#37000-4
#Verion 0.0
#digital normal test using the E-LOAD
UUT_EDS = 37000-564.eds
UUT_DATANAME = 37000-4-CANOPEN-OUTPUT-SHORT

PRE_OPERATIONAL
PAUSE-MANUALLY ACTIVATE SHORT ON E_LOAD
#-----setup PAT-----
#setup load
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1
NULL : sdo[0x5001][3] = 0 | 0.1 | 0.1
NULL : sdo[0x5001][4] = 0 | 0.1 | 0.1
OPERATIONAL
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 0 : NULL : WAIT = 0.2
sdo[0x2001][1] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5
sdo[0x2005][1] = 0 : NULL : WAIT = 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 1 : NULL : WAIT = 0.1
#check feedback is 0
NULL : sdo[0x5003][1] = 0 | 0 | 0.1
#check fault is set
NULL : sdo[0x5001][3] = 2 | 0 | 0.1
#check fault code
NULL : sdo[0x5000][3] = 1 | 0 | 0.1
#switch out load line
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_01 = 0 : NULL : WAIT = 0.5
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 0 : NULL : WAIT = 0.2
sdo[0x2001][1] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5
sdo[0x2005][1] = 1 : NULL : WAIT = 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 2 : NULL : WAIT = 0.1
#check feedback is 0
NULL : sdo[0x5003][1] = 0 | 0 | 0.1
#check fault is set
NULL : sdo[0x5001][3] = 10 | 0 | 0.1
#check fault code
NULL : sdo[0x5000][3] = 1 | 0 | 0.1
#switch out load line
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_02 = 0 : NULL : WAIT = 0.5
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 0 : NULL : WAIT = 0.2
sdo[0x2001][2] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5
sdo[0x2005][1] = 0 : NULL : WAIT = 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 4 : NULL : WAIT = 0.1
#check feedback is 0
NULL : sdo[0x5003][2] = 0 | 0 | 0.1
#check fault is set
NULL : sdo[0x5001][3] = 42 | 0 | 0.1
#check fault code
NULL : sdo[0x5000][3] = 1 | 0 | 0.1
#switch out load line
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_03 = 0 : NULL : WAIT = 0.5
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 0 : NULL : WAIT = 0.2
sdo[0x2001][2] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5
sdo[0x2005][1] = 2 : NULL : WAIT = 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 8 : NULL : WAIT = 0.1
#check feedback is 0
NULL : sdo[0x5003][2] = 0 | 0 | 0.1
#check fault is set
NULL : sdo[0x5001][3] = 170 | 0 | 0.1
#check fault code
NULL : sdo[0x5000][3] = 1 | 0 | 0.1
#switch out load line
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_04 = 0 : NULL : WAIT = 0.5
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 0 : NULL : WAIT = 0.2
sdo[0x2001][3] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5
sdo[0x2005][1] = 0 : NULL : WAIT = 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 16 : NULL : WAIT = 0.1
#check feedback is 0
NULL : sdo[0x5003][3] = 0 | 0 | 0.1
#check fault is set
NULL : sdo[0x5001][4] = 2 | 0 | 0.1
#check fault code
NULL : sdo[0x5000][3] = 1 | 0 | 0.1
#switch out load line
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_05 = 0 : NULL : WAIT = 0.5
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 0 : NULL : WAIT = 0.2
sdo[0x2001][3] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5
sdo[0x2005][1] = 4 : NULL : WAIT = 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 32 : NULL : WAIT = 0.1
#check feedback is 0
NULL : sdo[0x5003][3] = 0 | 0 | 0.1
#check fault is set
NULL : sdo[0x5001][4] = 10 | 0 | 0.1
#check fault code
NULL : sdo[0x5000][3] = 1 | 0 | 0.1
#switch out load line
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_06 = 0 : NULL : WAIT = 0.5
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 0 : NULL : WAIT = 0.2
sdo[0x2001][4] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5
sdo[0x2005][1] = 0 : NULL : WAIT = 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 64 : NULL : WAIT = 0.1
#check feedback is 0
NULL : sdo[0x5003][4] = 0 | 0 | 0.1
#check fault is set
NULL : sdo[0x5001][4] = 42 | 0 | 0.1
#check fault code
NULL : sdo[0x5000][3] = 1 | 0 | 0.1
#switch out load line
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_07 = 0 : NULL : WAIT = 0.5
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 0 : NULL : WAIT = 0.2
sdo[0x2001][4] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5
sdo[0x2005][1] = 8 : NULL : WAIT = 0.1

#set current and turn on output and verify feedback
sdo[0x6200][1] = 128 : NULL : WAIT = 0.1
#check feedback is 0
NULL : sdo[0x5003][4] = 0 | 0 | 0.1
#check fault is set
NULL : sdo[0x5001][4] = 170 | 0 | 0.1
#check fault code
NULL : sdo[0x5000][3] = 1 | 0 | 0.1
#switch out load line
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
J2_08 = 0 : NULL : WAIT = 0.5
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 0 : NULL : WAIT = 0.2
sdo[0x2001][5] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_09 = 1 : NULL : WAIT = 0.5
sdo[0x2005][1] = 0 : NULL : WAIT = 0.1

#set current and turn on output and verify feedback
sdo[0x6200][2] = 1 : NULL : WAIT = 0.1
#check feedback is 0
NULL : sdo[0x5003][5] = 0 | 0 | 0.1
#check fault is set
NULL : sdo[0x5001][5] = 2 | 0 | 0.1
#check fault code
NULL : sdo[0x5000][3] = 1 | 0 | 0.1
#switch out load line
sdo[0x6200][2] = 0 : NULL : WAIT = 0.1
J2_09 = 0 : NULL : WAIT = 0.5
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 0 : NULL : WAIT = 0.2
sdo[0x2001][5] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_10 = 1 : NULL : WAIT = 0.5
sdo[0x2005][1] = 16 : NULL : WAIT = 0.1

