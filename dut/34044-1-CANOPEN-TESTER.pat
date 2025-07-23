#34044-1
#Verion 0.0
#digital normal test using the E-LOAD
UUT_EDS = 37000-561.eds
UUT_DATANAME = 34044-1-CANOPEN-TESTER

#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2000][1] = 0 : NULL : WAIT = 0.2
sdo[0x2001][1] = 0x11 : NULL : WAIT = 0.2
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 0 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 100 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 200 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 300 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 400 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 500 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 600 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 700 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 800 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 900 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1000 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1100 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1200 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1300 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1400 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1500 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1600 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1700 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1800 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1900 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2000 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2100 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2200 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2300 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2400 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2500 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2600 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2700 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2800 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2900 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3000 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3100 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3200 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3300 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3400 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3500 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3600: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3600 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3700: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3700 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3800: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3800 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3900: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3900 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 4000 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4100: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 4100 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4200: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 4200 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4300: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 4300 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4400: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 4400 | 1000 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][1] = 0 | 0.1 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_01 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][1] = 0 | 0.1 | 0.1
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
SAVE
END
