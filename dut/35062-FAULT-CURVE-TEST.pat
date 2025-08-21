#35062
#Verion 0.0
UUT_DBC = 35062-561.dbc
UUT_DATANAME = 35062-FAULT-CURVE-TEST

#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
TEST_MODE = 1 : NULL : WAIT = 1
J1_12 = 1 : NULL : WAIT = 0.1
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_01 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT01 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
LdCurrentSet = 3000 : NULL : WAIT = 0.5
LdCurrentSet = 1000 : NULL : WAIT = 0.7
LdCurrentSet = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_01 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT01 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
LdCurrentSet = 3000 : NULL : WAIT = 0.5
LdCurrentSet = 1000 : NULL : WAIT = 0.7
LdCurrentSet = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_01 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT01 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
LdCurrentSet = 3000 : NULL : WAIT = 0.5
LdCurrentSet = 1000 : NULL : WAIT = 0.7
LdCurrentSet = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_01 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT01 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
LdCurrentSet = 3000 : NULL : WAIT = 0.5
LdCurrentSet = 1000 : NULL : WAIT = 0.7
LdCurrentSet = 2000 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch out load line, scope, clear current
OUTPUT01 = 0 : NULL : WAIT = 0.1
J1_01 = 0 : NULL : WAIT = 0.5
J1_12 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_02 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT02 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
LdCurrentSet = 3000 : NULL : WAIT = 0.5
LdCurrentSet = 1000 : NULL : WAIT = 0.7
LdCurrentSet = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_02 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT02 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
LdCurrentSet = 3000 : NULL : WAIT = 0.5
LdCurrentSet = 1000 : NULL : WAIT = 0.7
LdCurrentSet = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_02 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT02 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
LdCurrentSet = 3000 : NULL : WAIT = 0.5
LdCurrentSet = 1000 : NULL : WAIT = 0.7
LdCurrentSet = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_02 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT02 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
LdCurrentSet = 3000 : NULL : WAIT = 0.5
LdCurrentSet = 1000 : NULL : WAIT = 0.7
LdCurrentSet = 2000 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT02 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch out load line, scope, clear current
OUTPUT02 = 0 : NULL : WAIT = 0.1
J1_02 = 0 : NULL : WAIT = 0.5
J1_12 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_03 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT03 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
LdCurrentSet = 3000 : NULL : WAIT = 0.5
LdCurrentSet = 1000 : NULL : WAIT = 0.7
LdCurrentSet = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_03 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT03 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
LdCurrentSet = 3000 : NULL : WAIT = 0.5
LdCurrentSet = 1000 : NULL : WAIT = 0.7
LdCurrentSet = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_03 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT03 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
LdCurrentSet = 3000 : NULL : WAIT = 0.5
LdCurrentSet = 1000 : NULL : WAIT = 0.7
LdCurrentSet = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_03 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT03 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
LdCurrentSet = 3000 : NULL : WAIT = 0.5
LdCurrentSet = 1000 : NULL : WAIT = 0.7
LdCurrentSet = 2000 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT03 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch out load line, scope, clear current
OUTPUT03 = 0 : NULL : WAIT = 0.1
J1_03 = 0 : NULL : WAIT = 0.5
J1_12 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_04 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT04 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
LdCurrentSet = 3000 : NULL : WAIT = 0.5
LdCurrentSet = 1000 : NULL : WAIT = 0.7
LdCurrentSet = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_04 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT04 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
LdCurrentSet = 3000 : NULL : WAIT = 0.5
LdCurrentSet = 1000 : NULL : WAIT = 0.7
LdCurrentSet = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_04 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT04 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
LdCurrentSet = 3000 : NULL : WAIT = 0.5
LdCurrentSet = 1000 : NULL : WAIT = 0.7
LdCurrentSet = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_04 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT04 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
LdCurrentSet = 3000 : NULL : WAIT = 0.5
LdCurrentSet = 1000 : NULL : WAIT = 0.7
LdCurrentSet = 2000 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT04 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch out load line, scope, clear current
OUTPUT04 = 0 : NULL : WAIT = 0.1
J1_04 = 0 : NULL : WAIT = 0.5
J1_12 = 0 : NULL : WAIT = 0.5
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
SAVE
END
