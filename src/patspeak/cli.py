"""PATSpeak command-line interface.

This module provides the implementation behind the `pat` console command.
"""

from __future__ import annotations

import os
import sys
import signal
import threading
import time
from datetime import datetime


from .script import ProcessScript
from .preflight import suite_preflight
from . import runtime as rt
from . import __version__
from .paths import get_paths
from .console import make_log_path, style, color_enabled
from .revision import startup_banner
from .progress import (
    install as progress_install,
    set_suite as progress_set_suite,
    start_script as progress_start,
    finish_script as progress_finish,
    disable as progress_disable,
    emergency_restore_terminal as progress_emergency_restore_terminal,
)


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
        unit = str(getattr(rt, "UnitName", "") or "")
        test_file = str(getattr(rt, "TestFile", "") or "")
        if not unit or not test_file:
            return

        log_dir = getattr(rt, "LogPath", None)
        if not log_dir:
            return

        logfile = make_log_path(log_dir, unit, test_file, getattr(rt, "RunStamp", None))
        os.makedirs(os.path.dirname(logfile), exist_ok=True)
        stamp = datetime.today().strftime(getattr(rt, "TimeStampFormat", "%Y-%m-%d-%H:%M:%S"))

        with open(logfile, "w", encoding="utf-8", errors="replace") as f:
            f.write(str(getattr(rt, "UUT_TestLog", "") or ""))
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
        rt.finished = 1
        rt.test_done = 1
    except Exception:
        pass

    # Close the current script file if it's open.
    try:
        tf = getattr(rt, "test_file", None)
        if tf is not None:
            tf.close()
    except Exception:
        pass

    # Join CAN threads briefly.
    for attr in ("CAN_1", "CAN_2"):
        try:
            t = getattr(rt, attr, None)
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

            # IMPORTANT:
            # We install a custom SIGINT handler, which replaces Python's
            # default behavior of raising KeyboardInterrupt.
            #
            # The earlier implementation used threading.interrupt_main(), but
            # on some Windows setups that results in a *delayed* (or missed)
            # KeyboardInterrupt, which makes users press Ctrl+C twice.
            #
            # Call the default int handler explicitly so the first Ctrl+C
            # reliably aborts the run.
            # Raise KeyboardInterrupt *now* so the main loop stops scheduling
            # additional scripts (hooks/tests) after the current one unwinds.
            #
            # If something is wedged badly enough that KeyboardInterrupt can't
            # unwind, the user can still press Ctrl+C again to force-exit.
            signal.default_int_handler(signum, frame)

            # Unreachable (default_int_handler raises), but keep explicit for
            # readability.
            return

        # Second Ctrl+C => force exit (avoid indefinite hangs).
        try:
            print("\n^C received again — forcing exit.")
        except Exception:
            pass
        # If the progress UI is using the flicker-free "sticky" mode, it may
        # have changed the terminal scroll region to reserve the last row.
        # A hard os._exit() bypasses normal cleanup, so restore the terminal
        # *before* exiting to avoid leaving the user's console in a stuck
        # state.
        try:
            progress_emergency_restore_terminal()
        except Exception:
            pass
        os._exit(130)

    try:
        signal.signal(signal.SIGINT, _handler)
    except Exception:
        # Some environments may not support signal handling (rare on Windows).
        pass


def _repo_root() -> str:
    return str(get_paths().home)


