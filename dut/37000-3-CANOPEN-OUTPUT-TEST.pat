#37000-3
#Verion 0.0
#digital normal test using the E-LOAD
UUT_EDS = 37000-563.eds
UUT_DATANAME = 37000-3-CANOPEN-OUTPUT-TEST

#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
PRE_OPERATIONAL
#-----setup PAT-----
#setup load
LdRemote = 1 : NULL
LdEnable = 0 : NULL
LdCurrentSet = 0 : NULL
J0_08_METER_LOAD = 1 : NULL
OPERATIONAL
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
#disable global modes
sdo[0x2000][3] = 0 : NULL
sdo[0x2000][4] = 0 : NULL
#-----set 1A/3A overcurrent-----
sdo[0x2004][1] = 45 : NULL
sdo[0x2004][2] = 45 : NULL
#-----disable load-----
LdEnable = 0 : NULL
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][1] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_02 = 1 : NULL

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 0: NULL
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 0.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 200: NULL
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 2.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 400: NULL
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 4.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 600: NULL
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 6.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 800: NULL
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 8.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 1000: NULL
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 10.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 1200: NULL
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 12.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 1400: NULL
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 14.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 1600: NULL
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 16.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 1800: NULL
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 18.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 2000: NULL
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 20.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 2200: NULL
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 22.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 2400: NULL
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 24.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 2600: NULL
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 26.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 2800: NULL
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 28.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 3000: NULL
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 30.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 3200: NULL
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 32.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 3400: NULL
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 34.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 3600: NULL
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 36.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 3800: NULL
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 38.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 4000: NULL
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 40.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 4200: NULL
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.01
NULL : sdo[0x5003][2] = 42.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 2 : NULL
LdCurrentSet = 4400: NULL
#verify fault #1
NULL : MeterCurrent = 0  | 0.01 | 0.01
NULL : sdo[0x5003][2] = 0 | 0 | 0.01
NULL : sdo[0x5001][3] = 8 | 0 | 0.01

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_02 = 0 : NULL
#read signal value to update
NULL : sdo[0x5003][2] = 0 | 155 | 0.01
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][3] = 0 | 0 | 0.01
#-----disable load-----
LdEnable = 0 : NULL
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][2] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_03 = 1 : NULL

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 0: NULL
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 0.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 200: NULL
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 2.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 400: NULL
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 4.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 600: NULL
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 6.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 800: NULL
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 8.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 1000: NULL
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 10.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 1200: NULL
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 12.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 1400: NULL
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 14.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 1600: NULL
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 16.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 1800: NULL
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 18.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 2000: NULL
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 20.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 2200: NULL
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 22.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 2400: NULL
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 24.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 2600: NULL
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 26.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 2800: NULL
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 28.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 3000: NULL
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 30.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 3200: NULL
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 32.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 3400: NULL
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 34.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 3600: NULL
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 36.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 3800: NULL
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 38.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 4000: NULL
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 40.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 4200: NULL
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.01
NULL : sdo[0x5003][3] = 42.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 4 : NULL
LdCurrentSet = 4400: NULL
#verify fault #1
NULL : MeterCurrent = 0  | 0.01 | 0.01
NULL : sdo[0x5003][3] = 0 | 0 | 0.01
NULL : sdo[0x5001][3] = 32 | 0 | 0.01

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_03 = 0 : NULL
#read signal value to update
NULL : sdo[0x5003][3] = 0 | 155 | 0.01
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][3] = 0 | 0 | 0.01
#-----disable load-----
LdEnable = 0 : NULL
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][2] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_04 = 1 : NULL

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 0: NULL
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 0.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 200: NULL
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 2.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 400: NULL
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 4.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 600: NULL
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 6.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 800: NULL
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 8.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 1000: NULL
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 10.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 1200: NULL
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 12.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 1400: NULL
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 14.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 1600: NULL
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 16.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 1800: NULL
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 18.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 2000: NULL
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 20.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 2200: NULL
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 22.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 2400: NULL
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 24.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 2600: NULL
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 26.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 2800: NULL
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 28.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 3000: NULL
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 30.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 3200: NULL
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 32.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 3400: NULL
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 34.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 3600: NULL
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 36.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 3800: NULL
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 38.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 4000: NULL
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 40.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 4200: NULL
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.01
NULL : sdo[0x5003][4] = 42.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 8 : NULL
LdCurrentSet = 4400: NULL
#verify fault #1
NULL : MeterCurrent = 0  | 0.01 | 0.01
NULL : sdo[0x5003][4] = 0 | 0 | 0.01
NULL : sdo[0x5001][3] = 128 | 0 | 0.01

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_04 = 0 : NULL
#read signal value to update
NULL : sdo[0x5003][4] = 0 | 155 | 0.01
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][3] = 0 | 0 | 0.01
#-----disable load-----
LdEnable = 0 : NULL
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][3] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_06 = 1 : NULL

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 0: NULL
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 0.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 200: NULL
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 2.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 400: NULL
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 4.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 600: NULL
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 6.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 800: NULL
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 8.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 1000: NULL
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 10.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 1200: NULL
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 12.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 1400: NULL
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 14.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 1600: NULL
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 16.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 1800: NULL
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 18.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 2000: NULL
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 20.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 2200: NULL
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 22.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 2400: NULL
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 24.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 2600: NULL
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 26.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 2800: NULL
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 28.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 3000: NULL
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 30.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 3200: NULL
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 32.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 3400: NULL
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 34.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 3600: NULL
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 36.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 3800: NULL
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 38.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 4000: NULL
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 40.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 4200: NULL
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.01
NULL : sdo[0x5003][6] = 42.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 32 : NULL
LdCurrentSet = 4400: NULL
#verify fault #1
NULL : MeterCurrent = 0  | 0.01 | 0.01
NULL : sdo[0x5003][6] = 0 | 0 | 0.01
NULL : sdo[0x5001][4] = 8 | 0 | 0.01

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_06 = 0 : NULL
#read signal value to update
NULL : sdo[0x5003][6] = 0 | 155 | 0.01
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][4] = 0 | 0 | 0.01
#-----disable load-----
LdEnable = 0 : NULL
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][4] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_07 = 1 : NULL

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 0: NULL
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 0.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 200: NULL
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 2.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 400: NULL
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 4.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 600: NULL
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 6.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 800: NULL
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 8.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 1000: NULL
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 10.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 1200: NULL
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 12.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 1400: NULL
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 14.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 1600: NULL
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 16.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 1800: NULL
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 18.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 2000: NULL
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 20.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 2200: NULL
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 22.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 2400: NULL
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 24.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 2600: NULL
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 26.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 2800: NULL
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 28.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 3000: NULL
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 30.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 3200: NULL
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 32.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 3400: NULL
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 34.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 3600: NULL
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 36.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 3800: NULL
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 38.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 4000: NULL
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 40.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 4200: NULL
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.01
NULL : sdo[0x5003][7] = 42.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 64 : NULL
LdCurrentSet = 4400: NULL
#verify fault #1
NULL : MeterCurrent = 0  | 0.01 | 0.01
NULL : sdo[0x5003][7] = 0 | 0 | 0.01
NULL : sdo[0x5001][4] = 32 | 0 | 0.01

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_07 = 0 : NULL
#read signal value to update
NULL : sdo[0x5003][7] = 0 | 155 | 0.01
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][4] = 0 | 0 | 0.01
#-----disable load-----
LdEnable = 0 : NULL
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][4] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_08 = 1 : NULL

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 0: NULL
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 0.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 200: NULL
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 2.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 400: NULL
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 4.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 600: NULL
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 6.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 800: NULL
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 8.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 1000: NULL
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 10.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 1200: NULL
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 12.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 1400: NULL
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 14.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 1600: NULL
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 16.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 1800: NULL
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 18.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 2000: NULL
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 20.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 2200: NULL
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 22.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 2400: NULL
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 24.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 2600: NULL
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 26.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 2800: NULL
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 28.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 3000: NULL
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 30.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 3200: NULL
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 32.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 3400: NULL
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 34.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 3600: NULL
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 36.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 3800: NULL
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 38.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 4000: NULL
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 40.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 4200: NULL
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.01
NULL : sdo[0x5003][8] = 42.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][1] = 128 : NULL
LdCurrentSet = 4400: NULL
#verify fault #1
NULL : MeterCurrent = 0  | 0.01 | 0.01
NULL : sdo[0x5003][8] = 0 | 0 | 0.01
NULL : sdo[0x5001][4] = 128 | 0 | 0.01

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_08 = 0 : NULL
#read signal value to update
NULL : sdo[0x5003][8] = 0 | 155 | 0.01
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][4] = 0 | 0 | 0.01
#-----disable load-----
LdEnable = 0 : NULL
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][5] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_09 = 1 : NULL

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 0: NULL
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 0.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 200: NULL
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 2.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 400: NULL
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 4.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 600: NULL
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 6.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 800: NULL
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 8.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 1000: NULL
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 10.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 1200: NULL
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 12.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 1400: NULL
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 14.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 1600: NULL
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 16.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 1800: NULL
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 18.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 2000: NULL
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 20.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 2200: NULL
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 22.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 2400: NULL
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 24.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 2600: NULL
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 26.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 2800: NULL
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 28.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 3000: NULL
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 30.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 3200: NULL
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 32.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 3400: NULL
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 34.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 3600: NULL
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 36.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 3800: NULL
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 38.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 4000: NULL
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 40.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 4200: NULL
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.01
NULL : sdo[0x5003][9] = 42.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 1 : NULL
LdCurrentSet = 4400: NULL
#verify fault #1
NULL : MeterCurrent = 0  | 0.01 | 0.01
NULL : sdo[0x5003][9] = 0 | 0 | 0.01
NULL : sdo[0x5001][5] = 2 | 0 | 0.01

