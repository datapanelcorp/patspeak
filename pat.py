import os
import sys
import signal
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


# -----------------
# Optional suite hooks
# -----------------
#
# Hook scripts allow users to place small .pat programs next to their normal
# DUT tests and have them run automatically.
#
# Reserved filenames (case-insensitive):
#   - pat_start.pat
#   - pat_transition.pat
#   - pat_end.pat
#
# When present next to a test script, the runner will execute:
#   1) pat_start.pat         (once, before the first test in that folder)
#   2) pat_transition.pat    (before and after each test; consecutive duplicates are skipped)
#   3) pat_end.pat           (once, after the last test in that folder)
#
# Hook scripts are *not* included in directory discovery output.

HOOK_START = "pat_start.pat"
HOOK_TRANSITION = "pat_transition.pat"
HOOK_END = "pat_end.pat"
_HOOK_BASENAMES = {HOOK_START.lower(), HOOK_TRANSITION.lower(), HOOK_END.lower()}


def _write_interrupt_log(reason: str) -> None:
    """Best-effort: persist whatever log we have so far.

    Users frequently hit Ctrl+C during long WAIT/HOLD/timeouts.
    When that happens, we want two things:
      1) stop without hanging
      2) keep whatever progress/log output we already have
    """

    try:
        unit = str(getattr(globals, "UnitName", "") or "")
        test_file = str(getattr(globals, "TestFile", "") or "")
        if not unit or not test_file:
            return

        log_dir = getattr(globals, "LogPath", None)
        if not log_dir:
            return

        logfile = make_log_path(log_dir, unit, test_file, getattr(globals, "RunStamp", None))
        os.makedirs(os.path.dirname(logfile), exist_ok=True)
        stamp = datetime.today().strftime(getattr(globals, "TimeStampFormat", "%Y-%m-%d-%H:%M:%S"))

        with open(logfile, "w", encoding="utf-8", errors="replace") as f:
            f.write(str(getattr(globals, "UUT_TestLog", "") or ""))
            f.write(f"\n{reason} @ {stamp}\n")
    except Exception:
        # Don't let logging failures prevent shutdown.
        pass


def _stop_can_threads() -> None:
    """Best-effort CAN thread shutdown.

    Ctrl+C (SIGINT) can otherwise leave non-daemon threads running, which makes
    Python hang at interpreter shutdown while it waits for them.

    We avoid blocking forever: if a driver call wedges, a second Ctrl+C will
    force-exit.
    """

    # Signal all loops to stop.
    try:
        globals.finished = 1
        globals.test_done = 1
    except Exception:
        pass

    # Close the current script file if it's open.
    try:
        tf = getattr(globals, "test_file", None)
        if tf is not None:
            tf.close()
    except Exception:
        pass

    # Join CAN threads briefly.
    for attr in ("CAN_1", "CAN_2"):
        try:
            t = getattr(globals, attr, None)
            if t is not None:
                t.join(timeout=2.0)
        except Exception:
            pass


def _install_sigint_handler() -> None:
    """Install a SIGINT handler that requests shutdown.

    First Ctrl+C: request graceful stop.
    Second Ctrl+C: hard-exit (in case a driver thread is wedged).
    """

    state = {"count": 0}

    def _handler(signum, frame):  # noqa: ARG001
        """Handle Ctrl+C.

        On Windows, raising KeyboardInterrupt directly from a signal handler
        can behave inconsistently depending on how the program is running.
        Using threading.interrupt_main() is more reliable at breaking out of
        time.sleep()/input() without leaving stray threads.
        """

        state["count"] += 1

        if state["count"] == 1:
            try:
                print("\n^C received — stopping…")
            except Exception:
                pass

            # Persist whatever we have so far.
            _write_interrupt_log("Ctrl+C - user interruption")

            # Request a clean stop.
            _stop_can_threads()

            # Break out of any blocking call in the main thread.
            try:
                threading.interrupt_main()
            except Exception:
                pass
            return

        # Second Ctrl+C => force exit (avoid indefinite hangs).
        try:
            print("\n^C received again — forcing exit.")
        except Exception:
            pass
        os._exit(130)

    try:
        signal.signal(signal.SIGINT, _handler)
    except Exception:
        # Some environments may not support signal handling (rare on Windows).
        pass


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


def _is_hook_filename(path: str) -> bool:
    """Return True if `path` looks like a reserved hook script name."""
    try:
        base = os.path.basename(str(path)).strip().lower()
    except Exception:
        return False
    return base in _HOOK_BASENAMES


def find_hook_next_to(test_ref: str, hook_basename: str) -> str | None:
    """Return a test reference for a hook file next to `test_ref`, if present.

    The returned reference is suitable for globals.TestFile:
      - relative to dut/ when the file is under dut/
      - otherwise an absolute path
    """

    hook_basename = (hook_basename or "").strip()
    if not hook_basename:
        return None

    test_path = _abs_test_path(test_ref)
    test_dir = os.path.dirname(os.path.abspath(test_path))
    cand = os.path.join(test_dir, hook_basename)
    if not os.path.isfile(cand):
        return None

    dut_root = _dut_root()
    if _is_under_root(cand, dut_root):
        return os.path.relpath(cand, dut_root)
    return os.path.abspath(cand)


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
            # Hook scripts are special and should not be treated as normal
            # tests when running a whole folder.
            if _is_hook_filename(name):
                continue

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


