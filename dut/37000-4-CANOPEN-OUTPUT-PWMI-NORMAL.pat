#PWMi normal test with a 'red coil' 6.4 ohm inductive load. (2.27 amps @ 14.5 VDC)
#37000-4
#Verion 0.0
#
UUT_EDS = 37000-564.eds
UUT_DATANAME = 37000-4-CANOPEN-OUTPUT-PWMI-NORMAL

PRE_OPERATIONAL
#-----configure PWMi-----
sdo[0x2002][1] = 30.0, sdo[0x2002][2] = 20.0, sdo[0x2002][3] = 30.0, sdo[0x2002][4] = 20.0, sdo[0x2002][5] = 30.0, sdo[0x2002][6] = 20.0 : NULL : WAIT = 0.1
sdo[0x2002][7] = 30.0, sdo[0x2002][8] = 20.0, sdo[0x2002][9] = 30.0, sdo[0x2002][10] = 20.0, sdo[0x2002][11] = 30.0, sdo[0x2002][12] = 20.0 : NULL : WAIT = 0.1
sdo[0x2002][13] = 30.0, sdo[0x2002][14] = 20.0, sdo[0x2002][15] = 30.0, sdo[0x2002][16] = 20.0 : NULL
#-----set freq-----
sdo[0x3000] = 200 : NULL : WAIT = 0.2
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][2] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5
OPERATIONAL

sdo[0x2005][1] = 0 : NULL : WAIT = 0.1
sdo[0x6411][2] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][2] = 0 : sdo[0x5003][2] = 0 | 155 | 0.5
sdo[0x6411][2] = 100 : MeterAmps = 0.1 | 0.155 | 0.5
sdo[0x6411][2] = 100 : sdo[0x5003][2] = 100 | 155 | 0.5
sdo[0x6411][2] = 200 : MeterAmps = 0.2 | 0.155 | 0.5
sdo[0x6411][2] = 200 : sdo[0x5003][2] = 200 | 155 | 0.5
sdo[0x6411][2] = 300 : MeterAmps = 0.3 | 0.155 | 0.5
sdo[0x6411][2] = 300 : sdo[0x5003][2] = 300 | 155 | 0.5
sdo[0x6411][2] = 400 : MeterAmps = 0.4 | 0.155 | 0.5
sdo[0x6411][2] = 400 : sdo[0x5003][2] = 400 | 155 | 0.5
sdo[0x6411][2] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][2] = 500 : sdo[0x5003][2] = 500 | 155 | 0.5
sdo[0x6411][2] = 600 : MeterAmps = 0.6 | 0.155 | 0.5
sdo[0x6411][2] = 600 : sdo[0x5003][2] = 600 | 155 | 0.5
sdo[0x6411][2] = 700 : MeterAmps = 0.7 | 0.155 | 0.5
sdo[0x6411][2] = 700 : sdo[0x5003][2] = 700 | 155 | 0.5
sdo[0x6411][2] = 800 : MeterAmps = 0.8 | 0.155 | 0.5
sdo[0x6411][2] = 800 : sdo[0x5003][2] = 800 | 155 | 0.5
sdo[0x6411][2] = 900 : MeterAmps = 0.9 | 0.155 | 0.5
sdo[0x6411][2] = 900 : sdo[0x5003][2] = 900 | 155 | 0.5
sdo[0x6411][2] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][2] = 1000 : sdo[0x5003][2] = 1000 | 155 | 0.5
sdo[0x6411][2] = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
sdo[0x6411][2] = 1100 : sdo[0x5003][2] = 1100 | 155 | 0.5
sdo[0x6411][2] = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
sdo[0x6411][2] = 1200 : sdo[0x5003][2] = 1200 | 155 | 0.5
sdo[0x6411][2] = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
sdo[0x6411][2] = 1300 : sdo[0x5003][2] = 1300 | 155 | 0.5
sdo[0x6411][2] = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
sdo[0x6411][2] = 1400 : sdo[0x5003][2] = 1400 | 155 | 0.5
sdo[0x6411][2] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][2] = 1500 : sdo[0x5003][2] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][2] = 0 : NULL : WAIT = 1
J2_03 = 0 : NULL : WAIT = 1
#read signal value to update
NULL : sdo[0x5003][2] = 0 | 155 | 0.5
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][2] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5
OPERATIONAL

