import csv
import time
import os
#from playsound import playsound
from datetime import datetime
import support.globals as globals
from datetime import timedelta
import subprocess
import re

def DeathSpeep():

    cmd = [
        "python",
        r"DP800\rigol_dp800_sweep_ch2.py",
        "--resource", "USB0::0x1AB1::0x0E11::DP8C180100022::INSTR",
        "--channel", "2",
        "--start", "4.32",
        "--stop", "4.43",
        "--step", "0.001",
        "--mode", "updown",
        "--dwell", "0.020",
        "--opc-every", "25",
        "--output-off-at-end",
    ]

    result = subprocess.run(
        cmd,
        capture_output=True,
        text=True,
        check=True
    )

    print(result.stdout)
    print(result.stderr)
    globals.UUT_TestLog += result.stdout + "\n"
    globals.UUT_TestLog += result.stderr + "\n"

def CheckUUTTxTraffic(timeout_s: float = 2.0, tx_node: str = "UUT"):
    """Wait up to timeout_s seconds for any UUT-transmitted CAN message to be observed.

    'UUT-transmitted' is determined by parsing the loaded UUT DBC's BO_ Tx Node field (sender == tx_node).
    Returns (ok, seen_id, seen_name).
    """
    try:
        msg_ids = getattr(globals, "UUT_TxMsgIds", set()) or set()
        msg_info = getattr(globals, "UUT_TxMsgInfo", {}) or {}
    except:
        msg_ids = set()
        msg_info = {}

    if not msg_ids:
        return (False, None, None)

    start_count = getattr(globals, "UUT_TxSeenCount", 0)
    start_time = time.time()

    while (time.time() - start_time) < float(timeout_s):
        try:
            if getattr(globals, "UUT_TxSeenCount", 0) > start_count:
                seen_id = getattr(globals, "UUT_TxLastSeenId", None)
                seen_name = None
                if seen_id is not None:
                    seen_name = msg_info.get(seen_id) or msg_info.get((seen_id, True)) or msg_info.get((seen_id, False))
                return (True, seen_id, seen_name)
        except:
            pass
        time.sleep(0.01)

    return (False, None, None)


def SaveData():

    print("Writing Data Collected.")
    print("Fail Count:", globals.FailCount)
    for key,value in globals.UUT_Results.items():
        if(not "NULL" in key):
            tmp = key.split("-")
            TestStep = tmp[0]
            SignalName = tmp[1]
            DataLogTag = tmp[2]
            
            # HeaderName = ""
            
            # if(DataLogTag != ""):
                # #HeaderName = str(globals.UnitName) + "_" + SignalName + "_" + DataLogTag
                # HeaderName =  DataLogTag + "_" + str(globals.UnitName) + "_" + SignalName 
            # else:
                # HeaderName = str(globals.UnitName) + "_" + SignalName
                
            # datafile = globals.DataPath + HeaderName + ".csv"
            
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
            
    datafile = globals.DataPath + str(globals.UnitName) + ".csv"
    f = open(datafile, 'a')
    f.write(globals.AllCollectedData)
    #f = open(datafile, 'w')
    #f.write(globals.AllCollectedData + "\n")
    f.close()
    
    globals.AllCollectedData = ""            
    globals.UUT_Results.clear()

