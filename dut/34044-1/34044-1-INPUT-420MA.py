PortMode = 0

#global setup
TestName = "34044-1-INPUT-420MA"
datafile = TestName + ".pat"

outstr = ""
outstr += "#34044-1\n"
outstr += "#Verion 0.0\n"
outstr += "#input test\n"
outstr += "UUT_DBC = 34044-561.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 34044-----\n"
outstr += "Command = 93, PORT1_MODE = " + str(PortMode) + ", PORT2_MODE = " + str(PortMode) + ", PORT3_MODE = " + str(PortMode) + ", PORT4_MODE = " + str(PortMode) + " : NULL : WAIT = 0.2\n"
outstr += "#clear multiplex\n"
outstr += "Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL\n"

outstr += "#switch in 420ma gen\n"
outstr += "J4_01 = 1 : NULL : WAIT = 0.2\n"

outstr += "NULL : Input_5B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_6B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_7B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_8B = 0 | 0.1 | 0.1\n"

PortIndex = 0
ModeIndex = 0

PortAMode = "0"
PortBMode = "3"

AmpsInc = 5000
AmpsStart = AmpsInc
AmpsMax = 20000
AmpsValue = AmpsStart

while AmpsValue <= AmpsMax:
    outstr += "#promp user\n"
    outstr += "PAUSE- SET GEN TO " + str(AmpsValue) + "ma\n"
    PortIndex = 0
    while PortIndex <= 3:
        
        if(PortIndex==0):
            OutputConnector = "J2_10"
            InputName = "Input_5B"
            Status = "Input_5B"
            Feedback = "Port_5B"
            
        if(PortIndex==1):
            OutputConnector = "J2_12"
            InputName = "Input_6B"
            Status = "Input_6B"
            Feedback = "Port_6B"
            
        if(PortIndex==2):
            OutputConnector = "J3_02"
            InputName = "Input_7B"
            Status = "Input_7B"
            Feedback = "Port_7B"
            
        if(PortIndex==3):
            OutputConnector = "J3_04"
            InputName = "Input_8B"
            Status = "Input_8B"
            Feedback = "Port_8B"
            
        
        outstr += "#-----setup 34044-----\n"
        outstr += "#disable global modes\n"
        outstr += "#configure Port Modes\n"
        outstr += "Command = 83, MODE5A = " + PortAMode + ", MODE5B = " + PortBMode + ", MODE6A = " + PortAMode + ", MODE6B = " + PortBMode + ", MODE7A = " + PortAMode + ", MODE7B = " + PortBMode + " : NULL : WAIT = 0.2\n"
        outstr += "#clear multiplex\n"
        outstr += "Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL\n"
        outstr += "Command = 84, MODE8A = " + PortAMode + ", MODE8B = " + PortBMode + " : NULL : WAIT = 0.5\n"
        outstr += "#clear multiplex\n"
        outstr += "Command = 0, MODE8A = 0, MODE8B = 0 : NULL\n"
        outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5\n"
        outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
        outstr += "#clear multiplex\n"
        outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"

        outstr += "#switch input to load line\n"
        outstr += OutputConnector + " = 1 : NULL : WAIT = 0.1\n"
        outstr += "\n"
        outstr += "\n"
        outstr += "#Sweep of " + InputName + " from " + str(AmpsStart) + " to " + str(AmpsMax)  + " in " + str(AmpsInc) + " increments\n"
        outstr += "\n"
        
        #outstr += "PAUSE- TESTING " + InputName + ", SET GEN TO " + str(AmpsValue) + "ma\n"
        outstr += "#test ammmeter\n"
        outstr += "NULL : MeterAmps = " + str(AmpsValue/1000000) + " | 0.01 | 0.5\n"
        outstr += "#test feedback\n"
        outstr += "NULL : " + Feedback + " = " + str(AmpsValue/1000) + " | 0.155 | 0.1\n" 

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
outstr += "J4_01 = 0 : NULL : WAIT = 0.2\n"
outstr += "SAVE\n"
outstr += "END\n"

f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)