sdo[0x2005][1] = 2 : NULL : WAIT = 0.1
sdo[0x6411][2] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][2] = 0 : sdo[0x5003][2] = 0 | 155 | 0.5
sdo[0x6411][2] = 100 : MeterAmps = 0.1 | 0.155 | 0.5
sdo[0x6411][2] = 100 : sdo[0x5003][2] = 100 | 155 | 0.5
sdo[0x6411][2] = 200 : MeterAmps = 0.2 | 0.155 | 0.5
sdo[0x6411][2] = 200 : sdo[0x5003][2] = 200 | 155 | 0.5
sdo[0x6411][2] = 300 : MeterAmps = 0.3 | 0.155 | 0.5
sdo[0x6411][2] = 300 : sdo[0x5003][2] = 300 | 155 | 0.5
sdo[0x6411][2] = 400 : MeterAmps = 0.4 | 0.155 | 0.5
sdo[0x6411][2] = 400 : sdo[0x5003][2] = 400 | 155 | 0.5
sdo[0x6411][2] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][2] = 500 : sdo[0x5003][2] = 500 | 155 | 0.5
sdo[0x6411][2] = 600 : MeterAmps = 0.6 | 0.155 | 0.5
sdo[0x6411][2] = 600 : sdo[0x5003][2] = 600 | 155 | 0.5
sdo[0x6411][2] = 700 : MeterAmps = 0.7 | 0.155 | 0.5
sdo[0x6411][2] = 700 : sdo[0x5003][2] = 700 | 155 | 0.5
sdo[0x6411][2] = 800 : MeterAmps = 0.8 | 0.155 | 0.5
sdo[0x6411][2] = 800 : sdo[0x5003][2] = 800 | 155 | 0.5
sdo[0x6411][2] = 900 : MeterAmps = 0.9 | 0.155 | 0.5
sdo[0x6411][2] = 900 : sdo[0x5003][2] = 900 | 155 | 0.5
sdo[0x6411][2] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][2] = 1000 : sdo[0x5003][2] = 1000 | 155 | 0.5
sdo[0x6411][2] = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
sdo[0x6411][2] = 1100 : sdo[0x5003][2] = 1100 | 155 | 0.5
sdo[0x6411][2] = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
sdo[0x6411][2] = 1200 : sdo[0x5003][2] = 1200 | 155 | 0.5
sdo[0x6411][2] = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
sdo[0x6411][2] = 1300 : sdo[0x5003][2] = 1300 | 155 | 0.5
sdo[0x6411][2] = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
sdo[0x6411][2] = 1400 : sdo[0x5003][2] = 1400 | 155 | 0.5
sdo[0x6411][2] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][2] = 1500 : sdo[0x5003][2] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][2] = 0 : NULL : WAIT = 1
J2_04 = 0 : NULL : WAIT = 1
#read signal value to update
NULL : sdo[0x5003][2] = 0 | 155 | 0.5
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][4] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5
OPERATIONAL

sdo[0x2005][1] = 0 : NULL : WAIT = 0.1
sdo[0x6411][4] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][4] = 0 : sdo[0x5003][4] = 0 | 155 | 0.5
sdo[0x6411][4] = 100 : MeterAmps = 0.1 | 0.155 | 0.5
sdo[0x6411][4] = 100 : sdo[0x5003][4] = 100 | 155 | 0.5
sdo[0x6411][4] = 200 : MeterAmps = 0.2 | 0.155 | 0.5
sdo[0x6411][4] = 200 : sdo[0x5003][4] = 200 | 155 | 0.5
sdo[0x6411][4] = 300 : MeterAmps = 0.3 | 0.155 | 0.5
sdo[0x6411][4] = 300 : sdo[0x5003][4] = 300 | 155 | 0.5
sdo[0x6411][4] = 400 : MeterAmps = 0.4 | 0.155 | 0.5
sdo[0x6411][4] = 400 : sdo[0x5003][4] = 400 | 155 | 0.5
sdo[0x6411][4] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][4] = 500 : sdo[0x5003][4] = 500 | 155 | 0.5
sdo[0x6411][4] = 600 : MeterAmps = 0.6 | 0.155 | 0.5
sdo[0x6411][4] = 600 : sdo[0x5003][4] = 600 | 155 | 0.5
sdo[0x6411][4] = 700 : MeterAmps = 0.7 | 0.155 | 0.5
sdo[0x6411][4] = 700 : sdo[0x5003][4] = 700 | 155 | 0.5
sdo[0x6411][4] = 800 : MeterAmps = 0.8 | 0.155 | 0.5
sdo[0x6411][4] = 800 : sdo[0x5003][4] = 800 | 155 | 0.5
sdo[0x6411][4] = 900 : MeterAmps = 0.9 | 0.155 | 0.5
sdo[0x6411][4] = 900 : sdo[0x5003][4] = 900 | 155 | 0.5
sdo[0x6411][4] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][4] = 1000 : sdo[0x5003][4] = 1000 | 155 | 0.5
sdo[0x6411][4] = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
sdo[0x6411][4] = 1100 : sdo[0x5003][4] = 1100 | 155 | 0.5
sdo[0x6411][4] = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
sdo[0x6411][4] = 1200 : sdo[0x5003][4] = 1200 | 155 | 0.5
sdo[0x6411][4] = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
sdo[0x6411][4] = 1300 : sdo[0x5003][4] = 1300 | 155 | 0.5
sdo[0x6411][4] = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
sdo[0x6411][4] = 1400 : sdo[0x5003][4] = 1400 | 155 | 0.5
sdo[0x6411][4] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][4] = 1500 : sdo[0x5003][4] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][4] = 0 : NULL : WAIT = 1
J2_07 = 0 : NULL : WAIT = 1
#read signal value to update
NULL : sdo[0x5003][4] = 0 | 155 | 0.5
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][4] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5
OPERATIONAL