#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J2_09 = 0 : NULL
#read signal value to update
NULL : sdo[0x5003][9] = 0 | 155 | 0.01
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][5] = 0 | 0 | 0.01
#-----disable load-----
LdEnable = 0 : NULL
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][5] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_10 = 1 : NULL

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 0: NULL
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 0.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 200: NULL
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 2.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 400: NULL
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 4.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 600: NULL
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 6.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 800: NULL
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 8.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 1000: NULL
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 10.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 1200: NULL
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 12.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 1400: NULL
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 14.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 1600: NULL
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 16.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 1800: NULL
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 18.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 2000: NULL
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 20.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 2200: NULL
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 22.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 2400: NULL
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 24.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 2600: NULL
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 26.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 2800: NULL
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 28.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 3000: NULL
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 30.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 3200: NULL
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 32.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 3400: NULL
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 34.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 3600: NULL
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 36.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 3800: NULL
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 38.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 4000: NULL
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 40.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 4200: NULL
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.01
NULL : sdo[0x5003][10] = 42.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 2 : NULL
LdCurrentSet = 4400: NULL
#verify fault #1
NULL : MeterCurrent = 0  | 0.01 | 0.01
NULL : sdo[0x5003][10] = 0 | 0 | 0.01
NULL : sdo[0x5001][5] = 8 | 0 | 0.01

