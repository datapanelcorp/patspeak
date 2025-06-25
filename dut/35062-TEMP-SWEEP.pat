#35062-1
#Verion 0.0
#fan test
UUT_DBC = 35062-561.dbc
UUT_DATANAME = 35062-TEMP-SWEEP

J4_03 = 1 : NULL : WAIT = 0.2
#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdEnable = 1, LdMode = 1 : NULL : WAIT = 0.1
LdResistanceSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1
#switch input to load line
J1_01 = 1 : NULL : WAIT = 0.1
LdResistanceSet = 1500 : NULL : WAIT = 0.1
NULL : TEMP = 1 | 0.01 | 0.05
#switch out load line, set current
J1_01 = 0 : NULL : WAIT = 0.1
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
#tear down PS1
PwrSetCurrent = 0 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 0 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1
PwrRemote = 0 : NULL : WAIT = 0.1
J4_03 = 0 : NULL : WAIT = 0.2
SAVE
END
