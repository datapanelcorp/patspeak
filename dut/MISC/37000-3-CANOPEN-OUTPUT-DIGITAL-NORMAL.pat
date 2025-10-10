#37000-3
#Verion 0.0
#digital normal test using the E-LOAD
UUT_EDS = 37000-563.eds
UUT_DATANAME = 37000-3-CANOPEN-OUTPUT-DIGITAL-NORMAL

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
sdo[0x2000][1] = 0 : NULL
#switch in load line, set current
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][1] = 17 : NULL
#switch in load line, set current
J2_02 = 1 : NULL

#set current and turn on output and verify feedback
LdCurrentSet = 0: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 0.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 1.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 2.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 3.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 4.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 5.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 6.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 7.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 8.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 9.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 10.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 11.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 12.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 13.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 14.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 15.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 16.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 17.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 18.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 19.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 20.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 21.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 22.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 23.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 24.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 25.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 26.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 27.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 28.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 29.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 30.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 31.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 32.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 33.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 34.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 35.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 36.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 37.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 38.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 39.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 40.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 41.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 42.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 43.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify reading  Output1B
NULL : sdo[0x5003][2] = 44.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output1B
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#verify fault Output1B
NULL : sdo[0x5003][2] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][3] = 8 | 0 | 0.1
#verify reading from load
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_02 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][2] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][3] = 8 | 0 | 0.1
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][2] = 17 : NULL
#switch in load line, set current
J2_03 = 1 : NULL

#set current and turn on output and verify feedback
LdCurrentSet = 0: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 0.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 1.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 2.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 3.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 4.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 5.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 6.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 7.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 8.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 9.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 10.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 11.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 12.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 13.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 14.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 15.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 16.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 17.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 18.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 19.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 20.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 21.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 22.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 23.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 24.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 25.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 26.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 27.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 28.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 29.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 30.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 31.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 32.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 33.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 34.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 35.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 36.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 37.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 38.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 39.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 40.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 41.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 42.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 43.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify reading  Output2A
NULL : sdo[0x5003][3] = 44.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2A
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#verify fault Output2A
NULL : sdo[0x5003][3] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][3] = 40 | 0 | 0.1
#verify reading from load
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_03 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][3] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][3] = 40 | 0 | 0.1
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][2] = 17 : NULL
#switch in load line, set current
J2_04 = 1 : NULL

#set current and turn on output and verify feedback
LdCurrentSet = 0: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 0.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 1.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 2.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 3.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 4.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 5.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 6.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 7.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 8.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 9.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 10.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 11.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 12.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 13.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 14.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 15.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 16.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 17.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 18.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 19.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 20.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 21.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 22.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 23.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 24.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 25.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 26.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 27.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 28.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 29.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 30.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 31.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 32.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 33.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 34.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 35.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 36.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 37.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 38.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 39.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 40.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 41.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 42.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 43.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify reading  Output2B
NULL : sdo[0x5003][4] = 44.0 | 2 | 0.5
NULL : sdo[0x5001][3] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output2B
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#verify fault Output2B
NULL : sdo[0x5003][4] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][3] = 168 | 0 | 0.1
#verify reading from load
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_04 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][4] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][3] = 168 | 0 | 0.1
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][3] = 17 : NULL
#switch in load line, set current
J2_06 = 1 : NULL

#set current and turn on output and verify feedback
LdCurrentSet = 0: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 0.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 1.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 2.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 3.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 4.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 5.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 6.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 7.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 8.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 9.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 10.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 11.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 12.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 13.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 14.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 15.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 16.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 17.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 18.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 19.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 20.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 21.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 22.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 23.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 24.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 25.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 26.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 27.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 28.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 29.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 30.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 31.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 32.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 33.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 34.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 35.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 36.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 37.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 38.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 39.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 40.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 41.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 42.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 43.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify reading  Output3B
NULL : sdo[0x5003][6] = 44.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output3B
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#verify fault Output3B
NULL : sdo[0x5003][6] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 8 | 0 | 0.1
#verify reading from load
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_06 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][6] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][4] = 8 | 0 | 0.1
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][4] = 17 : NULL
#switch in load line, set current
J2_07 = 1 : NULL

#set current and turn on output and verify feedback
LdCurrentSet = 0: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 0.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 1.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 2.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 3.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 4.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 5.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 6.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 7.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 8.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 9.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 10.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 11.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 12.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 13.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 14.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 15.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 16.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 17.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 18.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 19.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 20.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 21.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 22.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 23.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 24.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 25.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 26.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 27.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 28.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 29.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 30.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 31.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 32.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 33.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 34.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 35.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 36.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 37.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 38.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 39.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 40.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 41.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 42.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 43.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify reading  Output4A
NULL : sdo[0x5003][7] = 44.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 24 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4A
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#verify fault Output4A
NULL : sdo[0x5003][7] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 40 | 0 | 0.1
#verify reading from load
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_07 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][7] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][4] = 40 | 0 | 0.1
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][4] = 17 : NULL
#switch in load line, set current
J2_08 = 1 : NULL

