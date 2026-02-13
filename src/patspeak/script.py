import csv
import time
import os
import re
import shlex
import subprocess
import sys
from pathlib import Path
#from playsound import playsound
from datetime import datetime
import patspeak.runtime as rt
from datetime import timedelta
from .can import send_raw_can
from .console import colorize_status_line, make_log_path, make_csv_path
from .progress import note_step_started, note_step_result


_PATSPEAK_RESULT_RE = re.compile(r"^\s*PATSPEAK_RESULT\s*=\s*(PASS|FAIL)\s*$", re.IGNORECASE)


def _parse_int_auto(tok: str) -> int:
    """Parse an int token as decimal unless it has a 0x prefix."""

    t = (tok or "").strip()
    base = 16 if t.lower().startswith("0x") else 10
    return int(t, base)


def _fmt_bytes_hex(data: bytes | bytearray | list[int]) -> str:
    try:
        if not isinstance(data, (bytes, bytearray)):
            data = bytes(int(b) & 0xFF for b in data)
        return " ".join(f"{b:02X}" for b in data)
    except Exception:
        return ""


def _iter_script_roots() -> list[Path]:
    """Return search roots for external PAT scripts.

    Search order (highest priority first):
      1) PATSPEAK_SCRIPT_DIR (os.pathsep-separated list)
      2) <current_test_dir>/scripts
      3) <workspace_home>/scripts/pat_scripts

    This keeps per-suite scripts easy, while still allowing a global shared pool.
    """

    roots: list[Path] = []

    # 1) Explicit env override(s)
    raw = os.environ.get("PATSPEAK_SCRIPT_DIR", "").strip()
    if raw:
        for part in raw.split(os.pathsep):
            p = Path(part).expanduser()
            if not p.is_absolute():
                # Interpret relative paths relative to workspace home when available.
                try:
                    p = Path(getattr(rt, "HomePath", ".") or ".") / p
                except Exception:
                    pass
            try:
                roots.append(p.resolve())
            except Exception:
                roots.append(p)

    # 2) Suite-local scripts folder (next to the .pat file)
    try:
        td = Path(getattr(rt, "TestDir", "") or "")
        if td:
            roots.append((td / "scripts").resolve())
    except Exception:
        pass

    # 3) Global scripts folder in the workspace
    try:
        home = Path(getattr(rt, "HomePath", "") or "")
        if home:
            roots.append((home / "scripts" / "pat_scripts").resolve())
    except Exception:
        pass

    # De-dupe while preserving order.
    seen: set[str] = set()
    out: list[Path] = []
    for r in roots:
        k = str(r)
        if k not in seen:
            seen.add(k)
            out.append(r)
    return out


def _resolve_script_path(script_token: str) -> Path | None:
    """Resolve a script token to an existing file path.

    - Absolute paths are used directly.
    - Relative paths are searched under the script roots.
    - Bare names are searched under script roots; ".py" is appended if missing.
    """

    tok = (script_token or "").strip().strip('"').strip("'")
    if not tok:
        return None

    p = Path(tok)
    candidates: list[Path] = []

    # Direct absolute path.
    if p.is_absolute():
        candidates.append(p)
    else:
        roots = _iter_script_roots()

        # If the token includes a directory component, treat it as a relative path.
        if p.parent != Path("."):
            for r in roots:
                candidates.append(r / p)
        else:
            for r in roots:
                candidates.append(r / p)
                if p.suffix == "":
                    candidates.append(r / (tok + ".py"))

    for c in candidates:
        try:
            if c.exists() and c.is_file():
                return c.resolve()
        except Exception:
            continue
    return None


def _parse_pat_command_line(line: str) -> list[str]:
    """Parse a PAT command line into argv tokens.

    Accepted forms:
      - "PAT <script> [args...]"
      - "PAT-<script> [args...]"   (legacy-friendly, like PAUSE-...)
    """

    s = (line or "").rstrip("\n").rstrip("\r")
    if s.startswith("PAT-"):
        cmdline = s.split("-", 1)[1].strip()
    elif s.startswith("PAT "):
        cmdline = s[len("PAT ") :].strip()
    elif s == "PAT":
        cmdline = ""
    else:
        # Not a PAT command.
        return []

    if not cmdline:
        return []

    # shlex: POSIX parsing on *nix, Windows-style on Windows.
    posix = os.name != "nt"
    try:
        return shlex.split(cmdline, posix=posix)
    except Exception:
        # Fall back to naive split.
        return cmdline.split()


