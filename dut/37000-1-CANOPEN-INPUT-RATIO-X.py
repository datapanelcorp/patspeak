MaxVolts = 12

PortIndex = 0
ModeIndex = 0
PortMode = 0

#global setup
TestName = "37000-1-CANOPEN-INPUT-RATIO-"+str(MaxVolts).replace('.', '_')
datafile = TestName + ".pat"

outstr = ""
outstr += "#37000-1\n"
outstr += "#Verion 0.0\n"
outstr += "#input test\n"
outstr += "UUT_EDS = 37000-561.eds\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"

outstr += "\n"
outstr += "#-----setup pat-----\n"
outstr += "#setup meter\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "\n"
outstr += "#-----setup main supply-----\n"
outstr += "#setup meter\n"
outstr += "J0_10_MAIN_SUPPLY = 1 : NULL : WAIT = 1\n"
#outstr += "PAUSE-VERIFY MAIN SUPPLY IS SET TO " + str(MaxVolts) + "\n"
outstr += "NULL : MeterVolts = " + str(MaxVolts) + " | 0.2 | 0.1\n"
outstr += "J0_10_MAIN_SUPPLY = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#setup PS1\n"
outstr += "PwrRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "PwrSetCurrent = 20 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1\n"
outstr += "\n"
#outstr += "#switch in o-scope\n"
outstr += "J4_03 = 1 : NULL : WAIT = 0.2\n"

#PortAMode = "0"
#PortBMode = "9"

InPortAMode = 0
InPortBMode = 9
OutPortAMode = 0
OutPortBMode = 0

OutputMode = str(int(OutPortAMode | (OutPortBMode << 4)))
InputMode = str(int(InPortAMode | (InPortBMode << 4)))

StartVolts = 1

VoltInc = 0.5
        
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

    outstr += "#-----setup 34044-----\n"
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
    
    #outstr += "#configure Port Modes\n"
    #outstr += "Command = 83, MODE5A = " + PortAMode + ", MODE5B = " + PortBMode + ", MODE6A = " + PortAMode + ", MODE6B = " + PortBMode + ", MODE7A = " + PortAMode + ", MODE7B = " + PortBMode + " : NULL : WAIT = 0.2\n"
    #outstr += "Command = 84, MODE8A = " + PortAMode + ", MODE8B = " + PortBMode + " : NULL : WAIT = 0.2\n"

    #outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2\n"
    #outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2\n"

    
    Voltage = StartVolts

    outstr += "#set power supply and wait\n"
    outstr += "PwrSetVoltage = " + str(int(StartVolts * 10)) + " : NULL : WAIT = 0.1\n"
    outstr += "#test power supply\n"
    outstr += "NULL : MeterVolts = " + str(StartVolts) + " | 0.155 | 0.1\n"

    outstr += "#switch input to load line\n"
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.1\n"
    outstr += "\n"
    outstr += "\n"
    outstr += "#Sweep of " + InputName + " from " + str(StartVolts) + " to " + str(MaxVolts)  + " in " + str(VoltInc) + " increments\n"
    outstr += "\n"

    while Voltage <= MaxVolts:
        outstr += "#set power supply\n"
        outstr += "PwrSetVoltage = " + str(int(Voltage * 10)) + " : NULL : WAIT = 0.1\n"
        outstr += "#test power supply\n"
        outstr += "NULL : MeterVolts = " + str(Voltage) + " | 0.155 | 0.1\n"
        outstr += "#test feedback\n"    
        outstr += "NULL : " + Feedback + " = " + str(int((Voltage / MaxVolts)*1000))  + " | 100 | 0.1\n" 
        Voltage += VoltInc
    
    outstr += "\n"
    outstr += "#Finished with port\n"
    outstr += "#switch out input\n"
    outstr += OutputConnector + " = 0 : NULL : WAIT = 0.1\n"
    PortIndex += 1

    outstr += "\n"

outstr += "#switch out load line, set current\n"
outstr += OutputConnector + " = 0 : NULL : WAIT = 0.1\n"
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1\n"

outstr += "#tear down PS1\n"
outstr += "PwrSetCurrent = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1\n"
outstr += "PwrRemote = 0 : NULL : WAIT = 0.1\n"

#outstr += "#switch out o-scope\n"
outstr += "J4_03 = 0 : NULL : WAIT = 0.2\n"
outstr += "SAVE\n"
outstr += "END\n"

f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)




