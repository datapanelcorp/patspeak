import os

#global setup
script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

PortMode = 0

outstr = ""
outstr += "#43019-1\n"
outstr += "#Verion 0.0\n"
outstr += "#input test\n"
outstr += "UUT_DBC = 43019-560.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

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
outstr += "PwrSetCurrent = 100 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1\n"
outstr += "\n"
#outstr += "#switch in o-scope\n"
outstr += "J4_03 = 1 : NULL : WAIT = 0.2\n"

outstr += "NULL : Input_1A = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_1B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_2A = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_2B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_3A = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_3B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_4A = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_4B = 0 | 0.1 | 0.1\n"

PortStart = 0
PortIndex = PortStart
MaxPort = 7


ModeIndex = 2
MaxMode = 4
GlobalMode = 0

while ModeIndex <= MaxMode:
    if(ModeIndex==0):#GROUND
        GlobalMode = "2"
        PortMode = "6"
        StartVolts = 1
        MaxVolts = 10
        FaultLimit = 11.2
        BVoltInc = 0.5
        SVoltInc = 0.1
        MaxValue = StartVolts

    if(ModeIndex==1):#POSITVE
        GlobalMode = "1"
        PortMode = "5"
        StartVolts = 12
        MaxVolts = 12
        FaultLimit = 14
        BVoltInc = 0.5
        SVoltInc = 0.1
        MaxValue = StartVolts

    if(ModeIndex==2):#5VDC
        GlobalMode = "4"
        PortMode = "1"
        StartVolts = 4
        MaxVolts = 5
        FaultLimit = 5.6
        BVoltInc = 0.5
        SVoltInc = 0.1
        MaxValue = FaultLimit + BVoltInc

    if(ModeIndex==3):#10VDC
        GlobalMode = "5"
        PortMode = "4"
        StartVolts = 9
        MaxVolts = 10
        FaultLimit = 11.2
        BVoltInc = 0.5
        SVoltInc = 0.1
        MaxValue = FaultLimit + BVoltInc

    if(ModeIndex==4):#32VDC
        GlobalMode = "6"
        PortMode = "2"
        StartVolts = 31
        MaxVolts = 32
        FaultLimit = 36.1
        BVoltInc = 0.5
        SVoltInc = 0.1
        MaxValue = FaultLimit + BVoltInc

    while PortIndex <= MaxPort:

        VoltInc = BVoltInc

        if(PortIndex == 0):
            Feedback = "Port_1A"
            OutputConnector = "J1_01"
            Status = "Input_1A"
        if(PortIndex == 1):
            Feedback = "Port_1B"
            OutputConnector = "J1_02"
            Status = "Input_1B"
        if(PortIndex == 2):
            Feedback = "Port_2A"
            OutputConnector = "J1_03"
            Status = "Input_2A"
        if(PortIndex == 3):
            Feedback = "Port_2B"
            OutputConnector = "J1_04"
            Status = "Input_2B"
        if(PortIndex == 4):
            Feedback = "Port_3A"
            OutputConnector = "J1_05"
            Status = "Input_3A"
        if(PortIndex == 5):
            Feedback = "Port_3B"
            OutputConnector = "J1_06"
            Status = "Input_3B"
        if(PortIndex == 6):
            Feedback = "Port_4A"
            OutputConnector = "J1_07"
            Status = "Input_4A"
        if(PortIndex == 7):
            Feedback = "Port_4B"
            OutputConnector = "J1_08"
            Status = "Input_4B"

        InputName = Feedback

        outstr += "#-----setup 43019-----\n"
        outstr += "#configure Global to " + GlobalMode + " with Ports as " + PortMode + " \n"
        outstr += "Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5\n"
        outstr += "Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5\n"
        outstr += "Command = 83, MODE1A = " + PortMode + ", MODE1B = " + PortMode + ", MODE2A =" + PortMode + ", MODE2B = " + PortMode + ", MODE3A = " + PortMode + ", MODE3B = " + PortMode + ", MODE4A = " + PortMode + ", MODE4B = " + PortMode + " : NULL : WAIT = 0.5\n"
        outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL\n"


        outstr += "Command = 82, MODE2 = " + GlobalMode + ", FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
        outstr += "#clear multiplex\n"
        outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"
        
        outstr += "#set power supply and wait\n"
        outstr += "PwrSetVoltage = " + str(int(StartVolts * 10)) + " : NULL : WAIT = 0.1\n"
        outstr += "#test power supply\n"


        if(ModeIndex==0):
            outstr += "#Ground Test " + InputName + "\n"
        elif(ModeIndex==1):
            outstr += "#Positive Test " + InputName + "\n"
        else:
            outstr += "#Sweep of " + InputName + " from " + str(StartVolts) + " to " + str(MaxVolts)  + " in " + str(VoltInc) + " increments\n"
        
        Voltage = StartVolts

        if(ModeIndex==0):
            outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1\n"
            outstr += "J0_07_GND_LOAD = 1 : NULL : WAIT = 1\n"
        else:
            outstr += "J0_07_GND_LOAD = 0 : NULL : WAIT = 1\n"
            outstr += "PwrSetVoltage = " + str(int(Voltage * 10)) + " : NULL : WAIT = 0.1\n"
            outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1\n"
            outstr += "NULL : MeterVolts = " + str(StartVolts) + " | 0.155 | 1\n"

        outstr += "#switch input to load line\n"
        outstr += OutputConnector + " = 1 : NULL : WAIT = 0.1\n"

        while Voltage <= (MaxValue):
            outstr += "#set power supply\n"
            outstr += "PwrSetVoltage = " + str(int(Voltage * 10)) + " : NULL : WAIT = 0.1\n"
            outstr += "#test power supply\n"
            if(ModeIndex>0):
                outstr += "NULL : MeterVolts = " + str(Voltage) + " | 0.155 | 0.1\n"
            outstr += "#test feedback\n"
            if(Voltage >= FaultLimit):
                VoltInc = SVoltInc
                outstr += "NULL : " + Feedback + " = 0 | 0.1 | 0.1\n"
                outstr += "NULL : " + Status + " = 2 | 0.1 | 0.1\n"
            else:
                VoltInc = BVoltInc
                if(ModeIndex>1):
                    outstr += "NULL : " + Feedback + " = " + str(Voltage) + " | 0.155 | 0.1\n" 
                else:
                    outstr += "NULL : " + Feedback + " = 0 | 0.155 | 0.1\n" 
                outstr += "NULL : " + Status + " = 1 | 0.1 | 0.1\n"
            Voltage += VoltInc
        
        outstr += "\n"
        outstr += "#Finished with port\n"
        outstr += "#switch out input\n"
        outstr += OutputConnector + " = 0 : NULL : WAIT = 0.1\n"
        PortIndex += 1

        outstr += "\n"
        
    ModeIndex += 1
    PortIndex = PortStart
    outstr += "\n"
    outstr += "#Finished with mode"
    outstr += "\n"
    outstr += "#cycle IGN to clean slate\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"

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

# outstr += "NULL : Input_1A = 2 | 0.1 | 0.1\n"
# outstr += "NULL : Input_1B = 2 | 0.1 | 0.1\n"
# outstr += "NULL : Input_3A = 2 | 0.1 | 0.1\n"
# outstr += "NULL : Input_3B = 2 | 0.1 | 0.1\n"
# outstr += "NULL : Input_5A = 2 | 0.1 | 0.1\n"
# outstr += "NULL : Input_5B = 2 | 0.1 | 0.1\n"
# outstr += "NULL : Input_7A = 2 | 0.1 | 0.1\n"
# outstr += "NULL : Input_7B = 2 | 0.1 | 0.1\n"
# outstr += "NULL : Input_9A = 2 | 0.1 | 0.1\n"
# outstr += "NULL : Input_9B = 2 | 0.1 | 0.1\n"

#outstr += "#switch out o-scope\n"
outstr += "J4_03 = 0 : NULL : WAIT = 0.2\n"
outstr += "SAVE\n"
outstr += "END\n"

f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



print(TestName + ".pat")