def _extract_explicit_result_marker(output_text: str) -> bool | None:
    """Look for a line like 'PATSPEAK_RESULT=PASS' or 'PATSPEAK_RESULT=FAIL'."""

    try:
        last: bool | None = None
        for raw in (output_text or "").splitlines():
            m = _PATSPEAK_RESULT_RE.match(raw)
            if not m:
                continue
            last = (m.group(1).upper() == "PASS")
        return last
    except Exception:
        return None


def _run_external_script(argv: list[str]) -> tuple[int, str]:
    """Run an external script and stream its output.

    Returns:
      (return_code, combined_output)
    """

    def _emit(text: str) -> None:
        """Best-effort mirror of streamed output for early failures."""

        if not text:
            return
        for ln in text.splitlines(True):
            try:
                print(ln.rstrip("\n"))
            except Exception:
                pass
            try:
                rt.UUT_TestLog += "    " + ln
            except Exception:
                pass

    if not argv:
        msg = "PAT: missing script\n"
        _emit(msg)
        return 2, msg

    script_token = argv[0]
    args = argv[1:]

    script_path = _resolve_script_path(script_token)
    if script_path is None:
        roots = _iter_script_roots()
        msg = "PAT: script not found: " + str(script_token) + "\n"
        if roots:
            msg += "PAT: searched roots:\n" + "\n".join("  - " + str(r) for r in roots) + "\n"
        _emit(msg)
        return 2, msg

    # Build subprocess argv.
    if script_path.suffix.lower() == ".py":
        # -u: unbuffered so progress prints show up live.
        cmd = [sys.executable, "-u", str(script_path), *args]
    else:
        cmd = [str(script_path), *args]

    # Environment: pass useful run context to the script.
    env = os.environ.copy()
    env.setdefault("PATSPEAK_HOME", str(getattr(rt, "HomePath", "") or ""))
    env.setdefault("PATSPEAK_DUT_DIR", str(getattr(rt, "DataPath", "") or ""))
    env.setdefault("PATSPEAK_DBC_DIR", str(getattr(rt, "DBCPath", "") or ""))
    env.setdefault("PATSPEAK_TEST_FILE", str(getattr(rt, "TestFile", "") or ""))
    env.setdefault("PATSPEAK_TEST_DIR", str(getattr(rt, "TestDir", "") or ""))
    env.setdefault("PATSPEAK_RESULTS_DIR", str(getattr(rt, "LogPath", "") or ""))
    env.setdefault("PATSPEAK_UNITNAME", str(getattr(rt, "UnitName", "") or ""))
    env.setdefault("PATSPEAK_RUNSTAMP", str(getattr(rt, "RunStamp", "") or ""))
    env.setdefault("PATSPEAK_STEP", str(getattr(rt, "TestStep", "") or ""))
    env["PATSPEAK_SCRIPT_PATH"] = str(script_path)

    # Run relative to the current test folder by default.
    cwd = str(getattr(rt, "TestDir", "") or os.getcwd())

    combined: list[str] = []
    try:
        p = subprocess.Popen(
            cmd,
            cwd=cwd,
            env=env,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            bufsize=1,
        )
    except Exception as e:
        msg = f"PAT: failed to start script: {e}\n"
        _emit(msg)
        return 2, msg

    # Stream output line-by-line.
    try:
        assert p.stdout is not None
        for line in p.stdout:
            combined.append(line)
            try:
                print(line.rstrip("\n"))
            except Exception:
                pass
            try:
                rt.UUT_TestLog += "    " + line
            except Exception:
                pass
    except Exception as e:
        combined.append(f"PAT: error while reading script output: {e}\n")
    finally:
        try:
            rc = int(p.wait())
        except Exception:
            rc = 2

    return rc, "".join(combined)


