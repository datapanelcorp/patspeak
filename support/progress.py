"""Terminal progress bar for PATSpeak.

Design goals
------------
- Keep a **single "bottom row" status line** visible while normal log output
  scrolls above it.
- Show:
    * suite progress (all tests)
    * current test progress (steps)
    * per-step pass/fail coloring
- Be lightweight: no external dependencies.

Implementation notes
--------------------
We wrap ``sys.stdout`` with a small proxy that:

1) clears the status line
2) writes normal output
3) redraws the status line

This approach behaves well on most terminals (including Windows when ANSI is
enabled via ``support.console``).

Progress is automatically disabled when stdout is not a TTY, unless forced via
environment variable.

Environment
-----------
PATSPEAK_PROGRESS:
  - "auto"  (default) : enable only when stdout is a TTY
  - "on" / "1"       : force enable
  - "off" / "0"      : disable
"""

from __future__ import annotations

import os
import re
import shutil
import sys
import threading
from dataclasses import dataclass, field
from typing import List, Optional

from support.console import style


_ANSI_RE = re.compile(r"\x1b\[[0-9;]*m")


def _strip_ansi(s: str) -> str:
    return _ANSI_RE.sub("", s)


def _visible_len(s: str) -> int:
    return len(_strip_ansi(s))


def _env_enabled() -> bool:
    """Return True if the user/environment wants progress UI enabled."""

    v = os.environ.get("PATSPEAK_PROGRESS", "auto").strip().lower()
    if v in {"0", "false", "no", "off", "disable", "disabled", "never"}:
        return False
    if v in {"1", "true", "yes", "on", "enable", "enabled", "always"}:
        return True

    # auto
    try:
        return bool(getattr(sys.stdout, "isatty", lambda: False)())
    except Exception:
        return False


def _term_width(default: int = 120) -> int:
    try:
        return shutil.get_terminal_size((default, 20)).columns
    except Exception:
        return default


def _clamp(n: int, lo: int, hi: int) -> int:
    return max(lo, min(hi, n))


def _basename(path: str) -> str:
    try:
        return os.path.basename(path)
    except Exception:
        return str(path)


def _status_glyph(status: str) -> str:
    """Return a 1-char glyph for a status (without color)."""

    if status == "pass":
        return "█"
    if status == "fail":
        return "█"
    if status == "running":
        return "▌"
    # pending / unknown
    return "·"


def _status_style(status: str, glyph: str) -> str:
    if status == "pass":
        return style(glyph, fg="green")
    if status == "fail":
        return style(glyph, fg="red", bold=True)
    if status == "running":
        return style(glyph, fg="yellow", bold=True)
    return style(glyph, fg="gray", dim=True)


@dataclass
class _ProgressState:
    enabled: bool = False
    installed: bool = False

    # Suite progress (tests)
    suite_total: int = 0
    suite_index: int = 0  # 1-based current test index when running a suite
    suite_statuses: List[str] = field(default_factory=list)

    # Current script
    kind: str = "test"  # test | hook-start | hook-transition | hook-end
    test_ref: str = ""
    unit_name: str = ""
    total_steps: int = 0
    step_index: int = 0  # 0-based current step index (best effort)
    step_statuses: List[str] = field(default_factory=list)
    fail_count: int = 0

    # Internal rendering
    _lock: threading.Lock = field(default_factory=threading.Lock, repr=False)
    _stdout_wrapper: Optional["_StdoutProxy"] = field(default=None, repr=False)

    def reset_test(self) -> None:
        self.kind = "test"
        self.test_ref = ""
        self.unit_name = ""
        self.total_steps = 0
        self.step_index = 0
        self.step_statuses = []
        self.fail_count = 0