sdo[0x2005][1] = 8 : NULL : WAIT = 0.1
sdo[0x6411][4] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][4] = 0 : sdo[0x5003][4] = 0 | 155 | 0.5
sdo[0x6411][4] = 100 : MeterAmps = 0.1 | 0.155 | 0.5
sdo[0x6411][4] = 100 : sdo[0x5003][4] = 100 | 155 | 0.5
sdo[0x6411][4] = 200 : MeterAmps = 0.2 | 0.155 | 0.5
sdo[0x6411][4] = 200 : sdo[0x5003][4] = 200 | 155 | 0.5
sdo[0x6411][4] = 300 : MeterAmps = 0.3 | 0.155 | 0.5
sdo[0x6411][4] = 300 : sdo[0x5003][4] = 300 | 155 | 0.5
sdo[0x6411][4] = 400 : MeterAmps = 0.4 | 0.155 | 0.5
sdo[0x6411][4] = 400 : sdo[0x5003][4] = 400 | 155 | 0.5
sdo[0x6411][4] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][4] = 500 : sdo[0x5003][4] = 500 | 155 | 0.5
sdo[0x6411][4] = 600 : MeterAmps = 0.6 | 0.155 | 0.5
sdo[0x6411][4] = 600 : sdo[0x5003][4] = 600 | 155 | 0.5
sdo[0x6411][4] = 700 : MeterAmps = 0.7 | 0.155 | 0.5
sdo[0x6411][4] = 700 : sdo[0x5003][4] = 700 | 155 | 0.5
sdo[0x6411][4] = 800 : MeterAmps = 0.8 | 0.155 | 0.5
sdo[0x6411][4] = 800 : sdo[0x5003][4] = 800 | 155 | 0.5
sdo[0x6411][4] = 900 : MeterAmps = 0.9 | 0.155 | 0.5
sdo[0x6411][4] = 900 : sdo[0x5003][4] = 900 | 155 | 0.5
sdo[0x6411][4] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][4] = 1000 : sdo[0x5003][4] = 1000 | 155 | 0.5
sdo[0x6411][4] = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
sdo[0x6411][4] = 1100 : sdo[0x5003][4] = 1100 | 155 | 0.5
sdo[0x6411][4] = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
sdo[0x6411][4] = 1200 : sdo[0x5003][4] = 1200 | 155 | 0.5
sdo[0x6411][4] = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
sdo[0x6411][4] = 1300 : sdo[0x5003][4] = 1300 | 155 | 0.5
sdo[0x6411][4] = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
sdo[0x6411][4] = 1400 : sdo[0x5003][4] = 1400 | 155 | 0.5
sdo[0x6411][4] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][4] = 1500 : sdo[0x5003][4] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][4] = 0 : NULL : WAIT = 1
J2_08 = 0 : NULL : WAIT = 1
#read signal value to update
NULL : sdo[0x5003][4] = 0 | 155 | 0.5
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][5] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_09 = 1 : NULL : WAIT = 0.5
OPERATIONAL

