import csv
from canlib import kvadblib
from datetime import datetime
import time
import os
import re
import support.globals as globals


_DBC_BO_RE = re.compile(r"^BO_\s+(\d+)\s+([A-Za-z0-9_]+)\s*:\s*(\d+)\s+([A-Za-z0-9_]+)")

# SocketCAN-style ID flags that sometimes appear in DBC exports (e.g., ID ORed with 0x80000000 for extended frames).
_CAN_EFF_FLAG = 0x80000000
_CAN_RTR_FLAG = 0x40000000
_CAN_ERR_FLAG = 0x20000000
_CAN_EFF_MASK = 0x1FFFFFFF
_CAN_SFF_MASK = 0x7FF

def _normalize_dbc_bo_id(raw_id: int):
    """Normalize a DBC BO_ message ID to (arbitration_id, is_extended).

    Some DBC exports store extended-frame messages as SocketCAN-style can_id values with flags
    ORed in (e.g., CAN_EFF_FLAG=0x80000000). Python-CAN and most APIs expose arbitration_id
    without these flag bits, so we strip them to ensure matching works.
    """
    arb = raw_id & _CAN_EFF_MASK
    is_ext = bool(raw_id & _CAN_EFF_FLAG) or (arb > _CAN_SFF_MASK)
    if not is_ext:
        arb = arb & _CAN_SFF_MASK
    return arb, is_ext

def _dbc_get_tx_messages_by_node(dbc_filename: str, tx_node: str = "UUT"):
    """Parse a .dbc and return (ids_set, id_to_name) for messages whose Tx node matches tx_node.

    This intentionally reads the raw DBC 'BO_' Tx Node field so behavior matches the DBC authoring.
    """
    ids = set()
    info = {}
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
    return ids, info



def initialize(): 
    global finished, TestStep, TestPhase, TestLine, PAT_Fdbk, UUT_Fdbk, pat_db, uut_db, test_file, TotalTime, StartTime, FailCount
    global pat_framebox_out, uut_framebox_out, PassTime, tracker_last_time, StepTime, UUT_Results, UUT_TestLog
    global WaitTime, WaitDone, SoundStart, SoundFail, SoundPass, TimeStampFormat, UnitName, HeaderAdded
    global MeterData, UUTData, TestFile, DataLogTag, DataPath, LogPath, CAN_1, CAN_2, Verbose, AllCollectedData, SuppressPatSupport, UUT_TxMsgIds, UUT_TxMsgInfo, UUT_TxSeenCount, UUT_TxLastSeen, UUT_TxLastSeenId

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
    PAT_Fdbk = { }
    UUT_Fdbk = { }
    UUT_Results = { }
    AllCollectedData = ""
    DataLogTag = ""
    HeaderAdded = 0
    FailCount = 0
    SuppressPatSupport = 'False'

    # UUT traffic tracking (messages whose Tx Node is tagged 'UUT' in the selected UUT DBC)
    UUT_TxMsgIds = set()
    UUT_TxMsgInfo = {}
    UUT_TxSeenCount = 0
    UUT_TxLastSeen = 0.0
    UUT_TxLastSeenId = None
    
    TimeStampFormat = '%Y-%m-%d-%H:%M:%S'
    
    UUT_TestLog = "Started on: " + str(datetime.today().strftime(TimeStampFormat)) + "\n"
    
    DBCPath = os.path.abspath(os.path.join(os.path.dirname(__file__), "..","dbc/"))
    DataPath = os.path.abspath(os.path.join(os.path.dirname(__file__), "..","dut/"))
    LogPath = os.path.abspath(os.path.join(os.path.dirname(__file__), "..","dut/"))
    
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
    DBCFileName = UUTDBCName[1].strip()
    filename = os.path.join(DBCPath, DBCFileName)
    # Precompute IDs of messages tagged as being transmitted by the UUT (DBC BO_ Tx Node == 'UUT').
    # This powers the UUT_TXCHECK command.
    UUT_TxMsgIds, UUT_TxMsgInfo = _dbc_get_tx_messages_by_node(filename, tx_node="UUT")
    if len(UUT_TxMsgIds) == 0:
        print("WARNING: No BO_ messages with Tx Node 'UUT' found in the selected UUT_DBC. UUT_TXCHECK will always fail.")
    else:
        print(f"UUT_TXCHECK: monitoring {len(UUT_TxMsgIds)} message IDs tagged Tx Node 'UUT'.")
    print("Loading", DBCFileName + "...")
    uut_db = kvadblib.Dbc(filename=filename)
    print("Updating UUT_Fdbk...")
        
    # Load PAT.dbc file only if SuppressPatSupport is not set to True
    if(SuppressPatSupport == 'True'):
        print("Suppression of PAT support active; UUT testing only")
    else:
        # read pat
        DBCFileName = "PAT.dbc"
        filename = os.path.join(DBCPath, DBCFileName)
        print("Loading", DBCFileName + "...")
        pat_db = kvadblib.Dbc(filename=filename)
        
        # compare uut and pat. skip if pat suppressed
        print("Verifing...")
        for pm in pat_db:
            for ps in pm.signals():
                for um in uut_db:
                    for us in um.signals():
                        if(ps.name == us.name):
                            print("\nDuplicate Signal Found, Aborting...", us.name)
                            quit()
        
        # init pat
        print("Setting up PAT I/O...")
        #TODO: update PAT_Fdbk globals.PAT_Fdbk[s.name] = value
        print(pat_db)
        pat_framebox_in = pat_framebox_out = kvadblib.FrameBox(pat_db)
        for message in pat_db:
            for s in message.signals():
                globals.PAT_Fdbk[s.name] = 0#s.name
                if(globals.Verbose == 1):
                    print(message.name, s.name)
            if(message.send_node.name == "CTRL"):
                pat_framebox_out.add_message(message.name)

    # init uut
    print("Setting up UUT I/O...")    
    #TODO: update UUT_Fdbk globals.UUT_Fdbk[s.name] = value
    print(uut_db)
    uut_framebox_in = uut_framebox_out = kvadblib.FrameBox(uut_db)
    for message in uut_db:
        for s in message.signals():
            globals.UUT_Fdbk[s.name] = 0#s.name
            if(globals.Verbose == 1):
                print(message.name, s.name)  
        if(message.send_node.name == "CTRL"):
            uut_framebox_out.add_message(message.name)

    #TODO: check signal names are in script.
    #TODO: check test commands are not
    