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

There are two rendering strategies:

1) **Sticky ANSI bottom row (preferred, no flicker)**

   On terminals that support VT/ANSI cursor control (Windows Terminal,
   modern conhost, most Unix terminals), we reserve the last terminal row for
   the progress line by setting a scroll region that excludes that row.

   Then we update the progress line by saving/restoring the cursor and
   writing directly to the reserved row. Normal log output scrolls above it
   without us clearing/redrawing the progress line around every print.

2) **Compat inline redraw (fallback)**

   When we *can't* trust cursor control (older Windows consoles / colorama
   stripping control codes), we fall back to the previous approach:

   - clear the current status line
   - write normal output
   - redraw the status line

   This works widely, but it can flicker because the status line disappears
   briefly while output is emitted.

Progress is automatically disabled when stdout is not a TTY, unless forced via
environment variable.

Environment
-----------
PATSPEAK_PROGRESS:
  - "auto"  (default) : enable only when stdout is a TTY
  - "on" / "1"       : force enable
  - "off" / "0"      : disable

PATSPEAK_PROGRESS_MODE:
  - "auto"   (default) : prefer sticky ANSI when supported; else compat
  - "sticky"           : force sticky ANSI (may print escapes on unsupported terminals)
  - "compat"           : force inline redraw (always works, may flicker)
"""

from __future__ import annotations

import os
import re
import shutil
import sys
import threading
import time
import atexit
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


def _term_size(default_cols: int = 120, default_rows: int = 30) -> tuple[int, int]:
    """Return (columns, rows) for the current terminal."""

    try:
        sz = shutil.get_terminal_size((default_cols, default_rows))
        return int(sz.columns), int(sz.lines)
    except Exception:
        return int(default_cols), int(default_rows)


def _env_mode() -> str:
    """Return progress renderer mode: auto|sticky|compat."""

    v = os.environ.get("PATSPEAK_PROGRESS_MODE", "auto").strip().lower()
    if v in {"sticky", "ansi", "stable"}:
        return "sticky"
    if v in {"compat", "inline", "simple", "basic"}:
        return "compat"
    return "auto"


def _env_stepbar_style() -> str:
    """Return the step-bar rendering style.

    Styles:
      - ``hybrid``           : overview bar (downsampled) + recent-step tape (scrolling)
      - ``overview``         : overview only (downsampled)
      - ``scroll``           : recent-step tape only (one glyph per step, scrolls)

    The style can be controlled via the ``PATSPEAK_STEPBAR_STYLE`` environment
    variable.
    """

    # Default to the **single-bar** representation.
    #
    # Users can opt into the split "hybrid" view if they want (overview + tape),
    # but the default should be predictable: one step bar (S) and one suite bar (T).
    v = os.environ.get("PATSPEAK_STEPBAR_STYLE", "overview").strip().lower()
    if v in {"overview", "full", "compress", "downsample"}:
        return "overview"
    if v in {"scroll", "tape", "recent", "window"}:
        return "scroll"
    return "hybrid"


def _is_colorama_wrapped(stream: object) -> bool:
    """Best-effort detection for colorama's stdout/stderr wrappers."""

    try:
        mod = type(stream).__module__
        return "colorama" in (mod or "").lower()
    except Exception:
        return False


def _enable_windows_vt_processing() -> bool:
    """Enable VT processing on Windows without wrapping streams.

    Returns True if VT processing is enabled (or not needed).
    """

    if os.name != "nt":
        return True

    try:
        import ctypes

        kernel32 = ctypes.windll.kernel32
        ENABLE_VIRTUAL_TERMINAL_PROCESSING = 0x0004

        def _enable(handle_id: int) -> bool:
            handle = kernel32.GetStdHandle(handle_id)
            mode = ctypes.c_uint()
            if kernel32.GetConsoleMode(handle, ctypes.byref(mode)) == 0:
                return False
            new_mode = mode.value | ENABLE_VIRTUAL_TERMINAL_PROCESSING
            return kernel32.SetConsoleMode(handle, new_mode) != 0

        # stdout (-11) and stderr (-12)
        ok_out = _enable(-11)
        ok_err = _enable(-12)
        return bool(ok_out or ok_err)
    except Exception:
        return False


def _sticky_ansi_supported() -> bool:
    """Return True if we should use the sticky ANSI renderer."""

    # Must be a real terminal.
    try:
        if not (hasattr(sys.stdout, "isatty") and sys.stdout.isatty()):
            return False
    except Exception:
        return False

    cols, rows = _term_size()
    if cols < 40 or rows < 4:
        return False

    # If colorama has wrapped stdout, it can strip cursor-control sequences.
    # Sticky mode relies on those sequences, so avoid it.
    if _is_colorama_wrapped(sys.stdout) or _is_colorama_wrapped(sys.stderr):
        return False

    # On Windows, explicitly enable VT processing (no wrapping).
    if os.name == "nt":
        if not _enable_windows_vt_processing():
            return False

    return True


