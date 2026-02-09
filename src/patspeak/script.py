import csv
import time
import os
#from playsound import playsound
from datetime import datetime
import patspeak.runtime as rt
from datetime import timedelta
from .console import colorize_status_line, make_log_path, make_csv_path
from .progress import note_step_started, note_step_result
def SaveData():

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
    # rt.LogPath is set to a per-test "results" folder during rt.initialize().
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
        
        print(logfile)
        f = open(logfile, 'w')
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

        
    
