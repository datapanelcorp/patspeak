"""Runtime state (legacy global-variable model).

PATSpeak historically used a single module full of globals that are reset
between tests.

For now, we keep that model because it matches the existing runner and keeps
behavior stable. The goal of this module is therefore:

- centralize all run-time mutable state
- make path handling robust when the package is installed
- keep initialization predictable (no implicit cwd assumptions)

The CLI sets ``TestFile`` and then calls :func:`initialize`.
"""

from __future__ import annotations

from datetime import datetime
import os
import re
from pathlib import Path
from typing import Any

from .can_db import CanDb
from .paths import get_paths
from .preflight import run_preflight


def _truthy(value: str) -> bool:
    v = str(value or "").strip().lower()
    return v in {"1", "true", "yes", "on"}


def _falsey(value: str) -> bool:
    v = str(value or "").strip().lower()
    return v in {"0", "false", "no", "off"}


# If True, PAT support is forcibly disabled regardless of script headers.
# This is used when only one physical CAN channel is available (or when the
# CAN backend auto-falls back to a single-channel configuration).
FORCE_SUPPRESS_PAT_SUPPORT: bool = False

# Avoid spamming the operator: we only print the forced-suppression warning once.
_FORCE_SUPPRESS_PAT_SUPPORT_ANNOUNCED: bool = False


# -----------------
# UUT TX traffic tracking support
# -----------------
#
# The legacy PATSpeak scripts can include a step like:
#   UUT_TXCHECK-2.0
#
# That step waits up to N seconds for *any* CAN message transmitted by the
# device-under-test to be observed on the UUT bus.
#
# We determine which messages are "UUT-transmitted" by reading the raw DBC
# 'BO_' Tx Node field (the last token on the BO_ line). This intentionally
# mirrors the older tx-branch implementation so DBC authoring behavior is the
# source of truth.


_DBC_BO_RE = re.compile(r"^BO_\s+(\d+)\s+([A-Za-z0-9_]+)\s*:\s*(\d+)\s+([A-Za-z0-9_]+)")

# SocketCAN-style ID flags that sometimes appear in DBC exports (e.g. ID ORed
# with 0x80000000 for extended frames).
_CAN_EFF_FLAG = 0x80000000
_CAN_RTR_FLAG = 0x40000000
_CAN_ERR_FLAG = 0x20000000
_CAN_EFF_MASK = 0x1FFFFFFF
_CAN_SFF_MASK = 0x7FF


def _normalize_dbc_bo_id(raw_id: int) -> tuple[int, bool]:
    """Normalize a DBC BO_ message ID to (arbitration_id, is_extended).

    Some DBC exports store extended-frame messages as SocketCAN-style can_id
    values with flags ORed in (e.g., CAN_EFF_FLAG=0x80000000). python-can
    exposes the on-the-wire arbitration_id without these flag bits, so we
    strip them here to ensure matching works.
    """

    arb = int(raw_id) & _CAN_EFF_MASK
    is_ext = bool(int(raw_id) & _CAN_EFF_FLAG) or (arb > _CAN_SFF_MASK)
    if not is_ext:
        arb = arb & _CAN_SFF_MASK
    return arb, is_ext


def _dbc_get_tx_messages_by_node(
    dbc_filename: str, tx_node: str = "UUT"
) -> tuple[set[tuple[int, bool]], dict[tuple[int, bool], str]]:
    """Parse a .dbc and return (ids_set, id_to_name) for messages sent by tx_node."""

    ids: set[tuple[int, bool]] = set()
    info: dict[tuple[int, bool], str] = {}

    try:
        with open(dbc_filename, "r", encoding="utf-8", errors="ignore") as f:
            for line in f:
                m = _DBC_BO_RE.match(line.strip())
                if not m:
                    continue
                raw_id = int(m.group(1))
                msg_id, is_ext = _normalize_dbc_bo_id(raw_id)
                msg_name = m.group(2)
                sender = m.group(4)
                if sender == tx_node:
                    ids.add((msg_id, is_ext))
                    info[(msg_id, is_ext)] = msg_name
    except FileNotFoundError:
        pass
    except OSError:
        pass

    return ids, info


