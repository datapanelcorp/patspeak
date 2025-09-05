import os

script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

PortIndex = 0
ModeIndex = 0

outstr = ""
outstr += "#37000-1\n"
outstr += "#Verion 0.0\n"
outstr += "#input test\n"
outstr += "UUT_EDS = 37000-561.eds\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 37000-----\n"

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
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1\n"
outstr += "\n"

InPortAMode = "10"
InPortBMode = "0"
OutPortAMode = "0"
OutPortBMode = "0"

InputConnectorA = "J3_01"
#ResetA = "Counter_7A_Reset"
#EnableA = "Counter_7A_ON_OFF"

InputConnectorB = "J3_03"
Scope = "J4_03"

OutputMode = 0x00
InputMode = 0xAA

outstr += "#-----setup 34044-----\n"
outstr += "#disable global modes\n"
outstr += "sdo[0x2000][3] = 0 : NULL : WAIT = 0.1\n"
outstr += "sdo[0x2000][4] = 0 : NULL : WAIT = 0.1\n"

outstr += "#configure Port Modes\n"
outstr += "sdo[0x2001][1] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
outstr += "sdo[0x2001][2] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
outstr += "sdo[0x2001][3] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
outstr += "sdo[0x2001][4] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
outstr += "sdo[0x2001][5] = " + str(0) + " : NULL : WAIT = 0.1\n"
outstr += "sdo[0x2001][6] = " + str(0) + " : NULL : WAIT = 0.1\n"
outstr += "sdo[0x2001][7] = " + str(InputMode) + " : NULL : WAIT = 0.1\n"
outstr += "sdo[0x2001][8] = " + str(InputMode) + " : NULL : WAIT = 0.1\n"

#outstr += "Command = 83, MODE1A = " + OutPortAMode + ", MODE1B = " + OutPortBMode + ", MODE2A = " + OutPortAMode + ", MODE2B = " + OutPortBMode + ", MODE3A = " + OutPortAMode + ", MODE3B = " + OutPortBMode + ", MODE4A = " + OutPortAMode + ", MODE4B = " + OutPortBMode + " : NULL : WAIT = 0.2\n"
#outstr += "Command = 83, MODE5A = " + InPortAMode + ", MODE5B = " + InPortBMode + ", MODE6A = " + InPortAMode + ", MODE6B = " + InPortBMode + ", MODE7A = " + InPortAMode + ", MODE7B = " + InPortBMode + " : NULL : WAIT = 0.2\n"
#outstr += "\n"
#outstr += "Command = 84, MODE8A = " + InPortAMode + ", MODE8B = " + InPortBMode + " : NULL : WAIT = 0.2\n"
#outstr += "\n"
#outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2\n"
#outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2\n"

outstr += "\n"
#outstr += "Command = 87, Counter_7A_Reset = 1, Counter_8A_Reset = 1, Counter_7A_ON_OFF = 1 : NULL : WAIT = 0.2\n"
#outstr += "Command = 87, Counter_8A_ON_OFF = 1, LowBYTE_Counter_7A_Setpoint = 0, LowBYTE_Counter_8A_Setpoint = 0 : NULL : WAIT = 0.2\n"
outstr += "sdo[0x2003][1] = " + str(0x05) + " : NULL : WAIT = 0.1\n"#fCnt1Enabled, fCnt1Reset
outstr += "sdo[0x2003][2] = " + str(0x05) + " : NULL : WAIT = 0.1\n"#fCnt2Enabled, fCnt2Reset

outstr += "sdo[0x3001][1] = " + str(0x00) + " : NULL : WAIT = 0.1\n"#Set_Point_7A
outstr += "sdo[0x3001][2] = " + str(0x00) + " : NULL : WAIT = 0.1\n"#Set_Point_8A
outstr += "\n"

outstr += Scope + " = 1 : NULL : WAIT = 0.1\n"
outstr += "#switch in test supply\n"
outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2\n"

outstr += "\n"

outstr += "PwrSetVoltage = 145 : NULL\n"

TheCount = 0
MaxCount = 5
EncoderValue = "sdo[0x6401][9]"

outstr += "#testing encoder foward\n"

