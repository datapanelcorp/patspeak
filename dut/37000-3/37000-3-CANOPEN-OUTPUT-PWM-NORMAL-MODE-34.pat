#37000-1
#Verion 0.0
#PWM test with 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
UUT_EDS = 37000-563.eds
UUT_DATANAME = 37000-3-CANOPEN-OUTPUT-PWM-NORMAL-MODE-34

#-----setup 37000-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Ports
sdo[0x2001][1] = 34 : NULL : WAIT = 0.1
sdo[0x2001][2] = 34 : NULL : WAIT = 0.1
sdo[0x2001][3] = 34 : NULL : WAIT = 0.1
sdo[0x2001][4] = 34 : NULL : WAIT = 0.1
sdo[0x2001][5] = 34 : NULL : WAIT = 0.1
sdo[0x2001][6] = 34 : NULL : WAIT = 0.1
sdo[0x2001][7] = 34 : NULL : WAIT = 0.1
sdo[0x2001][8] = 34 : NULL : WAIT = 0.1
PRE_OPERATIONAL
#test at 1000hz
sdo[0x3000] = 1000 : NULL : WAIT = 0.5
OPERATIONAL
#switch in 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
J4_01 = 1 : NULL : WAIT = 0.2
J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

sdo[0x6411][2] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 8| 2 | 0.5
sdo[0x6411][2] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 16 | 2 | 0.5
sdo[0x6411][2] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][2] = 0 : NULL : WAIT = 0.5
J2_02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

sdo[0x6411][3] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 8| 2 | 0.5
sdo[0x6411][3] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 16 | 2 | 0.5
sdo[0x6411][3] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][3] = 0 : NULL : WAIT = 0.5
J2_03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

sdo[0x6411][4] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 8| 2 | 0.5
sdo[0x6411][4] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 16 | 2 | 0.5
sdo[0x6411][4] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][4] = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

sdo[0x6411][6] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 8| 2 | 0.5
sdo[0x6411][6] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 16 | 2 | 0.5
sdo[0x6411][6] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][6] = 0 : NULL : WAIT = 0.5
J2_06 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

sdo[0x6411][7] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 8| 2 | 0.5
sdo[0x6411][7] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 16 | 2 | 0.5
sdo[0x6411][7] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][7] = 0 : NULL : WAIT = 0.5
J2_07 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

sdo[0x6411][8] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 8| 2 | 0.5
sdo[0x6411][8] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 16 | 2 | 0.5
sdo[0x6411][8] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][8] = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_09 = 1 : NULL : WAIT = 0.5

sdo[0x6411][9] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][9] = 8| 2 | 0.5
sdo[0x6411][9] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][9] = 16 | 2 | 0.5
sdo[0x6411][9] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][9] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][9] = 0 : NULL : WAIT = 0.5
J2_09 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_10 = 1 : NULL : WAIT = 0.5

sdo[0x6411][10] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][10] = 8| 2 | 0.5
sdo[0x6411][10] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][10] = 16 | 2 | 0.5
sdo[0x6411][10] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][10] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][10] = 0 : NULL : WAIT = 0.5
J2_10 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_11 = 1 : NULL : WAIT = 0.5

sdo[0x6411][11] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][11] = 8| 2 | 0.5
sdo[0x6411][11] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][11] = 16 | 2 | 0.5
sdo[0x6411][11] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][11] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][11] = 0 : NULL : WAIT = 0.5
J2_11 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_12 = 1 : NULL : WAIT = 0.5

sdo[0x6411][12] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][12] = 8| 2 | 0.5
sdo[0x6411][12] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][12] = 16 | 2 | 0.5
sdo[0x6411][12] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][12] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][12] = 0 : NULL : WAIT = 0.5
J2_12 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5

sdo[0x6411][13] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][13] = 8| 2 | 0.5
sdo[0x6411][13] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][13] = 16 | 2 | 0.5
sdo[0x6411][13] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][13] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][13] = 0 : NULL : WAIT = 0.5
J3_01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5

sdo[0x6411][14] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][14] = 8| 2 | 0.5
sdo[0x6411][14] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][14] = 16 | 2 | 0.5
sdo[0x6411][14] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][14] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][14] = 0 : NULL : WAIT = 0.5
J3_02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5