#set current and turn on output and verify feedback
LdCurrentSet = 0: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 0.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 1.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 2.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 3.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 4.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 5.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 6.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 7.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 8.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 9.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 10.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 11.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 12.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 13.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 14.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 15.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 16.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 17.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 18.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 19.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 20.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 21.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 22.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 23.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 24.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 25.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 26.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 27.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 28.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 29.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 30.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 31.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 32.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 33.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 34.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 35.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 36.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 37.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 38.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 39.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 40.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 41.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 42.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 43.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify reading  Output4B
NULL : sdo[0x5003][8] = 44.0 | 2 | 0.5
NULL : sdo[0x5001][4] = 104 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output4B
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#verify fault Output4B
NULL : sdo[0x5003][8] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 168 | 0 | 0.1
#verify reading from load
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_08 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][8] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][4] = 168 | 0 | 0.1
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][5] = 17 : NULL
#switch in load line, set current
J2_09 = 1 : NULL

#set current and turn on output and verify feedback
LdCurrentSet = 0: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 0.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 1.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 2.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 3.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 4.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 5.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 6.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 7.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 8.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 9.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 10.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 11.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 12.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 13.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 14.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 15.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 16.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 17.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 18.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 19.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 20.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 21.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 22.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 23.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 24.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 25.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 26.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 27.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 28.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 29.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 30.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 31.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 32.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 33.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 34.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 35.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 36.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 37.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 38.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 39.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 40.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 41.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 42.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 43.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify reading  Output5A
NULL : sdo[0x5003][9] = 44.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5A
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#verify fault Output5A
NULL : sdo[0x5003][9] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][5] = 2 | 0 | 0.1
#verify reading from load
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL : WAIT = 0.1
J2_09 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][9] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][5] = 2 | 0 | 0.1
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][5] = 17 : NULL
#switch in load line, set current
J2_10 = 1 : NULL

#set current and turn on output and verify feedback
LdCurrentSet = 0: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 0.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 1.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 2.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 3.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 4.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 5.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 6.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 7.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 8.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 9.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 10.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 11.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 12.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 13.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 14.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 15.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 16.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 17.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 18.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 19.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 20.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 21.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 22.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 23.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 24.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 25.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 26.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 27.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 28.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 29.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 30.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 31.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 32.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 33.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 34.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 35.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 36.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 37.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 38.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 39.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 40.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 41.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 42.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 43.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify reading  Output5B
NULL : sdo[0x5003][10] = 44.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output5B
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#verify fault Output5B
NULL : sdo[0x5003][10] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][5] = 10 | 0 | 0.1
#verify reading from load
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL : WAIT = 0.1
J2_10 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][10] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][5] = 10 | 0 | 0.1
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][6] = 17 : NULL
#switch in load line, set current
J2_11 = 1 : NULL

#set current and turn on output and verify feedback
LdCurrentSet = 0: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 0.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 1.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 2.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 3.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 4.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 5.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 6.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 7.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 8.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 9.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 10.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 11.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 12.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 13.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 14.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 15.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 16.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 17.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 18.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 19.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 20.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 21.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 22.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 23.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 24.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 25.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 26.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 27.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 28.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 29.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 30.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 31.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 32.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 33.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 34.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 35.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 36.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 37.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 38.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 39.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 40.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 41.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 42.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 43.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify reading  Output6A
NULL : sdo[0x5003][11] = 44.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6A
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#verify fault Output6A
NULL : sdo[0x5003][11] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][5] = 42 | 0 | 0.1
#verify reading from load
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL : WAIT = 0.1
J2_11 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][11] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][5] = 42 | 0 | 0.1
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][6] = 17 : NULL
#switch in load line, set current
J2_12 = 1 : NULL

#set current and turn on output and verify feedback
LdCurrentSet = 0: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 0.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 1.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 2.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 3.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 4.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 5.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 6.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 7.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 8.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 9.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 10.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 11.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 12.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 13.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 14.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 15.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 16.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 17.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 18.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 19.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 20.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 21.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 22.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 23.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 24.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 25.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 26.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 27.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 28.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 29.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 30.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 31.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 32.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 33.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 34.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 35.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 36.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 37.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 38.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 39.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 40.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 41.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 42.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 43.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify reading  Output6B
NULL : sdo[0x5003][12] = 44.0 | 2 | 0.5
NULL : sdo[0x5001][5] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output6B
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#verify fault Output6B
NULL : sdo[0x5003][12] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][5] = 170 | 0 | 0.1
#verify reading from load
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL : WAIT = 0.1
J2_12 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][12] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][5] = 170 | 0 | 0.1
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][7] = 17 : NULL
#switch in load line, set current
J3_01 = 1 : NULL