def _handle_pat_command(line: str) -> bool:
    """Handle a PAT external-script step.

    Returns True if the line was a PAT command and was handled.
    """

    if not (line.startswith("PAT-") or line.startswith("PAT ") or line == "PAT"):
        return False

    StepStr = str(rt.TestStep).zfill(5) + " "

    argv = _parse_pat_command_line(line)
    if not argv:
        msg = StepStr + "FAIL: PAT (missing script)"
        rt.UUT_TestLog += msg + "\n"
        print(colorize_status_line(msg))
        rt.FailCount += 1
        try:
            note_step_result(rt.TestStep, passed=False)
        except Exception:
            pass

        # Advance to next step.
        rt.TestLine = ""
        rt.PassTime = 0
        rt.StepTime = 0
        rt.WaitDone = 0
        rt.TestStep += 1
        rt.tracker_last_time = time.time()
        return True

    # Echo a one-line "TEST" marker so the operator sees what's running.
    try:
        show = " ".join(argv[:4]) + (" ..." if len(argv) > 4 else "")
        msg = StepStr + "TEST: PAT " + show
        rt.UUT_TestLog += msg + "\n"
        print(colorize_status_line(msg))
    except Exception:
        pass

    rc, out = _run_external_script(argv)

    explicit = _extract_explicit_result_marker(out)
    passed = bool(explicit) if explicit is not None else (rc == 0)

    if passed:
        msg = StepStr + "PASS: PAT " + str(argv[0]) + f" (rc={rc})"
        rt.UUT_TestLog += msg + "\n"
        print(colorize_status_line(msg))
        try:
            note_step_result(rt.TestStep, passed=True)
        except Exception:
            pass
    else:
        msg = StepStr + "FAIL: PAT " + str(argv[0]) + f" (rc={rc})"
        rt.UUT_TestLog += msg + "\n"
        print(colorize_status_line(msg))
        rt.FailCount += 1
        try:
            note_step_result(rt.TestStep, passed=False)
        except Exception:
            pass

    # Advance to next step.
    rt.TestLine = ""
    rt.PassTime = 0
    rt.StepTime = 0
    rt.WaitDone = 0
    rt.TestStep += 1

    # IMPORTANT: this step blocks while the script runs; reset the timing
    # tracker so the next step doesn't inherit a giant time_delta.
    rt.tracker_last_time = time.time()
    return True


def CheckUUTTxTraffic(timeout_s: float = 2.0, tx_node: str = "UUT"):
    """Wait up to timeout_s seconds for any UUT-transmitted CAN message to be observed.

    "UUT-transmitted" is determined by parsing the loaded UUT DBC's BO_ Tx Node
    field (sender == tx_node) during runtime.initialize().

    Returns:
        (ok, seen_id, seen_name)
    """

    try:
        msg_ids = getattr(rt, "UUT_TxMsgIds", set()) or set()
        msg_info = getattr(rt, "UUT_TxMsgInfo", {}) or {}
    except Exception:
        msg_ids = set()
        msg_info = {}

    if not msg_ids:
        return (False, None, None)

    start_count = int(getattr(rt, "UUT_TxSeenCount", 0) or 0)
    start_time = time.time()

    while (time.time() - start_time) < float(timeout_s):
        try:
            if int(getattr(rt, "UUT_TxSeenCount", 0) or 0) > start_count:
                seen_id = getattr(rt, "UUT_TxLastSeenId", None)
                seen_name = None
                if seen_id is not None:
                    seen_name = (
                        msg_info.get(seen_id)
                        or msg_info.get((seen_id, True))
                        or msg_info.get((seen_id, False))
                    )
                return (True, seen_id, seen_name)
        except Exception:
            pass
        time.sleep(0.01)

    return (False, None, None)


