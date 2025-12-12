import os

#global setup
script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

PortIndex = 0
ModeIndex = 0
PortMode = 0


outstr = ""
outstr += "#39009-1\n"
outstr += "#Verion 0.0\n"
outstr += "#input test\n"
outstr += "UUT_DBC = 39009-561.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"


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


Input1ConnectorA = "J2_02"
Input1ConnectorB = "J2_01"
Reset1 = "Counter_1A_Reset"
Enable1 = "Counter_1A_ON_OFF"
EncoderValue1 = "EncoderValue1"

Input2ConnectorA = "J2_04"
Input2ConnectorB = "J2_03"
Reset2 = "Counter_3A_Reset"
Enable2 = "Counter_3A_ON_OFF"
EncoderValue2 = "EncoderValue3"


PortIndex = 0
MaxPort = 0

TheCount = 0
MaxCount = 5

while PortIndex <= MaxPort:

    outstr += "#-----setup 39009-----\n"
    outstr += "#configure as Output Digital ON/OFF\n"
    outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5\n"
    outstr += "Command = 83, MODE1A = " + InPortAMode + ", MODE1B = " + InPortAMode + ", MODE2A = 1, MODE2B = 1, MODE3A = " + InPortAMode + ", MODE3B = " + InPortAMode + ", MODE4A = 1, MODE4B = 1, MODE5A = 0, MODE5B = 0, MODE6A = 1, MODE6B = 1, MODE7A = 0, MODE7B = 0 : NULL : WAIT = 0.5\n"
    outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL\n"
    outstr += "Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 0, MODE9B = 0, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5\n"
    outstr += "Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL\n"

    outstr += "\n"
    outstr += "Command = 87, Counter_1A_Reset = 1, Counter_3A_Reset = 1, Counter_1A_ON_OFF = 1, Counter_3A_ON_OFF = 1 : NULL : WAIT = 0.2\n"
    outstr += "#clear multiplex\n"
    outstr += "Command = 0, Counter_1A_Reset = 0, Counter_3A_Reset = 0, Counter_1A_ON_OFF = 0, Counter_3A_ON_OFF = 0 : NULL\n"
    outstr += "\n"

    outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
    outstr += "#clear multiplex\n"
    outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"

    outstr += "#switch in test supply\n"
    outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2\n"

    outstr += "\n"

    outstr += "PwrSetVoltage = 140 : NULL\n"

    xInputConnectorA = Input1ConnectorA
    xInputConnectorB = Input1ConnectorB
    xReset = Reset1
    xEnable = Enable1
    xEncoderValue = EncoderValue1

    outstr += "#testing encoder foward\n"
    while TheCount <= MaxCount:
        outstr += xInputConnectorA + " = 1 : NULL : WAIT = 0.2\n"
        TheCount += 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
        outstr += xInputConnectorB + " = 1 : NULL : WAIT = 0.2\n"
        TheCount += 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
        outstr += xInputConnectorA + " = 0 : NULL : WAIT = 0.2\n"
        TheCount += 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
        outstr += xInputConnectorB + " = 0 : NULL : WAIT = 0.2\n"
        TheCount += 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
        outstr += "\n"
        
    outstr += "#testing encoder reverse\n"
    while TheCount > 0:
        outstr += xInputConnectorB + " = 1 : NULL : WAIT = 0.2\n"
        TheCount -= 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
        outstr += xInputConnectorA + " = 1 : NULL : WAIT = 0.2\n"
        TheCount -= 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
        outstr += xInputConnectorB + " = 0 : NULL : WAIT = 0.2\n"
        TheCount -= 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
        outstr += xInputConnectorA + " = 0 : NULL : WAIT = 0.2\n"
        TheCount -= 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
        outstr += "\n"
        
    outstr += "#testing encoder reverse rollover\n"
    TheRevCount = 4294967295 + 1
    while TheCount <= MaxCount:
        outstr += xInputConnectorB + " = 1 : NULL : WAIT = 0.2\n"
        TheCount += 1
        TheRevCount -= 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheRevCount) + " | 0 | 0.1\n"
        outstr += xInputConnectorA + " = 1 : NULL : WAIT = 0.2\n"
        TheCount += 1
        TheRevCount -= 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheRevCount) + " | 0 | 0.1\n"
        outstr += xInputConnectorB + " = 0 : NULL : WAIT = 0.2\n"
        TheCount += 1
        TheRevCount -= 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheRevCount) + " | 0 | 0.1\n"
        outstr += xInputConnectorA + " = 0 : NULL : WAIT = 0.2\n"
        TheCount += 1
        TheRevCount -= 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheRevCount) + " | 0 | 0.1\n"
        outstr += "\n"
        
    outstr += "#switch out input\n"
    outstr += xInputConnectorA + " = 0 : NULL : WAIT = 0.2\n"
    outstr += xInputConnectorB + " = 0 : NULL : WAIT = 0.2\n"

    outstr += "#disable counter\n"
    outstr += "Command = 87, Counter_1A_Reset = 0, Counter_3A_Reset = 0, Counter_1A_ON_OFF = 0, Counter_3A_ON_OFF = 0 : NULL : WAIT = 0.2\n"
    outstr += "#verify count\n"
    outstr += "NULL : " + xEncoderValue + " = " + str(TheRevCount) + " | 0 | 0.1\n" 
    outstr += "#send counter reset\n"
    outstr += "Command = 87, Counter_1A_Reset = 1, Counter_3A_Reset = 1, Counter_1A_ON_OFF = 1, Counter_3A_ON_OFF = 1 : NULL : WAIT = 0.2\n"
    outstr += "#verify count reset\n"
    outstr += "NULL : " + xEncoderValue + " = 0 | 0 | 0.1\n" 

    outstr += "\n"

    outstr += "Command = 87, Counter_1A_Reset = 1, Counter_3A_Reset = 1, Counter_1A_ON_OFF = 1, Counter_3A_ON_OFF = 1 : NULL : WAIT = 0.2\n"
    outstr += "#clear multiplex\n"
    outstr += "Command = 0, Counter_1A_Reset = 0, Counter_3A_Reset = 0, Counter_1A_ON_OFF = 0, Counter_3A_ON_OFF = 0 : NULL\n"
    


    xInputConnectorA = Input2ConnectorA
    xInputConnectorB = Input2ConnectorB
    xReset = Reset2
    xEnable = Enable2
    xEncoderValue = EncoderValue2

    TheCount = -1 #WHY IS THIS NEEDED ONLY THE SECOND SWEEP?!?!

    outstr += "#testing encoder foward\n"
    while TheCount <= MaxCount:
        outstr += xInputConnectorA + " = 1 : NULL : WAIT = 0.2\n"
        TheCount += 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
        outstr += xInputConnectorB + " = 1 : NULL : WAIT = 0.2\n"
        TheCount += 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
        outstr += xInputConnectorA + " = 0 : NULL : WAIT = 0.2\n"
        TheCount += 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
        outstr += xInputConnectorB + " = 0 : NULL : WAIT = 0.2\n"
        TheCount += 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
        outstr += "\n"
        
    outstr += "#testing encoder reverse\n"
    while TheCount > 0:
        outstr += xInputConnectorB + " = 1 : NULL : WAIT = 0.2\n"
        TheCount -= 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
        outstr += xInputConnectorA + " = 1 : NULL : WAIT = 0.2\n"
        TheCount -= 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
        outstr += xInputConnectorB + " = 0 : NULL : WAIT = 0.2\n"
        TheCount -= 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
        outstr += xInputConnectorA + " = 0 : NULL : WAIT = 0.2\n"
        TheCount -= 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheCount) + " | 0 | 0.1\n"
        outstr += "\n"
        
    outstr += "#testing encoder reverse rollover\n"
    TheRevCount = 4294967295 + 1 
    while TheCount <= MaxCount:
        outstr += xInputConnectorB + " = 1 : NULL : WAIT = 0.2\n"
        TheCount += 1
        TheRevCount -= 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheRevCount) + " | 0 | 0.1\n"
        outstr += xInputConnectorA + " = 1 : NULL : WAIT = 0.2\n"
        TheCount += 1
        TheRevCount -= 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheRevCount) + " | 0 | 0.1\n"
        outstr += xInputConnectorB + " = 0 : NULL : WAIT = 0.2\n"
        TheCount += 1
        TheRevCount -= 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheRevCount) + " | 0 | 0.1\n"
        outstr += xInputConnectorA + " = 0 : NULL : WAIT = 0.2\n"
        TheCount += 1
        TheRevCount -= 1
        outstr += "NULL : " + xEncoderValue + " = " + str(TheRevCount) + " | 0 | 0.1\n"
        outstr += "\n"
        
    outstr += "#switch out input\n"
    outstr += xInputConnectorA + " = 0 : NULL : WAIT = 0.2\n"
    outstr += xInputConnectorB + " = 0 : NULL : WAIT = 0.2\n"

    outstr += "#disable counter\n"
    outstr += "Command = 87, Counter_1A_Reset = 0, Counter_3A_Reset = 0, Counter_1A_ON_OFF = 0, Counter_3A_ON_OFF = 0 : NULL : WAIT = 0.2\n"
    outstr += "#verify count\n"
    outstr += "NULL : " + xEncoderValue + " = " + str(TheRevCount) + " | 0 | 0.1\n" 
    outstr += "#send counter reset\n"
    outstr += "Command = 87, Counter_1A_Reset = 1, Counter_3A_Reset = 1, Counter_1A_ON_OFF = 1, Counter_3A_ON_OFF = 1 : NULL : WAIT = 0.2\n"
    outstr += "#verify count reset\n"
    outstr += "NULL : " + xEncoderValue + " = 0 | 0 | 0.1\n" 

    outstr += "\n"


    TheCount = 0 #why does the very first edge act weird?
    PortIndex += 1
    # outstr += "#cycle IGN to clean slate\n"
    # outstr += "RLY_K1 = 1 : NULL : WAIT = 1\n"
    # outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"

outstr += "#switch out power supply\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2\n"
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