def _parse_cli(argv: list[str]) -> tuple[str, int]:
    """Return (selector, verbosity_level).

    Verbosity levels:
      0 = default
      1 = verbose (existing behaviour)
      2 = super-verbose (trace signal switching + CAN TX diffs)

    Supported flags:
      -v, --verbose
      -vv, --super-verbose
    """

    selector = ""
    verbosity = 0

    for a in argv:
        a = (a or "").strip()

        # Most common forms.
        if a in ("-vv", "--vv", "--super-verbose"):
            verbosity = max(verbosity, 2)
            continue
        if a in ("-v", "--verbose"):
            verbosity = max(verbosity, 1)
            continue

        # Common "stacked" short flag style: -vvv, -vvvv, etc.
        if a.startswith("-") and len(a) > 2 and set(a[1:]) == {"v"}:
            verbosity = max(verbosity, min(2, len(a) - 1))
            continue

        # ignore unknown flags (for now)
        if a.startswith("-"):
            continue
        if not selector:
            selector = a

    return selector, verbosity


def _run_one_test(
    *,
    test_ref: str,
    suite_unit_name: dict,
    run_preflight_checks: bool = True,
    kind: str = "test",
) -> bool:
    """Run a single .pat script (test or hook).

    Returns True if the script completed, False if it was aborted early (Esc).
    """
    globals.TestFile = test_ref

    kind_norm = (kind or "test").strip().lower()

    # Show a friendly label.
    print("\n" + "=" * 80)
    label = "Running" if kind_norm == "test" else f"Running ({kind_norm})"
    print(label + ":", test_ref)
    print("=" * 80)

    # Re-initialize globals for this test.
    globals.initialize(run_preflight_checks=run_preflight_checks)

    # Hooks are typically used for setup/teardown/relay-cycling.
    # If the suite already has a UnitName (serial number, etc.), force hooks
    # to use it so they don't accidentally change output naming.
    if kind_norm != "test" and suite_unit_name.get("name"):
        globals.UnitName = str(suite_unit_name["name"])

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
    # NOTE: Ctrl+C can arrive while we're in ProcessScript() or in the sleep.
    # We catch KeyboardInterrupt here to ensure we always request a clean stop
    # (instead of letting it bubble out and potentially hang on shutdown).
    try:
        while (not globals.finished) and (not getattr(globals, "test_done", 0)):
            # ESC key handling (Windows terminal only).
            if msvcrt is not None and msvcrt.kbhit():
                key = msvcrt.getch()
                if key == b"\x1b":  # ESC
                    userinput = input(
                        "Are you sure you want to stop?\nPress Y to stop, any key to continue: "
                    )
                    if userinput in ("y", "Y"):
                        _write_interrupt_log("Esc - user interruption")
                        try:
                            globals.test_file.close()
                        except Exception:
                            pass
                        globals.test_done = 1
                        globals.finished = 1
                        return False

            ProcessScript()
            time.sleep(0.01)
    except KeyboardInterrupt:
        # Ctrl+C during test execution.
        # Do best-effort cleanup/logging here, but let the exception bubble so
        # main() can return an appropriate exit code.
        _write_interrupt_log("Ctrl+C - user interruption")
        _stop_can_threads()
        raise

    return True