def SaveData():

    # Suite hooks (pat_start / pat_transition / pat_end) can be configured to
    # run *without* writing any result artifacts. Respect that here.
    if not bool(getattr(rt, "WRITE_RESULTS", True)):
        try:
            rt.AllCollectedData = ""
            rt.UUT_Results.clear()
        except Exception:
            pass
        return

    print("Writing Data Collected.")
    print("Fail Count:", rt.FailCount)
    for key,value in rt.UUT_Results.items():
        if(not "NULL" in key):
            tmp = key.split("-")
            TestStep = tmp[0]
            SignalName = tmp[1]
            DataLogTag = tmp[2]
            
            # HeaderName = ""
            
            # if(DataLogTag != ""):
                # #HeaderName = str(rt.UnitName) + "_" + SignalName + "_" + DataLogTag
                # HeaderName =  DataLogTag + "_" + str(rt.UnitName) + "_" + SignalName 
            # else:
                # HeaderName = str(rt.UnitName) + "_" + SignalName
                
            # datafile = rt.DataPath + HeaderName + ".csv"
            
            # ShowStep = 1
            
            # if(ShowStep == 1):
                # FullHeaderName = "Step," + HeaderName
                # FullValue = TestStep + "," + str(value)
            # else:
                # FullHeaderName = HeaderName
                # FullValue = str(value)

            # if(os.path.exists(datafile)): #TODO: improve w/ header detection
                # f = open(datafile, 'a')
                # f.write(str(FullValue) + "\n")
                # f.close()
            # else:
                # f = open(datafile, 'w')
                # f.write(FullHeaderName + "\n")
                # f.write(str(FullValue) + "\n")
                # f.close()
            
    # Save CSV alongside the per-test logs.
    # rt.LogPath points at the suite's workspace results folder:
    #   <workspace>/results/<path-relative-to-dut>
    datafile = make_csv_path(rt.LogPath, str(rt.UnitName), getattr(rt, "RunStamp", None))
    f = open(datafile, 'a')
    f.write(rt.AllCollectedData)
    #f = open(datafile, 'w')
    #f.write(rt.AllCollectedData + "\n")
    f.close()
    
    rt.AllCollectedData = ""            
    rt.UUT_Results.clear()