sdo[0x2005][1] = 0 : NULL : WAIT = 0.1
sdo[0x6411][5] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][5] = 0 : sdo[0x5003][5] = 0 | 155 | 0.5
sdo[0x6411][5] = 100 : MeterAmps = 0.1 | 0.155 | 0.5
sdo[0x6411][5] = 100 : sdo[0x5003][5] = 100 | 155 | 0.5
sdo[0x6411][5] = 200 : MeterAmps = 0.2 | 0.155 | 0.5
sdo[0x6411][5] = 200 : sdo[0x5003][5] = 200 | 155 | 0.5
sdo[0x6411][5] = 300 : MeterAmps = 0.3 | 0.155 | 0.5
sdo[0x6411][5] = 300 : sdo[0x5003][5] = 300 | 155 | 0.5
sdo[0x6411][5] = 400 : MeterAmps = 0.4 | 0.155 | 0.5
sdo[0x6411][5] = 400 : sdo[0x5003][5] = 400 | 155 | 0.5
sdo[0x6411][5] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][5] = 500 : sdo[0x5003][5] = 500 | 155 | 0.5
sdo[0x6411][5] = 600 : MeterAmps = 0.6 | 0.155 | 0.5
sdo[0x6411][5] = 600 : sdo[0x5003][5] = 600 | 155 | 0.5
sdo[0x6411][5] = 700 : MeterAmps = 0.7 | 0.155 | 0.5
sdo[0x6411][5] = 700 : sdo[0x5003][5] = 700 | 155 | 0.5
sdo[0x6411][5] = 800 : MeterAmps = 0.8 | 0.155 | 0.5
sdo[0x6411][5] = 800 : sdo[0x5003][5] = 800 | 155 | 0.5
sdo[0x6411][5] = 900 : MeterAmps = 0.9 | 0.155 | 0.5
sdo[0x6411][5] = 900 : sdo[0x5003][5] = 900 | 155 | 0.5
sdo[0x6411][5] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][5] = 1000 : sdo[0x5003][5] = 1000 | 155 | 0.5
sdo[0x6411][5] = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
sdo[0x6411][5] = 1100 : sdo[0x5003][5] = 1100 | 155 | 0.5
sdo[0x6411][5] = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
sdo[0x6411][5] = 1200 : sdo[0x5003][5] = 1200 | 155 | 0.5
sdo[0x6411][5] = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
sdo[0x6411][5] = 1300 : sdo[0x5003][5] = 1300 | 155 | 0.5
sdo[0x6411][5] = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
sdo[0x6411][5] = 1400 : sdo[0x5003][5] = 1400 | 155 | 0.5
sdo[0x6411][5] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][5] = 1500 : sdo[0x5003][5] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][5] = 0 : NULL : WAIT = 1
J2_09 = 0 : NULL : WAIT = 1
#read signal value to update
NULL : sdo[0x5003][5] = 0 | 155 | 0.5
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][5] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_10 = 1 : NULL : WAIT = 0.5
OPERATIONAL

sdo[0x2005][1] = 16 : NULL : WAIT = 0.1
sdo[0x6411][5] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][5] = 0 : sdo[0x5003][5] = 0 | 155 | 0.5
sdo[0x6411][5] = 100 : MeterAmps = 0.1 | 0.155 | 0.5
sdo[0x6411][5] = 100 : sdo[0x5003][5] = 100 | 155 | 0.5
sdo[0x6411][5] = 200 : MeterAmps = 0.2 | 0.155 | 0.5
sdo[0x6411][5] = 200 : sdo[0x5003][5] = 200 | 155 | 0.5
sdo[0x6411][5] = 300 : MeterAmps = 0.3 | 0.155 | 0.5
sdo[0x6411][5] = 300 : sdo[0x5003][5] = 300 | 155 | 0.5
sdo[0x6411][5] = 400 : MeterAmps = 0.4 | 0.155 | 0.5
sdo[0x6411][5] = 400 : sdo[0x5003][5] = 400 | 155 | 0.5
sdo[0x6411][5] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][5] = 500 : sdo[0x5003][5] = 500 | 155 | 0.5
sdo[0x6411][5] = 600 : MeterAmps = 0.6 | 0.155 | 0.5
sdo[0x6411][5] = 600 : sdo[0x5003][5] = 600 | 155 | 0.5
sdo[0x6411][5] = 700 : MeterAmps = 0.7 | 0.155 | 0.5
sdo[0x6411][5] = 700 : sdo[0x5003][5] = 700 | 155 | 0.5
sdo[0x6411][5] = 800 : MeterAmps = 0.8 | 0.155 | 0.5
sdo[0x6411][5] = 800 : sdo[0x5003][5] = 800 | 155 | 0.5
sdo[0x6411][5] = 900 : MeterAmps = 0.9 | 0.155 | 0.5
sdo[0x6411][5] = 900 : sdo[0x5003][5] = 900 | 155 | 0.5
sdo[0x6411][5] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][5] = 1000 : sdo[0x5003][5] = 1000 | 155 | 0.5
sdo[0x6411][5] = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
sdo[0x6411][5] = 1100 : sdo[0x5003][5] = 1100 | 155 | 0.5
sdo[0x6411][5] = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
sdo[0x6411][5] = 1200 : sdo[0x5003][5] = 1200 | 155 | 0.5
sdo[0x6411][5] = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
sdo[0x6411][5] = 1300 : sdo[0x5003][5] = 1300 | 155 | 0.5
sdo[0x6411][5] = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
sdo[0x6411][5] = 1400 : sdo[0x5003][5] = 1400 | 155 | 0.5
sdo[0x6411][5] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][5] = 1500 : sdo[0x5003][5] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][5] = 0 : NULL : WAIT = 1
J2_10 = 0 : NULL : WAIT = 1
#read signal value to update
NULL : sdo[0x5003][5] = 0 | 155 | 0.5
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][6] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_11 = 1 : NULL : WAIT = 0.5
OPERATIONAL