def _clamp(n: int, lo: int, hi: int) -> int:
    return max(lo, min(hi, n))


def _basename(path: str) -> str:
    try:
        return os.path.basename(path)
    except Exception:
        return str(path)


def _format_elapsed(seconds: float) -> str:
    """Format an elapsed duration for display in the header.

    Always renders as ``HH:MM:SS`` (zero-padded).

    Examples:
      - 5 seconds   -> 00:00:05
      - 90 seconds  -> 00:01:30
      - 3723 sec    -> 01:02:03
    """

    try:
        s = int(max(0, float(seconds)))
    except Exception:
        s = 0

    h = s // 3600
    m = (s % 3600) // 60
    sec = s % 60
    return f"{h:02d}:{m:02d}:{sec:02d}"


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

    # Timing
    # ------
    # Monotonic start time for the whole suite/batch (set on the first script start).
    suite_start_monotonic: float = 0.0

    # Monotonic start time for the current script (test or hook). Used to
    # display an elapsed timer in the sticky header.
    script_start_monotonic: float = 0.0

    # Internal rendering
    _lock: threading.Lock = field(default_factory=threading.Lock, repr=False)
    _io_lock: threading.Lock = field(default_factory=threading.Lock, repr=False)
    # "renderer" is either:
    #   - _StdoutProxy (compat mode)
    #   - _StickyAnsiRenderer (sticky ANSI mode)
    _renderer: Optional[object] = field(default=None, repr=False)

    # When we wrap stdout/stderr, keep references so we can clear/restore.
    _stdout_wrapper: Optional[object] = field(default=None, repr=False)
    _stderr_wrapper: Optional[object] = field(default=None, repr=False)

    renderer_mode: str = "auto"  # auto|sticky|compat

    # Visible length of the last rendered status line (ANSI stripped).
    # Shared between stdout/stderr proxies so either stream can reliably
    # clear the status line before emitting output.
    last_status_len: int = 0

    # Cursor / render state
    # -------------------
    # The progress UI is drawn as a *single line* without a trailing newline.
    # That means the cursor typically sits at the end of that line.
    #
    # When log output is printed we temporarily clear the status line, emit
    # the log output, then (if the cursor is back at the start of a new line)
    # redraw the status line.
    #
    # IMPORTANT: Many Python APIs (including print()) call .write() multiple
    # times per logical line (e.g. once for the text, then once for "\n").
    # If we redraw between those writes, we can overwrite/erase the log line.
    # These flags let stdout/stderr proxies coordinate when it is safe to
    # clear/redraw.
    status_drawn: bool = False
    at_line_start: bool = True

    def reset_test(self) -> None:
        self.kind = "test"
        self.test_ref = ""
        self.unit_name = ""
        self.total_steps = 0
        self.step_index = 0
        self.step_statuses = []
        self.fail_count = 0
        self.script_start_monotonic = 0.0


class _StdoutProxy:
    """A stdout wrapper that keeps a bottom-row status line visible."""

    def __init__(self, real_stdout, state: _ProgressState):
        self._real = real_stdout
        self._state = state
        self._in_write = False
        # Clearing the status line is based on the *last rendered width*.
        # We keep that width in the shared state so stdout/stderr behave
        # consistently.

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
            # Serialize writes across stdout/stderr so the status line doesn't
            # get corrupted by interleaving output from multiple threads/streams.
            with self._state._io_lock:
                # Only clear the status line if it's actually on screen.
                #
                # Many callers (including print()) write a line in multiple
                # chunks (text, then "\n"). If we clear/redraw between those
                # chunks, we can erase the log line.
                if self._state.status_drawn:
                    self._clear_status_line()
                    self._state.status_drawn = False
                    self._state.at_line_start = True

                n = self._real.write(s)
                try:
                    self._real.flush()
                except Exception:
                    pass

                # Track whether the cursor is back at the start of a *new* line.
                # If we are mid-line, do NOT redraw the status line (it would
                # append to / overwrite the log output).
                if s.endswith("\n") or s.endswith("\r"):
                    self._state.at_line_start = True
                else:
                    self._state.at_line_start = False

                if self._state.at_line_start:
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
        # Clear the *previously rendered* status line without ANSI.
        #
        # Relying on "ESC[2K" is brittle on Windows when colorama is in use.
        # Overwriting with spaces works everywhere.
        n = int(self._state.last_status_len or 0)
        if n <= 0:
            return
        try:
            self._real.write("\r" + (" " * n) + "\r")
        except Exception:
            pass

    def _draw_status_line(self) -> None:
        # Render into a "safe" width (<terminal columns - 1>) to avoid
        # Windows autowrap quirks in the last column.
        w = _term_width()
        max_w = max(1, w - 1)
        line = render_progress_line(self._state, width=max_w)
        if not line:
            # If we decide not to render (too narrow, etc.), make sure we
            # don't leave a stale status line behind.
            try:
                self._clear_status_line()
                self._state.last_status_len = 0
                self._state.status_drawn = False
                # After clearing, we're at the start of the line.
                self._state.at_line_start = True
            except Exception:
                pass
            return
        try:
            # Clamp to <terminal width> - 1 to avoid an edge-case where
            # writing a character in the last column triggers autowrap in
            # some Windows consoles.
            line = _strip_to_width(line, max_w)

            vis = _visible_len(line)
            clear_n = max(int(self._state.last_status_len or 0), vis)
            clear_n = min(clear_n, max_w)

            # Clear old content then write the new status line.
            if clear_n > 0:
                self._real.write("\r" + (" " * clear_n) + "\r")
            self._real.write(line)
            self._real.flush()
            self._state.last_status_len = vis
            self._state.status_drawn = True
            self._state.at_line_start = False
        except Exception:
            pass

    def redraw(self) -> None:
        if not (self._state.enabled and self.isatty()):
            return
        # Re-render the status line without printing a new log line.
        if self._in_write:
            return
        # Don't redraw if we're mid-line (it would garble output).
        if not (self._state.status_drawn or self._state.at_line_start):
            return
        self._in_write = True
        try:
            with self._state._io_lock:
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
            with self._state._io_lock:
                if self._state.status_drawn:
                    self._clear_status_line()
                self._state.last_status_len = 0
                self._state.status_drawn = False
                self._state.at_line_start = True
                self._real.flush()
        finally:
            self._in_write = False


