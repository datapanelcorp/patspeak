import os

def WriteEncoderTest(outstr, TheChannel, StartValue):
    PortMode = "10"
 
    if(TheChannel == 0):
        InputConnectorA = "J1_06"#"J1_05"
        InputConnectorB = "J1_05"#"J1_06"
        Reset = "Counter_3A_Reset"
        Enable = "Counter_3A_ON_OFF"
        EncoderValue = "EncoderValue3"
        
    if(TheChannel == 1):
        InputConnectorA = "J1_08"#"J1_07"
        InputConnectorB = "J1_07"#"J1_08"
        Reset = "Counter_4A_Reset"
        Enable = "Counter_4A_ON_OFF"
        EncoderValue = "EncoderValue4"
        
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

    outstr += "#-----setup 39009-----\n"
    outstr += "#configure as Output Digital ON/OFF\n"
    outstr += "Command = 82, MODE1 = 0, MODE2 = 0, ADRaw = 0 : NULL : WAIT = 0.5\n"
    outstr += "Command = 83, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = " + PortMode + ", MODE3B = " + PortMode + ", MODE4A = " + PortMode + ", MODE4B = " + PortMode + ", MODE5A = 0, MODE5B = 0 : NULL : WAIT = 0.5\n"
    outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL\n"
    outstr += "\n"

    # outstr += "#avoid first activation glitch by activating prior to test\n"
    # outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2\n"
    # outstr += "PwrSetVoltage = 140 : NULL\n"
    # outstr += InputConnectorA + " = 1 : NULL : WAIT = 0.2\n"
    # outstr += InputConnectorB + " = 1 : NULL : WAIT = 0.2\n"
    # outstr += InputConnectorA + " = 0 : NULL : WAIT = 0.2\n"
    # outstr += InputConnectorB + " = 0 : NULL : WAIT = 0.2\n"
    # outstr += "PwrSetVoltage = 0 : NULL\n"
    # outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2\n"
    
    #outstr += "Command = 87, Counter_1A_Reset = 1, Counter_3A_Reset = 1, Counter_1A_ON_OFF = 1, Counter_3A_ON_OFF = 1 : NULL : WAIT = 0.2\n"
    outstr += "Command = 87, " + Reset + " = 1, " + Enable + " = 1 : NULL : WAIT = 0.2\n"
    outstr += "Command = 87, " + Reset + " = 0, " + Enable + " = 1 : NULL : WAIT = 0.2\n"
    outstr += "#clear multiplex\n"
    #outstr += "Command = 0, Counter_1A_Reset = 0, Counter_3A_Reset = 0, Counter_1A_ON_OFF = 0, Counter_3A_ON_OFF = 0 : NULL\n"
    outstr += "Command = 0, " + Reset + " = 0, " + Enable + " = 0 : NULL\n"
    outstr += "\n"

    outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
    outstr += "#clear multiplex\n"
    outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"

    outstr += "#switch in test supply\n"
    outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2\n"

    outstr += "\n"

    outstr += "PwrSetVoltage = 140 : NULL\n"

    outstr += "#avoid first activation glitch by activating prior to test\n"
    outstr += InputConnectorA + " = 1 : NULL : WAIT = 0.2\n"
    outstr += InputConnectorB + " = 1 : NULL : WAIT = 0.2\n"
    outstr += InputConnectorA + " = 0 : NULL : WAIT = 0.2\n"
    outstr += InputConnectorB + " = 0 : NULL : WAIT = 0.2\n"
    outstr += "Command = 87, " + Reset + " = 1, " + Enable + " = 1 : NULL : WAIT = 0.2\n"
    outstr += "Command = 87, " + Reset + " = 0, " + Enable + " = 1 : NULL : WAIT = 0.2\n"

    TheCount = StartValue
    MaxCount = 5

    outstr += "#testing encoder foward\n"
    while TheCount <= MaxCount:
        outstr += InputConnectorA + " = 1 : NULL : WAIT = 0.2\n"
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
        outstr += "\n"
        
    outstr += "#testing encoder reverse\n"
    while TheCount > 0:
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
        outstr += "\n"
        
    outstr += "#testing encoder reverse rollover\n"
    TheRevCount = 4294967295 + 1
    while TheCount <= MaxCount:
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
        outstr += "\n"
        
    outstr += "#switch out input\n"
    outstr += InputConnectorA + " = 0 : NULL : WAIT = 0.2\n"
    outstr += InputConnectorB + " = 0 : NULL : WAIT = 0.2\n"
    outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2\n"
    outstr += "#disable counter\n"
    outstr += "Command = 87, " + Enable + " = 1 : NULL : WAIT = 0.2\n"
    outstr += "Command = 0, " + Enable + " = 0 : NULL\n"
    outstr += "#verify count\n"
    outstr += "NULL : " + EncoderValue + " = " + str(TheRevCount) + " | 0 | 0.1\n" 
    outstr += "#send counter reset\n"
    outstr += "Command = 87, " + Reset + " = 1 : NULL : WAIT = 0.2\n"
    outstr += "Command = 0, " + Reset + " = 0 : NULL\n"
    outstr += "#verify count reset\n"
    outstr += "NULL : " + EncoderValue + " = 0 | 0 | 0.1\n" 
    outstr += "\n"

    outstr += "#switch out load line\n"
    outstr += InputConnectorA + " = 0, " + InputConnectorB + " = 0 : NULL : WAIT = 0.1\n"
    
    outstr += "#switch out power supply\n"
    outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
    outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
    outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1\n"
    outstr += "#cycle IGN to clean slate\n"
    return outstr


#global setup
script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
Test1Name = os.path.splitext(script_name)[0]
datafile = Test1Name + ".pat"

outstr = ""
outstr += "#43019-1\n"
outstr += "#Verion 0.0\n"
outstr += "#input test\n"
outstr += "UUT_DBC = 43019-560.dbc\n"
outstr += "UUT_DATANAME = " + Test1Name + "\n"
outstr += "\n"

outstr = WriteEncoderTest(outstr, 0, 0)
outstr = WriteEncoderTest(outstr, 1, 0)

outstr += "SAVE\n"
outstr += "END\n"

f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)

print(Test1Name + ".pat")

quit()

# #write file #1
# Channel = 1
# #global setup
# script_name = os.path.basename(__file__)
# print(f"The name of the running script is: {script_name}")
# Test2Name = os.path.splitext(script_name)[0] + "_" +  str(Channel)
# datafile = Test2Name + ".pat"

# outstr = ""
# outstr += "#43019-1\n"
# outstr += "#Verion 0.0\n"
# outstr += "#input test\n"
# outstr += "UUT_DBC = 43019-560.dbc\n"
# outstr += "UUT_DATANAME = " + Test2Name + "\n"
# outstr += "\n"

# outstr = WriteEncoderTest(outstr, Channel, 0)

# outstr += "SAVE\n"
# outstr += "END\n"

# f = open(datafile, 'w')
# f.write(outstr)
# f.close()    
# print(outstr)


# print(Test1Name + ".pat")
# print(Test2Name + ".pat")