class _StdoutProxy:
    """A stdout wrapper that keeps a bottom-row status line visible."""

    def __init__(self, real_stdout, state: _ProgressState):
        self._real = real_stdout
        self._state = state
        self._in_write = False

    def __getattr__(self, name):
        return getattr(self._real, name)

    def isatty(self) -> bool:  # pragma: no cover
        try:
            return bool(self._real.isatty())
        except Exception:
            return False

    def write(self, s: str) -> int:
        if not s:
            return 0

        # Avoid recursion when we redraw the status line.
        if self._in_write:
            return self._real.write(s)

        if not (self._state.enabled and self.isatty()):
            return self._real.write(s)

        self._in_write = True
        try:
            self._clear_status_line()
            n = self._real.write(s)
            try:
                self._real.flush()
            except Exception:
                pass
            self._draw_status_line()
            return n
        finally:
            self._in_write = False

    def flush(self) -> None:
        try:
            self._real.flush()
        except Exception:
            pass

    # -----------------
    # Status line ops
    # -----------------

    def _clear_status_line(self) -> None:
        # \r + clear entire line
        try:
            self._real.write("\r\x1b[2K")
        except Exception:
            pass

    def _draw_status_line(self) -> None:
        line = render_progress_line(self._state)
        if not line:
            return
        try:
            # Ensure we don't leave artifacts if the new line is shorter.
            self._real.write("\r\x1b[2K")
            self._real.write(line)
            self._real.flush()
        except Exception:
            pass

    def redraw(self) -> None:
        if not (self._state.enabled and self.isatty()):
            return
        # Re-render the status line without printing a new log line.
        if self._in_write:
            return
        self._in_write = True
        try:
            self._draw_status_line()
        finally:
            self._in_write = False

    def clear(self) -> None:
        if not (self._state.enabled and self.isatty()):
            return
        if self._in_write:
            return
        self._in_write = True
        try:
            self._clear_status_line()
            self._real.flush()
        finally:
            self._in_write = False