sdo[0x2005][1] = 0 : NULL : WAIT = 0.1
sdo[0x6411][6] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][6] = 0 : sdo[0x5003][6] = 0 | 155 | 0.5
sdo[0x6411][6] = 100 : MeterAmps = 0.1 | 0.155 | 0.5
sdo[0x6411][6] = 100 : sdo[0x5003][6] = 100 | 155 | 0.5
sdo[0x6411][6] = 200 : MeterAmps = 0.2 | 0.155 | 0.5
sdo[0x6411][6] = 200 : sdo[0x5003][6] = 200 | 155 | 0.5
sdo[0x6411][6] = 300 : MeterAmps = 0.3 | 0.155 | 0.5
sdo[0x6411][6] = 300 : sdo[0x5003][6] = 300 | 155 | 0.5
sdo[0x6411][6] = 400 : MeterAmps = 0.4 | 0.155 | 0.5
sdo[0x6411][6] = 400 : sdo[0x5003][6] = 400 | 155 | 0.5
sdo[0x6411][6] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][6] = 500 : sdo[0x5003][6] = 500 | 155 | 0.5
sdo[0x6411][6] = 600 : MeterAmps = 0.6 | 0.155 | 0.5
sdo[0x6411][6] = 600 : sdo[0x5003][6] = 600 | 155 | 0.5
sdo[0x6411][6] = 700 : MeterAmps = 0.7 | 0.155 | 0.5
sdo[0x6411][6] = 700 : sdo[0x5003][6] = 700 | 155 | 0.5
sdo[0x6411][6] = 800 : MeterAmps = 0.8 | 0.155 | 0.5
sdo[0x6411][6] = 800 : sdo[0x5003][6] = 800 | 155 | 0.5
sdo[0x6411][6] = 900 : MeterAmps = 0.9 | 0.155 | 0.5
sdo[0x6411][6] = 900 : sdo[0x5003][6] = 900 | 155 | 0.5
sdo[0x6411][6] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][6] = 1000 : sdo[0x5003][6] = 1000 | 155 | 0.5
sdo[0x6411][6] = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
sdo[0x6411][6] = 1100 : sdo[0x5003][6] = 1100 | 155 | 0.5
sdo[0x6411][6] = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
sdo[0x6411][6] = 1200 : sdo[0x5003][6] = 1200 | 155 | 0.5
sdo[0x6411][6] = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
sdo[0x6411][6] = 1300 : sdo[0x5003][6] = 1300 | 155 | 0.5
sdo[0x6411][6] = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
sdo[0x6411][6] = 1400 : sdo[0x5003][6] = 1400 | 155 | 0.5
sdo[0x6411][6] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][6] = 1500 : sdo[0x5003][6] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][6] = 0 : NULL : WAIT = 1
J2_11 = 0 : NULL : WAIT = 1
#read signal value to update
NULL : sdo[0x5003][6] = 0 | 155 | 0.5
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][6] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J2_12 = 1 : NULL : WAIT = 0.5
OPERATIONAL