def _dut_root() -> str:
    return str(get_paths().dut)


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

    The returned reference is suitable for rt.TestFile:
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

    Returns a list of test refs suitable for rt.TestFile:
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
    suite_index: int = 0,
) -> bool:
    """Run a single .pat script (test or hook).

    Returns True if the script completed. (Early stops are handled via Ctrl+C / SIGINT.)
    """
    rt.TestFile = test_ref

    kind_norm = (kind or "test").strip().lower()

    # Show a friendly label.
    print("\n" + "=" * 80)
    label = "Running" if kind_norm == "test" else f"Running ({kind_norm})"
    print(label + ":", test_ref)
    print("=" * 80)

    # Re-initialize globals for this test.
    rt.initialize(run_preflight_checks=run_preflight_checks)

    # Hooks are typically used for setup/teardown/relay-cycling.
    # If the suite already has a UnitName (serial number, etc.), force hooks
    # to use it so they don't accidentally change output naming.
    if kind_norm != "test" and suite_unit_name.get("name"):
        rt.UnitName = str(suite_unit_name["name"])

    # Prompt for UnitName only once per suite (unless script sets UUT_DATANAME).
    if rt.UnitName == "":
        if not suite_unit_name.get("name"):
            suite_unit_name["name"] = input(
                "Press Ctrl+C to stop the test early.\n\n"
                "Type a name for the test and press Enter to begin: "
            ).strip()
            if suite_unit_name["name"] == "":
                suite_unit_name["name"] = "untitled"
        rt.UnitName = suite_unit_name["name"]

    print("Test Name:", rt.UnitName)

    # Start the bottom-row progress UI for this script.
    # (For hooks, we still show the current suite index but do not mark the
    # suite item as running/complete.)
    try:
        progress_start(
            test_ref=test_ref,
            kind=kind_norm,
            suite_index=int(suite_index or 0),
            suite_mark_running=(kind_norm == "test" and int(suite_index or 0) > 0),
            unit_name=str(rt.UnitName or ""),
            total_steps=int(getattr(rt, "TotalSteps", 0) or 0),
        )
    except Exception:
        pass

    # Main step loop for this test.
    # NOTE: Ctrl+C can arrive while we're in ProcessScript() or in the sleep.
    # We catch KeyboardInterrupt here to ensure we always request a clean stop
    # (instead of letting it bubble out and potentially hang on shutdown).
    ok_pass = None
    try:
        while (not rt.finished) and (not getattr(rt, "test_done", 0)):
            ProcessScript()
            time.sleep(0.01)
    except KeyboardInterrupt:
        # Ctrl+C during test execution.
        # Do best-effort cleanup/logging here, but let the exception bubble so
        # main() can return an appropriate exit code.
        _write_interrupt_log("Ctrl+C - user interruption")
        _stop_can_threads()
        ok_pass = False
        raise

    finally:
        # Mark this script complete in the progress UI.
        try:
            if kind_norm == "test" and int(suite_index or 0) > 0:
                if ok_pass is None:
                    ok_pass = bool(getattr(rt, "FailCount", 0) == 0)
                progress_finish(passed=ok_pass, suite_index=int(suite_index or 0))
            else:
                progress_finish(passed=None, suite_index=0)
        except Exception:
            pass

    return True


