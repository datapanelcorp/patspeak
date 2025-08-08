#37000-1
#Verion 0.0
#digital normal test using the E-LOAD
UUT_EDS = 37000-561.eds
UUT_DATANAME = 37000-1-CANOPEN-OUTPUT-DIGITAL-NORMAL

PRE_OPERATIONAL
#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1
NULL : sdo[0x5001][3] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 0 | 0.1 | 0.1
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2001][1] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 0 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 400 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 600 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 700 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 800 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 900 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1400 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1600 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1700 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1800 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1900 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2400 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2600 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2700 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2800 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2900 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3400 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3600 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3700 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3800 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3900 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 4000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 4100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 4200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 4300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4400: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][1] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][3] = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][1] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][3] = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_01 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][1] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][3] = 0 | 0.1 | 0.1
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2001][1] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5
OPERATIONAL

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 0 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 400 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 600 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 700 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 800 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 900 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 1000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 1100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 1200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 1300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 1400 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 1500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 1600 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 1700 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 1800 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 1900 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 2000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 2100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 2200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 2300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 2400 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 2500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 2600 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 2700 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 2800 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 2900 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 3000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 3100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 3200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 3300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 3400 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 3500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 3600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 3600 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 3700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 3700 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 3800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 3800 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 3900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 3900 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 4000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 4100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 4100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 4200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 4200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 4300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 4300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 4400: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][2] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][3] = 8 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][2] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][3] = 8 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_02 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][2] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][3] = 0 | 0.1 | 0.1
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2001][2] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5
OPERATIONAL

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 0 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 400 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 600 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 700 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 800 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 900 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 1000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 1100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 1200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 1300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 1400 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 1500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 1600 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 1700 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 1800 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 1900 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 2000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 2100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 2200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 2300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 2400 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 2500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 2600 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 2700 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 2800 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 2900 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 3000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 3100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 3200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 3300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 3400 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 3500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 3600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 3600 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 3700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 3700 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 3800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 3800 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 3900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 3900 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 4000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 4100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 4100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 4200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 4200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 4300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 4300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 4400: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][3] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][3] = 32 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][3] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][3] = 32 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_03 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][3] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][3] = 0 | 0.1 | 0.1
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2001][2] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5
OPERATIONAL

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 0 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 400 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 600 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 700 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 800 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 900 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 1000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 1100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 1200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 1300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 1400 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 1500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 1600 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 1700 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 1800 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 1900 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 2000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 2100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 2200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 2300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 2400 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 2500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 2600 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 2700 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 2800 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 2900 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 3000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 3100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 3200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 3300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 3400 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 3500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 3600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 3600 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 3700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 3700 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 3800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 3800 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 3900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 3900 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 4000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 4100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 4100 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 4200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 4200 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 4300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 4300 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 4400: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][4] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][3] = 128 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][4] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][3] = 128 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_04 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][4] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][3] = 0 | 0.1 | 0.1
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2001][3] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5
OPERATIONAL

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 0 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 400 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 600 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 700 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 800 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 900 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 1000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 1100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 1200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 1300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 1400 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 1500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 1600 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 1700 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 1800 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 1900 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 2000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 2100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 2200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 2300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 2400 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 2500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 2600 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 2700 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 2800 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 2900 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 3000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 3100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 3200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 3300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 3400 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 3500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 3600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 3600 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 3700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 3700 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 3800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 3800 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 3900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 3900 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 4000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 4100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 4100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 4200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 4200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 4300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 4300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 4400: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][5] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][5] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_05 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][5] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][4] = 0 | 0.1 | 0.1
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2001][3] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5
OPERATIONAL

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 0 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 400 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 600 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 700 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 800 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 900 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 1000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 1100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 1200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 1300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 1400 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 1500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 1600 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 1700 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 1800 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 1900 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 2000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 2100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 2200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 2300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 2400 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 2500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 2600 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 2700 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 2800 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 2900 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 3000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 3100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 3200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 3300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 3400 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 3500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 3600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 3600 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 3700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 3700 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 3800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 3800 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 3900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 3900 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 4000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 4100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 4100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 4200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 4200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 4300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 4300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 4400: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][6] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 8 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][6] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 8 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_06 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][6] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][4] = 0 | 0.1 | 0.1
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2001][4] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5
OPERATIONAL

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 0 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 400 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 600 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 700 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 800 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 900 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 1000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 1100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 1200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 1300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 1400 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 1500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 1600 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 1700 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 1800 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 1900 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 2000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 2100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 2200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 2300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 2400 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 2500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 2600 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 2700 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 2800 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 2900 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 3000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 3100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 3200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 3300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 3400 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 3500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 3600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 3600 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 3700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 3700 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 3800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 3800 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 3900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 3900 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 4000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 4100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 4100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 4200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 4200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 4300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 4300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 4400: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][7] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 32 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][7] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 32 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_07 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][7] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][4] = 0 | 0.1 | 0.1
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2001][4] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5
OPERATIONAL

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 0 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 400 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 600 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 700 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 800 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 900 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 1000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 1100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 1200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 1300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 1400 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 1500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 1600 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 1700 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 1800 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 1900 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 2000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 2100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 2200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 2300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 2400 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 2500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 2600 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 2700 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 2800 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 2900 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 3000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 3100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 3200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 3300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 3400 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 3500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 3600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 3600 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 3700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 3700 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 3800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 3800 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 3900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 3900 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 4000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 4100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 4100 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 4200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 4200 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 4300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 4300 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 4400: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][8] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 128 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][8] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 128 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_08 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][8] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][4] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][3] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 0 | 0.1 | 0.1
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1