class _LockedStream:
    """A minimal stdout/stderr wrapper that serializes writes with a lock.

    Used by the sticky ANSI renderer so progress updates (cursor movement)
    cannot interleave with normal log output.
    """

    def __init__(self, real_stream, state: _ProgressState):
        self._real = real_stream
        self._state = state

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
        with self._state._io_lock:
            n = self._real.write(s)
            try:
                self._real.flush()
            except Exception:
                pass
            return n

    def flush(self) -> None:
        with self._state._io_lock:
            try:
                self._real.flush()
            except Exception:
                pass


class _StickyAnsiRenderer:
    """Sticky bottom-row renderer using ANSI cursor control.

    This reserves the last terminal row by setting a scroll region, then
    updates that row in-place using save/restore cursor sequences.
    """

    def __init__(self, real_stdout, state: _ProgressState):
        self._out = real_stdout
        self._state = state
        self._installed = False
        self._last_header: str = ""
        self._last_line: str = ""
        self._last_size: tuple[int, int] = (0, 0)
        self._last_draw: float = 0.0

    def isatty(self) -> bool:  # pragma: no cover
        try:
            return bool(getattr(self._out, "isatty", lambda: False)())
        except Exception:
            return False

    def install(self) -> None:
        if self._installed:
            return
        if not (self._state.enabled and self.isatty()):
            return

        # If a previous run of the program crashed or was hard-killed while the
        # sticky renderer was active, the user's terminal can be left with a
        # modified scroll region. Before we apply our own scroll region, do a
        # best-effort reset back to "full screen" margins.
        #
        # We wrap this in save/restore so we don't disrupt the cursor position.
        with self._state._io_lock:
            try:
                self._out.write("\x1b[s")
                self._out.write("\x1b[1;9999r")
                self._out.write("\x1b[u")
                self._out.flush()
            except Exception:
                pass

        # Initialize scroll region and draw once.
        self._last_size = _term_size()
        self._apply_scroll_region(force=True)
        self.redraw(force=True)

        # Important: after setting a scroll region that reserves the top/bottom
        # rows, the current cursor position may be *outside* that region (most
        # commonly when the user runs PATSpeak from a shell prompt on the last
        # visible row).
        #
        # If we leave the cursor below the bottom margin, many Windows consoles
        # will stop scrolling and subsequent output will overwrite the same
        # line. Move the cursor into the scrolling region so log output scrolls
        # normally on every run.
        try:
            _cols, _rows = _term_size()
            if _rows >= 4:
                # Output region bottom margin is one row above the footer.
                self._out.write(f"\x1b[{max(2, _rows - 1)};1H")
                self._out.flush()
        except Exception:
            pass

        # Ensure we restore the terminal at exit.
        atexit.register(self.shutdown)
        self._installed = True

    def _apply_scroll_region(self, *, force: bool = False) -> None:
        cols, rows = _term_size()
        if rows < 4:
            return

        if not force and (cols, rows) == self._last_size:
            return

        self._last_size = (cols, rows)

        top = 2
        bottom = max(1, rows - 1)

        # CSI Pt;Pb r sets scrolling region *and* (per VT spec) can move the
        # cursor to home. Wrap in save/restore so we don't disrupt output.
        with self._state._io_lock:
            try:
                self._out.write("\x1b[s")
                self._out.write(f"\x1b[{top};{bottom}r")
                self._out.write("\x1b[u")
                self._out.flush()
            except Exception:
                pass

    def redraw(self, *, force: bool = False) -> None:
        if not (self._state.enabled and self.isatty()):
            return

        # Basic rate-limit so very chatty tests don't hammer the terminal.
        now = time.time()
        if not force and (now - self._last_draw) < 0.03:  # ~33 FPS max
            return

        cols, rows = _term_size()
        if (cols, rows) != self._last_size:
            self._apply_scroll_region(force=True)

        # Render into a "safe" width (<terminal columns - 1>) to avoid
        # Windows autowrap quirks in the last column.
        max_w = max(1, cols - 1)
        header = render_header_line(self._state, width=max_w)
        footer = render_progress_line(self._state, width=max_w)

        if not header and not footer:
            self.clear()
            self._last_header = ""
            self._last_line = ""
            self._last_draw = now
            return

        # render_* already clamps to the requested width, but keep a defensive
        # clamp in case of unexpected ANSI-width accounting bugs.
        if header:
            header = _strip_to_width(header, max_w)
        if footer:
            footer = _strip_to_width(footer, max_w)

        if not force and header == self._last_header and footer == self._last_line:
            self._last_draw = now
            return

        # Draw the header (row 1) and footer (last row) while preserving the
        # current cursor position inside the scroll region.
        with self._state._io_lock:
            try:
                self._out.write("\x1b[s")

                # Header (top row)
                self._out.write("\x1b[1;1H")
                self._out.write("\x1b[2K")
                if header:
                    self._out.write(header)

                # Footer (bottom row)
                self._out.write(f"\x1b[{rows};1H")
                self._out.write("\x1b[2K")
                if footer:
                    self._out.write(footer)

                self._out.write("\x1b[u")
                self._out.flush()
            except Exception:
                pass

        self._last_header = header
        self._last_line = footer
        self._last_draw = now

    def clear(self) -> None:
        if not (self.isatty() and self._installed):
            return
        cols, rows = _term_size()
        with self._state._io_lock:
            try:
                self._out.write("\x1b[s")

                # Clear header (top row)
                self._out.write("\x1b[1;1H")
                self._out.write("\x1b[2K")

                # Clear footer (bottom row)
                self._out.write(f"\x1b[{rows};1H")
                self._out.write("\x1b[2K")

                self._out.write("\x1b[u")
                self._out.flush()
            except Exception:
                pass

        self._last_header = ""
        self._last_line = ""

    def shutdown(self) -> None:
        if not self._installed:
            return

        # IMPORTANT: Leaving the scroll region modified will "corrupt" the
        # user's console session (their prompt stops scrolling and only the
        # bottom line updates). The cleanup must therefore be *extremely*
        # robust.
        #
        # In particular:
        #   - Prefer an explicit full-region reset (1;9999r) over CSI r with no
        #     args, because some Windows terminals are picky about the default.
        #   - Avoid relying on save/restore semantics for restoring margins.
        cols, rows = _term_size()
        rows = max(2, int(rows or 0))
        with self._state._io_lock:
            try:
                seq = ""
                seq += "\x1b[0m"  # reset attributes
                seq += "\x1b[1;9999r"  # reset scroll region (explicit)
                seq += "\x1b[r"  # also reset (default) where supported
                # Clear header (row 1) and footer (last row) so the shell prompt
                # does not end up sharing progress UI lines.
                seq += "\x1b[1;1H"
                seq += "\x1b[2K"
                seq += f"\x1b[{rows};1H"
                seq += "\x1b[2K"
                seq += "\x1b[0m"
                self._out.write(seq)
                self._out.flush()
            except Exception:
                pass

        self._installed = False


