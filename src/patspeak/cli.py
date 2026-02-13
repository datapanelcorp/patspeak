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
from .console import make_log_path, safe_test_id, style, color_enabled
from .revision import startup_banner
from .progress import (
    install as progress_install,
    enable as progress_enable,
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

# Status codes returned by test runner functions
STATUS_EXIT = -1  # User requested abort/exit
STATUS_NEXT = 0  # Normal completion or skip (proceed to next)
# Any value > 0 represents a request to JUMP to that specific 1-based suite index.


def _env_truthy(name: str, default: bool = True) -> bool:
    """Parse a boolean-ish environment variable.

    Accepts common truthy/falsey spellings.

    This is intentionally duplicated here (instead of importing runtime._truthy)
    to keep CLI behavior stable even if runtime parsing changes.
    """

    raw = os.environ.get(name)
    if raw is None:
        return default

    s = str(raw).strip().lower()
    if s in {"1", "true", "t", "yes", "y", "on", "enable", "enabled", "all"}:
        return True
    if s in {"0", "false", "f", "no", "n", "off", "disable", "disabled", "none"}:
        return False
    return default


def _hook_results_enabled(kind: str) -> bool:
    """Return True if this hook kind should write result files.

    By default hooks write logs like any other .pat run.

    Users can suppress hook result files (while still running the hook scripts)
    via environment variables:

      - PATSPEAK_HOOK_RESULTS=0   (disable results for ALL hooks)
      - PATSPEAK_HOOK_START_RESULTS=0
      - PATSPEAK_HOOK_TRANSITION_RESULTS=0
      - PATSPEAK_HOOK_END_RESULTS=0
    """

    k = (kind or "").strip().lower()

    # Global override.
    if not _env_truthy("PATSPEAK_HOOK_RESULTS", default=True):
        return False

    if k in {"hook-start", "start", "pat_start"}:
        return _env_truthy("PATSPEAK_HOOK_START_RESULTS", default=True)
    if k in {"hook-transition", "transition", "pat_transition"}:
        return _env_truthy("PATSPEAK_HOOK_TRANSITION_RESULTS", default=True)
    if k in {"hook-end", "end", "pat_end"}:
        return _env_truthy("PATSPEAK_HOOK_END_RESULTS", default=True)

    # Unknown hook kinds default to enabled.
    return True


def _write_interrupt_log(reason: str) -> None:
    """Best-effort: persist whatever log we have so far.

    Users frequently hit Ctrl+C during long WAIT/HOLD/timeouts.
    When that happens, we want two things:
      1) stop without hanging
      2) keep whatever progress/log output we already have
    """

    try:
        # Respect per-run suppression (used by suite hooks).
        if not bool(getattr(rt, "WRITE_RESULTS", True)):
            return

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


# Track consecutive Ctrl+C presses globally.
_SIGINT_COUNT = 0


def _install_sigint_handler() -> None:
    """Install a SIGINT handler.

    First Ctrl+C: Raise KeyboardInterrupt (to show menu).
    Second Ctrl+C: Force hard-exit.
    """

    def _handler(signum, frame):  # noqa: ARG001
        global _SIGINT_COUNT
        _SIGINT_COUNT += 1

        if _SIGINT_COUNT == 1:
            # First press: raise KeyboardInterrupt to let the loop handle the menu.
            signal.default_int_handler(signum, frame)
            return

        # Second Ctrl+C => force exit.
        try:
            print("\n^C received again — forcing exit.")
        except Exception:
            pass
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
    all_tests: list[str] | None = None,
    log_test_ref: str | None = None,
    unit_name_override: str | None = None,
    write_results: bool | None = None,
) -> int:
    """Run a single .pat script (test or hook).

    Returns:
        int: One of STATUS_NEXT (0), STATUS_EXIT (-1), or a positive integer
             representing a 1-based index to jump to.
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

    # Control whether this run writes any result artifacts (log/CSV).
    # Defaults to True for normal tests.
    try:
        if write_results is None:
            rt.WRITE_RESULTS = True
        else:
            rt.WRITE_RESULTS = bool(write_results)
    except Exception:
        pass

    # Hooks are typically used for setup/teardown/relay-cycling.
    # If the suite already has a UnitName that was *prompted* (serial number,
    # etc.), force hooks to use it so we don't accidentally change output naming.
    if (
        kind_norm != "test"
        and suite_unit_name.get("name")
        and bool(suite_unit_name.get("prompted", False))
    ):
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
            suite_unit_name["prompted"] = True
        rt.UnitName = suite_unit_name["name"]

    # Optional naming overrides (primarily for hooks):
    # - unit_name_override controls the UnitName used for output files
    # - log_test_ref controls the test identifier used for output file naming
    if unit_name_override is not None:
        try:
            rt.UnitName = str(unit_name_override)
        except Exception:
            pass

    if log_test_ref is not None:
        # rt.initialize already opened the underlying file handle based on the
        # real test_ref. It's safe to replace rt.TestFile *string* now purely
        # for output naming purposes.
        try:
            rt.TestFile = str(log_test_ref)
        except Exception:
            pass

    print("Test Name:", rt.UnitName)

    # Start the bottom-row progress UI for this script.
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
    ok_pass = None
    exit_status = STATUS_NEXT

    try:
        while (not rt.finished) and (not getattr(rt, "test_done", 0)):
            try:
                ProcessScript()
                time.sleep(0.01)

            except KeyboardInterrupt:
                # Ctrl+C caught. Show the pause menu.
                try:
                    progress_disable()
                except Exception:
                    pass

                print("\n\n" + "=" * 30)
                print(" PAUSED BY USER")
                print("=" * 30)
                print(" (C)ontinue testing")
                print(" (S)kip current test")
                if kind_norm == "test" and all_tests and len(all_tests) > 1:
                    print(" (J)ump to test...")
                print(" (E)xit execution")
                print("-" * 30)

                should_break_loop = False

                while True:
                    try:
                        choice = input("Select option: ").strip().lower()
                    except ValueError:
                        continue

                    if choice.startswith("c"):
                        print("Resuming...")
                        # Reset interrupt count so next Ctrl+C is treated as a pause.
                        global _SIGINT_COUNT
                        _SIGINT_COUNT = 0
                        try:
                            # Use ENABLE, not install, to force the renderer back on.
                            progress_enable()
                        except Exception:
                            pass
                        # Break menu loop, continue test loop
                        break

                    if choice.startswith("s"):
                        print("Skipping test...")
                        _write_interrupt_log("Skipped by user command")
                        rt.test_done = 1
                        ok_pass = False
                        exit_status = STATUS_NEXT
                        should_break_loop = True
                        break

                    if choice.startswith("e"):
                        print("Exiting...")
                        _write_interrupt_log("Aborted by user command")
                        _stop_can_threads()
                        rt.finished = 1
                        exit_status = STATUS_EXIT
                        should_break_loop = True
                        break

                    if (
                        choice.startswith("j")
                        and kind_norm == "test"
                        and all_tests
                        and len(all_tests) > 1
                    ):
                        print("\nAvailable Tests:")
                        for idx, t_name in enumerate(all_tests, start=1):
                            marker = "   "
                            if idx == suite_index:
                                marker = "-> "
                            elif idx < suite_index:
                                marker = " * "
                            print(f"{marker} {idx}. {t_name}")

                        print("\nEnter test number to jump to (or Enter to cancel).")
                        try:
                            val = input("Jump to #: ").strip()
                            if not val:
                                continue
                            tgt = int(val)
                            if 1 <= tgt <= len(all_tests):
                                print(f"Jumping to test #{tgt}...")
                                _write_interrupt_log(f"User jumped to test #{tgt}")
                                rt.test_done = 1
                                # Do NOT set rt.finished = 1 here; that aborts the entire suite.
                                ok_pass = False
                                exit_status = tgt  # Return the target index
                                should_break_loop = True
                                break
                            else:
                                print("Invalid index.")
                        except ValueError:
                            print("Invalid input.")
                        continue

                if should_break_loop:
                    break

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

    return exit_status


def main() -> int:
    # Make Ctrl+C predictable.
    _install_sigint_handler()

    # Compute banner early.
    try:
        banner = startup_banner(base_version=__version__)
    except Exception:
        banner = ""

    argv_raw = [str(a or "").strip() for a in sys.argv[1:]]
    if any(a in {"-V", "--version", "--revision"} for a in argv_raw):
        if banner:
            print(banner)
        else:
            print(f"PATSpeak {__version__}")
        return 0

    interrupted = False

    try:
        selector, verbosity = _parse_cli(argv_raw)
        if not selector:
            if banner:
                print(banner)
            print("\nNo test specified...\n")
            print("Examples:")
            print('  pat "RESET.pat"')
            print('  pat 43019-1')
            print(r'  pat 43019-1\43019-1-INPUT-420MA')
            return 2

        tests = discover_tests(selector)
        if not tests:
            if banner:
                print(banner)
            print("\nCould not find any .pat tests for:", selector)
            print("Looked under:", _dut_root())
            return 2

        rt.Verbose = int(verbosity)
        if rt.Verbose >= 2:
            print("Super Verbose Enabled")
        elif rt.Verbose >= 1:
            print("Verbose Enabled")

        try:
            color_enabled()
        except Exception:
            pass

        try:
            progress_install()
            progress_set_suite(len(tests))
        except Exception:
            pass

        try:
            if banner:
                print(banner, flush=True)
        except Exception:
            pass

        # Hooks
        hook_start = find_hook_next_to(tests[0], HOOK_START)
        hook_end = find_hook_next_to(tests[-1], HOOK_END)
        transition_hooks: list[str] = []
        for t in tests:
            h = find_hook_next_to(t, HOOK_TRANSITION)
            if h:
                transition_hooks.append(h)

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

        # Check PAT channel requirements
        pat_support_refs: list[str] = []
        if hook_start:
            pat_support_refs.append(hook_start)
        pat_support_refs.extend(transition_hooks)
        pat_support_refs.extend(tests)
        if hook_end:
            pat_support_refs.append(hook_end)
        pat_support_refs = _uniq(pat_support_refs)

        need_pat_channel = any(test_uses_pat_support(t) for t in pat_support_refs)

        # Initialize globals
        rt.TestFile = tests[0]
        print("\nLoading", str(rt.TestFile) + "...")
        rt.initialize(run_preflight_checks=not suite_run)

        # Start CAN
        from .can import CANThread, autodetect_can_backend

        saved = getattr(rt, "SuppressPatSupport", "False")
        rt.SuppressPatSupport = "False" if need_pat_channel else "True"
        autodetect_can_backend()

        if getattr(rt, "FORCE_SUPPRESS_PAT_SUPPORT", False):
            need_pat_channel = False
            rt.SuppressPatSupport = "True"
        else:
            rt.SuppressPatSupport = saved

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

        suite_unit_name: dict = {
            "name": rt.UnitName or "",
            # Set True only when the operator was prompted for a suite name.
            # (If a script sets UUT_DATANAME, that is usually a per-test label,
            # not a serial number we want to force onto hooks.)
            "prompted": False,
        }
        last_run_abs: str | None = None

        def _run_script(
            ref: str,
            kind: str,
            *,
            suite_index: int = 0,
            all_tests_ref: list[str] | None = None,
            log_test_ref: str | None = None,
            unit_name_override: str | None = None,
            write_results: bool | None = None,
        ) -> int:
            """Run a test/hook. Returns status code (0=next, -1=exit, >0=jump)."""

            nonlocal last_run_abs
            if not ref:
                return STATUS_NEXT

            abs_ref = os.path.abspath(_abs_test_path(ref))
            if last_run_abs is not None and abs_ref.lower() == last_run_abs.lower():
                return STATUS_NEXT

            status = _run_one_test(
                test_ref=ref,
                suite_unit_name=suite_unit_name,
                run_preflight_checks=not suite_run,
                kind=kind,
                suite_index=int(suite_index or 0),
                all_tests=all_tests_ref,
                log_test_ref=log_test_ref,
                unit_name_override=unit_name_override,
                write_results=write_results,
            )
            
            # If valid run, update duplicate-check cache
            last_run_abs = abs_ref
            return status

        # Main suite execution index
        idx = 1

        # Track the last *test* we actually ran (used for transition naming,
        # especially when the user jumps around in the suite).
        last_test_ref: str | None = None

        def _hook_name_overrides(
            kind: str,
            *,
            from_ref: str | None = None,
            to_ref: str | None = None,
        ) -> tuple[str, str | None]:
            """Return (log_test_ref, unit_name_override) for a hook run.

            We want hook result filenames to clearly show what they are doing.
            For transition hooks, that means including the *from* and *to* tests.

            Naming rules:
              - If the suite UnitName was prompted (serial number, etc.), keep
                it as the filename prefix.
              - If the suite UnitName comes from UUT_DATANAME (usually a per-test
                label), do *not* force it onto hooks; instead, de-dupe filenames
                by setting UnitName == <hook alias>.
            """

            k = (kind or "").strip().lower()

            def _stem(ref: str | None, *, fallback: str) -> str:
                if not ref:
                    return fallback
                return safe_test_id(ref)

            if k in {"hook-start", "start"}:
                tgt = _stem(to_ref, fallback="START")
                alias = f"pat_start_before_{tgt}"
            elif k in {"hook-transition", "transition"}:
                src = _stem(from_ref, fallback="START")
                tgt = _stem(to_ref, fallback="END")
                alias = f"pat_transition_{src}_to_{tgt}"
            elif k in {"hook-end", "end"}:
                src = _stem(from_ref, fallback="END")
                alias = f"pat_end_after_{src}"
            else:
                # Fallback: keep it recognizable.
                alias = f"hook_{safe_test_id(kind or 'hook')}"

            log_test_ref = f"{alias}.pat"

            # If the suite name was prompted (serial), keep it.
            if bool(suite_unit_name.get("prompted", False)):
                return log_test_ref, None

            # Otherwise, produce clean hook filenames without a misleading
            # prefix from the first test.
            return log_test_ref, alias
        
        # Start hook
        if hook_start:
            start_log_ref, start_unit_override = _hook_name_overrides(
                "hook-start", to_ref=tests[0] if tests else None
            )
            status = _run_script(
                hook_start,
                "hook-start",
                suite_index=1,
                all_tests_ref=tests,
                log_test_ref=start_log_ref,
                unit_name_override=start_unit_override,
                write_results=_hook_results_enabled("hook-start"),
            )
            if status == STATUS_EXIT:
                return 0
            if status > 0:
                # Jump from start hook? Interpret as jumping to that test index
                idx = status
                last_run_abs = None

        # Run tests loop
        while idx <= len(tests):
            if rt.finished:
                break
            
            test_ref = tests[idx - 1]
            print(style(f"\n[{idx}/{len(tests)}] ", fg="gray", bold=True) + str(test_ref))

            # Pre-transition
            transition = find_hook_next_to(test_ref, HOOK_TRANSITION)
            if transition:
                pre_log_ref, pre_unit_override = _hook_name_overrides(
                    "hook-transition", from_ref=last_test_ref, to_ref=test_ref
                )
                status = _run_script(
                    transition,
                    "hook-transition",
                    suite_index=idx,
                    all_tests_ref=tests,
                    log_test_ref=pre_log_ref,
                    unit_name_override=pre_unit_override,
                    write_results=_hook_results_enabled("hook-transition"),
                )
                if status == STATUS_EXIT:
                    break
                if status > 0:
                    idx = status
                    last_run_abs = None
                    continue

            # Actual test
            status = _run_script(test_ref, "test", suite_index=idx, all_tests_ref=tests)
            if status == STATUS_EXIT:
                break

            # Record last executed test (used for transition naming).
            last_test_ref = test_ref

            if status > 0:
                idx = status
                last_run_abs = None
                continue

            # Post-transition
            if transition:
                next_ref = tests[idx] if (idx < len(tests)) else None
                post_log_ref, post_unit_override = _hook_name_overrides(
                    "hook-transition", from_ref=test_ref, to_ref=next_ref
                )
                status = _run_script(
                    transition,
                    "hook-transition",
                    suite_index=idx,
                    all_tests_ref=tests,
                    log_test_ref=post_log_ref,
                    unit_name_override=post_unit_override,
                    write_results=_hook_results_enabled("hook-transition"),
                )
                if status == STATUS_EXIT:
                    break
                if status > 0:
                    idx = status
                    last_run_abs = None
                    continue

            # Normal advance
            idx += 1

        # End hook
        if not rt.finished and hook_end:
            end_log_ref, end_unit_override = _hook_name_overrides(
                "hook-end", from_ref=last_test_ref or (tests[-1] if tests else None)
            )
            _run_script(
                hook_end,
                "hook-end",
                suite_index=len(tests),
                all_tests_ref=tests,
                log_test_ref=end_log_ref,
                unit_name_override=end_unit_override,
                write_results=_hook_results_enabled("hook-end"),
            )

        return 0

    except KeyboardInterrupt:
        interrupted = True
        try:
            print("\nInterrupted (Ctrl+C)")
        except Exception:
            pass
        _write_interrupt_log("Ctrl+C - user interruption")
        return 130

    finally:
        try:
            progress_disable()
        except Exception:
            pass

        _stop_can_threads()

        if interrupted:
            try:
                sys.stdout.flush()
                sys.stderr.flush()
            except Exception:
                pass
            try:
                time.sleep(0.25)
            except Exception:
                pass
            try:
                progress_emergency_restore_terminal()
            except Exception:
                pass
            os._exit(130)


if __name__ == "__main__":
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
        try:
            progress_emergency_restore_terminal()
        except Exception:
            pass
        os._exit(130)