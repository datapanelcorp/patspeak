#35062
#Verion 0.0
UUT_DBC = 35062-561.dbc
UUT_DATANAME = 35062-CURVE-TEST

#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
J1_12 = 1 : NULL : WAIT = 0.1
#all test times are set to zero to allow fast maniplation of the e-load
TEST_MODE = 1 : NULL : WAIT = 1
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_01 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT01 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
NULL : AMPS_FET1 = 5000 | 0 | 0
NULL : Out_Stat1 = 1 | 0 | 0
LdCurrentSet = 3000 : NULL : WAIT = 0.5
NULL : AMPS_FET1 = 3000 | 0 | 0
NULL : MeterCurrent = 3.0 | 1 | 0
NULL : Out_Stat1 = 1 | 0 | 0
LdCurrentSet = 1000 : NULL : WAIT = 0.7
NULL : AMPS_FET1 = 1000 | 0 | 0
NULL : MeterCurrent = 1.0 | 1 | 0
NULL : Out_Stat1 = 1 | 0 | 0
NULL : AMPS_FET1 = 0 | 0 | 0
NULL : MeterCurrent = 0.0 | 0 | 0
NULL : Out_Stat1 = 1 | 0 | 0.001
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_01 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT01 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
NULL : AMPS_FET1 = 5000 | 0 | 0
NULL : Out_Stat1 = 1 | 0 | 0
LdCurrentSet = 3000 : NULL : WAIT = 0.5
NULL : AMPS_FET1 = 3000 | 0 | 0
NULL : MeterCurrent = 3.0 | 1 | 0
NULL : Out_Stat1 = 1 | 0 | 0
LdCurrentSet = 1000 : NULL : WAIT = 0.7
NULL : AMPS_FET1 = 1000 | 0 | 0
NULL : MeterCurrent = 1.0 | 1 | 0
NULL : Out_Stat1 = 1 | 0 | 0
NULL : AMPS_FET1 = 0 | 0 | 0
NULL : MeterCurrent = 0.0 | 0 | 0
NULL : Out_Stat1 = 1 | 0 | 0.001
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_01 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT01 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
NULL : AMPS_FET1 = 5000 | 0 | 0
NULL : Out_Stat1 = 1 | 0 | 0
LdCurrentSet = 3000 : NULL : WAIT = 0.5
NULL : AMPS_FET1 = 3000 | 0 | 0
NULL : MeterCurrent = 3.0 | 1 | 0
NULL : Out_Stat1 = 1 | 0 | 0
LdCurrentSet = 1000 : NULL : WAIT = 0.7
NULL : AMPS_FET1 = 1000 | 0 | 0
NULL : MeterCurrent = 1.0 | 1 | 0
NULL : Out_Stat1 = 1 | 0 | 0
NULL : AMPS_FET1 = 0 | 0 | 0
NULL : MeterCurrent = 0.0 | 0 | 0
NULL : Out_Stat1 = 1 | 0 | 0.001
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_01 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT01 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
NULL : AMPS_FET1 = 5000 | 0 | 0
NULL : Out_Stat1 = 1 | 0 | 0
LdCurrentSet = 3000 : NULL : WAIT = 0.5
NULL : AMPS_FET1 = 3000 | 0 | 0
NULL : MeterCurrent = 3.0 | 1 | 0
NULL : Out_Stat1 = 1 | 0 | 0
LdCurrentSet = 1000 : NULL : WAIT = 0.7
NULL : AMPS_FET1 = 1000 | 0 | 0
NULL : MeterCurrent = 1.0 | 1 | 0
NULL : Out_Stat1 = 1 | 0 | 0
LdCurrentSet = 2000 : NULL : WAIT = 0.5
NULL : AMPS_FET1 = 2000 | 0 | 0
NULL : MeterCurrent = 2.0 | 0 | 0
NULL : Out_Stat1 = 2 | 0 | 0.001
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch out load line, scope, clear current
OUTPUT01 = 0 : NULL : WAIT = 0.1
J1_01 = 0 : NULL : WAIT = 0.5
J1_12 = 0 : NULL : WAIT = 0.5
#all test times are set to zero to allow fast maniplation of the e-load
TEST_MODE = 1 : NULL : WAIT = 1
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_02 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT02 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
NULL : AMPS_FET2 = 5000 | 0 | 0
NULL : Out_Stat2 = 1 | 0 | 0
LdCurrentSet = 3000 : NULL : WAIT = 0.5
NULL : AMPS_FET2 = 3000 | 0 | 0
NULL : MeterCurrent = 3.0 | 1 | 0
NULL : Out_Stat2 = 1 | 0 | 0
LdCurrentSet = 1000 : NULL : WAIT = 0.7
NULL : AMPS_FET2 = 1000 | 0 | 0
NULL : MeterCurrent = 1.0 | 1 | 0
NULL : Out_Stat2 = 1 | 0 | 0
NULL : AMPS_FET2 = 0 | 0 | 0
NULL : MeterCurrent = 0.0 | 0 | 0
NULL : Out_Stat2 = 1 | 0 | 0.001
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_02 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT02 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
NULL : AMPS_FET2 = 5000 | 0 | 0
NULL : Out_Stat2 = 1 | 0 | 0
LdCurrentSet = 3000 : NULL : WAIT = 0.5
NULL : AMPS_FET2 = 3000 | 0 | 0
NULL : MeterCurrent = 3.0 | 1 | 0
NULL : Out_Stat2 = 1 | 0 | 0
LdCurrentSet = 1000 : NULL : WAIT = 0.7
NULL : AMPS_FET2 = 1000 | 0 | 0
NULL : MeterCurrent = 1.0 | 1 | 0
NULL : Out_Stat2 = 1 | 0 | 0
NULL : AMPS_FET2 = 0 | 0 | 0
NULL : MeterCurrent = 0.0 | 0 | 0
NULL : Out_Stat2 = 1 | 0 | 0.001
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_02 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT02 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
NULL : AMPS_FET2 = 5000 | 0 | 0
NULL : Out_Stat2 = 1 | 0 | 0
LdCurrentSet = 3000 : NULL : WAIT = 0.5
NULL : AMPS_FET2 = 3000 | 0 | 0
NULL : MeterCurrent = 3.0 | 1 | 0
NULL : Out_Stat2 = 1 | 0 | 0
LdCurrentSet = 1000 : NULL : WAIT = 0.7
NULL : AMPS_FET2 = 1000 | 0 | 0
NULL : MeterCurrent = 1.0 | 1 | 0
NULL : Out_Stat2 = 1 | 0 | 0
NULL : AMPS_FET2 = 0 | 0 | 0
NULL : MeterCurrent = 0.0 | 0 | 0
NULL : Out_Stat2 = 1 | 0 | 0.001
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_02 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT02 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
NULL : AMPS_FET2 = 5000 | 0 | 0
NULL : Out_Stat2 = 1 | 0 | 0
LdCurrentSet = 3000 : NULL : WAIT = 0.5
NULL : AMPS_FET2 = 3000 | 0 | 0
NULL : MeterCurrent = 3.0 | 1 | 0
NULL : Out_Stat2 = 1 | 0 | 0
LdCurrentSet = 1000 : NULL : WAIT = 0.7
NULL : AMPS_FET2 = 1000 | 0 | 0
NULL : MeterCurrent = 1.0 | 1 | 0
NULL : Out_Stat2 = 1 | 0 | 0
LdCurrentSet = 2000 : NULL : WAIT = 0.5
NULL : AMPS_FET2 = 2000 | 0 | 0
NULL : MeterCurrent = 2.0 | 0 | 0
NULL : Out_Stat2 = 2 | 0 | 0.001
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT02 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch out load line, scope, clear current
OUTPUT02 = 0 : NULL : WAIT = 0.1
J1_02 = 0 : NULL : WAIT = 0.5
J1_12 = 0 : NULL : WAIT = 0.5
#all test times are set to zero to allow fast maniplation of the e-load
TEST_MODE = 1 : NULL : WAIT = 1
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_03 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT03 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
NULL : AMPS_FET3 = 5000 | 0 | 0
NULL : Out_Stat3 = 1 | 0 | 0
LdCurrentSet = 3000 : NULL : WAIT = 0.5
NULL : AMPS_FET3 = 3000 | 0 | 0
NULL : MeterCurrent = 3.0 | 1 | 0
NULL : Out_Stat3 = 1 | 0 | 0
LdCurrentSet = 1000 : NULL : WAIT = 0.7
NULL : AMPS_FET3 = 1000 | 0 | 0
NULL : MeterCurrent = 1.0 | 1 | 0
NULL : Out_Stat3 = 1 | 0 | 0
NULL : AMPS_FET3 = 0 | 0 | 0
NULL : MeterCurrent = 0.0 | 0 | 0
NULL : Out_Stat3 = 1 | 0 | 0.001
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_03 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT03 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
NULL : AMPS_FET3 = 5000 | 0 | 0
NULL : Out_Stat3 = 1 | 0 | 0
LdCurrentSet = 3000 : NULL : WAIT = 0.5
NULL : AMPS_FET3 = 3000 | 0 | 0
NULL : MeterCurrent = 3.0 | 1 | 0
NULL : Out_Stat3 = 1 | 0 | 0
LdCurrentSet = 1000 : NULL : WAIT = 0.7
NULL : AMPS_FET3 = 1000 | 0 | 0
NULL : MeterCurrent = 1.0 | 1 | 0
NULL : Out_Stat3 = 1 | 0 | 0
NULL : AMPS_FET3 = 0 | 0 | 0
NULL : MeterCurrent = 0.0 | 0 | 0
NULL : Out_Stat3 = 1 | 0 | 0.001
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_03 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT03 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
NULL : AMPS_FET3 = 5000 | 0 | 0
NULL : Out_Stat3 = 1 | 0 | 0
LdCurrentSet = 3000 : NULL : WAIT = 0.5
NULL : AMPS_FET3 = 3000 | 0 | 0
NULL : MeterCurrent = 3.0 | 1 | 0
NULL : Out_Stat3 = 1 | 0 | 0
LdCurrentSet = 1000 : NULL : WAIT = 0.7
NULL : AMPS_FET3 = 1000 | 0 | 0
NULL : MeterCurrent = 1.0 | 1 | 0
NULL : Out_Stat3 = 1 | 0 | 0
NULL : AMPS_FET3 = 0 | 0 | 0
NULL : MeterCurrent = 0.0 | 0 | 0
NULL : Out_Stat3 = 1 | 0 | 0.001
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_03 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT03 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
NULL : AMPS_FET3 = 5000 | 0 | 0
NULL : Out_Stat3 = 1 | 0 | 0
LdCurrentSet = 3000 : NULL : WAIT = 0.5
NULL : AMPS_FET3 = 3000 | 0 | 0
NULL : MeterCurrent = 3.0 | 1 | 0
NULL : Out_Stat3 = 1 | 0 | 0
LdCurrentSet = 1000 : NULL : WAIT = 0.7
NULL : AMPS_FET3 = 1000 | 0 | 0
NULL : MeterCurrent = 1.0 | 1 | 0
NULL : Out_Stat3 = 1 | 0 | 0
LdCurrentSet = 2000 : NULL : WAIT = 0.5
NULL : AMPS_FET3 = 2000 | 0 | 0
NULL : MeterCurrent = 2.0 | 0 | 0
NULL : Out_Stat3 = 2 | 0 | 0.001
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT03 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch out load line, scope, clear current
OUTPUT03 = 0 : NULL : WAIT = 0.1
J1_03 = 0 : NULL : WAIT = 0.5
J1_12 = 0 : NULL : WAIT = 0.5
#all test times are set to zero to allow fast maniplation of the e-load
TEST_MODE = 1 : NULL : WAIT = 1
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_04 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT04 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
NULL : AMPS_FET4 = 5000 | 0 | 0
NULL : Out_Stat4 = 1 | 0 | 0
LdCurrentSet = 3000 : NULL : WAIT = 0.5
NULL : AMPS_FET4 = 3000 | 0 | 0
NULL : MeterCurrent = 3.0 | 1 | 0
NULL : Out_Stat4 = 1 | 0 | 0
LdCurrentSet = 1000 : NULL : WAIT = 0.7
NULL : AMPS_FET4 = 1000 | 0 | 0
NULL : MeterCurrent = 1.0 | 1 | 0
NULL : Out_Stat4 = 1 | 0 | 0
NULL : AMPS_FET4 = 0 | 0 | 0
NULL : MeterCurrent = 0.0 | 0 | 0
NULL : Out_Stat4 = 1 | 0 | 0.001
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_04 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT04 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
NULL : AMPS_FET4 = 5000 | 0 | 0
NULL : Out_Stat4 = 1 | 0 | 0
LdCurrentSet = 3000 : NULL : WAIT = 0.5
NULL : AMPS_FET4 = 3000 | 0 | 0
NULL : MeterCurrent = 3.0 | 1 | 0
NULL : Out_Stat4 = 1 | 0 | 0
LdCurrentSet = 1000 : NULL : WAIT = 0.7
NULL : AMPS_FET4 = 1000 | 0 | 0
NULL : MeterCurrent = 1.0 | 1 | 0
NULL : Out_Stat4 = 1 | 0 | 0
NULL : AMPS_FET4 = 0 | 0 | 0
NULL : MeterCurrent = 0.0 | 0 | 0
NULL : Out_Stat4 = 1 | 0 | 0.001
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_04 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT04 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
NULL : AMPS_FET4 = 5000 | 0 | 0
NULL : Out_Stat4 = 1 | 0 | 0
LdCurrentSet = 3000 : NULL : WAIT = 0.5
NULL : AMPS_FET4 = 3000 | 0 | 0
NULL : MeterCurrent = 3.0 | 1 | 0
NULL : Out_Stat4 = 1 | 0 | 0
LdCurrentSet = 1000 : NULL : WAIT = 0.7
NULL : AMPS_FET4 = 1000 | 0 | 0
NULL : MeterCurrent = 1.0 | 1 | 0
NULL : Out_Stat4 = 1 | 0 | 0
NULL : AMPS_FET4 = 0 | 0 | 0
NULL : MeterCurrent = 0.0 | 0 | 0
NULL : Out_Stat4 = 1 | 0 | 0.001
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J1_04 = 1 : NULL : WAIT = 0.1
#turn on output and wait a moment
OUTPUT04 = 1 : NULL : WAIT = 0.1
LdCurrentSet = 5000 : NULL
LdEnable = 1 : NULL : WAIT = 0.2
NULL : AMPS_FET4 = 5000 | 0 | 0
NULL : Out_Stat4 = 1 | 0 | 0
LdCurrentSet = 3000 : NULL : WAIT = 0.5
NULL : AMPS_FET4 = 3000 | 0 | 0
NULL : MeterCurrent = 3.0 | 1 | 0
NULL : Out_Stat4 = 1 | 0 | 0
LdCurrentSet = 1000 : NULL : WAIT = 0.7
NULL : AMPS_FET4 = 1000 | 0 | 0
NULL : MeterCurrent = 1.0 | 1 | 0
NULL : Out_Stat4 = 1 | 0 | 0
LdCurrentSet = 2000 : NULL : WAIT = 0.5
NULL : AMPS_FET4 = 2000 | 0 | 0
NULL : MeterCurrent = 2.0 | 0 | 0
NULL : Out_Stat4 = 2 | 0 | 0.001
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT04 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch out load line, scope, clear current
OUTPUT04 = 0 : NULL : WAIT = 0.1
J1_04 = 0 : NULL : WAIT = 0.5
J1_12 = 0 : NULL : WAIT = 0.5
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 = 0, OUTPUT04 = 0 : NULL : WAIT = 0.5
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1
DM_MEM_W(252'129'9) = 200 : DM_MEM_R(252'129'9) = 200 | 0 | 0
DM_MEM_W(252'129'10) = 700 : DM_MEM_R(252'129'10) = 700 | 0 | 0
DM_MEM_W(252'129'11) = 650 : DM_MEM_R(252'129'11) = 650 | 0 | 0
DM_MEM_W(252'129'12) = 600 : DM_MEM_R(252'129'12) = 600 | 0 | 0
DM_MEM_W(252'129'13) = 550 : DM_MEM_R(252'129'13) = 550 | 0 | 0
DM_MEM_W(252'129'14) = 500 : DM_MEM_R(252'129'14) = 500 | 0 | 0
DM_MEM_W(252'129'15) = 450 : DM_MEM_R(252'129'15) = 450 | 0 | 0
DM_MEM_W(252'129'16) = 400 : DM_MEM_R(252'129'16) = 400 | 0 | 0
DM_MEM_W(252'129'17) = 350 : DM_MEM_R(252'129'17) = 350  | 0 | 0
DM_MEM_W(252'129'18) = 300 : DM_MEM_R(252'129'18) = 300  | 0 | 0
DM_MEM_W(252'129'19) = 250 : DM_MEM_R(252'129'19) = 250  | 0 | 0
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
TEST_MODE = 1 : NULL : WAIT = 1
#ignore first read after power cycle
NULL : DM_MEM_R(252'129'9) = -1 | 0 | 0
NULL : DM_MEM_R(252'129'9) = 200 | 0 | 0
NULL : DM_MEM_R(252'129'10) = 700 | 0 | 0
NULL : DM_MEM_R(252'129'11) = 650 | 0 | 0
NULL : DM_MEM_R(252'129'12) = 600 | 0 | 0
NULL : DM_MEM_R(252'129'13) = 550 | 0 | 0
NULL : DM_MEM_R(252'129'14) = 500 | 0 | 0
NULL : DM_MEM_R(252'129'15) = 450 | 0 | 0
NULL : DM_MEM_R(252'129'16) = 400 | 0 | 0
NULL : DM_MEM_R(252'129'17) = 350  | 0 | 0
NULL : DM_MEM_R(252'129'18) = 300  | 0 | 0
NULL : DM_MEM_R(252'129'19) = 250  | 0 | 0
TEST_MODE = 1 : NULL : WAIT = 1
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
#switch in load line, set current
J1_12 = 1 : NULL : WAIT = 0.1
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1 : NULL : WAIT = 0.1
#set high current value
LdCurrentSet = 3500 : NULL : WAIT = 0.1
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 = 0, OUTPUT04 = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
NULL : Out_Stat1 = 2 | 0 | 0.001
NULL : Out_Stat2 = 2 | 0 | 0.001
NULL : Out_Stat3 = 2 | 0 | 0.001
NULL : Out_Stat4 = 2 | 0 | 0.001
TEST_MODE = 1 : NULL : WAIT = 1
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
#switch in load line, set current
J1_12 = 1 : NULL : WAIT = 0.1
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1 : NULL : WAIT = 0.1
#set high current value
LdCurrentSet = 3500 : NULL : WAIT = 0.1
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 = 0, OUTPUT04 = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
NULL : Out_Stat1 = 2 | 0 | 0.001
NULL : Out_Stat2 = 2 | 0 | 0.001
NULL : Out_Stat3 = 2 | 0 | 0.001
NULL : Out_Stat4 = 2 | 0 | 0.001
TEST_MODE = 1 : NULL : WAIT = 1
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
#switch in load line, set current
J1_12 = 1 : NULL : WAIT = 0.1
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1 : NULL : WAIT = 0.1
#set high current value
LdCurrentSet = 3500 : NULL : WAIT = 0.1
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 = 0, OUTPUT04 = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
NULL : Out_Stat1 = 2 | 0 | 0.001
NULL : Out_Stat2 = 2 | 0 | 0.001
NULL : Out_Stat3 = 2 | 0 | 0.001
NULL : Out_Stat4 = 2 | 0 | 0.001
TEST_MODE = 1 : NULL : WAIT = 1
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
#switch in load line, set current
J1_12 = 1 : NULL : WAIT = 0.1
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1 : NULL : WAIT = 0.1
#set high current value
LdCurrentSet = 3500 : NULL : WAIT = 0.1
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 = 0, OUTPUT04 = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
NULL : Out_Stat1 = 2 | 0 | 0.001
NULL : Out_Stat2 = 2 | 0 | 0.001
NULL : Out_Stat3 = 2 | 0 | 0.001
NULL : Out_Stat4 = 2 | 0 | 0.001
TEST_MODE = 1 : NULL : WAIT = 1
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
#switch in load line, set current
J1_12 = 1 : NULL : WAIT = 0.1
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1 : NULL : WAIT = 0.1
#set high current value
LdCurrentSet = 3500 : NULL : WAIT = 0.1
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 = 0, OUTPUT04 = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
NULL : Out_Stat1 = 2 | 0 | 0.001
NULL : Out_Stat2 = 2 | 0 | 0.001
NULL : Out_Stat3 = 2 | 0 | 0.001
NULL : Out_Stat4 = 2 | 0 | 0.001
TEST_MODE = 1 : NULL : WAIT = 1
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
#switch in load line, set current
J1_12 = 1 : NULL : WAIT = 0.1
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1 : NULL : WAIT = 0.1
#set high current value
LdCurrentSet = 3500 : NULL : WAIT = 0.1
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 = 0, OUTPUT04 = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
NULL : Out_Stat1 = 2 | 0 | 0.001
NULL : Out_Stat2 = 2 | 0 | 0.001
NULL : Out_Stat3 = 2 | 0 | 0.001
NULL : Out_Stat4 = 2 | 0 | 0.001
TEST_MODE = 1 : NULL : WAIT = 1
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
#switch in load line, set current
J1_12 = 1 : NULL : WAIT = 0.1
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1 : NULL : WAIT = 0.1
#set high current value
LdCurrentSet = 2000 : NULL : WAIT = 0.1
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 = 0, OUTPUT04 = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
NULL : Out_Stat1 = 0 | 0 | 0.001
NULL : Out_Stat2 = 0 | 0 | 0.001
NULL : Out_Stat3 = 0 | 0 | 0.001
NULL : Out_Stat4 = 0 | 0 | 0.001
TEST_MODE = 1 : NULL : WAIT = 1
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
#switch in load line, set current
J1_12 = 1 : NULL : WAIT = 0.1
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1 : NULL : WAIT = 0.1
#set high current value
LdCurrentSet = 2000 : NULL : WAIT = 0.1
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 = 0, OUTPUT04 = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
NULL : Out_Stat1 = 0 | 0 | 0.001
NULL : Out_Stat2 = 0 | 0 | 0.001
NULL : Out_Stat3 = 0 | 0 | 0.001
NULL : Out_Stat4 = 0 | 0 | 0.001
TEST_MODE = 1 : NULL : WAIT = 1
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
#switch in load line, set current
J1_12 = 1 : NULL : WAIT = 0.1
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1 : NULL : WAIT = 0.1
#set high current value
LdCurrentSet = 2000 : NULL : WAIT = 0.1
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 = 0, OUTPUT04 = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
NULL : Out_Stat1 = 0 | 0 | 0.001
NULL : Out_Stat2 = 0 | 0 | 0.001
NULL : Out_Stat3 = 0 | 0 | 0.001
NULL : Out_Stat4 = 0 | 0 | 0.001
TEST_MODE = 1 : NULL : WAIT = 1
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
#switch in load line, set current
J1_12 = 1 : NULL : WAIT = 0.1
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1 : NULL : WAIT = 0.1
#set high current value
LdCurrentSet = 2000 : NULL : WAIT = 0.1
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 = 0, OUTPUT04 = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
NULL : Out_Stat1 = 0 | 0 | 0.001
NULL : Out_Stat2 = 0 | 0 | 0.001
NULL : Out_Stat3 = 0 | 0 | 0.001
NULL : Out_Stat4 = 0 | 0 | 0.001
TEST_MODE = 1 : NULL : WAIT = 1
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
#switch in load line, set current
J1_12 = 1 : NULL : WAIT = 0.1
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1 : NULL : WAIT = 0.1
#set high current value
LdCurrentSet = 2000 : NULL : WAIT = 0.1
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 = 0, OUTPUT04 = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
NULL : Out_Stat1 = 0 | 0 | 0.001
NULL : Out_Stat2 = 0 | 0 | 0.001
NULL : Out_Stat3 = 0 | 0 | 0.001
NULL : Out_Stat4 = 0 | 0 | 0.001
TEST_MODE = 1 : NULL : WAIT = 1
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
#switch in load line, set current
J1_12 = 1 : NULL : WAIT = 0.1
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1 : NULL : WAIT = 0.1
#set high current value
LdCurrentSet = 2000 : NULL : WAIT = 0.1
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 = 0, OUTPUT04 = 0 : NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2
LdEnable = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2
NULL : Out_Stat1 = 0 | 0 | 0.001
NULL : Out_Stat2 = 0 | 0 | 0.001
NULL : Out_Stat3 = 0 | 0 | 0.001
NULL : Out_Stat4 = 0 | 0 | 0.001
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 = 0, OUTPUT04 = 0 : NULL : WAIT = 0.5
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
SAVE
END