sdo[0x2005][1] = 32 : NULL : WAIT = 0.1
sdo[0x6411][6] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][6] = 0 : sdo[0x5003][6] = 0 | 155 | 0.5
sdo[0x6411][6] = 100 : MeterAmps = 0.1 | 0.155 | 0.5
sdo[0x6411][6] = 100 : sdo[0x5003][6] = 100 | 155 | 0.5
sdo[0x6411][6] = 200 : MeterAmps = 0.2 | 0.155 | 0.5
sdo[0x6411][6] = 200 : sdo[0x5003][6] = 200 | 155 | 0.5
sdo[0x6411][6] = 300 : MeterAmps = 0.3 | 0.155 | 0.5
sdo[0x6411][6] = 300 : sdo[0x5003][6] = 300 | 155 | 0.5
sdo[0x6411][6] = 400 : MeterAmps = 0.4 | 0.155 | 0.5
sdo[0x6411][6] = 400 : sdo[0x5003][6] = 400 | 155 | 0.5
sdo[0x6411][6] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][6] = 500 : sdo[0x5003][6] = 500 | 155 | 0.5
sdo[0x6411][6] = 600 : MeterAmps = 0.6 | 0.155 | 0.5
sdo[0x6411][6] = 600 : sdo[0x5003][6] = 600 | 155 | 0.5
sdo[0x6411][6] = 700 : MeterAmps = 0.7 | 0.155 | 0.5
sdo[0x6411][6] = 700 : sdo[0x5003][6] = 700 | 155 | 0.5
sdo[0x6411][6] = 800 : MeterAmps = 0.8 | 0.155 | 0.5
sdo[0x6411][6] = 800 : sdo[0x5003][6] = 800 | 155 | 0.5
sdo[0x6411][6] = 900 : MeterAmps = 0.9 | 0.155 | 0.5
sdo[0x6411][6] = 900 : sdo[0x5003][6] = 900 | 155 | 0.5
sdo[0x6411][6] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][6] = 1000 : sdo[0x5003][6] = 1000 | 155 | 0.5
sdo[0x6411][6] = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
sdo[0x6411][6] = 1100 : sdo[0x5003][6] = 1100 | 155 | 0.5
sdo[0x6411][6] = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
sdo[0x6411][6] = 1200 : sdo[0x5003][6] = 1200 | 155 | 0.5
sdo[0x6411][6] = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
sdo[0x6411][6] = 1300 : sdo[0x5003][6] = 1300 | 155 | 0.5
sdo[0x6411][6] = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
sdo[0x6411][6] = 1400 : sdo[0x5003][6] = 1400 | 155 | 0.5
sdo[0x6411][6] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][6] = 1500 : sdo[0x5003][6] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][6] = 0 : NULL : WAIT = 1
J2_12 = 0 : NULL : WAIT = 1
#read signal value to update
NULL : sdo[0x5003][6] = 0 | 155 | 0.5
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][7] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5
OPERATIONAL

sdo[0x2005][1] = 0 : NULL : WAIT = 0.1
sdo[0x6411][7] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][7] = 0 : sdo[0x5003][7] = 0 | 155 | 0.5
sdo[0x6411][7] = 100 : MeterAmps = 0.1 | 0.155 | 0.5
sdo[0x6411][7] = 100 : sdo[0x5003][7] = 100 | 155 | 0.5
sdo[0x6411][7] = 200 : MeterAmps = 0.2 | 0.155 | 0.5
sdo[0x6411][7] = 200 : sdo[0x5003][7] = 200 | 155 | 0.5
sdo[0x6411][7] = 300 : MeterAmps = 0.3 | 0.155 | 0.5
sdo[0x6411][7] = 300 : sdo[0x5003][7] = 300 | 155 | 0.5
sdo[0x6411][7] = 400 : MeterAmps = 0.4 | 0.155 | 0.5
sdo[0x6411][7] = 400 : sdo[0x5003][7] = 400 | 155 | 0.5
sdo[0x6411][7] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][7] = 500 : sdo[0x5003][7] = 500 | 155 | 0.5
sdo[0x6411][7] = 600 : MeterAmps = 0.6 | 0.155 | 0.5
sdo[0x6411][7] = 600 : sdo[0x5003][7] = 600 | 155 | 0.5
sdo[0x6411][7] = 700 : MeterAmps = 0.7 | 0.155 | 0.5
sdo[0x6411][7] = 700 : sdo[0x5003][7] = 700 | 155 | 0.5
sdo[0x6411][7] = 800 : MeterAmps = 0.8 | 0.155 | 0.5
sdo[0x6411][7] = 800 : sdo[0x5003][7] = 800 | 155 | 0.5
sdo[0x6411][7] = 900 : MeterAmps = 0.9 | 0.155 | 0.5
sdo[0x6411][7] = 900 : sdo[0x5003][7] = 900 | 155 | 0.5
sdo[0x6411][7] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][7] = 1000 : sdo[0x5003][7] = 1000 | 155 | 0.5
sdo[0x6411][7] = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
sdo[0x6411][7] = 1100 : sdo[0x5003][7] = 1100 | 155 | 0.5
sdo[0x6411][7] = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
sdo[0x6411][7] = 1200 : sdo[0x5003][7] = 1200 | 155 | 0.5
sdo[0x6411][7] = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
sdo[0x6411][7] = 1300 : sdo[0x5003][7] = 1300 | 155 | 0.5
sdo[0x6411][7] = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
sdo[0x6411][7] = 1400 : sdo[0x5003][7] = 1400 | 155 | 0.5
sdo[0x6411][7] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][7] = 1500 : sdo[0x5003][7] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][7] = 0 : NULL : WAIT = 1
J3_01 = 0 : NULL : WAIT = 1
#read signal value to update
NULL : sdo[0x5003][7] = 0 | 155 | 0.5
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][7] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5
OPERATIONAL

