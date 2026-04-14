PortMode = 0

#global setup
TestName = "34044-1-INPUT-ADC"
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

outstr += "\n"
outstr += "#-----setup pat-----\n"
outstr += "#setup meter\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"
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

outstr += "NULL : Input_5B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_6B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_7B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_8B = 0 | 0.1 | 0.1\n"

PortIndex = 0
ModeIndex = 0


ModeIndex = 0
MaxMode = 2
while ModeIndex <= MaxMode:
    
    if(ModeIndex==0):#5VDC
        PortAMode = "0"
        PortBMode = "4"
        StartVolts = 1
        MaxVolts = 5
        FaultLimit = 5.6#5.51
        BVoltInc = 0.5
        SVoltInc = 0.1
        
    if(ModeIndex==1):#10VDC
        PortAMode = "0"
        PortBMode = "5"
        StartVolts = 1
        MaxVolts = 10
        FaultLimit = 11.1#12#11.15
        BVoltInc = 0.5
        SVoltInc = 0.1
        
    if(ModeIndex==2):#32VDC
        PortAMode = "0"
        PortBMode = "6"
        StartVolts = 1
        MaxVolts = 32
        FaultLimit = 36.5#37#37
        BVoltInc = 0.5
        SVoltInc = 0.1
        
    while PortIndex <= 3:
        
        VoltInc = BVoltInc
        
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
        outstr += "Command = 83, MODE5A = " + PortAMode + ", MODE5B = " + PortBMode + ", MODE6A = " + PortAMode + ", MODE6B = " + PortBMode + ", MODE7A = " + PortAMode + ", MODE7B = " + PortBMode + " : NULL : WAIT = 0.5\n"
        outstr += "#clear multiplex\n"
        outstr += "Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL\n"
        
        outstr += "Command = 84, MODE8A = " + PortAMode + ", MODE8B = " + PortBMode + " : NULL : WAIT = 0.5\n"
        outstr += "#clear multiplex\n"
        outstr += "Command = 0, MODE8A = 0, MODE8B = 0 : NULL\n"
        outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 1 : NULL : WAIT = 0.5\n"
        outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
        outstr += "#clear multiplex\n"
        outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"
        
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
        
        Voltage = StartVolts
        
        while Voltage <= (FaultLimit + VoltInc):
            outstr += "#set power supply\n"
            outstr += "PwrSetVoltage = " + str(int(Voltage * 10)) + " : NULL : WAIT = 0.1\n"
            outstr += "#test power supply\n"
            outstr += "NULL : MeterVolts = " + str(Voltage) + " | 0.155 | 0.1\n"
            outstr += "#test feedback\n"    
            if(Voltage >= FaultLimit):
                VoltInc = SVoltInc
                outstr += "NULL : " + Feedback + " = 0 | 0.1 | 0.1\n"
                outstr += "NULL : " + Status + " = 2 | 0.1 | 0.1\n"
            else:
                VoltInc = BVoltInc
                outstr += "NULL : " + Feedback + " = " + str(Voltage) + " | 0.155 | 0.1\n" 
                outstr += "NULL : " + Status + " = 0 | 0.1 | 0.1\n"
            Voltage += VoltInc
        
        outstr += "\n"
        outstr += "#Finished with port\n"
        outstr += "#switch out input\n"
        outstr += OutputConnector + " = 0 : NULL : WAIT = 0.1\n"
        PortIndex += 1

        outstr += "\n"
        
    ModeIndex += 1
    PortIndex = 0
    outstr += "\n"
    outstr += "#Finished with mode"
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
outstr += "NULL : Input_5B = 2 | 0.1 | 0.1\n"
outstr += "NULL : Input_6B = 2 | 0.1 | 0.1\n"
outstr += "NULL : Input_7B = 2 | 0.1 | 0.1\n"
outstr += "NULL : Input_8B = 2 | 0.1 | 0.1\n"

#outstr += "#switch out o-scope\n"
outstr += "J4_03 = 0 : NULL : WAIT = 0.2\n"
outstr += "SAVE\n"
outstr += "END\n"

f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)




