"""Lightweight terminal formatting helpers.

This module exists to make console output easier to scan (pytest-style):

- PASS lines in green
- FAIL lines in red
- TEST lines in cyan

Color is automatically disabled when stdout is not a TTY, or when NO_COLOR is
set. You can override behavior with:

  PATSPEAK_COLOR=auto   (default)
  PATSPEAK_COLOR=always (force color)
  PATSPEAK_COLOR=never  (disable color)

On Windows, we try to enable ANSI escape processing. If "colorama" is
available it will be used; otherwise we fall back to a small ctypes-based
enabler.
"""

from __future__ import annotations

import os
import sys
from typing import Dict, Optional


_COLOR_ENABLED: Optional[bool] = None


def _enable_windows_ansi() -> bool:
    """Best-effort attempt to enable ANSI escape sequences on Windows."""

    if os.name != "nt":
        return True

    # Prefer colorama if present.
    try:
        import colorama  # type: ignore

        # just_fix_windows_console() enables ANSI processing on newer Windows
        # and wraps stdout/stderr on older versions.
        colorama.just_fix_windows_console()
        return True
    except Exception:
        pass

    # Fallback: enable ENABLE_VIRTUAL_TERMINAL_PROCESSING via ctypes.
    try:
        import ctypes

        kernel32 = ctypes.windll.kernel32
        STD_OUTPUT_HANDLE = -11
        handle = kernel32.GetStdHandle(STD_OUTPUT_HANDLE)
        mode = ctypes.c_uint()
        if kernel32.GetConsoleMode(handle, ctypes.byref(mode)) == 0:
            return False
        ENABLE_VIRTUAL_TERMINAL_PROCESSING = 0x0004
        new_mode = mode.value | ENABLE_VIRTUAL_TERMINAL_PROCESSING
        if kernel32.SetConsoleMode(handle, new_mode) == 0:
            return False
        return True
    except Exception:
        return False


def color_enabled() -> bool:
    """Return True if we should emit ANSI color codes."""

    global _COLOR_ENABLED
    if _COLOR_ENABLED is not None:
        return _COLOR_ENABLED

    # Community convention.
    if os.environ.get("NO_COLOR") is not None:
        _COLOR_ENABLED = False
        return _COLOR_ENABLED

    mode = os.environ.get("PATSPEAK_COLOR", "auto").strip().lower()
    if mode in {"0", "false", "no", "never", "off", "disable", "disabled"}:
        _COLOR_ENABLED = False
        return _COLOR_ENABLED

    force = mode in {"1", "true", "yes", "always", "on", "enable", "enabled"}

    is_tty = hasattr(sys.stdout, "isatty") and sys.stdout.isatty()
    if not force and not is_tty:
        _COLOR_ENABLED = False
        return _COLOR_ENABLED

    if os.name == "nt":
        ok = _enable_windows_ansi()
        if not ok and not force:
            _COLOR_ENABLED = False
            return _COLOR_ENABLED

    _COLOR_ENABLED = True
    return _COLOR_ENABLED


_FG: Dict[str, str] = {
    "red": "31",
    "green": "32",
    "yellow": "33",
    "blue": "34",
    "magenta": "35",
    "cyan": "36",
    "gray": "90",
}


def style(text: str, *, fg: Optional[str] = None, bold: bool = False, dim: bool = False) -> str:
    """Wrap *text* in ANSI escapes (or return it unchanged if disabled)."""

    if not color_enabled():
        return text

    codes = []
    if bold:
        codes.append("1")
    if dim:
        codes.append("2")
    if fg:
        code = _FG.get(fg)
        if code:
            codes.append(code)

    if not codes:
        return text

    return f"\x1b[{';'.join(codes)}m{text}\x1b[0m"


def colorize_status_line(line: str) -> str:
    """Colorize a PATSpeak status line.

    This expects lines formatted like:
      "00001 PASS: SignalName 12.3"
      "00002 FAIL: SignalName 0.0"
      "00003 TEST: SignalName 1.0 +/- 0.5"
    """

    if not color_enabled():
        return line

    # Keep this intentionally simple and robust (no regex dependency, no strict parsing).
    if "PASS:" in line:
        return line.replace("PASS:", style("PASS:", fg="green", bold=True), 1)
    if "FAIL:" in line:
        return line.replace("FAIL:", style("FAIL:", fg="red", bold=True), 1)
    if "TEST:" in line:
        return line.replace("TEST:", style("TEST:", fg="cyan", bold=True), 1)
    return line
