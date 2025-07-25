#34044-1
#Verion 0.0
#PWMi h-bridge test with a 'red coil' 6.4 ohm inductive load. (2.27 amps @ 14.5 VDC)
UUT_EDS = 37000-561.eds
UUT_DATANAME = 34044-1-CANOPEN-OUTPUT-PWMI-QUICK

PRE_OPERATIONAL
#-----configure PWMi-----
sdo[0x2002][1] = 20.0, sdo[0x2002][2] = 10.0, sdo[0x2002][3] = 20.0, sdo[0x2002][4] = 10.0, sdo[0x2002][5] = 20.0, sdo[0x2002][6] = 10.0 : NULL : WAIT = 0.5
sdo[0x2002][7] = 20.0, sdo[0x2002][8] = 10.0, sdo[0x2002][9] = 20.0, sdo[0x2002][10] = 10.0, sdo[0x2002][11] = 20.0, sdo[0x2002][12] = 10.0 : NULL : WAIT = 0.5
sdo[0x2002][13] = 20.0, sdo[0x2002][14] = 10.0, sdo[0x2002][15] = 20.0, sdo[0x2002][16] = 10.0 : NULL : WAIT = 0.5
#-----set freq-----
sdo[0x3000][0] = 500 : NULL : WAIT = 0.2
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][1] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5

OPERATIONAL
sdo[0x6411][1] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][1] = 0 : sdo[0x5003][1] = 0 | 155 | 0.5
sdo[0x6411][1] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][1] = 500 : sdo[0x5003][1] = 500 | 155 | 0.5
sdo[0x6411][1] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][1] = 1000 : sdo[0x5003][1] = 1000 | 155 | 0.5
sdo[0x6411][1] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][1] = 1500 : sdo[0x5003][1] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][1] = 0 : NULL : WAIT = 1
J2_01 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
PRE_OPERATIONAL
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][1] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

OPERATIONAL
sdo[0x6411][2] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][2] = 0 : sdo[0x5003][2] = 0 | 155 | 0.5
sdo[0x6411][2] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][2] = 500 : sdo[0x5003][2] = 500 | 155 | 0.5
sdo[0x6411][2] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][2] = 1000 : sdo[0x5003][2] = 1000 | 155 | 0.5
sdo[0x6411][2] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][2] = 1500 : sdo[0x5003][2] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][2] = 0 : NULL : WAIT = 1
J2_02 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
PRE_OPERATIONAL
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][2] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

OPERATIONAL
sdo[0x6411][3] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][3] = 0 : sdo[0x5003][3] = 0 | 155 | 0.5
sdo[0x6411][3] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][3] = 500 : sdo[0x5003][3] = 500 | 155 | 0.5
sdo[0x6411][3] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][3] = 1000 : sdo[0x5003][3] = 1000 | 155 | 0.5
sdo[0x6411][3] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][3] = 1500 : sdo[0x5003][3] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][3] = 0 : NULL : WAIT = 1
J2_03 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
PRE_OPERATIONAL
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][2] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

OPERATIONAL
sdo[0x6411][4] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][4] = 0 : sdo[0x5003][4] = 0 | 155 | 0.5
sdo[0x6411][4] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][4] = 500 : sdo[0x5003][4] = 500 | 155 | 0.5
sdo[0x6411][4] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][4] = 1000 : sdo[0x5003][4] = 1000 | 155 | 0.5
sdo[0x6411][4] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][4] = 1500 : sdo[0x5003][4] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][4] = 0 : NULL : WAIT = 1
J2_04 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
PRE_OPERATIONAL
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][3] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5

OPERATIONAL
sdo[0x6411][5] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][5] = 0 : sdo[0x5003][5] = 0 | 155 | 0.5
sdo[0x6411][5] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][5] = 500 : sdo[0x5003][5] = 500 | 155 | 0.5
sdo[0x6411][5] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][5] = 1000 : sdo[0x5003][5] = 1000 | 155 | 0.5
sdo[0x6411][5] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][5] = 1500 : sdo[0x5003][5] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][5] = 0 : NULL : WAIT = 1
J2_05 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
PRE_OPERATIONAL
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][3] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

OPERATIONAL
sdo[0x6411][6] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][6] = 0 : sdo[0x5003][6] = 0 | 155 | 0.5
sdo[0x6411][6] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][6] = 500 : sdo[0x5003][6] = 500 | 155 | 0.5
sdo[0x6411][6] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][6] = 1000 : sdo[0x5003][6] = 1000 | 155 | 0.5
sdo[0x6411][6] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][6] = 1500 : sdo[0x5003][6] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][6] = 0 : NULL : WAIT = 1
J2_06 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
PRE_OPERATIONAL
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][4] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

OPERATIONAL
sdo[0x6411][7] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][7] = 0 : sdo[0x5003][7] = 0 | 155 | 0.5
sdo[0x6411][7] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][7] = 500 : sdo[0x5003][7] = 500 | 155 | 0.5
sdo[0x6411][7] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][7] = 1000 : sdo[0x5003][7] = 1000 | 155 | 0.5
sdo[0x6411][7] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][7] = 1500 : sdo[0x5003][7] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][7] = 0 : NULL : WAIT = 1
J2_07 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
PRE_OPERATIONAL
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2000][1] = 1 : NULL : WAIT = 0.2
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][4] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

OPERATIONAL
sdo[0x6411][8] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][8] = 0 : sdo[0x5003][8] = 0 | 155 | 0.5
sdo[0x6411][8] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][8] = 500 : sdo[0x5003][8] = 500 | 155 | 0.5
sdo[0x6411][8] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][8] = 1000 : sdo[0x5003][8] = 1000 | 155 | 0.5
sdo[0x6411][8] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][8] = 1500 : sdo[0x5003][8] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][8] = 0 : NULL : WAIT = 1
J2_08 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
PRE_OPERATIONAL
SAVE
END