def initialize(*, run_preflight_checks: bool = True) -> None:
    """Reset globals and load DBC(s) for the current ``TestFile``."""

    # NOTE: we intentionally declare a big `global ...` list.
    # This mirrors the legacy codebase and makes it obvious which names are
    # meant to be shared across modules.
    global finished, test_done, TestStep, TestPhase, TestLine, PAT_Fdbk, UUT_Fdbk
    global pat_db, uut_db, test_file, TotalTime, StartTime, FailCount
    global PassTime, tracker_last_time, StepTime, UUT_Results, UUT_TestLog
    global WaitTime, WaitDone, TimeStampFormat, RunStamp, UnitName, HeaderAdded
    global MeterData, UUTData, TestFile, DataLogTag, DataPath, LogPath
    global CAN_1, CAN_2, Verbose, AllCollectedData, SuppressPatSupport
    global CAN_INTERFACE, CAN_CHANNELS, CAN_BITRATE, TotalSteps
    global DBCPath
    global HomePath, TestDir
    global UUT_TxMsgIds, UUT_TxMsgInfo, UUT_TxSeenCount, UUT_TxLastSeen, UUT_TxLastSeenId
    global UUT_TxSeenCountById, UUT_TxLastSeenById

    # -----------------
    # Baseline defaults
    # -----------------
    MeterData = []
    UUTData = []

    WaitTime = 0
    WaitDone = 0

    TotalTime = 0
    StartTime = 0
    tracker_last_time = 0
    StepTime = 0
    PassTime = 0

    TestStep = 0
    TestPhase = 0
    TestLine = ""

    finished = 0
    test_done = 0

    PAT_Fdbk = {}
    UUT_Fdbk = {}
    UUT_Results = {}

    AllCollectedData = ""
    DataLogTag = ""
    HeaderAdded = 0
    FailCount = 0
    TotalSteps = 0

    # UUT traffic tracking (messages whose Tx Node is tagged 'UUT' in the
    # selected UUT DBC). This powers the UUT_TXCHECK command.
    UUT_TxMsgIds = set()
    UUT_TxMsgInfo = {}
    UUT_TxSeenCount = 0
    UUT_TxLastSeen = 0.0
    UUT_TxLastSeenId = None
    UUT_TxSeenCountById = {}
    UUT_TxLastSeenById = {}

    # Default: PAT support enabled unless suppressed by script.
    SuppressPatSupport = "False"

    # CAN backend config (python-can).
    # patspeak.can.autodetect_can_backend() will populate these if left as "auto".
    CAN_INTERFACE = "auto"
    CAN_CHANNELS = None
    CAN_BITRATE = 250000

    TimeStampFormat = "%Y-%m-%d-%H:%M:%S"

    # A filesystem-safe run identifier used to prevent output overwrites.
    _now = datetime.now()
    RunStamp = _now.strftime("%Y%m%d-%H%M%S") + f"-{_now.microsecond // 1000:03d}"

    UUT_TestLog = "Started on: " + str(datetime.today().strftime(TimeStampFormat)) + "\n"

    _verbose = int(globals().get("Verbose", 0) or 0)

    # -----------------
    # Workspace paths
    # -----------------
    paths = get_paths()

    # Workspace root (folder that contains both dut/ and dbc/).
    HomePath = str(paths.home)

    # Where DBC files live.
    DBCPath = str(paths.dbc)

    # Where .pat scripts live (DUT suites).
    #
    # NOTE: historically DataPath was also used as the output folder. We now
    # keep DataPath as the DUT root (script root), and write outputs under a
    # workspace-level `results/` folder that mirrors the DUT folder structure.
    DataPath = str(paths.dut)

    # Ensure directories exist (helpful for first-run / fresh zip users).
    os.makedirs(DataPath, exist_ok=True)
    os.makedirs(DBCPath, exist_ok=True)

    # Workspace-level results root.
    # Default: <workspace>/results
    # Override: PATSPEAK_RESULTS_ROOT (absolute, or relative to workspace home)
    _results_root_raw = os.environ.get("PATSPEAK_RESULTS_ROOT", "").strip()
    if _results_root_raw:
        p = Path(_results_root_raw).expanduser()
        if not p.is_absolute():
            p = Path(HomePath) / p
        results_root = p.resolve()
    else:
        results_root = (Path(HomePath) / "results").resolve()
    results_root.mkdir(parents=True, exist_ok=True)

    # -----------------
    # Resolve current test path
    # -----------------
    _abs_test: str = str(TestFile)
    if not os.path.isabs(_abs_test):
        _abs_test = os.path.join(DataPath, _abs_test)
    _abs_test = os.path.abspath(_abs_test)

    # Directory containing the current .pat file.
    _test_dir = os.path.dirname(_abs_test)
    TestDir = _test_dir

    # Output directory for this suite folder:
    #   <workspace>/results/<path-relative-to-dut>
    # Example:
    #   dut/43019-1/...  -> results/43019-1/
    try:
        rel_suite = Path(_test_dir).resolve().relative_to(Path(DataPath).resolve())
    except Exception:
        # If the test isn't under the DUT root, fall back to a safe basename.
        rel_suite = Path(Path(_test_dir).name)

    LogPath = str((results_root / rel_suite).resolve())
    os.makedirs(LogPath, exist_ok=True)

    # -----------------
    # Read script file
    # -----------------
    try:
        test_file = open(_abs_test, "r", encoding="utf-8", errors="replace")
    except OSError as e:
        raise SystemExit(f"ERROR: could not open test file: {_abs_test}\n{e}")

    Lines = test_file.readlines()
    test_file.seek(0)

    # -----------------
    # Step count (for progress UI)
    # -----------------
    def _is_step_line(raw: str) -> bool:
        s = (raw or "").strip()
        if not s:
            return False
        if s.startswith("#"):
            return False
        if s == "END" or s == "SAVE" or s.startswith("PAUSE"):
            return False
        if s.upper().startswith("UUT_DBC") or s.upper().startswith("UUT_DATANAME") or s.upper().startswith("SUPPRESS_PAT_SUPPORT"):
            return False
        return True

    try:
        TotalSteps = sum(1 for ln in Lines if _is_step_line(ln))
    except Exception:
        TotalSteps = 0

    # -----------------
    # Parse header directives (updated to be case-insensitive)
    # -----------------
    uut_dbc_name = ""
    for line in Lines:
        s = (line or "").strip()
        if s.upper().startswith("UUT_DBC"):
            if "=" not in s:
                raise SystemExit(f"Malformed UUT_DBC line (missing '='):\n  {s}")
            uut_dbc_name = s.split("=", 1)[1].strip().strip('"').strip("'")
            break

    tmp_dataname = ""
    for line in Lines:
        s = (line or "").strip()
        if s.upper().startswith("UUT_DATANAME"):
            if "=" not in s:
                raise SystemExit(f"Malformed UUT_DATANAME line (missing '='):\n  {s}")
            tmp_dataname = s.split("=", 1)[1].strip().strip('"').strip("'")
            break

    UnitName = tmp_dataname if tmp_dataname else ""

    if not uut_dbc_name:
        raise SystemExit("No DBC file specified, add 'UUT_DBC = filename.dbc' to script")

    # SUPPRESS_PAT_SUPPORT parsing (case-insensitive)
    for line in Lines:
        s = (line or "").strip()
        if s.upper().startswith("SUPPRESS_PAT_SUPPORT"):
            if "=" not in s:
                raise SystemExit(f"Malformed SUPPRESS_PAT_SUPPORT line (missing '='):\n  {s}")

            raw = s.split("=", 1)[1].strip().strip('"').strip("'")
            if _truthy(raw):
                SuppressPatSupport = "True"
            elif _falsey(raw):
                SuppressPatSupport = "False"
            else:
                # Be forgiving, but warn.
                print(
                    "Warning: unrecognized SUPPRESS_PAT_SUPPORT value; treating as False:\n  "
                    + s
                )
                SuppressPatSupport = "False"
            break

    # Hardware/driver fallback:
    # If the CAN layer determined that only one physical CAN channel is
    # available, force UUT-only mode regardless of script headers.
    force_suppress_pat = _truthy(
        os.environ.get("PATSPEAK_FORCE_SUPPRESS_PAT_SUPPORT", "")
    ) or _truthy(str(globals().get("FORCE_SUPPRESS_PAT_SUPPORT", False)))

    if force_suppress_pat:
        global _FORCE_SUPPRESS_PAT_SUPPORT_ANNOUNCED
        if not _FORCE_SUPPRESS_PAT_SUPPORT_ANNOUNCED:
            print(
                "WARNING: Only one CAN channel is available; forcing SUPPRESS_PAT_SUPPORT=True (UUT-only)."
            )
            _FORCE_SUPPRESS_PAT_SUPPORT_ANNOUNCED = True
        SuppressPatSupport = "True"

    # -----------------
    # Load DBC(s)
    # -----------------
    uut_path = os.path.join(DBCPath, uut_dbc_name)

    # Precompute IDs of messages tagged as being transmitted by the UUT.
    # This powers the UUT_TXCHECK command.
    UUT_TxMsgIds, UUT_TxMsgInfo = _dbc_get_tx_messages_by_node(uut_path, tx_node="UUT")
    if len(UUT_TxMsgIds) == 0:
        print(
            "WARNING: No BO_ messages with Tx Node 'UUT' found in the selected UUT_DBC. "
            "UUT_TXCHECK will always fail."
        )
    else:
        print(f"UUT_TXCHECK: monitoring {len(UUT_TxMsgIds)} message IDs tagged Tx Node 'UUT'.")

    print("Loading", uut_dbc_name + "...")
    uut_db = CanDb(dbc_filename=uut_path)

    pat_dbc_name = "PAT.dbc"
    pat_db_for_check: Any = None

    # Load PAT.dbc only if PAT support is enabled.
    if SuppressPatSupport == "True":
        print("Suppression of PAT support active; UUT testing only")
        pat_db = None

        # For preflight only, try to load PAT.dbc so we can give better errors
        # if a script references PAT-only signals.
        try:
            pat_db_for_check = CanDb(dbc_filename=os.path.join(DBCPath, pat_dbc_name))
        except Exception:
            pat_db_for_check = None

    else:
        pat_path = os.path.join(DBCPath, pat_dbc_name)
        print("Loading", pat_dbc_name + "...")
        pat_db = CanDb(dbc_filename=pat_path)
        pat_db_for_check = pat_db
        
    # Ensure signal namespaces don't collide.
    # This check now runs even in suppressed mode IF the PAT DBC is available on disk.
    if pat_db_for_check:
        pat_signals = set(pat_db_for_check.iter_signal_names())
        uut_signals = set(uut_db.iter_signal_names())
        dupes = pat_signals.intersection(uut_signals)
        if dupes:
            dupe = sorted(dupes)[0]
            raise SystemExit(f"Duplicate Signal Found, Aborting... {dupe}")

    if pat_db:
        # Initialize PAT feedback dictionary.
        for message in pat_db.messages:
            for s in message.signals:
                PAT_Fdbk[s.name] = 0
                if _verbose >= 1:
                    print(message.name, s.name)

    # Initialize UUT feedback dictionary.
    print("Setting up UUT I/O...")
    for message in uut_db.messages:
        for s in message.signals:
            UUT_Fdbk[s.name] = 0
            if _verbose >= 1:
                print(message.name, s.name)

    # -----------------
    # Preflight checks
    # -----------------
    if run_preflight_checks:
        pat_support_active = (SuppressPatSupport == "False") and (pat_db is not None)
        ok = run_preflight(
            Lines,
            uut_db=uut_db,
            pat_db_runtime=pat_db,
            pat_db_for_check=pat_db_for_check,
            uut_dbc_name=uut_dbc_name,
            pat_dbc_name=pat_dbc_name,
            pat_support_active=pat_support_active,
        )
        if not ok:
            raise SystemExit(1)
