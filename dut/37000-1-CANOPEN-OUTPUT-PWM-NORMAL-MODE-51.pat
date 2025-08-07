#37000-1
#Verion 0.0
#PWM test with 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
UUT_EDS = 37000-561.eds
UUT_DATANAME = 37000-1-CANOPEN-OUTPUT-PWM-NORMAL-MODE-51

#-----get info 37000-1-----
#-VBAT
NULL : sdo[0x5002][1] = 0 | 9999 | 0.1
#-TEMP
NULL : sdo[0x5002][2] = 0 | 9999 | 0.1
#-CNFG1
NULL : sdo[0x5002][3] = 0 | 9999 | 0.1
#-CNFG2
NULL : sdo[0x5002][4] = 0 | 9999 | 0.1
#-CNFG3
NULL : sdo[0x5002][5] = 0 | 9999 | 0.1
#-----setup 37000-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Ports
sdo[0x2001][1] = 51 : NULL : WAIT = 0.1
sdo[0x2001][2] = 51 : NULL : WAIT = 0.1
sdo[0x2001][3] = 51 : NULL : WAIT = 0.1
sdo[0x2001][4] = 51 : NULL : WAIT = 0.1
PRE_OPERATIONAL
#test at 1000hz
sdo[0x3000] = 1000 : NULL : WAIT = 0.5
OPERATIONAL
#switch in 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
J4_01 = 1 : NULL : WAIT = 0.2
J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5

sdo[0x6411][1] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][1] = 800 | 200 | 0.5
sdo[0x6411][1] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][1] = 1600 | 200 | 0.5
sdo[0x6411][1] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][1] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][1] = 0 : NULL : WAIT = 0.5
J2_01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

sdo[0x6411][2] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 800 | 200 | 0.5
sdo[0x6411][2] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 1600 | 200 | 0.5
sdo[0x6411][2] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][2] = 0 : NULL : WAIT = 0.5
J2_02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

sdo[0x6411][3] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 800 | 200 | 0.5
sdo[0x6411][3] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 1600 | 200 | 0.5
sdo[0x6411][3] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][3] = 0 : NULL : WAIT = 0.5
J2_03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

sdo[0x6411][4] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 800 | 200 | 0.5
sdo[0x6411][4] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 1600 | 200 | 0.5
sdo[0x6411][4] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][4] = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5

sdo[0x6411][5] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][5] = 800 | 200 | 0.5
sdo[0x6411][5] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][5] = 1600 | 200 | 0.5
sdo[0x6411][5] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][5] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][5] = 0 : NULL : WAIT = 0.5
J2_05 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

sdo[0x6411][6] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 800 | 200 | 0.5
sdo[0x6411][6] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 1600 | 200 | 0.5
sdo[0x6411][6] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][6] = 0 : NULL : WAIT = 0.5
J2_06 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

sdo[0x6411][7] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 800 | 200 | 0.5
sdo[0x6411][7] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 1600 | 200 | 0.5
sdo[0x6411][7] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][7] = 0 : NULL : WAIT = 0.5
J2_07 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

sdo[0x6411][8] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 800 | 200 | 0.5
sdo[0x6411][8] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 1600 | 200 | 0.5
sdo[0x6411][8] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][8] = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
PRE_OPERATIONAL
#test at 500hz
sdo[0x3000] = 500 : NULL : WAIT = 0.5
OPERATIONAL
#switch in 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
J4_01 = 1 : NULL : WAIT = 0.2
J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5

sdo[0x6411][1] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][1] = 800 | 200 | 0.5
sdo[0x6411][1] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][1] = 1600 | 200 | 0.5
sdo[0x6411][1] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][1] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][1] = 0 : NULL : WAIT = 0.5
J2_01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

sdo[0x6411][2] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 800 | 200 | 0.5
sdo[0x6411][2] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 1600 | 200 | 0.5
sdo[0x6411][2] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][2] = 0 : NULL : WAIT = 0.5
J2_02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

sdo[0x6411][3] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 800 | 200 | 0.5
sdo[0x6411][3] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 1600 | 200 | 0.5
sdo[0x6411][3] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][3] = 0 : NULL : WAIT = 0.5
J2_03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

sdo[0x6411][4] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 800 | 200 | 0.5
sdo[0x6411][4] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 1600 | 200 | 0.5
sdo[0x6411][4] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][4] = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5

sdo[0x6411][5] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][5] = 800 | 200 | 0.5
sdo[0x6411][5] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][5] = 1600 | 200 | 0.5
sdo[0x6411][5] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][5] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][5] = 0 : NULL : WAIT = 0.5
J2_05 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

sdo[0x6411][6] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 800 | 200 | 0.5
sdo[0x6411][6] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 1600 | 200 | 0.5
sdo[0x6411][6] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][6] = 0 : NULL : WAIT = 0.5
J2_06 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

sdo[0x6411][7] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 800 | 200 | 0.5
sdo[0x6411][7] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 1600 | 200 | 0.5
sdo[0x6411][7] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][7] = 0 : NULL : WAIT = 0.5
J2_07 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

sdo[0x6411][8] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 800 | 200 | 0.5
sdo[0x6411][8] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 1600 | 200 | 0.5
sdo[0x6411][8] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][8] = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
PRE_OPERATIONAL
#test at 64hz
sdo[0x3000] = 64 : NULL : WAIT = 0.5
OPERATIONAL
#switch in 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
J4_01 = 1 : NULL : WAIT = 0.2
J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5

sdo[0x6411][1] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][1] = 800 | 200 | 0.5
sdo[0x6411][1] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][1] = 1600 | 200 | 0.5
sdo[0x6411][1] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][1] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][1] = 0 : NULL : WAIT = 0.5
J2_01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

sdo[0x6411][2] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 800 | 200 | 0.5
sdo[0x6411][2] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 1600 | 200 | 0.5
sdo[0x6411][2] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][2] = 0 : NULL : WAIT = 0.5
J2_02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

sdo[0x6411][3] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 800 | 200 | 0.5
sdo[0x6411][3] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 1600 | 200 | 0.5
sdo[0x6411][3] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][3] = 0 : NULL : WAIT = 0.5
J2_03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

sdo[0x6411][4] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 800 | 200 | 0.5
sdo[0x6411][4] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 1600 | 200 | 0.5
sdo[0x6411][4] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][4] = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5

sdo[0x6411][5] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][5] = 800 | 200 | 0.5
sdo[0x6411][5] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][5] = 1600 | 200 | 0.5
sdo[0x6411][5] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][5] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][5] = 0 : NULL : WAIT = 0.5
J2_05 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

sdo[0x6411][6] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 800 | 200 | 0.5
sdo[0x6411][6] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 1600 | 200 | 0.5
sdo[0x6411][6] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][6] = 0 : NULL : WAIT = 0.5
J2_06 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

sdo[0x6411][7] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 800 | 200 | 0.5
sdo[0x6411][7] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 1600 | 200 | 0.5
sdo[0x6411][7] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][7] = 0 : NULL : WAIT = 0.5
J2_07 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

sdo[0x6411][8] = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 800 | 200 | 0.5
sdo[0x6411][8] = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 1600 | 200 | 0.5
sdo[0x6411][8] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 3300 | 200 | 0.5
#switch out load line, switch coil
sdo[0x6411][8] = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
SAVE
END
