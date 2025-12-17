from input_count_write import WriteCountTest
from input_count_write import WriteMaxCountTest

PortIndex = 0
ModeIndex = 0
PortMode = 0

#global setup
TestName = "34044-1-INPUT-COUNT"
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

outstr += "#switch in scope\n"
outstr += "J4_03 = 1 : NULL : WAIT = 0.2\n"

# MaxCount = 5
# SetPoint = 5
# RolloverMode = 0
# InterlockMode = 1
# outstr += "#****** NO OVERFLOW, SET POINT = 5, MAX COUNT = 5, OUTPUT INTERLOCK\n"
# outstr = WriteCountTest(outstr, SetPoint, MaxCount, RolloverMode, InterlockMode)

# MaxCount = 5
# SetPoint = 3
# RolloverMode = 1
# InterlockMode = 0
# outstr += "#****** OVERFLOW, SET POINT = 3, MAX COUNT = 5, NO OUTPUT INTERLOCK\n"
# outstr = WriteCountTest(outstr, SetPoint, MaxCount, RolloverMode, InterlockMode)

# MaxCount = 5
# SetPoint = 2
# RolloverMode = 1
# InterlockMode = 1
# outstr += "#****** OVERFLOW, SET POINT = 3, MAX COUNT = 5, OUTPUT INTERLOCK\n"
# outstr = WriteCountTest(outstr, SetPoint, MaxCount, RolloverMode, InterlockMode)

MaxCount = 20
SetPoint = 0
RolloverMode = 1
InterlockMode = 0
outstr += "#****** OVERFLOW, SET POINT = 0, MAX COUNT = 5, NO OUTPUT INTERLOCK\n"
outstr = WriteCountTest(outstr, SetPoint, MaxCount, RolloverMode, InterlockMode)

# MaxCount = 65535
# SetPoint = 65535
# RolloverMode = 0
# InterlockMode = 1
# outstr += "#****** MAX MCOUNT\n"
# outstr = WriteMaxCountTest(outstr, SetPoint, MaxCount, RolloverMode, InterlockMode)

outstr += "#switch out power supply\n"
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1\n"

outstr += "#switch out scope\n"
outstr += "J4_03 = 1 : NULL : WAIT = 0.2\n"

outstr += "SAVE\n"
outstr += "END\n"

f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)




