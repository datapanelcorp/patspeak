MaxVolts = 14.5

PortIndex = 0
ModeIndex = 0
PortMode = 0

import os

#global setup
script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]+"-"+str(MaxVolts).replace('.', '_')
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

outstr += "\n"
outstr += "#-----setup main supply-----\n"
outstr += "#setup meter\n"
outstr += "J0_10_MAIN_SUPPLY = 1 : NULL : WAIT = 1\n"
outstr += "PAUSE-VERIFY MAIN SUPPLY IS SET TO " + str(MaxVolts) + "\n"
outstr += "NULL : MeterVolts = " + str(MaxVolts) + " | 0.1 | 0.1\n"
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

PortMode = "9"
StartVolts = 1

VoltInc = 0.5
MaxPort = 7
# BVoltInc = 0.5

while PortIndex <= MaxPort:

    # VoltInc = BVoltInc

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

    outstr += "#-----setup 43019-----\n"
    outstr += "#configure as Outputs to " + PortMode + " \n"
    outstr += "Command = 82, MODE2 = 0, ADRaw = 0 : NULL : WAIT = 0.5\n"
    outstr += "Command = 83, MODE1A = " + PortMode + ", MODE1B = " + PortMode + ", MODE2A =" + PortMode + ", MODE2B = " + PortMode + ", MODE3A = " + PortMode + ", MODE3B = " + PortMode + ", MODE4A = " + PortMode + ", MODE4B = " + PortMode + " : NULL : WAIT = 0.5\n"
    outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL\n"


    outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
    outstr += "#clear multiplex\n"
    outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"
    

    Voltage = StartVolts

    outstr += "#set power supply and wait\n"
    outstr += "PwrSetVoltage = " + str(int(StartVolts * 10)) + " : NULL : WAIT = 0.1\n"
    outstr += "#test power supply\n"
    outstr += "NULL : MeterVolts = " + str(StartVolts) + " | 0.155 | 0.1\n"

    outstr += "#switch input to load line\n"
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.1\n"
    outstr += "\n"
    outstr += "\n"
    outstr += "#Sweep of " + Status + " from " + str(StartVolts) + " to " + str(MaxVolts)  + " in " + str(VoltInc) + " increments\n"
    outstr += "\n"

    while Voltage <= MaxVolts:
        outstr += "#set power supply\n"
        outstr += "PwrSetVoltage = " + str(int(Voltage * 10)) + " : NULL : WAIT = 0.1\n"
        outstr += "#test power supply\n"
        outstr += "NULL : MeterVolts = " + str(Voltage) + " | 0.155 | 0.1\n"
        outstr += "#test feedback\n"    
        outstr += "NULL : " + Feedback + " = " + str((Voltage / MaxVolts))  + " | 0.1 | 0.1\n" 
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



print(TestName + ".pat")