sdo[0x6411][15] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][15] = 8| 2 | 0.5
sdo[0x6411][15] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][15] = 16 | 2 | 0.5
sdo[0x6411][15] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][15] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][15] = 0 : NULL : WAIT = 0.5
J3_03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5

sdo[0x6411][16] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][16] = 8| 2 | 0.5
sdo[0x6411][16] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][16] = 16 | 2 | 0.5
sdo[0x6411][16] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][16] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][16] = 0 : NULL : WAIT = 0.5
J3_04 = 0 : NULL : WAIT = 0.5
PRE_OPERATIONAL
#test at 500hz
sdo[0x3000] = 500 : NULL : WAIT = 0.5
OPERATIONAL
#switch in 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
J4_01 = 1 : NULL : WAIT = 0.2
J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

sdo[0x6411][2] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 8| 2 | 0.5
sdo[0x6411][2] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 16 | 2 | 0.5
sdo[0x6411][2] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][2] = 0 : NULL : WAIT = 0.5
J2_02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

sdo[0x6411][3] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 8| 2 | 0.5
sdo[0x6411][3] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 16 | 2 | 0.5
sdo[0x6411][3] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][3] = 0 : NULL : WAIT = 0.5
J2_03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

sdo[0x6411][4] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 8| 2 | 0.5
sdo[0x6411][4] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 16 | 2 | 0.5
sdo[0x6411][4] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][4] = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

sdo[0x6411][6] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 8| 2 | 0.5
sdo[0x6411][6] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 16 | 2 | 0.5
sdo[0x6411][6] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][6] = 0 : NULL : WAIT = 0.5
J2_06 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

sdo[0x6411][7] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 8| 2 | 0.5
sdo[0x6411][7] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 16 | 2 | 0.5
sdo[0x6411][7] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][7] = 0 : NULL : WAIT = 0.5
J2_07 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

sdo[0x6411][8] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 8| 2 | 0.5
sdo[0x6411][8] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 16 | 2 | 0.5
sdo[0x6411][8] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][8] = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_09 = 1 : NULL : WAIT = 0.5

sdo[0x6411][9] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][9] = 8| 2 | 0.5
sdo[0x6411][9] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][9] = 16 | 2 | 0.5
sdo[0x6411][9] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][9] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][9] = 0 : NULL : WAIT = 0.5
J2_09 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_10 = 1 : NULL : WAIT = 0.5

sdo[0x6411][10] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][10] = 8| 2 | 0.5
sdo[0x6411][10] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][10] = 16 | 2 | 0.5
sdo[0x6411][10] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][10] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][10] = 0 : NULL : WAIT = 0.5
J2_10 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_11 = 1 : NULL : WAIT = 0.5

sdo[0x6411][11] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][11] = 8| 2 | 0.5
sdo[0x6411][11] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][11] = 16 | 2 | 0.5
sdo[0x6411][11] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][11] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][11] = 0 : NULL : WAIT = 0.5
J2_11 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_12 = 1 : NULL : WAIT = 0.5

sdo[0x6411][12] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][12] = 8| 2 | 0.5
sdo[0x6411][12] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][12] = 16 | 2 | 0.5
sdo[0x6411][12] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][12] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][12] = 0 : NULL : WAIT = 0.5
J2_12 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5

sdo[0x6411][13] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][13] = 8| 2 | 0.5
sdo[0x6411][13] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][13] = 16 | 2 | 0.5
sdo[0x6411][13] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][13] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][13] = 0 : NULL : WAIT = 0.5
J3_01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5

sdo[0x6411][14] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][14] = 8| 2 | 0.5
sdo[0x6411][14] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][14] = 16 | 2 | 0.5
sdo[0x6411][14] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][14] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][14] = 0 : NULL : WAIT = 0.5
J3_02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5

sdo[0x6411][15] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][15] = 8| 2 | 0.5
sdo[0x6411][15] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][15] = 16 | 2 | 0.5
sdo[0x6411][15] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][15] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][15] = 0 : NULL : WAIT = 0.5
J3_03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5