def main() -> int:
    # Make Ctrl+C predictable: request a clean stop, and avoid interpreter hangs
    # caused by live non-daemon threads.
    _install_sigint_handler()

    # Print a one-line version/revision banner up front.
    # (Disable with: PATSPEAK_BANNER=0)
    try:
        banner = startup_banner(base_version=__version__)
        if banner:
            print(banner)
    except Exception:
        # Never let banner/revision logic prevent running tests.
        pass

    interrupted = False

    try:
        selector, verbosity = _parse_cli(sys.argv[1:])
        if not selector:
            print("\nNo test specified...\n")
            print("Examples:")
            # Preferred (after running scripts/setup_venv and activating the venv):
            print('  pat "RESET.pat"')
            print('  pat 43019-1')
            print(r'  pat 43019-1\43019-1-INPUT-420MA')
            print('  pat "43019-1\\43019-1-INPUT-420MA.pat" -v')
            print('  pat "43019-1\\43019-1-INPUT-420MA.pat" -vv')
            print("")
            # Fallback (run directly from the repo root):
            print('  python pat.py "RESET.pat"')
            print('  python pat.py 43019-1')
            return 2

        tests = discover_tests(selector)
        if not tests:
            print("\nCould not find any .pat tests for:", selector)
            print("Looked under:", _dut_root())
            return 2

        rt.Verbose = int(verbosity)
        if rt.Verbose >= 2:
            print("Super Verbose Enabled")
        elif rt.Verbose >= 1:
            print("Verbose Enabled")

        # Optional bottom-row progress UI (auto-enabled when stdout is a TTY).
        # This installs a stdout wrapper that keeps the status line visible
        # while normal prints scroll above.
        # Force ANSI / color initialization *before* installing the progress UI.
        # On Windows, colorama may wrap sys.stdout/sys.stderr when first used.
        # If that happens after we install the progress wrapper, it can replace it.
        # Calling color_enabled() here ensures any required wrapping happens first.
        try:
            color_enabled()
        except Exception:
            pass

        try:
            progress_install()
            progress_set_suite(len(tests))
        except Exception:
            pass

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
            dbc_root = str(get_paths().dbc)

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
        rt.TestFile = tests[0]
        print("\nLoading", str(rt.TestFile) + "...")
        rt.initialize(run_preflight_checks=not suite_run)

        # Start CAN threads (once for the whole run).
        from .can import CANThread, autodetect_can_backend

        # Auto-detect CAN backend; temporarily force the "need ch1" decision.
        saved = getattr(rt, "SuppressPatSupport", "False")
        rt.SuppressPatSupport = "False" if need_pat_channel else "True"
        autodetect_can_backend()

        # If the CAN layer had to fall back to a single available CAN channel,
        # it will force SUPPRESS_PAT_SUPPORT for the whole process. In that
        # case we must *not* start CAN-CH1.
        if getattr(rt, "FORCE_SUPPRESS_PAT_SUPPORT", False):
            need_pat_channel = False
            rt.SuppressPatSupport = "True"
        else:
            rt.SuppressPatSupport = saved

        # Threads are daemon threads as a last-resort safety valve: if a driver
        # call wedges and a clean shutdown can't join, the interpreter won't hang.
        rt.CAN_1 = threading.Thread(
            target=CANThread, args=(0,), daemon=True, name="CAN-CH0"
        )
        rt.CAN_1.start()

        if need_pat_channel:
            rt.CAN_2 = threading.Thread(
                target=CANThread, args=(1,), daemon=True, name="CAN-CH1"
            )
            rt.CAN_2.start()

        time.sleep(2)

        # Suite UnitName cache (for scripts that don't specify UUT_DATANAME).
        suite_unit_name: dict = {"name": rt.UnitName or ""}

        last_run_abs: str | None = None

        def _run_script(ref: str, kind: str, *, suite_index: int = 0) -> bool:
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
                suite_index=int(suite_index or 0),
            )
            last_run_abs = abs_ref
            return ok

        # Start hook (once, before the first test).
        if hook_start:
            ok = _run_script(hook_start, "hook-start", suite_index=1)
            if not ok:
                return 0

        # Run tests (with optional transition hook before/after each).
        for idx, test_ref in enumerate(tests, start=1):
            if rt.finished:
                break

            print(style(f"\n[{idx}/{len(tests)}] ", fg="gray", bold=True) + str(test_ref))

            transition = find_hook_next_to(test_ref, HOOK_TRANSITION)
            if transition:
                ok = _run_script(transition, "hook-transition", suite_index=idx)
                if not ok:
                    break

            ok = _run_script(test_ref, "test", suite_index=idx)
            if not ok:
                break

            if transition:
                ok = _run_script(transition, "hook-transition", suite_index=idx)
                if not ok:
                    break

        # End hook (once, after the last test).
        if not rt.finished and hook_end:
            _run_script(hook_end, "hook-end", suite_index=len(tests))

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
        # Clear the bottom-row progress UI so the user's shell prompt doesn't
        # end up on the same line.
        try:
            progress_disable()
        except Exception:
            pass

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
            # os._exit() bypasses atexit and may skip other cleanup.
            # Make sure the terminal isn't left with a modified scroll region
            # (sticky progress UI) before we hard exit.
            try:
                progress_emergency_restore_terminal()
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
        try:
            progress_disable()
        except Exception:
            pass
        # Ensure the terminal scroll region is restored even on hard-exit.
        try:
            progress_emergency_restore_terminal()
        except Exception:
            pass
        os._exit(130)