#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J2_10 = 0 : NULL
#read signal value to update
NULL : sdo[0x5003][10] = 0 | 155 | 0.01
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][5] = 0 | 0 | 0.01
#-----disable load-----
LdEnable = 0 : NULL
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][6] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_11 = 1 : NULL

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 0: NULL
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 0.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 200: NULL
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 2.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 400: NULL
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 4.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 600: NULL
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 6.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 800: NULL
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 8.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 1000: NULL
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 10.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 1200: NULL
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 12.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 1400: NULL
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 14.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 1600: NULL
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 16.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 1800: NULL
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 18.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 2000: NULL
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 20.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 2200: NULL
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 22.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 2400: NULL
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 24.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 2600: NULL
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 26.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 2800: NULL
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 28.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 3000: NULL
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 30.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 3200: NULL
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 32.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 3400: NULL
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 34.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 3600: NULL
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 36.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 3800: NULL
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 38.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 4000: NULL
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 40.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 4200: NULL
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.01
NULL : sdo[0x5003][11] = 42.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 4 : NULL
LdCurrentSet = 4400: NULL
#verify fault #1
NULL : MeterCurrent = 0  | 0.01 | 0.01
NULL : sdo[0x5003][11] = 0 | 0 | 0.01
NULL : sdo[0x5001][5] = 32 | 0 | 0.01

