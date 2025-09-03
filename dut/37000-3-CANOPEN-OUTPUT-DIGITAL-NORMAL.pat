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
