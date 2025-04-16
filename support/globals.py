import csv
from canlib import kvadblib
from datetime import datetime
import time

import support.globals as globals


def initialize(): 
    global finished, TestStep, TestPhase, TestLine, PAT_Fdbk, UUT_Fdbk, pat_db, uut_db, test_file, TotalTime, StartTime, FailCount
    global pat_framebox_out, uut_framebox_out, PassTime, tracker_last_time, StepTime, UUT_Results, UUT_TestLog
    global WaitTime, WaitDone, SoundStart, SoundFail, SoundPass, TimeStampFormat, UnitName, HeaderAdded
    global MeterData, UUTData, TestFile, DataLogTag, DataPath, LogPath, CAN_1, CAN_2, Verbose, AllCollectedData

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
    
    TimeStampFormat = '%Y-%m-%d-%H:%M:%S'
    
    UUT_TestLog = "Started on: " + str(datetime.today().strftime(TimeStampFormat)) + "\n"
    
    TestPath = "C:\\Bin\\patspeak\\dut\\"
    DBCPath = "C:\\Bin\\patspeak\\dbc\\"
    DataPath = "C:\\Bin\\patspeak\\data\\"
    LogPath = "C:\\Bin\\patspeak\\data\\"
    
    SoundStart = "C:\\Bin\\patspeak\\sounds\\startup.wav"
    SoundFail = "C:\\Bin\\patspeak\\sounds\\fail.wav"
    SoundPass = "C:\\Bin\\patspeak\\sounds\\tada.wav"  

    #find UUT DBC file name
    test_file = open(TestPath + TestFile, 'r')
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

    DBCFileName = "PAT.dbc"
    print("Loading", DBCFileName + "...")
    pat_db = kvadblib.Dbc(filename=DBCPath + DBCFileName)

    
    DBCFileName = UUTDBCName[1].strip()
    print("Loading", DBCFileName + "...")
    uut_db = kvadblib.Dbc(filename=DBCPath + DBCFileName)
    print("Updating UUT_Fdbk...")
    
    print("Verifing...")
    for pm in pat_db:
        for ps in pm.signals():
            for um in uut_db:
                for us in um.signals():
                    if(ps.name == us.name):
                        print("\nDuplicate Signal Found, Aborting...", us.name)
                        quit()
                        
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
    