def render_progress_line(state: _ProgressState) -> str:
    """Build the 1-line progress UI (ANSI-colored)."""

    if not state.enabled:
        return ""

    width = _term_width()
    if width < 40:
        # Too narrow to be useful; don't risk wrapping.
        return ""

    # -----------------
    # Fixed left side
    # -----------------

    suite_prefix = ""
    if state.suite_total > 0 and state.suite_index > 0:
        suite_prefix = f"[{state.suite_index}/{state.suite_total}]"
        suite_prefix = style(suite_prefix, fg="gray", bold=True)

    # Test label
    kind = (state.kind or "test").strip().lower()
    kind_label = ""
    if kind != "test":
        kind_label = style(f"{kind}", fg="magenta", bold=True)

    test_name = _basename(state.test_ref) if state.test_ref else ""
    if test_name:
        test_name = style(test_name, bold=True)

    # Step counters (best effort)
    step_part = ""
    if state.total_steps > 0:
        step_part = f"step {state.step_index + 1}/{state.total_steps}"
    elif state.test_ref:
        step_part = f"step {state.step_index + 1}/?"
    if step_part:
        step_part = style(step_part, fg="cyan")

    # Fail counter
    fail_part = ""
    if state.test_ref:
        fail_part = f"F:{state.fail_count}"
        fail_part = style(fail_part, fg="red" if state.fail_count else "green", bold=bool(state.fail_count))

    # Compose base segments (we'll truncate to avoid wrapping).
    left_parts = [p for p in (suite_prefix, kind_label, test_name, step_part, fail_part) if p]
    left = " ".join(left_parts)

    # -----------------
    # Bars
    # -----------------

    # Leave some spacing around bars.
    # We'll allocate remaining width to: " S:<stepbar>" and optionally " T:<suitebar>".
    bar_sep = " "
    step_label = style("S:", fg="gray", dim=True)
    test_label = style("T:", fg="gray", dim=True)

    # Reserve at least 1 space between left and bars.
    left_len = _visible_len(left)
    remaining = width - left_len
    if remaining < 10:
        # If we can't even fit bars, just show truncated left.
        return _strip_to_width(left, width)

    # We always show the step bar if we have a test.
    show_step_bar = bool(state.test_ref)
    show_suite_bar = state.suite_total > 1 and state.suite_index > 0

    # Labels/spaces overhead.
    overhead = 0
    if show_step_bar:
        overhead += 1 + _visible_len(step_label)  # leading space + "S:"
    if show_suite_bar:
        overhead += 1 + _visible_len(test_label)  # space + "T:"
        overhead += 1  # additional space between the two bars

    remaining_for_bars = width - left_len - overhead
    if remaining_for_bars < 5:
        # Drop suite bar first.
        show_suite_bar = False
        overhead = 0
        if show_step_bar:
            overhead += 1 + _visible_len(step_label)
        remaining_for_bars = width - left_len - overhead

    if remaining_for_bars < 5:
        return _strip_to_width(left, width)

    suite_bar_width = 0
    if show_suite_bar:
        # Give suite bar up to 1/3 of remaining, but not more than number of tests.
        suite_bar_width = _clamp(remaining_for_bars // 3, 6, min(40, state.suite_total))

    step_bar_width = remaining_for_bars - suite_bar_width
    if show_suite_bar:
        step_bar_width -= 1  # space between S bar and T bar

    step_bar_width = max(5, step_bar_width)
    if show_suite_bar:
        suite_bar_width = max(5, suite_bar_width)

    step_bar = ""
    if show_step_bar:
        step_bar = _render_bar(state.step_statuses, step_bar_width)

    suite_bar = ""
    if show_suite_bar:
        suite_bar = _render_bar(state.suite_statuses, suite_bar_width)

    # -----------------
    # Final compose + clamp
    # -----------------

    out = left
    if show_step_bar:
        out += bar_sep + step_label + step_bar
    if show_suite_bar:
        out += " " + test_label + suite_bar

    return _strip_to_width(out, width)


def _strip_to_width(s: str, width: int) -> str:
    """Clamp *s* to a maximum visible width, preserving ANSI sequences."""

    # This is a simple scanner that copies ANSI escapes but counts only visible chars.
    if _visible_len(s) <= width:
        return s

    out: list[str] = []
    visible = 0
    i = 0
    while i < len(s) and visible < width:
        if s[i] == "\x1b":
            # Copy ANSI sequence verbatim.
            m = _ANSI_RE.match(s, i)
            if m:
                out.append(m.group(0))
                i = m.end()
                continue
        out.append(s[i])
        visible += 1
        i += 1

    # Ensure attributes are reset so we don't leak styling.
    out.append("\x1b[0m")
    return "".join(out)


def _render_bar(statuses: List[str], width: int) -> str:
    """Render the last *width* statuses as colored 1-char blocks."""

    if width <= 0:
        return ""

    if not statuses:
        return style("·" * width, fg="gray", dim=True)

    # Show the most recent items if we don't fit.
    window = statuses[-width:]
    clipped = len(statuses) > width

    chars = []
    if clipped and width >= 2:
        # Indicate that we're showing the tail.
        chars.append(style("‹", fg="gray", dim=True))
        window = statuses[-(width - 1) :]

    for st in window:
        g = _status_glyph(st)
        chars.append(_status_style(st, g))
    return "".join(chars)


# -----------------
# Public API
# -----------------


_STATE = _ProgressState()


def progress_enabled() -> bool:
    return _STATE.enabled


def install() -> None:
    """Install the stdout wrapper (idempotent)."""

    if _STATE.installed:
        return

    if not _env_enabled():
        _STATE.enabled = False
        _STATE.installed = True
        return

    # Enable and wrap stdout.
    _STATE.enabled = True
    proxy = _StdoutProxy(sys.stdout, _STATE)
    _STATE._stdout_wrapper = proxy
    sys.stdout = proxy
    _STATE.installed = True

    # Patch input() so prompts aren't overwritten by the status line.
    import builtins

    if not hasattr(builtins, "_patspeak_input"):
        builtins._patspeak_input = builtins.input  # type: ignore[attr-defined]

        def _wrapped_input(prompt: str = ""):
            try:
                if _STATE._stdout_wrapper is not None:
                    _STATE._stdout_wrapper.clear()
            except Exception:
                pass
            try:
                return builtins._patspeak_input(prompt)  # type: ignore[attr-defined]
            finally:
                try:
                    redraw()
                except Exception:
                    pass

        builtins.input = _wrapped_input  # type: ignore[assignment]


def enable() -> None:
    """Enable progress rendering (installing stdout wrapper if needed)."""

    install()
    _STATE.enabled = True
    redraw()


def disable() -> None:
    _STATE.enabled = False
    try:
        if _STATE._stdout_wrapper is not None:
            _STATE._stdout_wrapper.clear()
    except Exception:
        pass


def redraw() -> None:
    try:
        if _STATE._stdout_wrapper is not None:
            _STATE._stdout_wrapper.redraw()
    except Exception:
        pass


def set_suite(total_tests: int) -> None:
    with _STATE._lock:
        _STATE.suite_total = max(0, int(total_tests or 0))
        _STATE.suite_index = 0
        _STATE.suite_statuses = ["pending"] * _STATE.suite_total
    redraw()


def start_script(
    *,
    test_ref: str,
    kind: str = "test",
    suite_index: int = 0,
    suite_mark_running: bool = True,
    unit_name: str = "",
    total_steps: int = 0,
) -> None:
    """Start tracking a script run (test or hook)."""

    with _STATE._lock:
        _STATE.kind = (kind or "test").strip()
        _STATE.test_ref = str(test_ref or "")
        _STATE.unit_name = str(unit_name or "")
        _STATE.total_steps = max(0, int(total_steps or 0))
        _STATE.step_index = 0
        _STATE.step_statuses = ["pending"] * _STATE.total_steps if _STATE.total_steps else []
        _STATE.fail_count = 0

        if _STATE.suite_total > 0 and suite_index > 0:
            _STATE.suite_index = int(suite_index)
            idx = _STATE.suite_index - 1
            if suite_mark_running and 0 <= idx < len(_STATE.suite_statuses):
                _STATE.suite_statuses[idx] = "running"

    redraw()


def finish_script(*, passed: Optional[bool] = None, suite_index: int = 0) -> None:
    """Mark the current script as finished."""

    with _STATE._lock:
        if passed is not None:
            st = "pass" if passed else "fail"
            # Mark suite item
            if _STATE.suite_total > 0 and suite_index > 0:
                idx = int(suite_index) - 1
                if 0 <= idx < len(_STATE.suite_statuses):
                    _STATE.suite_statuses[idx] = st
        # For the current test, also mark the current step as no longer "running".
        if _STATE.step_statuses and 0 <= _STATE.step_index < len(_STATE.step_statuses):
            if _STATE.step_statuses[_STATE.step_index] == "running":
                _STATE.step_statuses[_STATE.step_index] = "pending"
    redraw()


def note_step_started(step_index: int) -> None:
    with _STATE._lock:
        i = int(step_index or 0)
        _STATE.step_index = max(0, i)
        if _STATE.total_steps > 0 and i >= _STATE.total_steps:
            # Defensive: scripts can be malformed; extend.
            _STATE.step_statuses.extend(["pending"] * (i + 1 - _STATE.total_steps))
            _STATE.total_steps = i + 1
        if i >= len(_STATE.step_statuses):
            _STATE.step_statuses.extend(["pending"] * (i + 1 - len(_STATE.step_statuses)))
        if _STATE.step_statuses:
            if _STATE.step_statuses[i] == "pending":
                _STATE.step_statuses[i] = "running"
    redraw()


def note_step_result(step_index: int, *, passed: bool) -> None:
    with _STATE._lock:
        i = int(step_index or 0)
        _STATE.step_index = max(0, i)
        if i >= len(_STATE.step_statuses):
            _STATE.step_statuses.extend(["pending"] * (i + 1 - len(_STATE.step_statuses)))
        _STATE.step_statuses[i] = "pass" if passed else "fail"
        if not passed:
            _STATE.fail_count += 1
    redraw()
