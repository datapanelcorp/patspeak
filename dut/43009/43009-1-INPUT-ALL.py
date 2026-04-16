import os

#global setup
script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"


outstr = ""
outstr += "#43009-1\n"
outstr += "#Verion 0.0\n"
outstr += "#input test\n"
outstr += "UUT_DBC = 43009-560.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "\n"
outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"

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



StartVolts = 1
MaxVolts = 5
FaultLimit = 5.6
BVoltInc = 0.5
SVoltInc = 0.1
MaxValue = FaultLimit + BVoltInc
Tol = "0.050"
    

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

    outstr += "Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1 : NULL : WAIT = 0.5\n"

    outstr += "#set power supply and wait\n"
    outstr += "PwrSetVoltage = " + str(int(StartVolts * 10)) + " : NULL : WAIT = 0.1\n"

    outstr += "#Sweep of " + InputName + " from " + str(StartVolts) + " to " + str(MaxVolts)  + " in " + str(VoltInc) + " increments\n"
    
    Voltage = StartVolts

    outstr += "PwrSetVoltage = " + str(int(Voltage * 10)) + " : NULL : WAIT = 0.1\n"
    outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1\n"
    outstr += "#test power supply\n"
    outstr += "NULL : MeterVolts = " + str(StartVolts) + " | " + Tol  + " | 1\n"

    outstr += "#switch input to load line\n"
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.1\n"
    outstr += "\n"

    while Voltage <= (MaxValue):
        outstr += "#set power supply\n"
        outstr += "PwrSetVoltage = " + str(int(Voltage * 10)) + " : NULL\n"
        outstr += "#test power supply\n"
        outstr += "NULL : MeterVolts = " + str(Voltage) + " | " + Tol + " | 0.1\n"
        outstr += "#test feedback\n"
        if(Voltage >= FaultLimit):
            VoltInc = SVoltInc
            outstr += "NULL : " + Feedback + " = 0 | 0.1 | 0.1\n"
            outstr += "NULL : " + Status + " = 2 | 0.1 | 0.1\n"
        else:
            VoltInc = BVoltInc
            outstr += "NULL : " + Feedback + " = " + str(Voltage) + " | " + Tol + " | 0.1\n" 
            outstr += "NULL : " + Status + " = 1 | 0.1 | 0.1\n"
        Voltage += VoltInc
    
    outstr += "\n"
    outstr += "#Finished with port\n"
    outstr += "#switch out input\n"
    outstr += OutputConnector + " = 0 : NULL : WAIT = 0.1\n"
    PortIndex += 1

    outstr += "\n"

PortIndex = PortStart
outstr += "\n"
outstr += "#Finished with mode"
outstr += "\n"
outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"

outstr += "#switch out load line, set current\n"
#outstr += OutputConnector + " = 0 : NULL : WAIT = 0.1\n"
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
