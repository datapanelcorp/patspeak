#34044-1
#Verion 0.0
#PWMi normal test with a 2.1 Ohm resistive load. (6.9 amps @ 14.5 VDC)
#PWMi overshoot should cause the output to overcurrent
UUT_EDS = 37000-561.eds
UUT_DATANAME = 34044-1-CANOPEN-OUTPUT-PWMI-OVERCURRENT

PRE_OPERATIONAL
#-----configure PWMi-----
sdo[0x2002][1] = 80.0, sdo[0x2002][2] = 50.0, sdo[0x2002][3] = 80.0, sdo[0x2002][4] = 50.0, sdo[0x2002][5] = 80.0, sdo[0x2002][6] = 50.0 : NULL : WAIT = 0.5
sdo[0x2002][7] = 80.0, sdo[0x2002][8] = 50.0, sdo[0x2002][9] = 80.0, sdo[0x2002][10] = 50.0, sdo[0x2002][11] = 80.0, sdo[0x2002][12] = 50.0 : NULL : WAIT = 0.5
sdo[0x2002][13] = 80.0, sdo[0x2002][14] = 50.0, sdo[0x2002][15] = 80.0, sdo[0x2002][16] = 50.0 : NULL : WAIT = 0.5
#-----set freq-----
sdo[0x3000][0] = 100 : NULL : WAIT = 0.2
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][1] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][1] = 4000 : sdo[0x5001][3] = 2 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][1] = 0 : NULL : WAIT = 1
J2_01 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][1] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][2] = 4000 : sdo[0x5001][3] = 8 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][2] = 0 : NULL : WAIT = 1
J2_02 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][2] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][3] = 4000 : sdo[0x5001][3] = 32 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][3] = 0 : NULL : WAIT = 1
J2_03 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][2] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][4] = 4000 : sdo[0x5001][3] = 128 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][4] = 0 : NULL : WAIT = 1
J2_04 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][3] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][5] = 4000 : sdo[0x5001][4] = 2 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][5] = 0 : NULL : WAIT = 1
J2_05 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][3] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][6] = 4000 : sdo[0x5001][4] = 8 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][6] = 0 : NULL : WAIT = 1
J2_06 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][4] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][7] = 4000 : sdo[0x5001][4] = 32 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][7] = 0 : NULL : WAIT = 1
J2_07 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][4] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5
OPERATIONAL


sdo[0x6411][8] = 4000 : sdo[0x5001][4] = 128 | 0.1 | 1
#switch out load line, switch coil
sdo[0x6411][8] = 0 : NULL : WAIT = 1
J2_08 = 0 : NULL : WAIT = 1
SAVE
END