#set current and turn on output and verify feedback
sdo[0x6200][2] = 2 : NULL : WAIT = 0.1
#check feedback is 0
NULL : sdo[0x5003][5] = 0 | 0 | 0.1
#check fault is set
NULL : sdo[0x5001][5] = 10 | 0 | 0.1
#check fault code
NULL : sdo[0x5000][3] = 1 | 0 | 0.1
#switch out load line
sdo[0x6200][2] = 0 : NULL : WAIT = 0.1
J2_10 = 0 : NULL : WAIT = 0.5
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 0 : NULL : WAIT = 0.2
sdo[0x2001][6] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_11 = 1 : NULL : WAIT = 0.5
sdo[0x2005][1] = 0 : NULL : WAIT = 0.1

#set current and turn on output and verify feedback
sdo[0x6200][2] = 4 : NULL : WAIT = 0.1
#check feedback is 0
NULL : sdo[0x5003][6] = 0 | 0 | 0.1
#check fault is set
NULL : sdo[0x5001][5] = 42 | 0 | 0.1
#check fault code
NULL : sdo[0x5000][3] = 1 | 0 | 0.1
#switch out load line
sdo[0x6200][2] = 0 : NULL : WAIT = 0.1
J2_11 = 0 : NULL : WAIT = 0.5
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 0 : NULL : WAIT = 0.2
sdo[0x2001][6] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J2_12 = 1 : NULL : WAIT = 0.5
sdo[0x2005][1] = 32 : NULL : WAIT = 0.1

#set current and turn on output and verify feedback
sdo[0x6200][2] = 8 : NULL : WAIT = 0.1
#check feedback is 0
NULL : sdo[0x5003][6] = 0 | 0 | 0.1
#check fault is set
NULL : sdo[0x5001][5] = 170 | 0 | 0.1
#check fault code
NULL : sdo[0x5000][3] = 1 | 0 | 0.1
#switch out load line
sdo[0x6200][2] = 0 : NULL : WAIT = 0.1
J2_12 = 0 : NULL : WAIT = 0.5
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 0 : NULL : WAIT = 0.2
sdo[0x2001][7] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5
sdo[0x2005][1] = 0 : NULL : WAIT = 0.1

#set current and turn on output and verify feedback
sdo[0x6200][2] = 16 : NULL : WAIT = 0.1
#check feedback is 0
NULL : sdo[0x5003][7] = 0 | 0 | 0.1
#check fault is set
NULL : sdo[0x5001][6] = 2 | 0 | 0.1
#check fault code
NULL : sdo[0x5000][3] = 1 | 0 | 0.1
#switch out load line
sdo[0x6200][2] = 0 : NULL : WAIT = 0.1
J3_01 = 0 : NULL : WAIT = 0.5
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 0 : NULL : WAIT = 0.2
sdo[0x2001][7] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5
sdo[0x2005][1] = 64 : NULL : WAIT = 0.1

#set current and turn on output and verify feedback
sdo[0x6200][2] = 32 : NULL : WAIT = 0.1
#check feedback is 0
NULL : sdo[0x5003][7] = 0 | 0 | 0.1
#check fault is set
NULL : sdo[0x5001][6] = 10 | 0 | 0.1
#check fault code
NULL : sdo[0x5000][3] = 1 | 0 | 0.1
#switch out load line
sdo[0x6200][2] = 0 : NULL : WAIT = 0.1
J3_02 = 0 : NULL : WAIT = 0.5
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 0 : NULL : WAIT = 0.2
sdo[0x2001][8] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5
sdo[0x2005][1] = 0 : NULL : WAIT = 0.1

#set current and turn on output and verify feedback
sdo[0x6200][2] = 64 : NULL : WAIT = 0.1
#check feedback is 0
NULL : sdo[0x5003][8] = 0 | 0 | 0.1
#check fault is set
NULL : sdo[0x5001][6] = 42 | 0 | 0.1
#check fault code
NULL : sdo[0x5000][3] = 1 | 0 | 0.1
#switch out load line
sdo[0x6200][2] = 0 : NULL : WAIT = 0.1
J3_03 = 0 : NULL : WAIT = 0.5
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
sdo[0x2000][1] = 0 : NULL : WAIT = 0.2
sdo[0x2001][8] = 17 : NULL : WAIT = 0.2
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5
sdo[0x2005][1] = 128 : NULL : WAIT = 0.1

#set current and turn on output and verify feedback
sdo[0x6200][2] = 128 : NULL : WAIT = 0.1
#check feedback is 0
NULL : sdo[0x5003][8] = 0 | 0 | 0.1
#check fault is set
NULL : sdo[0x5001][6] = 170 | 0 | 0.1
#check fault code
NULL : sdo[0x5000][3] = 1 | 0 | 0.1
#switch out load line
sdo[0x6200][2] = 0 : NULL : WAIT = 0.1
J3_04 = 0 : NULL : WAIT = 0.5
NULL : sdo[0x5001][3] = 170 | 0 | 0.1
NULL : sdo[0x5001][4] = 170 | 0 | 0.1
NULL : sdo[0x5001][5] = 170 | 0 | 0.1
NULL : sdo[0x5001][6] = 170 | 0 | 0.1
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
PRE_OPERATIONAL
SAVE
END
