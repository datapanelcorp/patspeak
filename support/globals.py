import csv
from canlib import kvadblib
from datetime import datetime
import time
import os
import support.globals as globals


def initialize(): 
    global finished, TestStep, TestPhase, TestLine, PAT_Fdbk, UUT_Fdbk, pat_db, uut_db, test_file, TotalTime, StartTime, FailCount
    global pat_framebox_out, uut_framebox_out, PassTime, tracker_last_time, StepTime, UUT_Results, UUT_TestLog
    global WaitTime, WaitDone, SoundStart, SoundFail, SoundPass, TimeStampFormat, UnitName, HeaderAdded
    global MeterData, UUTData, TestFile, DataLogTag, DataPath, LogPath, CAN_1, CAN_2, Verbose, AllCollectedData, SuppressPatSupport

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
    