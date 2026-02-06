import os
import sys
import msvcrt
import threading
import time
import keyboard
from datetime import datetime

"""PATSpeak main entry.

This version uses python-can + cantools, and no longer depends on Kvaser's
kvadblib for DBC handling.
"""

#from support.events import ProcessEvents
from support.script import ProcessScript
import support.globals as globals

def ErrorTrap(error):
    # Historically this attempted to terminate thread objects directly.
    # Threads are now stopped via the globals.finished flag.
    print("Fatal error:", error)
    globals.finished = 1
    quit()
    
n = len(sys.argv)
# print("Total arguments passed:", n)
 
# Arguments passed
#print("\nName of Python script:", sys.argv[0])
 
# print("\nArguments passed:", end = " ")
# for i in range(1, n):
    # print(sys.argv[i], end = " ")

#----TODO: process Arguments better
if (n >= 2):
    globals.TestFile = sys.argv[1].strip()
    if(globals.TestFile.endswith(".pat")):
        print("\nLoading", globals.TestFile + "...")
    else:
        print("\nNot a PAT script...")
        globals.finished = 1
        quit()
else:
    print("\nNo file specified...")
    globals.finished = 1
    quit()
    
if (n >= 3):
    if(sys.argv[2].strip() == '-v'):
        globals.Verbose = 1
else:
    globals.Verbose = 0
    
if(globals.Verbose == 1):
    print("Verbose Enabled")
#--------

globals.initialize()

# All CAN interfaces (PCAN, Kvaser, SocketCAN, ...) are handled by support.can.
from support.can import CANThread, autodetect_can_backend

# Auto-detect and report which CAN backend will be used.
autodetect_can_backend()

#start CAN
globals.CAN_1 = threading.Thread(target=CANThread, args=(0,))
globals.CAN_1.start()
   
#Start CAN thread for PAT
if(globals.SuppressPatSupport == 'False'): # skip if suppressed
    globals.CAN_2 = threading.Thread(target=CANThread, args=(1,))
    globals.CAN_2.start()
time.sleep(2)

#playsound(globals.SoundStart)

if(globals.UnitName == ""):
    globals.UnitName = input("Pressing Esc will end the test early." + "\n\nType a name for the test and press Enter to begin.")

if(globals.UnitName == ""):
    globals.UnitName = "untitled"
    
print("Test Name:", globals.UnitName)

while not globals.finished:
    # If ESC key pressed in main loop, while focused on terminal
    # Pause test and prompt user to confirm exit of test
    # (msvcrt is a windows compatible library)
    if msvcrt.kbhit():
        key = msvcrt.getch()
        if key == b'\x1b':  # ESC key
            userinput = input("Are you sure you want to stop.\nPress Y to stop, any key to continue.")
            if((userinput == "y") or (userinput == "Y")):
                logfile = globals.LogPath + str(globals.UnitName) + "_" + globals.TestFile + ".log"
                f = open(logfile, 'w')
                f.write("Esc - user interruption @ " + str(datetime.today().strftime(globals.TimeStampFormat)) + "\n")
                f.write(globals.UUT_TestLog)
                f.close()        
                globals.finished = 1
                break  # finishing the loop

    ProcessScript()
    time.sleep(0.01)

globals.finished = 1