def ProcessScript():
    
    time_delta = 0      
    tracker_time = time.time()
    if(rt.tracker_last_time):
        time_delta = tracker_time - rt.tracker_last_time
    rt.tracker_last_time = tracker_time
    
    logfile = make_log_path(
        rt.LogPath,
        str(rt.UnitName),
        str(rt.TestFile),
        getattr(rt, "RunStamp", None),
    )
    #logfile = rt.LogPath + rt.TestFile + ".log"
    print_test = 0
    
    StepStr = str(rt.TestStep).zfill(5) + ' ' #* len(str(rt.TestStep))

    # Keep a copy of the raw line for debugging (before whitespace stripping).
    raw_line = None
    if(rt.TestLine == ""):
        rt.TestLine = rt.test_file.readline().rstrip()
        raw_line = rt.TestLine
        if(rt.TestStep == 0):
            rt.StartTime = time.time()
        rt.UUT_TestLog += StepStr + rt.TestLine + "\n" 
        print_test = 1 #only print om new lines

        # Progress UI: mark a step as started as soon as we consume a *step* line.
        # (Avoid marking comments/directives/END as steps so the bar stays aligned.)
        try:
            s = (rt.TestLine or "").strip()
            is_step = bool(s) and (not s.startswith("#"))
            if is_step:
                if s in {"END", "SAVE"} or s.startswith("PAUSE"):
                    is_step = False
                elif s.startswith("UUT_DBC") or s.startswith("UUT_DATANAME") or s.startswith("SUPPRESS_PAT_SUPPORT"):
                    is_step = False
            if is_step:
                note_step_started(rt.TestStep)
        except Exception:
            pass

        # Super-verbose: echo every .pat line as it is consumed.
        if(getattr(rt, "Verbose", 0) >= 2):
            print(StepStr + str(raw_line))

    if(rt.TestLine == "END"): 
        rt.UUT_TestLog += "Fail count: " + str(rt.FailCount) + "\n"
        rt.UUT_TestLog += "Finished on: " + str(datetime.today().strftime(rt.TimeStampFormat)) + "\n"
        
        EndTime = time.time()
        time_lapsed = EndTime - rt.StartTime
        convert = timedelta(seconds=time_lapsed)
        rt.UUT_TestLog += "elapsed time: " + str(convert) + "\n"
        print("elapsed time:", convert)
        print("END OF TEST")
        
        # Write the per-test log unless this run has result output suppressed
        # (commonly used for suite hooks like pat_start / pat_transition).
        if bool(getattr(rt, "WRITE_RESULTS", True)):
            print(logfile)
            f = open(logfile, 'w', encoding='utf-8', errors='replace')
            f.write(rt.UUT_TestLog)
            f.close()
        try:
            rt.test_file.close()
        except Exception:
            pass
        rt.test_done = 1
        #playsound(rt.SoundPass)
        #TODO: prompt for another and start over
        #yn = input("Do you want to test another unit? y/n")
        #if(yn != "y"):
        return
        
    if(rt.TestLine.startswith("PAUSE")):
        the_prompt = rt.TestLine.split("-")
        yn = input(the_prompt[1])
        rt.TestLine = "" #clear to stop further processing
        rt.tracker_last_time = time.time() # <--- ADD THIS LINE

    # External custom-step hook: PAT <script> [args...]
    # This must run before we strip spaces and parse ':' step lines.
    if _handle_pat_command(rt.TestLine):
        return

    # UUT TX traffic check: UUT_TXCHECK-<timeout_s>
    #
    # This step blocks (up to timeout) while it listens for any CAN message
    # transmitted by the UUT (per DBC Tx Node tagging).
    _compact = (rt.TestLine or "").replace(" ", "")
    if _compact.startswith("UUT_TXCHECK"):
        # Optional syntax: UUT_TXCHECK-<timeout_seconds> or UUT_TXCHECK=<timeout_seconds>
        timeout_s = 2.0
        try:
            parts = re.split(r"[-=]", _compact, maxsplit=1)
            if len(parts) == 2 and parts[1].strip() != "":
                timeout_s = float(parts[1].strip())
        except Exception:
            pass

        ok, seen_id, seen_name = CheckUUTTxTraffic(timeout_s=timeout_s)
        if ok:
            detail = f" ({seen_name})" if seen_name else ""
            msg = str(rt.TestStep).zfill(5) + " PASS: UUT_TXCHECK" + detail
            rt.UUT_TestLog += msg + "\n"
            print(colorize_status_line(msg))
            try:
                note_step_result(rt.TestStep, passed=True)
            except Exception:
                pass
        else:
            reason = "no UUT-tagged TX messages seen"
            if not getattr(rt, "UUT_TxMsgIds", set()):
                reason = "no messages in DBC tagged with Tx Node UUT"
            msg = str(rt.TestStep).zfill(5) + " FAIL: UUT_TXCHECK (" + str(reason) + ")"
            rt.UUT_TestLog += msg + "\n"
            print(colorize_status_line(msg))
            rt.FailCount += 1
            try:
                note_step_result(rt.TestStep, passed=False)
            except Exception:
                pass

        # Advance like a normal test step.
        rt.TestLine = ""
        rt.PassTime = 0
        rt.StepTime = 0
        rt.WaitDone = 0
        rt.TestStep += 1
        rt.tracker_last_time = time.time()
        return

    # SEND_CAN raw CAN frame: SEND_CAN CH0 <id> [b0 b1 ...]
    #
    # Example:
    #   SEND_CAN CH0 0x18FED927 5 5 1 9 7 7 0 0
    #
    # ID and bytes accept either decimal (default) or hex prefixed by 0x.
    stripped = (rt.TestLine or "").strip()
    if stripped == "SEND_CAN" or stripped.startswith("SEND_CAN "):
        tokens = stripped.split()

        ok = False
        reason = None

        # Parse: SEND_CAN <channel> <id> [bytes...]
        try:
            if len(tokens) < 3:
                raise ValueError("missing args (expected: SEND_CAN CH0 <id> [b0 b1 ...])")

            ch_tok = tokens[1].strip().upper()
            id_tok = tokens[2].strip()
            data_toks = tokens[3:]

            ch = None
            if ch_tok.startswith("CH") and ch_tok[2:].isdigit():
                ch = int(ch_tok[2:])
            elif ch_tok.isdigit():
                ch = int(ch_tok)

            if ch not in (0, 1):
                raise ValueError(f"invalid channel {tokens[1]!r} (expected CH0 or CH1)")

            # If CH1 is requested but PAT support is suppressed, fail early.
            if ch == 1:
                if getattr(rt, "SuppressPatSupport", "True") == "True":
                    raise ValueError("CH1 unavailable (SUPPRESS_PAT_SUPPORT=True)")
                th = getattr(rt, "CAN_2", None)
                if th is None or (hasattr(th, "is_alive") and not th.is_alive()):
                    raise ValueError("CH1 unavailable (CAN thread not running)")

            arb = _parse_int_auto(id_tok)
            if arb < 0 or arb > 0x1FFFFFFF:
                raise ValueError("CAN id out of range (expected 0..0x1FFFFFFF)")

            data: list[int] = []
            for bt in data_toks:
                b = _parse_int_auto(bt)
                if b < 0 or b > 255:
                    raise ValueError(f"data byte out of range (0..255): {bt!r}")
                data.append(int(b))

            if len(data) > 8:
                raise ValueError(f"too many data bytes ({len(data)}); max is 8")

            ok, err = send_raw_can(
                channel_number=int(ch),
                arbitration_id=int(arb),
                data=data,
                # Let send_raw_can infer extended-id based on id > 0x7FF.
                is_extended_id=None,
            )
            if not ok:
                raise RuntimeError(err or "CAN send failed")

        except Exception as e:
            ok = False
            reason = str(e)

        # Log step result.
        if ok:
            ch_s = tokens[1].strip().upper()
            try:
                # Normalize CH token to CH0/CH1 for display.
                if ch_s.isdigit():
                    ch_s = "CH" + ch_s
            except Exception:
                pass

            try:
                arb_s = int(_parse_int_auto(tokens[2]))
            except Exception:
                arb_s = 0

            try:
                payload = [int(_parse_int_auto(t)) & 0xFF for t in tokens[3:]]
            except Exception:
                payload = []

            msg = (
                str(rt.TestStep).zfill(5)
                + f" PASS: SEND_CAN {ch_s} 0x{arb_s:X} : "
                + _fmt_bytes_hex(payload)
            )
            rt.UUT_TestLog += msg + "\n"
            print(colorize_status_line(msg))
            try:
                note_step_result(rt.TestStep, passed=True)
            except Exception:
                pass
        else:
            msg = (
                str(rt.TestStep).zfill(5)
                + " FAIL: SEND_CAN ("
                + str(reason or "unknown error")
                + ")"
            )
            rt.UUT_TestLog += msg + "\n"
            print(colorize_status_line(msg))
            rt.FailCount += 1
            try:
                note_step_result(rt.TestStep, passed=False)
            except Exception:
                pass

        # Advance like a normal test step.
        rt.TestLine = ""
        rt.PassTime = 0
        rt.StepTime = 0
        rt.WaitDone = 0
        rt.TestStep += 1
        rt.tracker_last_time = time.time()
        return
        
    if(rt.TestLine == "SAVE"):
        SaveData()
        rt.TestLine = "" #clear to stop further processing
        
    if(rt.TestLine.startswith("UUT_DBC")):
        rt.TestLine = "" #clear to stop further processing
        
    if(rt.TestLine.startswith("UUT_DATANAME")):
        rt.TestLine = "" #clear to stop further processing

    if(rt.TestLine.startswith("SUPPRESS_PAT_SUPPORT")):
        rt.TestLine = "" #clear to stop further processing

    #TODO: verify format
    if((rt.TestLine.startswith("#")) or (rt.TestLine=="")):
        if(getattr(rt, "Verbose", 0) >= 1):
            if(rt.TestLine.startswith("#")):
                print(StepStr + rt.TestLine)
        rt.TestLine = ""

    else:
        rt.TestLine = rt.TestLine.replace(" ", "")
        
        #print(str(rt.StepTime) + " " + rt.TestLine)
        
        IO = rt.TestLine.split(":")
        Outs = IO[0].split(",")
        Ins = IO[1].split(",")
        
        Timeout = 5
        Hold = 0
        Wait = 0

        # Track which timing flags were explicitly specified on the line.
        timeout_specified = False
        hold_specified = False
        wait_specified = False

        # Super-verbose helper: only emit debug once per step (when we first
        # read the line) to avoid spamming during WAIT/HOLD polling.
        def _dbg(msg: str) -> None:
            if(getattr(rt, "Verbose", 0) >= 2 and print_test):
                print(StepStr + msg)

        if(len(IO) == 3):
            Flags = IO[2].split(",")
            for o in Flags:
                s = o.split("=")
                if(s[0] == "TIMEOUT"):
                    Timeout = float(s[1])
                    timeout_specified = True
                if(s[0] == "HOLD"):
                    Hold = float(s[1])
                    hold_specified = True
                    Timeout = 0
                if(s[0] == "WAIT"):
                    if(rt.WaitDone == 0):
                        Wait = float(s[1])
                    wait_specified = True
                    Timeout = 0
                if(s[0] == "MESSAGE"):
                    input(s[1] + "\nPress Enter to continue...")
                    Timeout = 0
                if(s[0] == "TAG"):
                    rt.DataLogTag = s[1]
                    Timeout = 0

        # Super-verbose: show per-step timing flags.
        if(print_test and getattr(rt, "Verbose", 0) >= 2):
            if(wait_specified):
                _dbg(f"FLAG WAIT={Wait}")
            if(hold_specified):
                _dbg(f"FLAG HOLD={Hold}")
            if(timeout_specified):
                _dbg(f"FLAG TIMEOUT={Timeout}")

        TestToStr = ""
        SignalName = ""
        TestValue = 0
        TestTol = 0
        TestTime = 0
        RealValue = 0


        for o in Outs:
            s = o.split("=")
            SignalName = s[0]
            if s[0] == "NULL":
                pass
            else:
                if s[1] == "DATALOG":
                    TestTime = rt.PassTime = 0  # force pass

                    RealValue = None
                    # Prefer PAT (if enabled), otherwise fall back to UUT.
                    if rt.SuppressPatSupport == 'False' and rt.pat_db is not None:
                        RealValue = rt.pat_db.get_tx_signal(SignalName)
                    if RealValue is None:
                        RealValue = rt.uut_db.get_tx_signal(SignalName)
                    if RealValue is None:
                        print("signal not found!", SignalName)
                        RealValue = 0

                    # Super-verbose: show the logged value.
                    _dbg(f"DATALOG {SignalName}: {RealValue}")

                    rt.UUT_Results[
                        str(rt.TestStep) + "-" + SignalName + "-" + rt.DataLogTag
                    ] = RealValue
                else:
                    try:
                        v = float(s[1])
                    except Exception:
                        # Non-numeric outputs aren't supported here.
                        v = None

                    if v is not None:
                        pat_set = False
                        uut_set = False

                        # PAT outputs (if enabled)
                        if rt.SuppressPatSupport == 'False' and rt.pat_db is not None:
                            prev = rt.pat_db.get_tx_signal(SignalName)
                            if rt.pat_db.set_tx_signal(SignalName, v):
                                pat_set = True
                                rt.PAT_Fdbk[SignalName] = v
                                RealValue = v
                                _dbg(f"SET PAT  {SignalName}: {prev} -> {v}")

                        # UUT outputs
                        prev = rt.uut_db.get_tx_signal(SignalName)
                        if rt.uut_db.set_tx_signal(SignalName, v):
                            uut_set = True
                            rt.UUT_Fdbk[SignalName] = v
                            RealValue = v
                            _dbg(f"SET UUT  {SignalName}: {prev} -> {v}")

                        # If the script references an output that isn't in any TX message,
                        # call it out loudly in super-verbose mode.
                        if not pat_set and not uut_set:
                            _dbg(f"SET ???  {SignalName}: {v} (signal not found in TX)")
        
        if(Wait):
            rt.WaitTime += time_delta
            if(rt.WaitTime >= Wait):
                rt.WaitDone = 1 #stop from resetting
                rt.WaitTime = Wait = 0 #allow to pass

        if(Wait == 0):
            for i in Ins:
                s = i.split("=")
                SignalName = s[0]
                if(SignalName == "NULL"):
                    pass
                else:
                    if(s[1] == "DATALOG"):
                        TestTime = rt.PassTime = 0 #force pass
                        try:
                            RealValue = float(rt.PAT_Fdbk[SignalName])
                        except:
                            try:
                                RealValue = float(rt.UUT_Fdbk[SignalName])
                            except:
                                print("signal not found!", SignalName)
                                rt.StepTime = Timeout #force exit
                    else:
                        t = s[1].split("|")
                        TestValue = float(t[0].rstrip())
                        TestTol = float(t[1].rstrip())
                        TestToStr = "+/- " + str(TestTol)
                        TestTime = float(t[2].rstrip())
                        try:
                            RealValue = float(rt.PAT_Fdbk[SignalName])
                        except:
                            try:
                                RealValue = float(rt.UUT_Fdbk[SignalName])
                            except:
                                print("signal not found!", SignalName)
                                rt.StepTime = Timeout #force exit
                            
                        RealValue = round(RealValue, 4)
                        TestValue = round(TestValue, 4)
                        
                        if((RealValue <= (TestValue + TestTol))&(RealValue >= (TestValue - TestTol))):
                            #if(RealValue >= (TestValue - TestTol)):
                            rt.PassTime += time_delta
                        else:
                            rt.PassTime = 0
                        #else:
                       #     rt.PassTime = 0

            if(Hold):
                rt.PassTime = 0
                
            if(Timeout):
                rt.StepTime += time_delta

            if((rt.PassTime >= TestTime)|((Timeout)&(rt.StepTime >= Timeout))):
                if(SignalName != 'NULL'):
                    rt.UUT_Results[str(rt.TestStep) + "-" + SignalName + "-" + rt.DataLogTag] = RealValue
                    if((Timeout)&(rt.StepTime >= Timeout)):
                        TestString = StepStr + "FAIL:" + " " + SignalName + " " + str(RealValue)
                        rt.FailCount += 1
                        try:
                            note_step_result(rt.TestStep, passed=False)
                        except Exception:
                            pass
                    else:
                        TestString = StepStr + "PASS:" + " " + SignalName + " " + str(RealValue)
                        try:
                            note_step_result(rt.TestStep, passed=True)
                        except Exception:
                            pass
                    rt.UUT_TestLog += TestString + "\n"
                    print(colorize_status_line(TestString))
                    
                    name_header = "Step,"
                    the_fdbk_values = str(rt.TestStep) + ","
                    
                    for name in rt.UUT_Fdbk:
                        name_header += name + ","
                        the_fdbk_values += str(round(float(rt.UUT_Fdbk[name]),3)) + ","
                        
                    for name in rt.PAT_Fdbk:
                        name_header += name + ","
                        the_fdbk_values += str(round(float(rt.PAT_Fdbk[name]),3)) + ","

                    #if(rt.AllCollectedData == ""):
                    if(rt.HeaderAdded == 0):
                        rt.HeaderAdded = 1
                        #print(name_header)
                        rt.AllCollectedData = name_header + "\n"
                        

                    rt.AllCollectedData += the_fdbk_values  + "\n"

                        
                rt.TestLine = "" #read next line
                rt.PassTime = 0
                rt.StepTime = 0
                rt.WaitDone = 0
                rt.TestStep += 1              
            else:
                if(print_test):
                    TestString = StepStr + "TEST:" + " " + SignalName + " " + str(TestValue) + " " + TestToStr
                    rt.UUT_TestLog += TestString + "\n"
                    print(colorize_status_line(TestString))

        
    