#set current and turn on output and verify feedback
LdCurrentSet = 0: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 0.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 1.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 2.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 3.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 4.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 5.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 6.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 7.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 8.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 9.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 10.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 11.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 12.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 13.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 14.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 15.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 16.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 17.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 18.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 19.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 20.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 21.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 22.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 23.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 24.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 25.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 26.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 27.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 28.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 29.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 30.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 31.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 32.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 33.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 34.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 35.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 36.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 37.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 38.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 39.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 40.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 41.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 42.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 43.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify reading  Output7A
NULL : sdo[0x5003][13] = 44.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 1 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7A
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#verify fault Output7A
NULL : sdo[0x5003][13] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][6] = 2 | 0 | 0.1
#verify reading from load
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL : WAIT = 0.1
J3_01 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][13] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][6] = 2 | 0 | 0.1
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][7] = 17 : NULL
#switch in load line, set current
J3_02 = 1 : NULL

#set current and turn on output and verify feedback
LdCurrentSet = 0: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 0.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 1.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 2.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 3.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 4.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 5.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 6.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 7.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 8.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 9.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 10.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 11.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 12.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 13.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 14.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 15.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 16.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 17.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 18.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 19.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 20.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 21.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 22.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 23.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 24.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 25.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 26.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 27.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 28.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 29.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 30.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 31.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 32.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 33.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 34.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 35.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 36.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 37.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 38.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 39.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 40.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 41.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 42.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 43.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify reading  Output7B
NULL : sdo[0x5003][14] = 44.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 6 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output7B
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#verify fault Output7B
NULL : sdo[0x5003][14] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][6] = 10 | 0 | 0.1
#verify reading from load
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL : WAIT = 0.1
J3_02 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][14] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][6] = 10 | 0 | 0.1
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][8] = 17 : NULL
#switch in load line, set current
J3_03 = 1 : NULL

#set current and turn on output and verify feedback
LdCurrentSet = 0: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 0.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 1.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 2.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 3.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 4.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 5.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 6.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 7.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 8.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 9.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 10.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 11.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 12.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 13.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 14.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 15.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 16.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 17.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 18.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 19.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 20.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 21.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 22.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 23.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 24.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 25.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 26.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 27.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 28.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 29.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 30.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 31.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 32.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 33.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 34.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 35.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 36.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 37.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 38.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 39.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 40.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 41.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 42.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 43.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify reading  Output8A
NULL : sdo[0x5003][15] = 44.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 26 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8A
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#verify fault Output8A
NULL : sdo[0x5003][15] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][6] = 42 | 0 | 0.1
#verify reading from load
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL : WAIT = 0.1
J3_03 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][15] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][6] = 42 | 0 | 0.1
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][8] = 17 : NULL
#switch in load line, set current
J3_04 = 1 : NULL

#set current and turn on output and verify feedback
LdCurrentSet = 0: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 0.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 1.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 2.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 3.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 4.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 5.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 6.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 7.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 8.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 9.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 10.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 11.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 12.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 13.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 14.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 15.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 16.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 17.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 18.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 19.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 20.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 21.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 22.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 23.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 24.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 25.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 26.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 27.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 28.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 29.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 30.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 31.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 32.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 33.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 34.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 35.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 36.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 37.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 38.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 39.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 40.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 41.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 42.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 43.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify reading  Output8B
NULL : sdo[0x5003][16] = 44.0 | 2 | 0.5
NULL : sdo[0x5001][6] = 106 | 0.01 | 0.1
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500: NULL : WAIT = 0.1
LdEnable = 1 : NULL
#TESING Output8B
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#verify fault Output8B
NULL : sdo[0x5003][16] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][6] = 170 | 0 | 0.1
#verify reading from load
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL : WAIT = 0.1
J3_04 = 0 : NULL : WAIT = 0.5
#read signal value to update
NULL : sdo[0x5003][16] = 0 | 155 | 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][6] = 170 | 0 | 0.1
NULL : sdo[0x5001][3] = 168 | 0 | 0.1
NULL : sdo[0x5001][4] = 168 | 0 | 0.1
NULL : sdo[0x5001][5] = 170 | 0 | 0.1
NULL : sdo[0x5001][6] = 170 | 0 | 0.1
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
PRE_OPERATIONAL
SAVE
END