sdo[0x6411][16] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][16] = 8| 2 | 0.5
sdo[0x6411][16] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][16] = 16 | 2 | 0.5
sdo[0x6411][16] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][16] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][16] = 0 : NULL : WAIT = 0.5
J3_04 = 0 : NULL : WAIT = 0.5
PRE_OPERATIONAL
#test at 64hz
sdo[0x3000] = 64 : NULL : WAIT = 0.5
OPERATIONAL
#switch in 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
J4_01 = 1 : NULL : WAIT = 0.2
J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

sdo[0x6411][2] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 8| 2 | 0.5
sdo[0x6411][2] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 16 | 2 | 0.5
sdo[0x6411][2] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][2] = 0 : NULL : WAIT = 0.5
J2_02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

sdo[0x6411][3] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 8| 2 | 0.5
sdo[0x6411][3] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 16 | 2 | 0.5
sdo[0x6411][3] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][3] = 0 : NULL : WAIT = 0.5
J2_03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

sdo[0x6411][4] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 8| 2 | 0.5
sdo[0x6411][4] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 16 | 2 | 0.5
sdo[0x6411][4] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][4] = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

sdo[0x6411][6] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 8| 2 | 0.5
sdo[0x6411][6] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 16 | 2 | 0.5
sdo[0x6411][6] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][6] = 0 : NULL : WAIT = 0.5
J2_06 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

sdo[0x6411][7] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 8| 2 | 0.5
sdo[0x6411][7] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 16 | 2 | 0.5
sdo[0x6411][7] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][7] = 0 : NULL : WAIT = 0.5
J2_07 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

sdo[0x6411][8] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 8| 2 | 0.5
sdo[0x6411][8] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 16 | 2 | 0.5
sdo[0x6411][8] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][8] = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_09 = 1 : NULL : WAIT = 0.5

sdo[0x6411][9] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][9] = 8| 2 | 0.5
sdo[0x6411][9] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][9] = 16 | 2 | 0.5
sdo[0x6411][9] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][9] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][9] = 0 : NULL : WAIT = 0.5
J2_09 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_10 = 1 : NULL : WAIT = 0.5

sdo[0x6411][10] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][10] = 8| 2 | 0.5
sdo[0x6411][10] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][10] = 16 | 2 | 0.5
sdo[0x6411][10] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][10] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][10] = 0 : NULL : WAIT = 0.5
J2_10 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_11 = 1 : NULL : WAIT = 0.5

sdo[0x6411][11] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][11] = 8| 2 | 0.5
sdo[0x6411][11] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][11] = 16 | 2 | 0.5
sdo[0x6411][11] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][11] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][11] = 0 : NULL : WAIT = 0.5
J2_11 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_12 = 1 : NULL : WAIT = 0.5

sdo[0x6411][12] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][12] = 8| 2 | 0.5
sdo[0x6411][12] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][12] = 16 | 2 | 0.5
sdo[0x6411][12] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][12] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][12] = 0 : NULL : WAIT = 0.5
J2_12 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5

sdo[0x6411][13] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][13] = 8| 2 | 0.5
sdo[0x6411][13] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][13] = 16 | 2 | 0.5
sdo[0x6411][13] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][13] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][13] = 0 : NULL : WAIT = 0.5
J3_01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5

sdo[0x6411][14] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][14] = 8| 2 | 0.5
sdo[0x6411][14] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][14] = 16 | 2 | 0.5
sdo[0x6411][14] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][14] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][14] = 0 : NULL : WAIT = 0.5
J3_02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5

sdo[0x6411][15] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][15] = 8| 2 | 0.5
sdo[0x6411][15] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][15] = 16 | 2 | 0.5
sdo[0x6411][15] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][15] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][15] = 0 : NULL : WAIT = 0.5
J3_03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5

sdo[0x6411][16] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][16] = 8| 2 | 0.5
sdo[0x6411][16] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][16] = 16 | 2 | 0.5
sdo[0x6411][16] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][16] = 33 | 2 | 0.5
#switch out load line, switch coil
sdo[0x6411][16] = 0 : NULL : WAIT = 0.5
J3_04 = 0 : NULL : WAIT = 0.5
SAVE
END
