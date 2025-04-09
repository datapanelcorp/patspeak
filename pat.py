import os
import sys
#from playsound import playsound
#os.environ['SDL_VIDEO_WINDOW_POS'] = "%d,%d" % (1,1)
#os.environ["DISPLAY"] = ':0'
#import pygame
import threading
import time
import keyboard
from datetime import datetime

from support.screens import DrawScreen 
from support.events import ProcessEvents
from support.can import CANThread
from support.script import ProcessScript
import support.globals as globals


def ErrorTrap(error):
    sink = error #sink errors for now
    globals.CAN1.terminate() 
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

#print("\nInit screen...")
#init screen
#pygame.init()
#screen = pygame.display.set_mode((800, 600), pygame.RESIZABLE)
#pygame.display.set_caption('PAT')
#print(pygame.display.Info())
#pygame.mouse.set_visible(0)
#pygame.mouse.set_cursor((8,8),(0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0))

#start CAN
globals.CAN_1 = threading.Thread(target=CANThread, args=(0,))
globals.CAN_1.start()
   
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

    if keyboard.is_pressed('esc'):
        userinput = input("Are you sure you want to stop.\nPress Y to stop, any key to continue.")
        if((userinput == "y") or (userinput == "Y")):
            logfile = globals.LogPath + str(globals.UnitName) + "_" + globals.TestFile + ".log"
            f = open(logfile, 'w')
            f.write("Esc - user interruption @ " + str(datetime.today().strftime(globals.TimeStampFormat)) + "\n")
            f.write(globals.UUT_TestLog)
            f.close()        
            globals.finished = 1
            break  # finishing the loop

    ScreenMode = 0
    #screen.fill((0, 0, 0))
    #DrawScreen(screen, ScreenMode)
    ProcessScript()
    #ProcessEvents()
    #pygame.display.flip()
    time.sleep(0.01)

globals.finished = 1

