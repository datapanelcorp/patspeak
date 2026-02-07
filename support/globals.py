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
    global WaitTime, WaitDone, SoundStart, SoundFail, SoundPass, TimeStampFormat, UnitName, HeaderAdded
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
    
    UUT_TestLog = "Started on: " + str(datetime.today().strftime(TimeStampFormat)) + "\n"
    
    DBCPath = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "dbc"))
    DataPath = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "dut"))
    LogPath = DataPath

    # Ensure output directories exist
    os.makedirs(DataPath, exist_ok=True)
    os.makedirs(DBCPath, exist_ok=True)
    
    SoundStart = os.path.join(os.path.dirname(__file__), "..", "..", "startup.wav")
    SoundFail = os.path.join(os.path.dirname(__file__), "..", "..", "fail.wav")
    SoundPass = os.path.join(os.path.dirname(__file__), "..", "..", "tada.wav")  

    #find UUT DBC file name
    test_file = open(os.path.join(DataPath, TestFile), 'r')
    Lines = test_file.readlines()
    test_file.seek(0)
    
    UUTDBCName = ""
    for line in Lines:
        if(line.startswith("UUT_DBC")):
            UUTDBCName = line.split("=")
            
    TempCheck = ""
    for line in Lines:
        if(line.startswith("UUT_DATANAME")):
            TempCheck = line.split("=")
    
    UnitName = ""
    if(TempCheck != ""):
        UnitName = TempCheck[1].strip()
        
    if(UUTDBCName == ""):
        print("No DBC file specified, add 'UUT_DBC = filename.dbc' to script")
        quit()

    for line in Lines:
        if(line.startswith("SUPPRESS_PAT_SUPPORT")):
            SuppressPatSupport = line.split("=")
            SuppressPatSupport = SuppressPatSupport[1].strip()
            break
                    
    # read uut
    uut_dbc_name = UUTDBCName[1].strip()
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
                if(globals.Verbose == 1):
                    print(message.name, s.name)

    # init uut
    print("Setting up UUT I/O...")
    for message in uut_db.messages:
        for s in message.signals:
            globals.UUT_Fdbk[s.name] = 0
            if(globals.Verbose == 1):
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
    