def main() -> int:
    # Make Ctrl+C predictable: request a clean stop, and avoid interpreter hangs
    # caused by live non-daemon threads.
    _install_sigint_handler()

    interrupted = False

    try:
        selector, verbosity = _parse_cli(sys.argv[1:])
        if not selector:
            print("\nNo test specified...\n")
            print("Examples:")
            print('  python pat.py "RESET.pat"')
            print('  python pat.py 43019')
            print(r'  python pat.py 43019\43019-1-INPUT-420MA')
            print('  python pat.py "43019\\43019-1-INPUT-420MA.pat" -v')
            print('  python pat.py "43019\\43019-1-INPUT-420MA.pat" -vv')
            return 2

        tests = discover_tests(selector)
        if not tests:
            print("\nCould not find any .pat tests for:", selector)
            print("Looked under:", _dut_root())
            return 2

        globals.Verbose = int(verbosity)
        if globals.Verbose >= 2:
            print("Super Verbose Enabled")
        elif globals.Verbose >= 1:
            print("Verbose Enabled")

        # Optional per-folder hook scripts (next to the tests).
        hook_start = find_hook_next_to(tests[0], HOOK_START)
        hook_end = find_hook_next_to(tests[-1], HOOK_END)
        transition_hooks: list[str] = []
        for t in tests:
            h = find_hook_next_to(t, HOOK_TRANSITION)
            if h:
                transition_hooks.append(h)

        # Keep hook refs unique (but preserve first-seen order).
        def _uniq(items: list[str]) -> list[str]:
            seen: set[str] = set()
            out: list[str] = []
            for it in items:
                if not it:
                    continue
                key = os.path.abspath(_abs_test_path(it)).lower()
                if key in seen:
                    continue
                seen.add(key)
                out.append(it)
            return out

        transition_hooks = _uniq(transition_hooks)

        suite_run = len(tests) > 1
        if suite_run:
            dbc_root = os.path.abspath(os.path.join(_repo_root(), "dbc"))

            # Preflight *everything* we might run (tests + hooks), but only
            # show each script once.
            preflight_refs: list[str] = []
            if hook_start:
                preflight_refs.append(hook_start)
            preflight_refs.extend(transition_hooks)
            preflight_refs.extend(tests)
            if hook_end:
                preflight_refs.append(hook_end)
            preflight_refs = _uniq(preflight_refs)

            ok = suite_preflight(preflight_refs, dut_root=_dut_root(), dbc_root=dbc_root)
            if not ok:
                return 1

        # Decide whether we must open channel 1 at startup.
        pat_support_refs: list[str] = []
        if hook_start:
            pat_support_refs.append(hook_start)
        pat_support_refs.extend(transition_hooks)
        pat_support_refs.extend(tests)
        if hook_end:
            pat_support_refs.append(hook_end)
        pat_support_refs = _uniq(pat_support_refs)

        need_pat_channel = any(test_uses_pat_support(t) for t in pat_support_refs)

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

        # Threads are daemon threads as a last-resort safety valve: if a driver
        # call wedges and a clean shutdown can't join, the interpreter won't hang.
        globals.CAN_1 = threading.Thread(
            target=CANThread, args=(0,), daemon=True, name="CAN-CH0"
        )
        globals.CAN_1.start()

        if need_pat_channel:
            globals.CAN_2 = threading.Thread(
                target=CANThread, args=(1,), daemon=True, name="CAN-CH1"
            )
            globals.CAN_2.start()

        time.sleep(2)

        # Suite UnitName cache (for scripts that don't specify UUT_DATANAME).
        suite_unit_name: dict = {"name": globals.UnitName or ""}

        last_run_abs: str | None = None

        def _run_script(ref: str, kind: str) -> bool:
            """Run a test/hook by reference, skipping consecutive duplicates."""

            nonlocal last_run_abs

            if not ref:
                return True

            abs_ref = os.path.abspath(_abs_test_path(ref))
            if last_run_abs is not None and abs_ref.lower() == last_run_abs.lower():
                # Common case: transition runs after test N and before test N+1.
                # If both would execute the same file back-to-back, skip the
                # second invocation.
                return True

            ok = _run_one_test(
                test_ref=ref,
                suite_unit_name=suite_unit_name,
                run_preflight_checks=not suite_run,
                kind=kind,
            )
            last_run_abs = abs_ref
            return ok

        # Start hook (once, before the first test).
        if hook_start:
            ok = _run_script(hook_start, "hook-start")
            if not ok:
                return 0

        # Run tests (with optional transition hook before/after each).
        for idx, test_ref in enumerate(tests, start=1):
            if globals.finished:
                break

            print(style(f"\n[{idx}/{len(tests)}] ", fg="gray", bold=True) + str(test_ref))

            transition = find_hook_next_to(test_ref, HOOK_TRANSITION)
            if transition:
                ok = _run_script(transition, "hook-transition")
                if not ok:
                    break

            ok = _run_script(test_ref, "test")
            if not ok:
                break

            if transition:
                ok = _run_script(transition, "hook-transition")
                if not ok:
                    break

        # End hook (once, after the last test).
        if not globals.finished and hook_end:
            _run_script(hook_end, "hook-end")

        return 0

    except KeyboardInterrupt:
        # We suppress the stack trace and do best-effort cleanup in finally.
        interrupted = True
        try:
            print("\nInterrupted (Ctrl+C)")
        except Exception:
            pass
        # Persist what we have so far.
        _write_interrupt_log("Ctrl+C - user interruption")
        return 130

    finally:
        _stop_can_threads()

        # On some Windows CAN backends (or when vendor driver calls wedge), the
        # interpreter can still hang on shutdown waiting for stray non-daemon
        # threads. If the user explicitly requested interruption, make exit
        # deterministic.
        if interrupted:
            try:
                sys.stdout.flush()
                sys.stderr.flush()
            except Exception:
                pass
            # Give the threads a brief moment to unwind, then hard-exit.
            try:
                time.sleep(0.25)
            except Exception:
                pass
            os._exit(130)


if __name__ == "__main__":
    # Last-resort guard: even if a KeyboardInterrupt bubbles past main()
    # (e.g. if local edits remove the try/except), do not leave the process
    # half-alive with CAN threads running.
    try:
        raise SystemExit(main())
    except KeyboardInterrupt:
        try:
            print("\nInterrupted (Ctrl+C)")
        except Exception:
            pass
        try:
            _write_interrupt_log("Ctrl+C - user interruption")
        except Exception:
            pass
        try:
            _stop_can_threads()
        except Exception:
            pass
        os._exit(130)
