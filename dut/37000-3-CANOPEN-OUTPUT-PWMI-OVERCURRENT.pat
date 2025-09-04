#37000-1
#Verion 0.0
#PWMi overcurrent test with a 2.1 Ohm resistive load. (6.9 amps @ 14.5 VDC)
UUT_EDS = 37000-563.eds
UUT_DATANAME = 37000-3-CANOPEN-OUTPUT-PWMI-OVERCURRENT

PRE_OPERATIONAL
#-----configure PWMi-----
sdo[0x2002][1] = 80.0, sdo[0x2002][2] = 50.0, sdo[0x2002][3] = 80.0, sdo[0x2002][4] = 50.0, sdo[0x2002][5] = 80.0, sdo[0x2002][6] = 50.0 : NULL : WAIT = 0.1
sdo[0x2002][7] = 80.0, sdo[0x2002][8] = 50.0, sdo[0x2002][9] = 80.0, sdo[0x2002][10] = 50.0, sdo[0x2002][11] = 80.0, sdo[0x2002][12] = 50.0 : NULL : WAIT = 0.1
sdo[0x2002][13] = 80.0, sdo[0x2002][14] = 50.0, sdo[0x2002][15] = 80.0, sdo[0x2002][16] = 50.0 : NULL
sdo[0x2002][17] = 80.0, sdo[0x2002][18] = 50.0, sdo[0x2002][19] = 80.0, sdo[0x2002][20] = 50.0, sdo[0x2002][21] = 80.0, sdo[0x2002][22] = 50.0 : NULL : WAIT = 0.1
sdo[0x2002][23] = 80.0, sdo[0x2002][24] = 50.0, sdo[0x2002][25] = 80.0, sdo[0x2002][26] = 50.0, sdo[0x2002][27] = 80.0, sdo[0x2002][28] = 50.0 : NULL : WAIT = 0.1
sdo[0x2002][29] = 80.0, sdo[0x2002][30] = 50.0, sdo[0x2002][31] = 80.0, sdo[0x2002][32] = 50.0 : NULL
#-----set freq-----
sdo[0x3000] = 200 : NULL : WAIT = 0.2
#-----no fault reset freq-----
sdo[0x2000][1] = 0 : NULL
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][1] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5
J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][2] = 4000 : sdo[0x5001][3] = 8 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][2] = 0 : NULL : WAIT = 1
J2_02 = 0 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][2] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5
J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][3] = 4000 : sdo[0x5001][3] = 40 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][3] = 0 : NULL : WAIT = 1
J2_03 = 0 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][2] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5
J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][4] = 4000 : sdo[0x5001][3] = 168 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][4] = 0 : NULL : WAIT = 1
J2_04 = 0 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][3] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5
J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][6] = 4000 : sdo[0x5001][4] = 8 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][6] = 0 : NULL : WAIT = 1
J2_06 = 0 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][4] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5
J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][7] = 4000 : sdo[0x5001][4] = 40 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][7] = 0 : NULL : WAIT = 1
J2_07 = 0 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][4] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5
J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][8] = 4000 : sdo[0x5001][4] = 168 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][8] = 0 : NULL : WAIT = 1
J2_08 = 0 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][5] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_09 = 1 : NULL : WAIT = 0.5
J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][9] = 4000 : sdo[0x5001][5] = 2 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][9] = 0 : NULL : WAIT = 1
J2_09 = 0 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][5] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_10 = 1 : NULL : WAIT = 0.5
J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][10] = 4000 : sdo[0x5001][5] = 10 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][10] = 0 : NULL : WAIT = 1
J2_10 = 0 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][6] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_11 = 1 : NULL : WAIT = 0.5
J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][11] = 4000 : sdo[0x5001][5] = 42 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][11] = 0 : NULL : WAIT = 1
J2_11 = 0 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][6] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_12 = 1 : NULL : WAIT = 0.5
J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][12] = 4000 : sdo[0x5001][5] = 170 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][12] = 0 : NULL : WAIT = 1
J2_12 = 0 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][7] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5
J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][13] = 4000 : sdo[0x5001][6] = 2 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][13] = 0 : NULL : WAIT = 1
J3_01 = 0 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][7] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5
J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][14] = 4000 : sdo[0x5001][6] = 10 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][14] = 0 : NULL : WAIT = 1
J3_02 = 0 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][8] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5
J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][15] = 4000 : sdo[0x5001][6] = 42 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][15] = 0 : NULL : WAIT = 1
J3_03 = 0 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][8] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5
J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][16] = 4000 : sdo[0x5001][6] = 170 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][16] = 0 : NULL : WAIT = 1
J3_04 = 0 : NULL : WAIT = 1
SAVE
END
