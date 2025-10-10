import os

script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")

TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

outstr = ""
outstr += "#37000-1\n"
outstr += "#Verion 0.0\n"
outstr += "#input test\n"
outstr += "UUT_EDS = 37000-561.eds\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"


outstr += "#switch in 420ma gen\n"
outstr += "J4_05 = 1 : NULL : WAIT = 0.2\n"

PortIndex = 0
ModeIndex = 0

#PortAMode = "0"
#PortBMode = "3"

InPortAMode = 0
InPortBMode = 3
OutPortAMode = 0
OutPortBMode = 0

OutputMode = str(int(OutPortAMode | (OutPortBMode << 4)))
InputMode = str(int(InPortAMode | (InPortBMode << 4)))

AmpsInc = 5000
AmpsStart = AmpsInc
AmpsMax = 20000
AmpsValue = AmpsStart

while AmpsValue <= AmpsMax:
    outstr += "#promp user\n"
    outstr += "PAUSE- SET GEN TO " + str(AmpsValue/1000) + "ma\n"
    PortIndex = 0
    while PortIndex <= 3:
        if(PortIndex==0):
            OutputConnector = "J2_10"
            InputName = "Input_5B"
            Feedback = "sdo[0x6401][2]"
            
        if(PortIndex==1):
            OutputConnector = "J2_12"
            InputName = "Input_6B"
            Feedback = "sdo[0x6401][4]"
            
        if(PortIndex==2):
            OutputConnector = "J3_02"
            InputName = "Input_7B"
            Feedback = "sdo[0x6401][6]"
            
        if(PortIndex==3):
            OutputConnector = "J3_04"
            InputName = "Input_8B"
            Feedback = "sdo[0x6401][8]"

        outstr += "#-----setup 37000-1-----\n"
        outstr += "#disable global modes\n"
        outstr += "sdo[0x2000][3] = 0 : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2000][4] = 0 : NULL : WAIT = 0.1\n"
        outstr += "#configure Port Modes\n"
        outstr += "sdo[0x2001][1] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][2] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][3] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][4] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][5] = " + str(InputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][6] = " + str(InputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][7] = " + str(InputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][8] = " + str(InputMode) + " : NULL : WAIT = 0.1\n"

        outstr += "#switch input to load line\n"
        outstr += OutputConnector + " = 1 : NULL : WAIT = 0.1\n"
        outstr += "\n"
        outstr += "\n"
        outstr += "#Sweep of " + InputName + " from " + str(AmpsStart) + " to " + str(AmpsMax)  + " in " + str(AmpsInc) + " increments\n"
        outstr += "\n"
        
        #outstr += "PAUSE- TESTING " + InputName + ", SET GEN TO " + str(AmpsValue) + "ma\n"
        outstr += "#test ammmeter\n"
        #outstr += "NULL : MeterAmps = " + str(AmpsValue/1000000) + " | 0.01 | 0.5\n"
        outstr += "#test feedback\n"
        #outstr += "NULL : " + Feedback + " = " + str(AmpsValue/1000) + " | 0.155 | 0.1\n" 
        outstr += "NULL : " + Feedback + " = " + str(AmpsValue) + " | 155 | 0.1\n" 
        outstr += "\n"
        outstr += "#Finished with port\n"
        outstr += "#switch out input\n"
        outstr += OutputConnector + " = 0 : NULL : WAIT = 0.2\n"
        PortIndex += 1

        outstr += "\n"
        
    AmpsValue += AmpsInc

PortIndex = 0
outstr += "\n"
outstr += "#Finished with mode"
outstr += "\n"
    
outstr += "#switch out load line\n"
outstr += OutputConnector + " = 0 : NULL : WAIT = 0.1\n"
outstr += "#switch out 420ma gen\n"
outstr += "J4_05 = 0 : NULL : WAIT = 0.2\n"
outstr += "SAVE\n"
outstr += "END\n"

f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



print(TestName + ".pat")