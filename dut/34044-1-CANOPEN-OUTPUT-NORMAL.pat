#34044-1
#Verion 0.0
#digital normal test using the E-LOAD
UUT_EDS = 37000-561.eds
UUT_DATANAME = 34044-1-CANOPEN-OUTPUT-NORMAL

NULL : sdo[0x5001][3] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 0 | 0.1 | 0.1
#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2001][1] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 0 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 1500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 2500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 3500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][1] = 4000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 1 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][1] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][3] = 2 | 0.1 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_01 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][3] = 0 | 0.1 | 0.1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2001][1] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 0 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 1000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 1500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 2000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 2500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 3000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 3500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][2] = 4000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 4 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][2] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][3] = 8 | 0.1 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_02 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][3] = 0 | 0.1 | 0.1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2001][2] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 0 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 1000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 1500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 2000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 2500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 3000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 3500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][3] = 4000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 16 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][3] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][3] = 32 | 0.1 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_03 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][3] = 0 | 0.1 | 0.1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2001][2] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 0 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 1000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 1500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 2000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 2500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 3000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 3500 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][4] = 4000 | 1000 | 0.1
NULL : sdo[0x5001][3] = 64 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][4] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][3] = 128 | 0.1 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_04 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][3] = 0 | 0.1 | 0.1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2001][3] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 0 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 1000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 1500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 2000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 2500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 3000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 3500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][5] = 4000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 1 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][5] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 2 | 0.1 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_05 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][4] = 0 | 0.1 | 0.1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2001][3] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 0 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 1000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 1500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 2000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 2500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 3000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 3500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][6] = 4000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 4 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][6] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 8 | 0.1 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_06 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][4] = 0 | 0.1 | 0.1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2001][4] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 0 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 1000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 1500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 2000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 2500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 3000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 3500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][7] = 4000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 16 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][7] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 32 | 0.1 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_07 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : sdo[0x5001][4] = 0 | 0.1 | 0.1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2001][4] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 0 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 1000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 1500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 2000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 2500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 3000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 3500 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : sdo[0x5003][8] = 4000 | 1000 | 0.1
NULL : sdo[0x5001][4] = 64 | 0.01 | 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : sdo[0x5003][8] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 128 | 0.1 | 0.1

#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_08 = 0 : NULL : WAIT = 0.5
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
SAVE
END