def render_header_line(state: _ProgressState, *, width: Optional[int] = None) -> str:
    """Build the 1-line header UI (ANSI-colored).

    In sticky mode this line is drawn on the **top row** of the terminal and
    stays visible while log output scrolls in the region below.

    Layout (per user request):
      - left:  test count  [i/N]
      - center: current test name
      - right: elapsed time
    """

    if not state.enabled:
        return ""

    # NOTE: Some Windows terminals behave badly if we print into the *last*
    # column (autowrap / cursor jumps). The sticky renderer therefore renders
    # into a "safe" width (typically <terminal columns - 1>) and passes it
    # here.
    width = int(width if width is not None else _term_width())
    if width < 40:
        return ""

    if not state.test_ref:
        return ""

    # Left: suite position
    left = ""
    if state.suite_total > 0 and state.suite_index > 0:
        left = style(f"[{state.suite_index}/{state.suite_total}]", fg="gray", bold=True)

    # Center: test name (include hook kind so operators can see what's running)
    kind = (state.kind or "test").strip().lower()
    name = _basename(state.test_ref)
    if kind != "test":
        center = " ".join(
            p
            for p in (
                style(kind, fg="magenta", bold=True) if kind else "",
                style(name, bold=True) if name else "",
            )
            if p
        )
    else:
        center = style(name, bold=True) if name else ""

    # Right: elapsed time (monotonic)
    right = ""
    if state.script_start_monotonic:
        elapsed = _format_elapsed(time.monotonic() - float(state.script_start_monotonic))
        right = style(elapsed, fg="gray", bold=True)

    # Compose a single line with left/center/right alignment.
    L = _visible_len(left)
    C = _visible_len(center)
    R = _visible_len(right)

    # Define the safe region where the centered title can live.
    region_start = L + (1 if left else 0)
    region_end = width - R - (1 if right else 0)
    available = max(0, region_end - region_start)

    if available <= 0:
        # Not enough room; fall back to a simple join.
        fallback = " ".join([p for p in (left, center, right) if p])
        return _strip_to_width(fallback, width)

    # Truncate center if needed.
    if C > available:
        center = _strip_to_width(center, available)
        C = _visible_len(center)

    # Center within the available region.
    center_start = region_start + max(0, (available - C) // 2)
    right_start = max(0, width - R)

    out = ""
    if left:
        out += left

    # Pad up to the center start.
    out += " " * max(0, center_start - _visible_len(out))
    if center:
        out += center

    # Pad up to the right start.
    out += " " * max(0, right_start - _visible_len(out))
    if right:
        out += right

    return _strip_to_width(out, width)


def render_progress_line(state: _ProgressState, *, width: Optional[int] = None) -> str:
    """Build the 1-line footer progress UI (ANSI-colored).

    The user-facing design for the footer is intentionally minimal:
      - Fail count (F:<n>)
      - Step progress bar for the current file (S:)
      - Suite/batch progress bar (T:)
      - Total runtime (right-justified)

    The test index/name and per-script elapsed time are displayed in the *header*
    (top row) instead.
    """

    if not state.enabled:
        return ""

    # Render into an optional "safe" width (see render_header_line).
    width = int(width if width is not None else _term_width())
    if width < 40:
        # Too narrow to be useful; don't risk wrapping.
        return ""

    # -----------------
    # Right side (total runtime)
    # -----------------
    right = ""
    if getattr(state, "suite_start_monotonic", 0.0):
        try:
            total_elapsed = _format_elapsed(time.monotonic() - float(state.suite_start_monotonic))
        except Exception:
            total_elapsed = "00:00:00"
        # Keep this short but explicit (avoids confusion with the per-script timer in the header).
        right = style("TOTAL", fg="gray", dim=True) + " " + style(total_elapsed, fg="gray", bold=True)

    R = _visible_len(right)

    # Only show the total runtime if we can still keep useful progress bars.
    if right and (width - R - 1) < 25:
        right = ""
        R = 0

    left_width = width if not right else max(1, width - R - 1)

    # -----------------
    # Fixed left side
    # -----------------

    # Fail counter only (per user request).
    fail_part = ""
    if state.test_ref:
        fail_part = f"F:{state.fail_count}"
        fail_part = style(
            fail_part,
            fg="red" if state.fail_count else "green",
            bold=bool(state.fail_count),
        )

    left = fail_part
    left_len = _visible_len(left)
    remaining = left_width - left_len
    if remaining < 10:
        left_out = _strip_to_width(left, left_width)
        if not right:
            return _strip_to_width(left_out, width)
        pad = max(1, (width - R) - _visible_len(left_out))
        return _strip_to_width(left_out + (" " * pad) + right, width)

    # -----------------
    # Bars
    # -----------------

    step_label = style("S:", fg="gray", dim=True)
    suite_label = style("T:", fg="gray", dim=True)

    show_step_bar = bool(state.test_ref)
    # Always show the suite/batch bar when running under a suite (even if it is 1 test).
    show_suite_bar = bool(state.suite_total > 0 and state.suite_index > 0)

    # Visible overhead (spaces + labels, excluding the bars themselves).
    overhead = 0
    if show_step_bar:
        overhead += 1 + _visible_len(step_label)
    if show_suite_bar:
        overhead += 1 + _visible_len(suite_label)

    remaining_for_bars = left_width - left_len - overhead
    if remaining_for_bars < 8 and show_suite_bar:
        # Not enough room for both; drop the suite bar first.
        show_suite_bar = False
        overhead = 1 + _visible_len(step_label) if show_step_bar else 0
        remaining_for_bars = left_width - left_len - overhead

    if remaining_for_bars < 5:
        left_out = _strip_to_width(left, left_width)
        if not right:
            return _strip_to_width(left_out, width)
        pad = max(1, (width - R) - _visible_len(left_out))
        return _strip_to_width(left_out + (" " * pad) + right, width)

    suite_bar_width = 0
    if show_suite_bar:
        # Allocate ~1/4 of the bar area to the suite bar (bounded),
        # but also try to preserve per-test detail when it fits.
        target = max(1, remaining_for_bars // 4)
        suite_bar_width = min(int(state.suite_total or 0) or 1, 40)
        suite_bar_width = min(suite_bar_width, target)

        # Ensure we leave at least 5 chars for the step bar.
        if (remaining_for_bars - suite_bar_width) < 5:
            suite_bar_width = max(1, remaining_for_bars - 5)

        if suite_bar_width < 1:
            show_suite_bar = False
            suite_bar_width = 0

    step_bar_width = remaining_for_bars - suite_bar_width
    step_bar_width = max(5, step_bar_width)

    step_bar = ""
    if show_step_bar:
        step_bar = _render_step_bar(
            state.step_statuses,
            step_bar_width,
            current_index=state.step_index,
        )

    suite_bar = ""
    if show_suite_bar:
        suite_bar = _render_overview_bar(state.suite_statuses, suite_bar_width)

    out = left
    if show_step_bar:
        out += " " + step_label + step_bar
    if show_suite_bar:
        out += " " + suite_label + suite_bar

    out = _strip_to_width(out, left_width)

    if not right:
        return _strip_to_width(out, width)

    pad = max(1, (width - R) - _visible_len(out))
    out += " " * pad
    out += right
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


def _render_overview_bar(statuses: List[str], width: int) -> str:
    """Render a fixed-width *overview* status bar.

    - If ``len(statuses) <= width``: render one glyph per status, then pad with
      pending dots so the bar stays a constant width.
    - If ``len(statuses) > width``: downsample the full timeline into ``width``
      buckets and render the most "severe" status per bucket:

        fail > running > pass > pending

    This ensures the bar always represents the whole script (so it doesn't
    appear to "start late" on long tests).
    """

    if width <= 0:
        return ""

    if not statuses:
        return style("·" * width, fg="gray", dim=True)

    n = len(statuses)

    def _bucket(items: list[str]) -> str:
        if not items:
            return "pending"
        # Most severe first.
        if "fail" in items:
            return "fail"
        if "running" in items:
            return "running"
        if "pass" in items:
            return "pass"
        return "pending"

    # No compression needed.
    if n <= width:
        return _render_status_sequence(statuses, width)

    # Downsample across the full list.
    chars = []
    for col in range(width):
        a = (col * n) // width
        b = ((col + 1) * n) // width
        if b <= a:
            b = min(n, a + 1)
        st = _bucket(statuses[a:b])
        g = _status_glyph(st)
        chars.append(_status_style(st, g))
    return "".join(chars)


def _render_status_sequence(statuses: List[str], width: int) -> str:
    """Render one glyph per status, padding with pending dots to *width*."""

    if width <= 0:
        return ""

    chars: list[str] = []
    for st in statuses[:width]:
        g = _status_glyph(st)
        chars.append(_status_style(st, g))
    if len(statuses) < width:
        chars.append(style("·" * (width - len(statuses)), fg="gray", dim=True))
    return "".join(chars)


def _render_scroll_tape(statuses: List[str], width: int, *, current_index: int) -> str:
    """Render a *scrolling* per-step tape.

    The tape shows one glyph per step, up to *width* steps:

      - Early in the test, the tape fills from the left (future steps are dots).
      - Once the number of completed steps exceeds *width*, the tape becomes a
        sliding window of the most recent steps so you can watch the test move
        in real-time.

    This is the view operators typically expect when they say "scroll the steps".
    """

    if width <= 0:
        return ""

    if not statuses:
        return style("·" * width, fg="gray", dim=True)

    n = len(statuses)
    i = int(current_index or 0)
    i = _clamp(i, 0, max(0, n - 1))

    # Window is inclusive of the current step index.
    completed = i + 1
    if completed <= width:
        window = list(statuses[:completed])
        if completed < width:
            window.extend(["pending"] * (width - completed))
    else:
        start = completed - width
        window = list(statuses[start:completed])

    return _render_status_sequence(window, width)


def _render_step_bar(statuses: List[str], width: int, *, current_index: int) -> str:
    """Render the *step* bar.

    For short scripts (steps <= width), we always render one glyph per step.

    For long scripts, we support multiple styles (env: PATSPEAK_STEPBAR_STYLE):

      - overview: downsampled overview
      - scroll:   scrolling per-step tape
      - hybrid:   overview + scrolling tape (best of both)
    """

    if width <= 0:
        return ""

    # If the full per-step view fits, always show it (it's the most informative).
    if len(statuses) <= width:
        return _render_status_sequence(statuses, width)

    style_mode = _env_stepbar_style()
    if style_mode == "overview":
        return _render_overview_bar(statuses, width)
    if style_mode == "scroll":
        return _render_scroll_tape(statuses, width, current_index=current_index)

    # Hybrid (default): overview + recent tape.
    # If the bar is too narrow, fall back to overview.
    if width < 14:
        return _render_overview_bar(statuses, width)

    # Reserve a chunk for the recent-step tape.
    tape_w = _clamp(width // 3, 8, 24)
    # Ensure overview part is still usable.
    if (width - tape_w - 1) < 6:
        tape_w = max(6, width - 7)
    overview_w = max(5, width - tape_w - 1)

    overview = _render_overview_bar(statuses, overview_w)
    sep = style("|", fg="gray", dim=True)
    tape = _render_scroll_tape(statuses, tape_w, current_index=current_index)
    return overview + sep + tape



# -----------------
# Public API
# -----------------


_STATE = _ProgressState()


# Sticky-mode timer tick
# ----------------------
#
# The sticky renderer keeps the header/footer pinned without flicker, but the
# elapsed time in the header would otherwise only update when some other event
# triggers a redraw (e.g. a new step output line).
#
# A tiny background ticker updates the UI at low frequency (<= 4 Hz). The
# renderer itself de-dupes identical frames, so in practice this updates the
# header once per second when the formatted mm:ss changes.

_TICK_STOP = threading.Event()
_TICK_THREAD: Optional[threading.Thread] = None


def _start_ticker() -> None:
    global _TICK_THREAD
    try:
        if _TICK_THREAD is not None and _TICK_THREAD.is_alive():
            return
    except Exception:
        pass

    _TICK_STOP.clear()

    def _run() -> None:
        # Use Event.wait() so we can wake quickly when stopping.
        while not _TICK_STOP.is_set():
            try:
                r = _STATE._renderer
                if _STATE.enabled and isinstance(r, _StickyAnsiRenderer):
                    r.redraw()  # type: ignore[call-arg]
            except Exception:
                pass
            _TICK_STOP.wait(0.25)

    t = threading.Thread(target=_run, name="patspeak-progress-tick", daemon=True)
    t.start()
    _TICK_THREAD = t


def _stop_ticker() -> None:
    global _TICK_THREAD
    try:
        _TICK_STOP.set()
    except Exception:
        pass

    t = _TICK_THREAD
    _TICK_THREAD = None
    if t is None:
        return
    try:
        t.join(timeout=0.25)
    except Exception:
        pass


def progress_enabled() -> bool:
    return _STATE.enabled


def install() -> None:
    """Install progress rendering (idempotent)."""

    if _STATE.installed:
        return

    if not _env_enabled():
        _STATE.enabled = False
        _STATE.installed = True
        return

    # Decide renderer.
    mode = _env_mode()
    _STATE.renderer_mode = mode

    use_sticky = False
    if mode == "sticky":
        use_sticky = _sticky_ansi_supported()
    elif mode == "compat":
        use_sticky = False
    else:  # auto
        use_sticky = _sticky_ansi_supported()

    _STATE.enabled = True

    if use_sticky:
        # Sticky ANSI renderer:
        #   - reserve last row via scroll region
        #   - update bottom line in-place (no flicker)

        real_out = sys.stdout
        real_err = sys.stderr

        renderer = _StickyAnsiRenderer(real_out, _STATE)
        _STATE._renderer = renderer

        # Wrap stdout/stderr with a lock so our cursor-control updates don't
        # interleave with normal output.
        out_locked = _LockedStream(real_out, _STATE)
        _STATE._stdout_wrapper = out_locked
        sys.stdout = out_locked

        try:
            err_locked = _LockedStream(real_err, _STATE)
            _STATE._stderr_wrapper = err_locked
            sys.stderr = err_locked
        except Exception:
            _STATE._stderr_wrapper = None

        # Install renderer (sets scroll region + initial draw).
        try:
            renderer.install()
        except Exception:
            pass

        # Keep the elapsed time ticking in the header even during long
        # WAIT/HOLD steps that don't produce log output.
        try:
            _start_ticker()
        except Exception:
            pass
    else:
        # Compat inline redraw renderer (works everywhere, may flicker).

        # Force console ANSI initialization before wrapping streams.
        #
        # On Windows, some ANSI helpers (e.g. colorama) may wrap/replace
        # sys.stdout/sys.stderr the first time color is used. If that happens
        # *after* we install our progress wrapper, the wrapper can be replaced
        # and the bottom-row UI will stop updating. Doing this up-front keeps
        # the progress proxy as the outermost stream wrapper.
        try:
            from support.console import color_enabled as _color_enabled

            _color_enabled()
        except Exception:
            pass

        out_proxy = _StdoutProxy(sys.stdout, _STATE)
        _STATE._stdout_wrapper = out_proxy
        _STATE._renderer = out_proxy
        sys.stdout = out_proxy

        try:
            err_proxy = _StdoutProxy(sys.stderr, _STATE)
            _STATE._stderr_wrapper = err_proxy
            sys.stderr = err_proxy
        except Exception:
            _STATE._stderr_wrapper = None

    _STATE.installed = True

    # Patch input() so prompts aren't overwritten by the status line.
    import builtins

    if not hasattr(builtins, "_patspeak_input"):
        builtins._patspeak_input = builtins.input  # type: ignore[attr-defined]

        def _wrapped_input(prompt: str = ""):
            try:
                # Clear the progress UI so prompts are readable.
                r = _STATE._renderer
                if r is not None and hasattr(r, "clear"):
                    r.clear()  # type: ignore[call-arg]
            except Exception:
                pass
            try:
                return builtins._patspeak_input(prompt)  # type: ignore[attr-defined]
            finally:
                try:
                    # Restore progress UI.
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

    # Stop the sticky-mode redraw ticker (if running) before tearing down the
    # renderer. This avoids races where the ticker draws while we are
    # restoring the terminal scroll region.
    try:
        _stop_ticker()
    except Exception:
        pass
    r = _STATE._renderer
    if r is None:
        return

    # Sticky renderer needs to reset the scroll region; compat renderer just
    # clears its inline status line.
    try:
        if hasattr(r, "shutdown"):
            r.shutdown()  # type: ignore[attr-defined]
        elif hasattr(r, "clear"):
            r.clear()  # type: ignore[call-arg]
    except Exception:
        pass

    # Belt-and-suspenders: the sticky renderer changes the terminal scroll
    # region. If *anything* goes wrong during shutdown (driver threads,
    # interrupted output, etc.), the user's shell can be left in a "stuck"
    # state. Emit a minimal raw restore sequence to ensure we always return
    # the scroll region to full-screen margins.
    try:
        if isinstance(r, _StickyAnsiRenderer):
            _raw_restore_terminal_state()
    except Exception:
        pass


def _raw_restore_terminal_state() -> None:
    """Unconditionally restore full-screen scroll region and clear the last row.

    This uses low-level ``os.write`` to bypass any Python stream wrappers.
    It's safe to call multiple times.
    """

    try:
        # Avoid _term_size() if possible; huge row numbers are clamped by terminals.
        seq = ""
        seq += "\x1b[0m"  # reset attributes
        seq += "\x1b[1;9999r"  # explicit full-screen scroll region
        seq += "\x1b[r"  # default reset where supported
        seq += "\x1b[1;1H"  # move cursor to top row (clamped)
        seq += "\x1b[2K"  # clear header line
        seq += "\x1b[9999;1H"  # move cursor to last visible row (clamped)
        seq += "\x1b[2K"  # clear entire line
        seq += "\x1b[0m"
        data = seq.encode("utf-8", errors="ignore")
        for fd in (1, 2):
            try:
                os.write(fd, data)
            except Exception:
                continue
    except Exception:
        pass


def emergency_restore_terminal() -> None:
    """Best-effort restore of terminal state after sticky mode.

    The flicker-free "sticky" renderer reserves the last terminal row by
    changing the terminal **scroll region**.

    If the process terminates abruptly via ``os._exit()`` (for example when the
    user hits Ctrl+C twice and we hard-exit to avoid hanging threads), Python's
    normal cleanup does *not* run:

      - ``atexit`` handlers are skipped
      - ``finally`` blocks can be skipped (depending on where we exit)

    In that case the terminal can be left in a "stuck" state where output only
    scrolls in the upper region and the bottom line stays fixed.

    This function is intended for those emergency paths. It only does anything
    when the sticky renderer is active.

    Important: this intentionally avoids acquiring internal locks because it
    may be called from a signal handler.
    """

    # Only relevant for the sticky renderer.
    try:
        r = _STATE._renderer
        if not isinstance(r, _StickyAnsiRenderer):
            return
    except Exception:
        return

    # In emergency exit paths we want the most robust thing possible.
    # Stop the redraw ticker (if it exists) and avoid stream wrappers by
    # emitting the restore sequence directly.
    try:
        _TICK_STOP.set()
    except Exception:
        pass
    _raw_restore_terminal_state()


def redraw() -> None:
    r = _STATE._renderer
    if r is None:
        return
    try:
        if hasattr(r, "redraw"):
            r.redraw()  # type: ignore[call-arg]
    except Exception:
        pass


def set_suite(total_tests: int) -> None:
    with _STATE._lock:
        _STATE.suite_total = max(0, int(total_tests or 0))
        _STATE.suite_index = 0
        _STATE.suite_statuses = ["pending"] * _STATE.suite_total
        _STATE.suite_start_monotonic = 0.0
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
        _STATE.script_start_monotonic = time.monotonic()
        if not _STATE.suite_start_monotonic:
            _STATE.suite_start_monotonic = _STATE.script_start_monotonic
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
        # For the current test, also resolve any step still marked "running".
        #
        # Why: some PAT lines are "output-only" (e.g. relay toggles, WAIT steps)
        # and never emit a PASS/FAIL status line. The runner still advances to
        # the next step, but without an explicit result we'd otherwise leave a
        # trail of "running" (yellow) blocks behind.
        #
        # At script end, any "running" step is effectively "complete".
        # Mark it as pass so the bar matches what the operator expects.
        for i, st in enumerate(list(_STATE.step_statuses)):
            if st == "running":
                _STATE.step_statuses[i] = "pass"
    redraw()


def note_step_started(step_index: int) -> None:
    with _STATE._lock:
        i = int(step_index or 0)

        # When we start a new step, the previous step must have completed.
        # If it was left as "running" (most commonly because that step had no
        # PASS/FAIL output), treat it as a successful step.
        if i > 0 and _STATE.step_statuses:
            # Resolve *any* lingering running steps before the new index.
            # (Normally there will be at most one.)
            for j in range(min(i, len(_STATE.step_statuses))):
                if _STATE.step_statuses[j] == "running":
                    _STATE.step_statuses[j] = "pass"

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
