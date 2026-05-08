import os

def WriteCountTest(outstr, MaxCount):
    PortMode = "8"

    PortIndex = 0
    
    while PortIndex <= 1:

        if(PortIndex==0):
            InputConnector = "J2_01"
            InputName = "Input_1A"
            Status = "Input_1A"
            Count = "Hertz_Count_Input1A"
            Reset = "Counter_1A_Reset"
            Enable = "Counter_1A_ON_OFF"
            
        if(PortIndex==1):
            InputConnector = "J2_02"
            InputName = "Input_1B"
            Status = "Input_1B"
            Count = "Hertz_Count_Input1B"
            Reset = "Counter_1B_Reset"
            Enable = "Counter_1B_ON_OFF"
        
        outstr += "#-----setup 39009-----\n"
        outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5\n"
        outstr += "Command = 83, MODE1A = " + PortMode + ", MODE1B = " + PortMode + ", MODE2A = 1, MODE2B = 1, MODE3A = " + PortMode + ", MODE3B = " + PortMode + ", MODE4A = 1, MODE4B = 1, MODE5A = 1, MODE5B = 1, MODE6A = 1, MODE6B = 1, MODE7A = 1, MODE7B = 1 : NULL : WAIT = 0.5\n"
        outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL\n"
        outstr += "Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 1, MODE9B = 1, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5\n"
        outstr += "Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL\n"

        outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
        outstr += "#clear multiplex\n"
        outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"

        outstr += "\n"


        outstr += "#switch in test supply\n"
        outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2\n"
        outstr += "#switch in input\n"
        outstr += InputConnector + " = 0 : NULL : WAIT = 0.2\n"
        outstr += "\n"
        outstr += "PwrSetVoltage = 140 : NULL\n"
        outstr += "#testing count events\n"
        TheCount = 0
        outstr += "Command = 87, Counter_1A_Reset = 1, Counter_1B_Reset = 1, Counter_1A_ON_OFF = 1, Counter_1B_ON_OFF = 1 : NULL : WAIT = 0.2\n"
        outstr += "#clear multiplex\n"
        outstr += "Command = 0, Counter_1A_Reset = 0, Counter_1B_Reset = 0, Counter_1A_ON_OFF = 0, Counter_1B_ON_OFF = 0 : NULL\n"
        outstr += "\n"
        
        while TheCount <= MaxCount:
            outstr += "#verify count\n"
            outstr += "NULL : " + Count + " = " + str(TheCount) + " | 0 | 0.1\n"
            outstr += InputConnector + " = 1 : NULL : WAIT = 1\n"
            TheCount += 1
            outstr += "NULL : " + InputName + " = 1 | 0 | 0.1\n"
            outstr += InputConnector + " = 0 : NULL : WAIT = 1\n"
            TheCount += 1
            outstr += "NULL : " + InputName + " = 0 | 0 | 0.1\n"
            outstr += "\n"
            
        outstr += "#switch out input\n"
        outstr += InputConnector + " = 0 : NULL : WAIT = 0.2\n"
        outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2\n"
        outstr += "#disable counter\n"
        outstr += "Command = 87, " + Enable + " = 1 : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, " + Enable + " = 0 : NULL\n"
        outstr += "#verify count\n"
        outstr += "NULL : " + Count + " = " + str(TheCount) + " | 0 | 0.1\n" 
        outstr += "#send counter reset\n"
        outstr += "Command = 87, " + Reset + " = 1 : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, " + Reset + " = 0 : NULL\n"
        outstr += "#verify count reset\n"
        outstr += "NULL : " + Count + " = 0 | 0 | 0.1\n" 
        outstr += "\n"
        PortIndex += 1
        
    outstr += "#switch out load line\n"
    outstr += InputConnector + " = 0 : NULL : WAIT = 0.1\n"
    return outstr
    
PortIndex = 0
ModeIndex = 0
PortMode = 0

#global setup
script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

outstr = ""
outstr += "#39009-1\n"
outstr += "#Verion 0.0\n"
outstr += "#input test\n"
outstr += "UUT_DBC = 39009-561.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

# outstr += "#setup meter\n"
# outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
# outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
# outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
# outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"
# outstr += "\n"

outstr += "#setup PS1\n"
outstr += "PwrRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "PwrSetCurrent = 100 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 140 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1\n"
outstr += "\n"
#outstr += "#switch in o-scope\n"
outstr += "J4_03 = 1 : NULL : WAIT = 0.2\n"

# outstr += "#-----setup PAT-----\n"
# outstr += "#setup load\n"
# outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
# outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
# outstr += "LdCurrentSet = 10 : NULL : WAIT = 0.1\n"
# outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"

outstr += "#******MAX COUNT = 5\n"
MaxCount = 5
outstr = WriteCountTest(outstr, MaxCount)


outstr += "#switch out power supply\n"
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1\n"

outstr += "SAVE\n"
outstr += "END\n"

f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)




print(TestName + ".pat")
