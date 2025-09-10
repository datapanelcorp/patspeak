#37000-4
#Verion 0.0
#PWMi overcurrent test with a 2.1 Ohm resistive load. (6.9 amps @ 14.5 VDC)
UUT_EDS = 37000-564.eds
UUT_DATANAME = 37000-4-CANOPEN-OUTPUT-PWMI-OVERCURRENT

PRE_OPERATIONAL
#-----configure PWMi-----
sdo[0x2002][1] = 80.0, sdo[0x2002][2] = 50.0, sdo[0x2002][3] = 80.0, sdo[0x2002][4] = 50.0, sdo[0x2002][5] = 80.0, sdo[0x2002][6] = 50.0 : NULL : WAIT = 0.1
sdo[0x2002][7] = 80.0, sdo[0x2002][8] = 50.0, sdo[0x2002][9] = 80.0, sdo[0x2002][10] = 50.0, sdo[0x2002][11] = 80.0, sdo[0x2002][12] = 50.0 : NULL : WAIT = 0.1
sdo[0x2002][13] = 80.0, sdo[0x2002][14] = 50.0, sdo[0x2002][15] = 80.0, sdo[0x2002][16] = 50.0 : NULL
#-----set freq-----
sdo[0x3000] = 200 : NULL : WAIT = 0.2
#-----no fault reset-----
sdo[0x2000][1] = 0 : NULL
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][2] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5
J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL

sdo[0x2005][1] = 0 : NULL : WAIT = 0.1

sdo[0x6411][2] = 4000 : sdo[0x5001][3] = 32 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][2] = 0 : NULL : WAIT = 1
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

sdo[0x2005][1] = 2 : NULL : WAIT = 0.1

sdo[0x6411][2] = 4000 : sdo[0x5001][3] = 160 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][2] = 0 : NULL : WAIT = 1
J2_04 = 0 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][4] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5
J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL

sdo[0x2005][1] = 0 : NULL : WAIT = 0.1

sdo[0x6411][4] = 4000 : sdo[0x5001][4] = 32 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][4] = 0 : NULL : WAIT = 1
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

sdo[0x2005][1] = 8 : NULL : WAIT = 0.1

sdo[0x6411][4] = 4000 : sdo[0x5001][4] = 160 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][4] = 0 : NULL : WAIT = 1
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

sdo[0x2005][1] = 0 : NULL : WAIT = 0.1

sdo[0x6411][5] = 4000 : sdo[0x5001][5] = 2 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][5] = 0 : NULL : WAIT = 1
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

sdo[0x2005][1] = 16 : NULL : WAIT = 0.1

sdo[0x6411][5] = 4000 : sdo[0x5001][5] = 10 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][5] = 0 : NULL : WAIT = 1
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

sdo[0x2005][1] = 0 : NULL : WAIT = 0.1

sdo[0x6411][6] = 4000 : sdo[0x5001][5] = 42 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][6] = 0 : NULL : WAIT = 1
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

sdo[0x2005][1] = 32 : NULL : WAIT = 0.1

sdo[0x6411][6] = 4000 : sdo[0x5001][5] = 170 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][6] = 0 : NULL : WAIT = 1
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

sdo[0x2005][1] = 0 : NULL : WAIT = 0.1

sdo[0x6411][7] = 4000 : sdo[0x5001][6] = 2 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][7] = 0 : NULL : WAIT = 1
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

sdo[0x2005][1] = 64 : NULL : WAIT = 0.1

sdo[0x6411][7] = 4000 : sdo[0x5001][6] = 10 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][7] = 0 : NULL : WAIT = 1
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

sdo[0x2005][1] = 0 : NULL : WAIT = 0.1

sdo[0x6411][8] = 4000 : sdo[0x5001][6] = 42 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][8] = 0 : NULL : WAIT = 1
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

sdo[0x2005][1] = 128 : NULL : WAIT = 0.1

sdo[0x6411][8] = 4000 : sdo[0x5001][6] = 170 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][8] = 0 : NULL : WAIT = 1
J3_04 = 0 : NULL : WAIT = 1
SAVE
END