sdo[0x2005][1] = 64 : NULL : WAIT = 0.1
sdo[0x6411][7] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][7] = 0 : sdo[0x5003][7] = 0 | 155 | 0.5
sdo[0x6411][7] = 100 : MeterAmps = 0.1 | 0.155 | 0.5
sdo[0x6411][7] = 100 : sdo[0x5003][7] = 100 | 155 | 0.5
sdo[0x6411][7] = 200 : MeterAmps = 0.2 | 0.155 | 0.5
sdo[0x6411][7] = 200 : sdo[0x5003][7] = 200 | 155 | 0.5
sdo[0x6411][7] = 300 : MeterAmps = 0.3 | 0.155 | 0.5
sdo[0x6411][7] = 300 : sdo[0x5003][7] = 300 | 155 | 0.5
sdo[0x6411][7] = 400 : MeterAmps = 0.4 | 0.155 | 0.5
sdo[0x6411][7] = 400 : sdo[0x5003][7] = 400 | 155 | 0.5
sdo[0x6411][7] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][7] = 500 : sdo[0x5003][7] = 500 | 155 | 0.5
sdo[0x6411][7] = 600 : MeterAmps = 0.6 | 0.155 | 0.5
sdo[0x6411][7] = 600 : sdo[0x5003][7] = 600 | 155 | 0.5
sdo[0x6411][7] = 700 : MeterAmps = 0.7 | 0.155 | 0.5
sdo[0x6411][7] = 700 : sdo[0x5003][7] = 700 | 155 | 0.5
sdo[0x6411][7] = 800 : MeterAmps = 0.8 | 0.155 | 0.5
sdo[0x6411][7] = 800 : sdo[0x5003][7] = 800 | 155 | 0.5
sdo[0x6411][7] = 900 : MeterAmps = 0.9 | 0.155 | 0.5
sdo[0x6411][7] = 900 : sdo[0x5003][7] = 900 | 155 | 0.5
sdo[0x6411][7] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][7] = 1000 : sdo[0x5003][7] = 1000 | 155 | 0.5
sdo[0x6411][7] = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
sdo[0x6411][7] = 1100 : sdo[0x5003][7] = 1100 | 155 | 0.5
sdo[0x6411][7] = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
sdo[0x6411][7] = 1200 : sdo[0x5003][7] = 1200 | 155 | 0.5
sdo[0x6411][7] = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
sdo[0x6411][7] = 1300 : sdo[0x5003][7] = 1300 | 155 | 0.5
sdo[0x6411][7] = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
sdo[0x6411][7] = 1400 : sdo[0x5003][7] = 1400 | 155 | 0.5
sdo[0x6411][7] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][7] = 1500 : sdo[0x5003][7] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][7] = 0 : NULL : WAIT = 1
J3_02 = 0 : NULL : WAIT = 1
#read signal value to update
NULL : sdo[0x5003][7] = 0 | 155 | 0.5
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][8] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5
OPERATIONAL

sdo[0x2005][1] = 0 : NULL : WAIT = 0.1
sdo[0x6411][8] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][8] = 0 : sdo[0x5003][8] = 0 | 155 | 0.5
sdo[0x6411][8] = 100 : MeterAmps = 0.1 | 0.155 | 0.5
sdo[0x6411][8] = 100 : sdo[0x5003][8] = 100 | 155 | 0.5
sdo[0x6411][8] = 200 : MeterAmps = 0.2 | 0.155 | 0.5
sdo[0x6411][8] = 200 : sdo[0x5003][8] = 200 | 155 | 0.5
sdo[0x6411][8] = 300 : MeterAmps = 0.3 | 0.155 | 0.5
sdo[0x6411][8] = 300 : sdo[0x5003][8] = 300 | 155 | 0.5
sdo[0x6411][8] = 400 : MeterAmps = 0.4 | 0.155 | 0.5
sdo[0x6411][8] = 400 : sdo[0x5003][8] = 400 | 155 | 0.5
sdo[0x6411][8] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][8] = 500 : sdo[0x5003][8] = 500 | 155 | 0.5
sdo[0x6411][8] = 600 : MeterAmps = 0.6 | 0.155 | 0.5
sdo[0x6411][8] = 600 : sdo[0x5003][8] = 600 | 155 | 0.5
sdo[0x6411][8] = 700 : MeterAmps = 0.7 | 0.155 | 0.5
sdo[0x6411][8] = 700 : sdo[0x5003][8] = 700 | 155 | 0.5
sdo[0x6411][8] = 800 : MeterAmps = 0.8 | 0.155 | 0.5
sdo[0x6411][8] = 800 : sdo[0x5003][8] = 800 | 155 | 0.5
sdo[0x6411][8] = 900 : MeterAmps = 0.9 | 0.155 | 0.5
sdo[0x6411][8] = 900 : sdo[0x5003][8] = 900 | 155 | 0.5
sdo[0x6411][8] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][8] = 1000 : sdo[0x5003][8] = 1000 | 155 | 0.5
sdo[0x6411][8] = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
sdo[0x6411][8] = 1100 : sdo[0x5003][8] = 1100 | 155 | 0.5
sdo[0x6411][8] = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
sdo[0x6411][8] = 1200 : sdo[0x5003][8] = 1200 | 155 | 0.5
sdo[0x6411][8] = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
sdo[0x6411][8] = 1300 : sdo[0x5003][8] = 1300 | 155 | 0.5
sdo[0x6411][8] = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
sdo[0x6411][8] = 1400 : sdo[0x5003][8] = 1400 | 155 | 0.5
sdo[0x6411][8] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][8] = 1500 : sdo[0x5003][8] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][8] = 0 : NULL : WAIT = 1
J3_03 = 0 : NULL : WAIT = 1
#read signal value to update
NULL : sdo[0x5003][8] = 0 | 155 | 0.5
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#-----setup 37000-----
sdo[0x2000][3] = 0 : NULL : WAIT = 0.2
sdo[0x2000][4] = 0 : NULL : WAIT = 0.2
sdo[0x2001][8] = 68 : NULL : WAIT = 0.2
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5
OPERATIONAL

