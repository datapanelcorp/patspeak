import os
import sys
import threading
import time
from datetime import datetime

# msvcrt is Windows-only; we use it for ESC handling in the terminal.
try:
    import msvcrt  # type: ignore
except Exception:  # pragma: no cover
    msvcrt = None

# keyboard is a legacy dependency; kept for backwards compatibility.
try:
    import keyboard  # type: ignore  # noqa: F401
except Exception:
    keyboard = None  # noqa: F401

"""PATSpeak main entry.

This version uses python-can + cantools, and no longer depends on Kvaser's
kvadblib for DBC handling.
"""

from support.script import ProcessScript
from support.preflight import suite_preflight
import support.globals as globals
from support.console import make_log_path, style


def _repo_root() -> str:
    return os.path.abspath(os.path.dirname(__file__))


def _dut_root() -> str:
    return os.path.abspath(os.path.join(_repo_root(), "dut"))


def _normalize_selector(sel: str) -> str:
    """Normalize a user CLI selector into a relative path-like string.

    Accepts:
      - "RESET.pat"
      - "43019"
      - "43019\\43019-1-INPUT-420MA"
      - "dut\\43019\\43019-1-INPUT-420MA.pat"
    """
    sel = (sel or "").strip().strip('"').strip("'")
    if not sel:
        return ""

    # Make both slash styles work regardless of OS.
    sel = sel.replace("/", os.sep).replace("\\", os.sep)

    # Strip a leading "dut/" if provided.
    parts = [p for p in sel.split(os.sep) if p and p not in (".",)]
    if parts and parts[0].lower() == "dut":
        parts = parts[1:]

    if not parts:
        return ""

    return os.path.normpath(os.path.join(*parts))


def _is_under_root(path: str, root: str) -> bool:
    try:
        return os.path.commonpath([os.path.abspath(path), os.path.abspath(root)]) == os.path.abspath(root)
    except Exception:
        return False


def _abs_test_path(test_ref: str) -> str:
    """Return an absolute filesystem path for a test reference."""
    test_ref = str(test_ref)
    if os.path.isabs(test_ref):
        return test_ref
    return os.path.join(_dut_root(), test_ref)


def discover_tests(selector: str) -> list[str]:
    """Expand a selector into one or more .pat tests.

    Returns a list of test refs suitable for globals.TestFile:
      - usually a path relative to dut/ (e.g. "43019\\foo.pat")
      - but may be absolute if the user provided an absolute path
    """
    dut_root = _dut_root()
    sel = _normalize_selector(selector)
    if not sel:
        return []

    abs_candidate = sel if os.path.isabs(sel) else os.path.join(dut_root, sel)

    # Directory selector => run all *.pat in that folder (non-recursive).
    if os.path.isdir(abs_candidate):
        pats = []
        for name in os.listdir(abs_candidate):
            if name.lower().endswith(".pat"):
                pats.append(os.path.join(abs_candidate, name))

        pats.sort(key=lambda p: p.lower())
        tests = []
        for p in pats:
            if _is_under_root(p, dut_root):
                tests.append(os.path.relpath(p, dut_root))
            else:
                tests.append(p)
        return tests

    # File selector (with extension)
    if abs_candidate.lower().endswith(".pat") and os.path.isfile(abs_candidate):
        if _is_under_root(abs_candidate, dut_root):
            return [os.path.relpath(abs_candidate, dut_root)]
        return [abs_candidate]

    # File selector (without extension)
    if not abs_candidate.lower().endswith(".pat"):
        cand = abs_candidate + ".pat"
        if os.path.isfile(cand):
            if _is_under_root(cand, dut_root):
                return [os.path.relpath(cand, dut_root)]
            return [cand]

    return []


def test_uses_pat_support(test_ref: str) -> bool:
    """Return True if this test wants PAT support (i.e., not suppressed).

    Default is PAT support enabled unless the script contains:
      SUPPRESS_PAT_SUPPORT = True
    """
    path = _abs_test_path(test_ref)
    try:
        with open(path, "r", encoding="utf-8", errors="replace") as f:
            for raw in f:
                line = raw.strip()
                if not line or line.startswith("#"):
                    continue
                if line.upper().startswith("SUPPRESS_PAT_SUPPORT"):
                    parts = line.split("=", 1)
                    if len(parts) != 2:
                        return True
                    val = parts[1].strip().lower()
                    if val in {"1", "true", "yes", "on"}:
                        return False
                    return True
    except Exception:
        # If we can't read the file, assume PAT support is needed
        # (it will fail later with a clearer error).
        return True
    return True


def _parse_cli(argv: list[str]) -> tuple[str, bool]:
    """Return (selector, verbose)."""
    selector = ""
    verbose = False

    for a in argv:
        a = a.strip()
        if a in ("-v", "--verbose"):
            verbose = True
            continue
        if a.startswith("-"):
            # ignore unknown flags (for now)
            continue
        if not selector:
            selector = a

    return selector, verbose


