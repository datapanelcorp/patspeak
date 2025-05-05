import os
import sys
import msvcrt
import threading
import time
import keyboard
from datetime import datetime

import can # Imports python-can library for pcan support : "pip install python-can"

#from support.events import ProcessEvents
from support.script import ProcessScript
import support.globals as globals

def ErrorTrap(error):
    sink = error #sink errors for now
    globals.CAN1.terminate() 
    if globals.SuppressPatSupport == 'False':
        globals.CAN2.terminate() 
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

try:
    bus = can.Bus(channel='PCAN_USBBUS1', interface='pcan', bitrate=250000)
    print("PCAN1 Detected")
    bus.shutdown()
    if globals.SuppressPatSupport == 'False':
        bus = can.Bus(channel='PCAN_USBBUS2', interface='pcan', bitrate=250000)
        print("PCAN2 Detected")
        bus.shutdown()
    from support.pcan_interface import CANThread 
except can.CanError:
    print("No PCAN device detected")
    from support.can import CANThread

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