def ProcessScript():
    
    time_delta = 0      
    tracker_time = time.time()
    if(globals.tracker_last_time):
        time_delta = tracker_time - globals.tracker_last_time
    globals.tracker_last_time = tracker_time
    
    logfile = globals.LogPath + str(globals.UnitName) + "_" + str(globals.TestFile) + ".log"
    #logfile = globals.LogPath + globals.TestFile + ".log"
    print_test = 0
    
    StepStr = str(globals.TestStep).zfill(5) + ' ' #* len(str(globals.TestStep))
    if(globals.TestLine == ""):
        globals.TestLine = globals.test_file.readline().rstrip()
        if(globals.TestStep == 0):
            globals.StartTime = time.time()
        globals.UUT_TestLog += StepStr + globals.TestLine + "\n" 
        print_test = 1 #only print om new lines

    if(globals.TestLine == "END"): 
        globals.UUT_TestLog += "Fail count: " + str(globals.FailCount) + "\n"
        globals.UUT_TestLog += "Finished on: " + str(datetime.today().strftime(globals.TimeStampFormat)) + "\n"
        
        EndTime = time.time()
        time_lapsed = EndTime - globals.StartTime
        convert = timedelta(seconds=time_lapsed)
        globals.UUT_TestLog += "elapsed time: " + str(convert) + "\n"
        print("elapsed time:", convert)
        print("END OF TEST")
        
        print(logfile)
        f = open(logfile, 'w')
        f.write(globals.UUT_TestLog)
        f.close()        
        globals.finished = 1
        #playsound(globals.SoundPass)
        #TODO: prompt for another and start over
        #yn = input("Do you want to test another unit? y/n")
        #if(yn != "y"):
        quit()
        
    if(globals.TestLine.startswith("PAUSE")):
        the_prompt = globals.TestLine.split("-")
        yn = input(the_prompt[1])
        globals.TestLine = "" #clear to stop further processing

    if(globals.TestLine.startswith("SWEEP")):
        DeathSpeep()
        globals.TestLine = "" #clear to stop further processing

    if(globals.TestLine.startswith("UUT_TXCHECK")):
        # Optional syntax: UUT_TXCHECK-<timeout_seconds> or UUT_TXCHECK=<timeout_seconds>
        timeout_s = 2.0
        try:
            parts = re.split(r"[-=]", globals.TestLine, maxsplit=1)
            if len(parts) == 2 and parts[1].strip() != "":
                timeout_s = float(parts[1].strip())
        except:
            pass

        ok, seen_id, seen_name = CheckUUTTxTraffic(timeout_s=timeout_s)
        if ok:
            detail = ""
            if seen_name:
                detail = f" ({seen_name})"
            msg = str(globals.TestStep).zfill(5) + " PASS: UUT_TXCHECK" + detail
            globals.UUT_TestLog += msg + "\n"
            print(msg)
        else:
            reason = "no UUT-tagged TX messages seen"
            if not getattr(globals, "UUT_TxMsgIds", set()):
                reason = "no messages in DBC tagged with Tx Node UUT"
            msg = str(globals.TestStep).zfill(5) + " FAIL: UUT_TXCHECK (" + str(reason) + ")"
            globals.UUT_TestLog += msg + "\n"
            print(msg)
            globals.FailCount += 1

        # advance like a normal test step
        globals.TestLine = "" #read next line
        globals.PassTime = 0
        globals.StepTime = 0
        globals.WaitDone = 0
        globals.TestStep += 1

    if(globals.TestLine == "SAVE"):
        SaveData()
        globals.TestLine = "" #clear to stop further processing
        
    if(globals.TestLine.startswith("UUT_DBC")):
        globals.TestLine = "" #clear to stop further processing
        
    if(globals.TestLine.startswith("UUT_DATANAME")):
        globals.TestLine = "" #clear to stop further processing

    if(globals.TestLine.startswith("SUPPRESS_PAT_SUPPORT")):
        globals.TestLine = "" #clear to stop further processing

    #TODO: verify format
    if((globals.TestLine.startswith("#")) or (globals.TestLine=="")):
        if(globals.Verbose == 1):
            if(globals.TestLine.startswith("#")):
                print(StepStr + globals.TestLine)
        globals.TestLine = ""

    else:
        globals.TestLine = globals.TestLine.replace(" ", "")
        
        #print(str(globals.StepTime) + " " + globals.TestLine)
        
        IO = globals.TestLine.split(":")
        Outs = IO[0].split(",")
        Ins = IO[1].split(",")
        
        Timeout = 5
        Hold = 0
        Wait = 0

        if(len(IO) == 3):
            Flags = IO[2].split(",")
            for o in Flags:
                s = o.split("=")
                if(s[0] == "TIMEOUT"):
                    Timeout = float(s[1])
                if(s[0] == "HOLD"):
                    Hold = float(s[1])
                    Timeout = 0
                if(s[0] == "WAIT"):
                    if(globals.WaitDone == 0):
                        Wait = float(s[1])
                    Timeout = 0
                if(s[0] == "MESSAGE"):
                    input(s[1] + "\nPress Enter to continue...")
                    Timeout = 0
                if(s[0] == "TAG"):
                    globals.DataLogTag = s[1]
                    Timeout = 0

        TestToStr = ""
        SignalName = ""
        TestValue = 0
        TestTol = 0
        TestTime = 0
        RealValue = 0

        for o in Outs:
            s = o.split("=")
            SignalName = s[0]
            if(s[0] == "NULL"):
                pass
            else:
                if(s[1] == "DATALOG"):
                    TestTime = globals.PassTime = 0 #force pass
                    RealValue = globals.pat_framebox_out.signal(SignalName).phys
                    globals.UUT_Results[str(globals.TestStep) + "-" + SignalName + "-" + globals.DataLogTag] = RealValue 
                else:
                    try:
                        globals.pat_framebox_out.signal(SignalName).phys = float(s[1])
                        globals.PAT_Fdbk[SignalName] = float(s[1])
                        RealValue = float(s[1])
                    except:
                        pass
                    #TODO: why is this called twice?    
                    try:
                        globals.uut_framebox_out.signal(SignalName).phys = float(s[1])
                        globals.UUT_Fdbk[SignalName] = float(s[1])
                        RealValue = float(s[1])
                    except:
                        pass
        
        if(Wait):
            globals.WaitTime += time_delta
            if(globals.WaitTime >= Wait):
                globals.WaitDone = 1 #stop from resetting
                globals.WaitTime = Wait = 0 #allow to pass

        if(Wait == 0):
            for i in Ins:
                s = i.split("=")
                SignalName = s[0]
                if(SignalName == "NULL"):
                    pass
                else:
                    if(s[1] == "DATALOG"):
                        TestTime = globals.PassTime = 0 #force pass
                        try:
                            RealValue = float(globals.PAT_Fdbk[SignalName])
                        except:
                            try:
                                RealValue = float(globals.UUT_Fdbk[SignalName])
                            except:
                                print("signal not found!", SignalName)
                                globals.StepTime = Timeout #force exit
                    else:
                        t = s[1].split("|")
                        TestValue = float(t[0].rstrip())
                        TestTol = float(t[1].rstrip())
                        TestToStr = "+/- " + str(TestTol)
                        TestTime = float(t[2].rstrip())
                        try:
                            RealValue = float(globals.PAT_Fdbk[SignalName])
                        except:
                            try:
                                RealValue = float(globals.UUT_Fdbk[SignalName])
                            except:
                                print("signal not found!", SignalName)
                                globals.StepTime = Timeout #force exit
                            
                        RealValue = round(RealValue, 4)
                        TestValue = round(TestValue, 4)
                        
                        if((RealValue <= (TestValue + TestTol))&(RealValue >= (TestValue - TestTol))):
                            #if(RealValue >= (TestValue - TestTol)):
                            globals.PassTime += time_delta
                        else:
                            globals.PassTime = 0
                        #else:
                       #     globals.PassTime = 0

            if(Hold):
                globals.PassTime = 0
                
            if(Timeout):
                globals.StepTime += time_delta

            if((globals.PassTime >= TestTime)|((Timeout)&(globals.StepTime >= Timeout))):
                if(SignalName != 'NULL'):
                    globals.UUT_Results[str(globals.TestStep) + "-" + SignalName + "-" + globals.DataLogTag] = RealValue
                    if((Timeout)&(globals.StepTime >= Timeout)):
                        TestString = StepStr + "FAIL:" + " " + SignalName + " " + str(RealValue)
                        globals.FailCount += 1
                    else:
                        TestString = StepStr + "PASS:" + " " + SignalName + " " + str(RealValue)
                    globals.UUT_TestLog += TestString + "\n"
                    print(TestString)
                    
                    name_header = "Step,"
                    the_fdbk_values = str(globals.TestStep) + ","
                    
                    for name in globals.UUT_Fdbk:
                        name_header += name + ","
                        the_fdbk_values += str(round(float(globals.UUT_Fdbk[name]),3)) + ","
                        
                    for name in globals.PAT_Fdbk:
                        name_header += name + ","
                        the_fdbk_values += str(round(float(globals.PAT_Fdbk[name]),3)) + ","

                    #if(globals.AllCollectedData == ""):
                    if(globals.HeaderAdded == 0):
                        globals.HeaderAdded = 1
                        #print(name_header)
                        globals.AllCollectedData = name_header + "\n"
                        

                    globals.AllCollectedData += the_fdbk_values  + "\n"

                        
                globals.TestLine = "" #read next line
                globals.PassTime = 0
                globals.StepTime = 0
                globals.WaitDone = 0
                globals.TestStep += 1              
            else:
                if(print_test):
                    TestString = StepStr + "TEST:" + " " + SignalName + " " + str(TestValue) + " " + TestToStr
                    globals.UUT_TestLog += TestString + "\n"
                    print(TestString)

        
    