sdo[0x2005][1] = 128 : NULL : WAIT = 0.1
sdo[0x6411][8] = 0 : MeterAmps = 0.0 | 0.155 | 0.5
sdo[0x6411][8] = 0 : sdo[0x5003][8] = 0 | 155 | 0.5
sdo[0x6411][8] = 100 : MeterAmps = 0.1 | 0.155 | 0.5
sdo[0x6411][8] = 100 : sdo[0x5003][8] = 100 | 155 | 0.5
sdo[0x6411][8] = 200 : MeterAmps = 0.2 | 0.155 | 0.5
sdo[0x6411][8] = 200 : sdo[0x5003][8] = 200 | 155 | 0.5
sdo[0x6411][8] = 300 : MeterAmps = 0.3 | 0.155 | 0.5
sdo[0x6411][8] = 300 : sdo[0x5003][8] = 300 | 155 | 0.5
sdo[0x6411][8] = 400 : MeterAmps = 0.4 | 0.155 | 0.5
sdo[0x6411][8] = 400 : sdo[0x5003][8] = 400 | 155 | 0.5
sdo[0x6411][8] = 500 : MeterAmps = 0.5 | 0.155 | 0.5
sdo[0x6411][8] = 500 : sdo[0x5003][8] = 500 | 155 | 0.5
sdo[0x6411][8] = 600 : MeterAmps = 0.6 | 0.155 | 0.5
sdo[0x6411][8] = 600 : sdo[0x5003][8] = 600 | 155 | 0.5
sdo[0x6411][8] = 700 : MeterAmps = 0.7 | 0.155 | 0.5
sdo[0x6411][8] = 700 : sdo[0x5003][8] = 700 | 155 | 0.5
sdo[0x6411][8] = 800 : MeterAmps = 0.8 | 0.155 | 0.5
sdo[0x6411][8] = 800 : sdo[0x5003][8] = 800 | 155 | 0.5
sdo[0x6411][8] = 900 : MeterAmps = 0.9 | 0.155 | 0.5
sdo[0x6411][8] = 900 : sdo[0x5003][8] = 900 | 155 | 0.5
sdo[0x6411][8] = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
sdo[0x6411][8] = 1000 : sdo[0x5003][8] = 1000 | 155 | 0.5
sdo[0x6411][8] = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
sdo[0x6411][8] = 1100 : sdo[0x5003][8] = 1100 | 155 | 0.5
sdo[0x6411][8] = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
sdo[0x6411][8] = 1200 : sdo[0x5003][8] = 1200 | 155 | 0.5
sdo[0x6411][8] = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
sdo[0x6411][8] = 1300 : sdo[0x5003][8] = 1300 | 155 | 0.5
sdo[0x6411][8] = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
sdo[0x6411][8] = 1400 : sdo[0x5003][8] = 1400 | 155 | 0.5
sdo[0x6411][8] = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
sdo[0x6411][8] = 1500 : sdo[0x5003][8] = 1500 | 155 | 0.5
#switch out load line, switch coil
sdo[0x6411][8] = 0 : NULL : WAIT = 1
J3_04 = 0 : NULL : WAIT = 1
#read signal value to update
NULL : sdo[0x5003][8] = 0 | 155 | 0.5
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
PRE_OPERATIONAL
SAVE
END