#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J2_11 = 0 : NULL
#read signal value to update
NULL : sdo[0x5003][11] = 0 | 155 | 0.01
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][5] = 0 | 0 | 0.01
#-----disable load-----
LdEnable = 0 : NULL
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][6] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_12 = 1 : NULL

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 0: NULL
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 0.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 200: NULL
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 2.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 400: NULL
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 4.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 600: NULL
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 6.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 800: NULL
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 8.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 1000: NULL
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 10.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 1200: NULL
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 12.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 1400: NULL
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 14.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 1600: NULL
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 16.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 1800: NULL
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 18.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 2000: NULL
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 20.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 2200: NULL
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 22.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 2400: NULL
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 24.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 2600: NULL
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 26.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 2800: NULL
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 28.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 3000: NULL
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 30.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 3200: NULL
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 32.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 3400: NULL
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 34.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 3600: NULL
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 36.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 3800: NULL
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 38.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 4000: NULL
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 40.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 4200: NULL
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.01
NULL : sdo[0x5003][12] = 42.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 8 : NULL
LdCurrentSet = 4400: NULL
#verify fault #1
NULL : MeterCurrent = 0  | 0.01 | 0.01
NULL : sdo[0x5003][12] = 0 | 0 | 0.01
NULL : sdo[0x5001][5] = 128 | 0 | 0.01

#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J2_12 = 0 : NULL
#read signal value to update
NULL : sdo[0x5003][12] = 0 | 155 | 0.01
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][5] = 0 | 0 | 0.01
#-----disable load-----
LdEnable = 0 : NULL
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][7] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J3_01 = 1 : NULL

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 0: NULL
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 0.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 200: NULL
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 2.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 400: NULL
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 4.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 600: NULL
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 6.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 800: NULL
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 8.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 1000: NULL
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 10.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 1200: NULL
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 12.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 1400: NULL
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 14.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 1600: NULL
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 16.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 1800: NULL
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 18.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 2000: NULL
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 20.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 2200: NULL
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 22.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 2400: NULL
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 24.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 2600: NULL
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 26.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 2800: NULL
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 28.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 3000: NULL
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 30.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 3200: NULL
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 32.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 3400: NULL
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 34.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 3600: NULL
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 36.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 3800: NULL
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 38.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 4000: NULL
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 40.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 4200: NULL
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.01
NULL : sdo[0x5003][13] = 42.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 16 : NULL
LdCurrentSet = 4400: NULL
#verify fault #1
NULL : MeterCurrent = 0  | 0.01 | 0.01
NULL : sdo[0x5003][13] = 0 | 0 | 0.01
NULL : sdo[0x5001][6] = 2 | 0 | 0.01

#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J3_01 = 0 : NULL
#read signal value to update
NULL : sdo[0x5003][13] = 0 | 155 | 0.01
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][6] = 0 | 0 | 0.01
#-----disable load-----
LdEnable = 0 : NULL
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][7] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J3_02 = 1 : NULL

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 0: NULL
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 0.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 200: NULL
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 2.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 400: NULL
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 4.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 600: NULL
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 6.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 800: NULL
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 8.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 1000: NULL
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 10.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 1200: NULL
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 12.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 1400: NULL
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 14.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 1600: NULL
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 16.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 1800: NULL
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 18.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 2000: NULL
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 20.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 2200: NULL
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 22.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 2400: NULL
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 24.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 2600: NULL
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 26.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 2800: NULL
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 28.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 3000: NULL
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 30.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 3200: NULL
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 32.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 3400: NULL
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 34.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 3600: NULL
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 36.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 3800: NULL
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 38.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 4000: NULL
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 40.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 4200: NULL
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.01
NULL : sdo[0x5003][14] = 42.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 32 : NULL
LdCurrentSet = 4400: NULL
#verify fault #1
NULL : MeterCurrent = 0  | 0.01 | 0.01
NULL : sdo[0x5003][14] = 0 | 0 | 0.01
NULL : sdo[0x5001][6] = 8 | 0 | 0.01