#verify fault #1 clear
NULL : sdo[0x5001][3] = 0 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : sdo[0x5001][3] = 2 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #2 clear
NULL : sdo[0x5001][3] = 0 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : sdo[0x5001][3] = 2 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #3 clear
NULL : sdo[0x5001][3] = 0 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : sdo[0x5001][3] = 2 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #4 clear
NULL : sdo[0x5001][3] = 0 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : sdo[0x5001][3] = 2 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #5 sticks
NULL : sdo[0x5001][3] = 2 | 0.1 | 0.1
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_01 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1


#verify fault #1 clear
NULL : sdo[0x5001][3] = 2 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : sdo[0x5001][3] = 10 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #2 clear
NULL : sdo[0x5001][3] = 2 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : sdo[0x5001][3] = 10 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #3 clear
NULL : sdo[0x5001][3] = 2 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : sdo[0x5001][3] = 10 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #4 clear
NULL : sdo[0x5001][3] = 2 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : sdo[0x5001][3] = 10 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #5 sticks
NULL : sdo[0x5001][3] = 10 | 0.1 | 0.1
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_02 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1


#verify fault #1 clear
NULL : sdo[0x5001][3] = 10 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : sdo[0x5001][3] = 42 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #2 clear
NULL : sdo[0x5001][3] = 10 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : sdo[0x5001][3] = 42 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #3 clear
NULL : sdo[0x5001][3] = 10 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : sdo[0x5001][3] = 42 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #4 clear
NULL : sdo[0x5001][3] = 10 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : sdo[0x5001][3] = 42 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #5 sticks
NULL : sdo[0x5001][3] = 42 | 0.1 | 0.1
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_03 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1


#verify fault #1 clear
NULL : sdo[0x5001][3] = 42 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : sdo[0x5001][3] = 170 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #2 clear
NULL : sdo[0x5001][3] = 42 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : sdo[0x5001][3] = 170 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #3 clear
NULL : sdo[0x5001][3] = 42 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : sdo[0x5001][3] = 170 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #4 clear
NULL : sdo[0x5001][3] = 42 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : sdo[0x5001][3] = 170 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #5 sticks
NULL : sdo[0x5001][3] = 170 | 0.1 | 0.1
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_04 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1


#verify fault #1 clear
NULL : sdo[0x5001][4] = 0 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : sdo[0x5001][4] = 2 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #2 clear
NULL : sdo[0x5001][4] = 0 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : sdo[0x5001][4] = 2 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #3 clear
NULL : sdo[0x5001][4] = 0 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : sdo[0x5001][4] = 2 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #4 clear
NULL : sdo[0x5001][4] = 0 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : sdo[0x5001][4] = 2 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #5 sticks
NULL : sdo[0x5001][4] = 2 | 0.1 | 0.1
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_05 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1


#verify fault #1 clear
NULL : sdo[0x5001][4] = 2 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : sdo[0x5001][4] = 10 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #2 clear
NULL : sdo[0x5001][4] = 2 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : sdo[0x5001][4] = 10 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #3 clear
NULL : sdo[0x5001][4] = 2 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : sdo[0x5001][4] = 10 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #4 clear
NULL : sdo[0x5001][4] = 2 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : sdo[0x5001][4] = 10 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #5 sticks
NULL : sdo[0x5001][4] = 10 | 0.1 | 0.1
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_06 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1


#verify fault #1 clear
NULL : sdo[0x5001][4] = 10 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : sdo[0x5001][4] = 42 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #2 clear
NULL : sdo[0x5001][4] = 10 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : sdo[0x5001][4] = 42 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #3 clear
NULL : sdo[0x5001][4] = 10 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : sdo[0x5001][4] = 42 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #4 clear
NULL : sdo[0x5001][4] = 10 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : sdo[0x5001][4] = 42 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #5 sticks
NULL : sdo[0x5001][4] = 42 | 0.1 | 0.1
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_07 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1


#verify fault #1 clear
NULL : sdo[0x5001][4] = 42 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : sdo[0x5001][4] = 170 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #2 clear
NULL : sdo[0x5001][4] = 42 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : sdo[0x5001][4] = 170 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #3 clear
NULL : sdo[0x5001][4] = 42 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : sdo[0x5001][4] = 170 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #4 clear
NULL : sdo[0x5001][4] = 42 | 0 | 0.1
#turn ON output
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : sdo[0x5001][4] = 170 | 0.1 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1

#verify fault #5 sticks
NULL : sdo[0x5001][4] = 170 | 0.1 | 0.1
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_08 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][3] = 170 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 170 | 0.1 | 0.1
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
PRE_OPERATIONAL
SAVE
END