while TheCount <= MaxCount:
    outstr += "PwrEnable = 1 : NULL : WAIT = 0.2\n"
    outstr += InputConnectorA + " = 1 : NULL : WAIT = 0.2\n"
    if(TheCount > 0):   #37000 firmware does not increment count on inital rising edge
        TheCount += 1
    outstr += "NULL : " + EncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
    outstr += InputConnectorB + " = 1 : NULL : WAIT = 0.2\n"
    TheCount += 1
    outstr += "NULL : " + EncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
    outstr += InputConnectorA + " = 0 : NULL : WAIT = 0.2\n"
    TheCount += 1
    outstr += "NULL : " + EncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
    outstr += InputConnectorB + " = 0 : NULL : WAIT = 0.2\n"
    TheCount += 1
    outstr += "NULL : " + EncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
    outstr += "PwrEnable = 0 : NULL : WAIT = 0.2\n"
    outstr += "\n"
    
outstr += "#testing encoder reverse\n"
while TheCount > 0:
    outstr += "PwrEnable = 1 : NULL : WAIT = 0.2\n"
    outstr += InputConnectorB + " = 1 : NULL : WAIT = 0.2\n"
    TheCount -= 1
    outstr += "NULL : " + EncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
    outstr += InputConnectorA + " = 1 : NULL : WAIT = 0.2\n"
    TheCount -= 1
    outstr += "NULL : " + EncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
    outstr += InputConnectorB + " = 0 : NULL : WAIT = 0.2\n"
    TheCount -= 1
    outstr += "NULL : " + EncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
    outstr += InputConnectorA + " = 0 : NULL : WAIT = 0.2\n"
    TheCount -= 1
    outstr += "NULL : " + EncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
    outstr += "PwrEnable = 0 : NULL : WAIT = 0.2\n"
    outstr += "\n"
    
outstr += "#testing encoder reverse rollover\n"
TheRevCount = TheCount#4294967295 + 1
while TheCount <= MaxCount:
    outstr += "PwrEnable = 1 : NULL : WAIT = 0.2\n"
    outstr += InputConnectorB + " = 1 : NULL : WAIT = 0.2\n"
    TheCount += 1
    TheRevCount -= 1
    outstr += "NULL : " + EncoderValue + " = " + str(TheRevCount) + " | 0 | 0.1\n"
    outstr += InputConnectorA + " = 1 : NULL : WAIT = 0.2\n"
    TheCount += 1
    TheRevCount -= 1
    outstr += "NULL : " + EncoderValue + " = " + str(TheRevCount) + " | 0 | 0.1\n"
    outstr += InputConnectorB + " = 0 : NULL : WAIT = 0.2\n"
    TheCount += 1
    TheRevCount -= 1
    outstr += "NULL : " + EncoderValue + " = " + str(TheRevCount) + " | 0 | 0.1\n"
    outstr += InputConnectorA + " = 0 : NULL : WAIT = 0.2\n"
    TheCount += 1
    TheRevCount -= 1
    outstr += "NULL : " + EncoderValue + " = " + str(TheRevCount) + " | 0 | 0.1\n"
    outstr += "PwrEnable = 0 : NULL : WAIT = 0.2\n"
    outstr += "\n"
    
outstr += "#switch out input\n"
outstr += InputConnectorA + " = 0 : NULL : WAIT = 0.2\n"
outstr += InputConnectorB + " = 0 : NULL : WAIT = 0.2\n"
outstr += Scope + " = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2\n"
outstr += "#disable counter\n"
outstr += "sdo[0x2003][1] = " + str(0x01) + " : NULL : WAIT = 0.1\n"#fCnt1Enabled
#outstr += "Command = 87, " + EnableA + " = 1 : NULL : WAIT = 0.2\n"
#outstr += "Command = 0, " + EnableA + " = 0 : NULL\n"
outstr += "#verify count\n"
outstr += "NULL : " + EncoderValue + " = " + str(TheRevCount) + " | 0 | 0.1\n" 
outstr += "#send counter reset\n"
outstr += "sdo[0x2003][1] = " + str(0x04) + " : NULL : WAIT = 0.1\n"#fCnt1Reset
#outstr += "Command = 87, " + ResetA + " = 1 : NULL : WAIT = 0.2\n"
#outstr += "Command = 0, " + ResetA + " = 0 : NULL\n"
outstr += "#verify count reset\n"
outstr += "NULL : " + EncoderValue + " = 0 | 0 | 0.1\n" 
outstr += "\n"

    
outstr += "#switch out load line\n"
outstr += InputConnectorA + " = 0, " + InputConnectorB + " = 0 : NULL : WAIT = 0.1\n"

outstr += "#switch out power supply\n"
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1\n"

outstr += "SAVE\n"
outstr += "END\n"

f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)




print(TestName + ".pat")