#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J3_02 = 0 : NULL
#read signal value to update
NULL : sdo[0x5003][14] = 0 | 155 | 0.01
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][6] = 0 | 0 | 0.01
#-----disable load-----
LdEnable = 0 : NULL
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][8] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J3_03 = 1 : NULL

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 0: NULL
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 0.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 200: NULL
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 2.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 400: NULL
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 4.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 600: NULL
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 6.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 800: NULL
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 8.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 1000: NULL
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 10.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 1200: NULL
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 12.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 1400: NULL
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 14.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 1600: NULL
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 16.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 1800: NULL
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 18.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 2000: NULL
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 20.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 2200: NULL
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 22.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 2400: NULL
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 24.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 2600: NULL
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 26.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 2800: NULL
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 28.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 3000: NULL
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 30.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 3200: NULL
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 32.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 3400: NULL
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 34.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 3600: NULL
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 36.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 3800: NULL
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 38.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 4000: NULL
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 40.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 4200: NULL
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.01
NULL : sdo[0x5003][15] = 42.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 64 : NULL
LdCurrentSet = 4400: NULL
#verify fault #1
NULL : MeterCurrent = 0  | 0.01 | 0.01
NULL : sdo[0x5003][15] = 0 | 0 | 0.01
NULL : sdo[0x5001][6] = 32 | 0 | 0.01

#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J3_03 = 0 : NULL
#read signal value to update
NULL : sdo[0x5003][15] = 0 | 155 | 0.01
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][6] = 0 | 0 | 0.01
#-----disable load-----
LdEnable = 0 : NULL
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][8] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J3_04 = 1 : NULL

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 0: NULL
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 0.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 200: NULL
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 2.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 400: NULL
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 4.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 600: NULL
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 6.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 800: NULL
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 8.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 1000: NULL
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 10.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 1200: NULL
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 12.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 1400: NULL
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 14.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 1600: NULL
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 16.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 1800: NULL
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 18.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 2000: NULL
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 20.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 2200: NULL
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 22.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 2400: NULL
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 24.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 2600: NULL
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 26.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 2800: NULL
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 28.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 3000: NULL
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 30.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 3200: NULL
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 32.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 3400: NULL
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 34.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 3600: NULL
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 36.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 3800: NULL
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 38.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 4000: NULL
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 40.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 4200: NULL
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.01
NULL : sdo[0x5003][16] = 42.0 | 10 | 0.01

#set current and turn on output and verify feedback
LdEnable = 1 : NULL
sdo[0x6200][2] = 128 : NULL
LdCurrentSet = 4400: NULL
#verify fault #1
NULL : MeterCurrent = 0  | 0.01 | 0.01
NULL : sdo[0x5003][16] = 0 | 0 | 0.01
NULL : sdo[0x5001][6] = 128 | 0 | 0.01

