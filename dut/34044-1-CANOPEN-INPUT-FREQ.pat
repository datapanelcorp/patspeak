#34044-1
#Verion 0.0
#input test
UUT_EDS = 37000-561.eds
UUT_DATANAME = 34044-1-CANOPEN-INPUT-FREQ


#-----setup pat-----
#setup freq
J0_11_FREQ_GEN = 1 : NULL : WAIT = 1

PAUSE- FREQ_GEN TO 500Hz 15% Duty
#-----setup 34044-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 7 : NULL : WAIT = 0.1
sdo[0x2001][6] = 7 : NULL : WAIT = 0.1
sdo[0x2001][7] = 7 : NULL : WAIT = 0.1
sdo[0x2001][8] = 7 : NULL : WAIT = 0.1
#switch input to load line
J3_01 = 1 : NULL : WAIT = 1
NULL : sdo[0x6401][9] = 500 | 30 | 0.1
NULL : sdo[0x6401][10] = 15 | 1 | 0.1
J3_01 = 0 : NULL : WAIT = 1

#-----setup 34044-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 7 : NULL : WAIT = 0.1
sdo[0x2001][6] = 7 : NULL : WAIT = 0.1
sdo[0x2001][7] = 7 : NULL : WAIT = 0.1
sdo[0x2001][8] = 7 : NULL : WAIT = 0.1
#switch input to load line
J3_03 = 1 : NULL : WAIT = 1
NULL : sdo[0x6401][11] = 500 | 30 | 0.1
NULL : sdo[0x6401][12] = 15 | 1 | 0.1
J3_03 = 0 : NULL : WAIT = 1

PAUSE- FREQ_GEN TO 1000Hz 30% Duty
#-----setup 34044-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 7 : NULL : WAIT = 0.1
sdo[0x2001][6] = 7 : NULL : WAIT = 0.1
sdo[0x2001][7] = 7 : NULL : WAIT = 0.1
sdo[0x2001][8] = 7 : NULL : WAIT = 0.1
#switch input to load line
J3_01 = 1 : NULL : WAIT = 1
NULL : sdo[0x6401][9] = 1000 | 30 | 0.1
NULL : sdo[0x6401][10] = 30 | 1 | 0.1
J3_01 = 0 : NULL : WAIT = 1

#-----setup 34044-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 7 : NULL : WAIT = 0.1
sdo[0x2001][6] = 7 : NULL : WAIT = 0.1
sdo[0x2001][7] = 7 : NULL : WAIT = 0.1
sdo[0x2001][8] = 7 : NULL : WAIT = 0.1
#switch input to load line
J3_03 = 1 : NULL : WAIT = 1
NULL : sdo[0x6401][11] = 1000 | 30 | 0.1
NULL : sdo[0x6401][12] = 30 | 1 | 0.1
J3_03 = 0 : NULL : WAIT = 1

PAUSE- FREQ_GEN TO 1500Hz 45% Duty
#-----setup 34044-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 7 : NULL : WAIT = 0.1
sdo[0x2001][6] = 7 : NULL : WAIT = 0.1
sdo[0x2001][7] = 7 : NULL : WAIT = 0.1
sdo[0x2001][8] = 7 : NULL : WAIT = 0.1
#switch input to load line
J3_01 = 1 : NULL : WAIT = 1
NULL : sdo[0x6401][9] = 1500 | 30 | 0.1
NULL : sdo[0x6401][10] = 45 | 1 | 0.1
J3_01 = 0 : NULL : WAIT = 1

#-----setup 34044-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 7 : NULL : WAIT = 0.1
sdo[0x2001][6] = 7 : NULL : WAIT = 0.1
sdo[0x2001][7] = 7 : NULL : WAIT = 0.1
sdo[0x2001][8] = 7 : NULL : WAIT = 0.1
#switch input to load line
J3_03 = 1 : NULL : WAIT = 1
NULL : sdo[0x6401][11] = 1500 | 30 | 0.1
NULL : sdo[0x6401][12] = 45 | 1 | 0.1
J3_03 = 0 : NULL : WAIT = 1

