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
import re
from typing import Dict, Optional


_COLOR_ENABLED: Optional[bool] = None


def _enable_windows_ansi() -> bool:
    """Best-effort attempt to enable ANSI escape sequences on Windows.

    Important:
      - Prefer enabling Windows 10+ VT processing via ctypes because it *does not*
        wrap/replace sys.stdout or sys.stderr.
      - Fall back to colorama wrapping only when VT processing can't be enabled.

    Wrapping sys.stdout can interfere with other stream proxies (like the
    progress UI), so the order here is intentional.
    """

    if os.name != "nt":
        return True

    # First try: enable VT processing directly (no stream wrapping).
    try:
        import ctypes

        kernel32 = ctypes.windll.kernel32
        STD_OUTPUT_HANDLE = -11
        handle = kernel32.GetStdHandle(STD_OUTPUT_HANDLE)
        mode = ctypes.c_uint()
        if kernel32.GetConsoleMode(handle, ctypes.byref(mode)) != 0:
            ENABLE_VIRTUAL_TERMINAL_PROCESSING = 0x0004
            new_mode = mode.value | ENABLE_VIRTUAL_TERMINAL_PROCESSING
            if kernel32.SetConsoleMode(handle, new_mode) != 0:
                return True
    except Exception:
        pass

    # Second try: colorama wrapper (older Windows terminals).
    try:
        import colorama  # type: ignore

        # just_fix_windows_console() enables ANSI processing on newer Windows
        # and wraps stdout/stderr on older versions.
        colorama.just_fix_windows_console()
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



# -----------------
# Path/name helpers
# -----------------

def _safe_filename_component(text: str, *, default: str = "") -> str:
    """Return *text* made safe for use in a filename.

    - Removes/normalizes path separators
    - Replaces Windows-forbidden characters with "_"
    - Collapses repeated "_"
    """

    t = str(text or "").strip()
    if not t:
        return default

    # Never allow directory components inside the "name".
    t = re.sub(r"[\\/]+", "_", t)

    # Make it robust for absolute Windows paths too (e.g. "C:\\dut\\43019\\test.pat").
    # Windows disallows characters like ':' in filenames.
    t = re.sub(r'[<>:"/\\|?*]', "_", t)

    # Keep filenames readable.
    t = re.sub(r"_+", "_", t)
    t = t.strip(" ._")

    return t or default


def safe_test_id(test_file: str) -> str:
    """Return a filesystem-safe identifier for *test_file*.

    Since outputs are now written to a per-test-folder `results/` directory
    (next to the `.pat` file), we no longer need to embed the full relative
    path into the log filename.

    We therefore use the **test file stem** (basename without extension).

    Examples:
      "RESET.pat" -> "RESET"
      "43019/43019-1-INPUT-420MA.pat" -> "43019-1-INPUT-420MA"
      "C:\\dut\\43019\\foo.pat" -> "foo"
    """

    base = os.path.basename(str(test_file or "").strip())
    stem = os.path.splitext(base)[0] if base else ""
    return _safe_filename_component(stem, default="unknown_test")


def make_log_path(log_dir: str, unit_name: str, test_file: str, run_stamp: Optional[str] = None) -> str:
    """Build a log file path for a given unit + test.

    Naming goals:
      - clean and readable
      - unique per UnitName when you test multiple units
      - avoid duplicated names when UnitName matches the test name

    By default, PATSpeak writes a single log per (UnitName, TestFile) into the
    per-test results folder.

    If *run_stamp* is provided, it will be appended to the filename to prevent
    overwriting outputs on reruns.

    Examples:
      UnitName="SN123"  Test="43019-1-INPUT-420MA.pat" -> "SN123_43019-1-INPUT-420MA.log"
      UnitName="43019-1-INPUT-420MA" Test=".../43019-1-INPUT-420MA.pat" -> "43019-1-INPUT-420MA.log"
      (with run_stamp="20260206-201122-123") -> "..._20260206-201122-123.log"
    """

    safe_unit = _safe_filename_component(unit_name, default="")
    safe_test = safe_test_id(test_file)

    # De-dup if the user uses UnitName as the test name.
    if safe_unit and safe_unit.lower() != safe_test.lower():
        base = f"{safe_unit}_{safe_test}"
    else:
        base = f"{safe_test}"

    safe_stamp = _safe_filename_component(run_stamp, default="") if run_stamp else ""
    filename = f"{base}_{safe_stamp}.log" if safe_stamp else f"{base}.log"

    return os.path.join(str(log_dir), filename)


def make_csv_path(data_dir: str, unit_name: str, run_stamp: Optional[str] = None) -> str:
    """Build the CSV output path for a unit.

    If *run_stamp* is provided, it will be appended to avoid overwriting on reruns.
    """
    safe_unit = _safe_filename_component(unit_name, default="untitled")
    safe_stamp = _safe_filename_component(run_stamp, default="") if run_stamp else ""
    filename = f"{safe_unit}_{safe_stamp}.csv" if safe_stamp else f"{safe_unit}.csv"
    return os.path.join(str(data_dir), filename)
