import csv
import time
import os
#from playsound import playsound
from datetime import datetime
import support.globals as globals
from datetime import timedelta
from support.console import colorize_status_line, make_log_path, make_csv_path
from support.progress import note_step_started, note_step_result
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
            
    # Save CSV alongside the per-test logs.
    # globals.LogPath is set to a per-test "results" folder during globals.initialize().
    datafile = make_csv_path(globals.LogPath, str(globals.UnitName), getattr(globals, "RunStamp", None))
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
    
    logfile = make_log_path(
        globals.LogPath,
        str(globals.UnitName),
        str(globals.TestFile),
        getattr(globals, "RunStamp", None),
    )
    #logfile = globals.LogPath + globals.TestFile + ".log"
    print_test = 0
    
    StepStr = str(globals.TestStep).zfill(5) + ' ' #* len(str(globals.TestStep))

    # Keep a copy of the raw line for debugging (before whitespace stripping).
    raw_line = None
    if(globals.TestLine == ""):
        globals.TestLine = globals.test_file.readline().rstrip()
        raw_line = globals.TestLine
        if(globals.TestStep == 0):
            globals.StartTime = time.time()
        globals.UUT_TestLog += StepStr + globals.TestLine + "\n" 
        print_test = 1 #only print om new lines

        # Progress UI: mark a step as started as soon as we consume a *step* line.
        # (Avoid marking comments/directives/END as steps so the bar stays aligned.)
        try:
            s = (globals.TestLine or "").strip()
            is_step = bool(s) and (not s.startswith("#"))
            if is_step:
                if s in {"END", "SAVE"} or s.startswith("PAUSE"):
                    is_step = False
                elif s.startswith("UUT_DBC") or s.startswith("UUT_DATANAME") or s.startswith("SUPPRESS_PAT_SUPPORT"):
                    is_step = False
            if is_step:
                note_step_started(globals.TestStep)
        except Exception:
            pass

        # Super-verbose: echo every .pat line as it is consumed.
        if(getattr(globals, "Verbose", 0) >= 2):
            print(StepStr + str(raw_line))

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
        try:
            globals.test_file.close()
        except Exception:
            pass
        globals.test_done = 1
        #playsound(globals.SoundPass)
        #TODO: prompt for another and start over
        #yn = input("Do you want to test another unit? y/n")
        #if(yn != "y"):
        return
        
    if(globals.TestLine.startswith("PAUSE")):
        the_prompt = globals.TestLine.split("-")
        yn = input(the_prompt[1])
        globals.TestLine = "" #clear to stop further processing
        
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
        if(getattr(globals, "Verbose", 0) >= 1):
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

        # Track which timing flags were explicitly specified on the line.
        timeout_specified = False
        hold_specified = False
        wait_specified = False

        # Super-verbose helper: only emit debug once per step (when we first
        # read the line) to avoid spamming during WAIT/HOLD polling.
        def _dbg(msg: str) -> None:
            if(getattr(globals, "Verbose", 0) >= 2 and print_test):
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
                    if(globals.WaitDone == 0):
                        Wait = float(s[1])
                    wait_specified = True
                    Timeout = 0
                if(s[0] == "MESSAGE"):
                    input(s[1] + "\nPress Enter to continue...")
                    Timeout = 0
                if(s[0] == "TAG"):
                    globals.DataLogTag = s[1]
                    Timeout = 0

        # Super-verbose: show per-step timing flags.
        if(print_test and getattr(globals, "Verbose", 0) >= 2):
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
                    TestTime = globals.PassTime = 0  # force pass

                    RealValue = None
                    # Prefer PAT (if enabled), otherwise fall back to UUT.
                    if globals.SuppressPatSupport == 'False' and globals.pat_db is not None:
                        RealValue = globals.pat_db.get_tx_signal(SignalName)
                    if RealValue is None:
                        RealValue = globals.uut_db.get_tx_signal(SignalName)
                    if RealValue is None:
                        print("signal not found!", SignalName)
                        RealValue = 0

                    # Super-verbose: show the logged value.
                    _dbg(f"DATALOG {SignalName}: {RealValue}")

                    globals.UUT_Results[
                        str(globals.TestStep) + "-" + SignalName + "-" + globals.DataLogTag
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
                        if globals.SuppressPatSupport == 'False' and globals.pat_db is not None:
                            prev = globals.pat_db.get_tx_signal(SignalName)
                            if globals.pat_db.set_tx_signal(SignalName, v):
                                pat_set = True
                                globals.PAT_Fdbk[SignalName] = v
                                RealValue = v
                                _dbg(f"SET PAT  {SignalName}: {prev} -> {v}")

                        # UUT outputs
                        prev = globals.uut_db.get_tx_signal(SignalName)
                        if globals.uut_db.set_tx_signal(SignalName, v):
                            uut_set = True
                            globals.UUT_Fdbk[SignalName] = v
                            RealValue = v
                            _dbg(f"SET UUT  {SignalName}: {prev} -> {v}")

                        # If the script references an output that isn't in any TX message,
                        # call it out loudly in super-verbose mode.
                        if not pat_set and not uut_set:
                            _dbg(f"SET ???  {SignalName}: {v} (signal not found in TX)")
        
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
                        try:
                            note_step_result(globals.TestStep, passed=False)
                        except Exception:
                            pass
                    else:
                        TestString = StepStr + "PASS:" + " " + SignalName + " " + str(RealValue)
                        try:
                            note_step_result(globals.TestStep, passed=True)
                        except Exception:
                            pass
                    globals.UUT_TestLog += TestString + "\n"
                    print(colorize_status_line(TestString))
                    
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
                    print(colorize_status_line(TestString))

        
    