PAUSE- FREQ_GEN TO 2000Hz 60% Duty
#-----setup 34044-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 7 : NULL : WAIT = 0.1
sdo[0x2001][6] = 7 : NULL : WAIT = 0.1
sdo[0x2001][7] = 7 : NULL : WAIT = 0.1
sdo[0x2001][8] = 7 : NULL : WAIT = 0.1
#switch input to load line
J3_01 = 1 : NULL : WAIT = 1
NULL : sdo[0x6401][9] = 2000 | 30 | 0.1
NULL : sdo[0x6401][10] = 60 | 1 | 0.1
J3_01 = 0 : NULL : WAIT = 1

#-----setup 34044-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 7 : NULL : WAIT = 0.1
sdo[0x2001][6] = 7 : NULL : WAIT = 0.1
sdo[0x2001][7] = 7 : NULL : WAIT = 0.1
sdo[0x2001][8] = 7 : NULL : WAIT = 0.1
#switch input to load line
J3_03 = 1 : NULL : WAIT = 1
NULL : sdo[0x6401][11] = 2000 | 30 | 0.1
NULL : sdo[0x6401][12] = 60 | 1 | 0.1
J3_03 = 0 : NULL : WAIT = 1

PAUSE- FREQ_GEN TO 2500Hz 75% Duty
#-----setup 34044-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 7 : NULL : WAIT = 0.1
sdo[0x2001][6] = 7 : NULL : WAIT = 0.1
sdo[0x2001][7] = 7 : NULL : WAIT = 0.1
sdo[0x2001][8] = 7 : NULL : WAIT = 0.1
#switch input to load line
J3_01 = 1 : NULL : WAIT = 1
NULL : sdo[0x6401][9] = 2500 | 30 | 0.1
NULL : sdo[0x6401][10] = 75 | 1 | 0.1
J3_01 = 0 : NULL : WAIT = 1

#-----setup 34044-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 7 : NULL : WAIT = 0.1
sdo[0x2001][6] = 7 : NULL : WAIT = 0.1
sdo[0x2001][7] = 7 : NULL : WAIT = 0.1
sdo[0x2001][8] = 7 : NULL : WAIT = 0.1
#switch input to load line
J3_03 = 1 : NULL : WAIT = 1
NULL : sdo[0x6401][11] = 2500 | 30 | 0.1
NULL : sdo[0x6401][12] = 75 | 1 | 0.1
J3_03 = 0 : NULL : WAIT = 1

PAUSE- FREQ_GEN TO 3000Hz 90% Duty
#-----setup 34044-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 7 : NULL : WAIT = 0.1
sdo[0x2001][6] = 7 : NULL : WAIT = 0.1
sdo[0x2001][7] = 7 : NULL : WAIT = 0.1
sdo[0x2001][8] = 7 : NULL : WAIT = 0.1
#switch input to load line
J3_01 = 1 : NULL : WAIT = 1
NULL : sdo[0x6401][9] = 3000 | 30 | 0.1
NULL : sdo[0x6401][10] = 90 | 1 | 0.1
J3_01 = 0 : NULL : WAIT = 1

#-----setup 34044-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 7 : NULL : WAIT = 0.1
sdo[0x2001][6] = 7 : NULL : WAIT = 0.1
sdo[0x2001][7] = 7 : NULL : WAIT = 0.1
sdo[0x2001][8] = 7 : NULL : WAIT = 0.1
#switch input to load line
J3_03 = 1 : NULL : WAIT = 1
NULL : sdo[0x6401][11] = 3000 | 30 | 0.1
NULL : sdo[0x6401][12] = 90 | 1 | 0.1
J3_03 = 0 : NULL : WAIT = 1

#switch out load line
J3_03 = 0 : NULL : WAIT = 0.1
J0_11_FREQ_GEN = 0 : NULL : WAIT = 1
J4_03 = 0 : NULL : WAIT = 0.2
SAVE
END