def _run_one_test(*, test_ref: str, suite_unit_name: dict, run_preflight_checks: bool = True) -> bool:
    """Run a single .pat test. Returns True if completed, False if aborted."""
    globals.TestFile = test_ref

    # Show a friendly label.
    print("\n" + "=" * 80)
    print("Running:", test_ref)
    print("=" * 80)

    # Re-initialize globals for this test.
    globals.initialize(run_preflight_checks=run_preflight_checks)

    # Prompt for UnitName only once per suite (unless script sets UUT_DATANAME).
    if globals.UnitName == "":
        if not suite_unit_name.get("name"):
            suite_unit_name["name"] = input(
                "Pressing Esc will end the test early.\n\n"
                "Type a name for the test and press Enter to begin: "
            ).strip()
            if suite_unit_name["name"] == "":
                suite_unit_name["name"] = "untitled"
        globals.UnitName = suite_unit_name["name"]

    print("Test Name:", globals.UnitName)

    # Main step loop for this test.
    while (not globals.finished) and (not getattr(globals, "test_done", 0)):
        # ESC key handling (Windows terminal only).
        if msvcrt is not None and msvcrt.kbhit():
            key = msvcrt.getch()
            if key == b"\x1b":  # ESC
                userinput = input(
                    "Are you sure you want to stop?\nPress Y to stop, any key to continue: "
                )
                if userinput in ("y", "Y"):
                    logfile = make_log_path(
                        globals.LogPath, str(globals.UnitName), str(globals.TestFile)
                    )
                    os.makedirs(os.path.dirname(logfile), exist_ok=True)
                    with open(logfile, "w", encoding="utf-8", errors="replace") as f:
                        f.write(
                            "Esc - user interruption @ "
                            + str(datetime.today().strftime(globals.TimeStampFormat))
                            + "\n"
                        )
                        f.write(globals.UUT_TestLog)

                    try:
                        globals.test_file.close()
                    except Exception:
                        pass

                    globals.test_done = 1
                    globals.finished = 1
                    return False

        ProcessScript()
        time.sleep(0.01)

    return True


def main() -> int:
    selector, verbose = _parse_cli(sys.argv[1:])
    if not selector:
        print("\nNo test specified...\n")
        print("Examples:")
        print('  python pat.py "RESET.pat"')
        print('  python pat.py 43019')
        print(r'  python pat.py 43019\43019-1-INPUT-420MA')
        print('  python pat.py "43019\\43019-1-INPUT-420MA.pat" -v')
        return 2

    tests = discover_tests(selector)
    if not tests:
        print("\nCould not find any .pat tests for:", selector)
        print("Looked under:", _dut_root())
        return 2

    globals.Verbose = 1 if verbose else 0
    if globals.Verbose:
        print("Verbose Enabled")

    suite_run = len(tests) > 1
    if suite_run:
        dbc_root = os.path.abspath(os.path.join(_repo_root(), 'dbc'))
        ok = suite_preflight(tests, dut_root=_dut_root(), dbc_root=dbc_root)
        if not ok:
            return 1

    # Decide whether we must open channel 1 at startup.
    need_pat_channel = any(test_uses_pat_support(t) for t in tests)

    # Initialize globals using the *first* test so DBCs / signal dicts exist
    # before we start CAN threads.
    globals.TestFile = tests[0]
    print("\nLoading", str(globals.TestFile) + "...")
    globals.initialize(run_preflight_checks=not suite_run)

    # Start CAN threads (once for the whole run).
    from support.can import CANThread, autodetect_can_backend

    # Auto-detect CAN backend; temporarily force the "need ch1" decision.
    saved = getattr(globals, "SuppressPatSupport", "False")
    globals.SuppressPatSupport = "False" if need_pat_channel else "True"
    autodetect_can_backend()
    globals.SuppressPatSupport = saved

    globals.CAN_1 = threading.Thread(target=CANThread, args=(0,))
    globals.CAN_1.start()

    if need_pat_channel:
        globals.CAN_2 = threading.Thread(target=CANThread, args=(1,))
        globals.CAN_2.start()

    time.sleep(2)

    # Suite UnitName cache (for scripts that don't specify UUT_DATANAME).
    suite_unit_name: dict = {"name": globals.UnitName or ""}

    # Run the first test we already initialized, then the rest.
    # Note: _run_one_test() will re-initialize, so include tests[0] too.
    for idx, test_ref in enumerate(tests, start=1):
        if globals.finished:
            break

        print(style(f"\n[{idx}/{len(tests)}] ", fg="gray", bold=True) + str(test_ref))
        ok = _run_one_test(test_ref=test_ref, suite_unit_name=suite_unit_name, run_preflight_checks=not suite_run)
        if not ok:
            break

    # End run: stop CAN threads.
    globals.finished = 1
    try:
        if hasattr(globals, "CAN_1") and globals.CAN_1 is not None:
            globals.CAN_1.join(timeout=2.0)
    except Exception:
        pass
    try:
        if hasattr(globals, "CAN_2") and getattr(globals, "CAN_2", None) is not None:
            globals.CAN_2.join(timeout=2.0)
    except Exception:
        pass

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
