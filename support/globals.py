import csv
from datetime import datetime
import time
import os
import support.globals as globals

from support.can_db import CanDb
from support.preflight import run_preflight


def initialize(*, run_preflight_checks: bool = True): 
    global finished, test_done, TestStep, TestPhase, TestLine, PAT_Fdbk, UUT_Fdbk, pat_db, uut_db, test_file, TotalTime, StartTime, FailCount
    global PassTime, tracker_last_time, StepTime, UUT_Results, UUT_TestLog
    global WaitTime, WaitDone, SoundStart, SoundFail, SoundPass, TimeStampFormat, RunStamp, UnitName, HeaderAdded
    global MeterData, UUTData, TestFile, DataLogTag, DataPath, LogPath, CAN_1, CAN_2, Verbose, AllCollectedData, SuppressPatSupport
    global CAN_INTERFACE, CAN_CHANNELS, CAN_BITRATE

    UnitNumber = 0
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
    PAT_Fdbk = { }
    UUT_Fdbk = { }
    UUT_Results = { }
    AllCollectedData = ""
    DataLogTag = ""
    HeaderAdded = 0
    FailCount = 0
    SuppressPatSupport = 'False'

    # CAN backend config (python-can).
    # support.can.autodetect_can_backend() will populate these if left as "auto".
    CAN_INTERFACE = "auto"
    CAN_CHANNELS = None
    CAN_BITRATE = 250000
    
    TimeStampFormat = '%Y-%m-%d-%H:%M:%S'

    # A filesystem-safe run identifier used to prevent output overwrites.
    # We include millisecond precision so rapid reruns still get unique names.
    _now = datetime.now()
    RunStamp = _now.strftime('%Y%m%d-%H%M%S') + f"-{_now.microsecond // 1000:03d}"
    
    UUT_TestLog = "Started on: " + str(datetime.today().strftime(TimeStampFormat)) + "\n"
    
    # Repo paths
    DBCPath = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "dbc"))

    # Where .pat scripts live.
    # NOTE: historically DataPath was also used as the output folder. We now
    # keep DataPath as the DUT root (script root), and place outputs in a
    # per-test "results" subfolder next to the .pat file.
    DataPath = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "dut"))

    # Compute output directory based on the current test file location.
    # Example:
    #   dut/43019/example.pat  -> dut/43019/results/
    #   dut/RESET.pat          -> dut/results/
    _abs_test = TestFile
    if not os.path.isabs(str(_abs_test)):
        _abs_test = os.path.join(DataPath, str(_abs_test))
    _abs_test = os.path.abspath(str(_abs_test))
    _test_dir = os.path.dirname(_abs_test)

    # "results" is a common convention in test automation repos.
    LogPath = os.path.join(_test_dir, "results")

    # Ensure required directories exist
    os.makedirs(DataPath, exist_ok=True)
    os.makedirs(DBCPath, exist_ok=True)
    os.makedirs(LogPath, exist_ok=True)
    
    SoundStart = os.path.join(os.path.dirname(__file__), "..", "..", "startup.wav")
    SoundFail = os.path.join(os.path.dirname(__file__), "..", "..", "fail.wav")
    SoundPass = os.path.join(os.path.dirname(__file__), "..", "..", "tada.wav")  

    # find UUT DBC file name
    # (open via absolute path so outputs can live elsewhere)
    test_file = open(_abs_test, 'r', encoding='utf-8', errors='replace')
    Lines = test_file.readlines()
    test_file.seek(0)

    uut_dbc_name = ""
    for line in Lines:
        s = line.strip()
        if s.startswith("UUT_DBC"):
            if "=" not in s:
                print("Malformed UUT_DBC line (missing '='):\n  " + s)
                quit()
            uut_dbc_name = s.split("=", 1)[1].strip().strip('"').strip("'")
            break

    tmp_dataname = ""
    for line in Lines:
        s = line.strip()
        if s.startswith("UUT_DATANAME"):
            if "=" not in s:
                print("Malformed UUT_DATANAME line (missing '='):\n  " + s)
                quit()
            tmp_dataname = s.split("=", 1)[1].strip().strip('"').strip("'")
            break

    UnitName = tmp_dataname if tmp_dataname else ""

    if uut_dbc_name == "":
        print("No DBC file specified, add 'UUT_DBC = filename.dbc' to script")
        quit()

    for line in Lines:
        s = line.strip()
        if s.startswith("SUPPRESS_PAT_SUPPORT"):
            if "=" not in s:
                print("Malformed SUPPRESS_PAT_SUPPORT line (missing '='):\n  " + s)
                quit()
            SuppressPatSupport = s.split("=", 1)[1].strip().strip('"').strip("'")
            break
                    
    # read uut
    filename = os.path.join(DBCPath, uut_dbc_name)
    print("Loading", uut_dbc_name + "...")
    uut_db = CanDb(dbc_filename=filename)
    print("Updating UUT_Fdbk...")

    pat_dbc_name = "PAT.dbc"
    pat_db_for_check = None
        
    # Load PAT.dbc file only if SuppressPatSupport is not set to True
    if(SuppressPatSupport == 'True'):
        print("Suppression of PAT support active; UUT testing only")
        pat_db = None
        # For preflight only, we still try to load PAT.dbc so we can give
        # better error messages if a script references PAT-only signals.
        try:
            pat_db_for_check = CanDb(dbc_filename=os.path.join(DBCPath, pat_dbc_name))
        except Exception:
            pat_db_for_check = None
    else:
        # read pat
        filename = os.path.join(DBCPath, pat_dbc_name)
        print("Loading", pat_dbc_name + "...")
        pat_db = CanDb(dbc_filename=filename)
        pat_db_for_check = pat_db
        
        # compare uut and pat. skip if pat suppressed
        print("Verifing...")
        pat_signals = set(pat_db.iter_signal_names())
        uut_signals = set(uut_db.iter_signal_names())
        dupes = pat_signals.intersection(uut_signals)
        if dupes:
            dupe = sorted(dupes)[0]
            print("\nDuplicate Signal Found, Aborting...", dupe)
            quit()
        
        # init pat
        print("Setting up PAT I/O...")
        for message in pat_db.messages:
            for s in message.signals:
                globals.PAT_Fdbk[s.name] = 0
                if(getattr(globals, "Verbose", 0) >= 1):
                    print(message.name, s.name)

    # init uut
    print("Setting up UUT I/O...")
    for message in uut_db.messages:
        for s in message.signals:
            globals.UUT_Fdbk[s.name] = 0
            if(getattr(globals, "Verbose", 0) >= 1):
                print(message.name, s.name)
    # -----------------
    # Preflight checks
    # -----------------
    if run_preflight_checks:
        pat_support_active = (SuppressPatSupport == 'False') and (pat_db is not None)
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
            quit()

    #TODO: check test commands are not
    