#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J3_04 = 0 : NULL
#read signal value to update
NULL : sdo[0x5003][16] = 0 | 155 | 0.01
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][6] = 0 | 0 | 0.01
LdRemote = 0 : NULL
LdEnable = 0 : NULL
J0_08_METER_LOAD = 0 : NULL
PRE_OPERATIONAL
SAVE
END
#switch in load line, set current
J2_02 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault #1 clear
NULL : sdo[0x5001][3] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 2 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][3] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 2 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][3] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 2 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][3] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 2 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_02 = 0 : NULL
LdCurrentSet = 0 : NULL
#switch in load line, set current
J2_03 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault #1 clear
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 4 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][3] = 32 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 4 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][3] = 32 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 4 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][3] = 32 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 4 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][3] = 32 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][3] = 32 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_03 = 0 : NULL
LdCurrentSet = 0 : NULL
#switch in load line, set current
J2_04 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault #1 clear
NULL : sdo[0x5001][3] = 40 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 8 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][3] = 128 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][3] = 40 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 8 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][3] = 128 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][3] = 40 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 8 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][3] = 128 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][3] = 40 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 8 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][3] = 128 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][3] = 128 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_04 = 0 : NULL
LdCurrentSet = 0 : NULL
#switch in load line, set current
J2_06 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault #1 clear
NULL : sdo[0x5001][4] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 32 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][4] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 32 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][4] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 32 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][4] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 32 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_06 = 0 : NULL
LdCurrentSet = 0 : NULL
#switch in load line, set current
J2_07 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault #1 clear
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 64 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][4] = 32 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 64 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][4] = 32 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 64 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][4] = 32 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 64 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][4] = 32 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][4] = 32 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_07 = 0 : NULL
LdCurrentSet = 0 : NULL
#switch in load line, set current
J2_08 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault #1 clear
NULL : sdo[0x5001][4] = 40 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 128 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][4] = 128 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][4] = 40 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 128 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][4] = 128 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][4] = 40 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 128 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][4] = 128 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][4] = 40 | 0 | 0.01
#turn ON output
sdo[0x6200][1] = 128 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][4] = 128 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][1] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][4] = 128 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_08 = 0 : NULL
LdCurrentSet = 0 : NULL
#switch in load line, set current
J2_09 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault #1 clear
NULL : sdo[0x5001][5] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 1 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][5] = 2 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][5] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 1 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][5] = 2 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][5] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 1 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][5] = 2 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][5] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 1 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][5] = 2 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][5] = 2 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J2_09 = 0 : NULL
LdCurrentSet = 0 : NULL
#switch in load line, set current
J2_10 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault #1 clear
NULL : sdo[0x5001][5] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 2 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][5] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][5] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 2 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][5] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][5] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 2 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][5] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][5] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 2 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][5] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][5] = 8 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J2_10 = 0 : NULL
LdCurrentSet = 0 : NULL
#switch in load line, set current
J2_11 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault #1 clear
NULL : sdo[0x5001][5] = 8 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 4 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][5] = 32 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][5] = 8 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 4 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][5] = 32 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][5] = 8 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 4 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][5] = 32 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][5] = 8 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 4 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][5] = 32 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][5] = 32 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J2_11 = 0 : NULL
LdCurrentSet = 0 : NULL
#switch in load line, set current
J2_12 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault #1 clear
NULL : sdo[0x5001][5] = 40 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 8 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][5] = 128 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][5] = 40 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 8 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][5] = 128 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][5] = 40 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 8 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][5] = 128 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][5] = 40 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 8 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][5] = 128 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][5] = 128 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J2_12 = 0 : NULL
LdCurrentSet = 0 : NULL
#switch in load line, set current
J3_01 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault #1 clear
NULL : sdo[0x5001][6] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 16 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][6] = 2 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][6] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 16 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][6] = 2 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][6] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 16 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][6] = 2 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][6] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 16 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][6] = 2 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][6] = 2 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J3_01 = 0 : NULL
LdCurrentSet = 0 : NULL
#switch in load line, set current
J3_02 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault #1 clear
NULL : sdo[0x5001][6] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 32 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][6] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][6] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 32 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][6] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][6] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 32 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][6] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][6] = 0 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 32 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][6] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][6] = 8 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J3_02 = 0 : NULL
LdCurrentSet = 0 : NULL
#switch in load line, set current
J3_03 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault #1 clear
NULL : sdo[0x5001][6] = 8 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 64 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][6] = 32 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][6] = 8 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 64 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][6] = 32 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][6] = 8 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 64 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][6] = 32 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][6] = 8 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 64 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][6] = 32 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][6] = 32 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J3_03 = 0 : NULL
LdCurrentSet = 0 : NULL
#switch in load line, set current
J3_04 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault #1 clear
NULL : sdo[0x5001][6] = 40 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 128 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][6] = 128 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][6] = 40 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 128 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][6] = 128 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][6] = 40 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 128 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][6] = 128 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][6] = 40 | 0 | 0.01
#turn ON output
sdo[0x6200][2] = 128 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][6] = 128 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF output
sdo[0x6200][2] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][6] = 128 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J3_04 = 0 : NULL
LdCurrentSet = 0 : NULL
NULL : sdo[0x5001][3] = 170 | 0 | 0.001
NULL : sdo[0x5001][4] = 170 | 0 | 0.001
NULL : sdo[0x5001][5] = 170 | 0 | 0.001
NULL : sdo[0x5001][6] = 170 | 0 | 0.001
LdRemote = 0 : NULL
LdEnable = 0 : NULL
J0_08_METER_LOAD = 0 : NULL
PRE_OPERATIONAL
SAVE
END
