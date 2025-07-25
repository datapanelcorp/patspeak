#34044-1
#Verion 0.0
#PWM test with 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
UUT_EDS = 34044-561.eds
UUT_DATANAME = 34044-1-CANOPEN-OUTPUT-PWM-NORMAL-MODE-2

#-----setup 34044-----
#disable global modes
#configure Ports
Command = 83, MODE1A = 2, MODE1B = 2, MODE2A = 2, MODE2B = 2, MODE3A = 2, MODE3B = 2, MODE4A = 2, MODE4B = 2 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 93, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL : WAIT = 0.5
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL : WAIT = 0.5
Command = 82, SaveSettings = 1, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, SaveSettings = 0, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
Command = 82, FREQ1 = 40, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FREQ1 = 0, SaveSettings = 0 : NULL
#switch in 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
J4_01 = 1 : NULL : WAIT = 0.2
J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5

sdo[0x6411][1] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][1] = 0.8 | 0.2 | 0.5
sdo[0x6411][1] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][1] = 1.6 | 0.2 | 0.5
sdo[0x6411][1] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][1] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][1] = 0 : NULL : WAIT = 0.5
J2_01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

sdo[0x6411][2] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 0.8 | 0.2 | 0.5
sdo[0x6411][2] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 1.6 | 0.2 | 0.5
sdo[0x6411][2] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][2] = 0 : NULL : WAIT = 0.5
J2_02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

sdo[0x6411][3] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 0.8 | 0.2 | 0.5
sdo[0x6411][3] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 1.6 | 0.2 | 0.5
sdo[0x6411][3] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][3] = 0 : NULL : WAIT = 0.5
J2_03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

sdo[0x6411][4] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 0.8 | 0.2 | 0.5
sdo[0x6411][4] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 1.6 | 0.2 | 0.5
sdo[0x6411][4] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][4] = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5

sdo[0x6411][5] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][5] = 0.8 | 0.2 | 0.5
sdo[0x6411][5] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][5] = 1.6 | 0.2 | 0.5
sdo[0x6411][5] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][5] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][5] = 0 : NULL : WAIT = 0.5
J2_05 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

sdo[0x6411][6] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 0.8 | 0.2 | 0.5
sdo[0x6411][6] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 1.6 | 0.2 | 0.5
sdo[0x6411][6] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][6] = 0 : NULL : WAIT = 0.5
J2_06 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

sdo[0x6411][7] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 0.8 | 0.2 | 0.5
sdo[0x6411][7] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 1.6 | 0.2 | 0.5
sdo[0x6411][7] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][7] = 0 : NULL : WAIT = 0.5
J2_07 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

sdo[0x6411][8] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 0.8 | 0.2 | 0.5
sdo[0x6411][8] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 1.6 | 0.2 | 0.5
sdo[0x6411][8] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][8] = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
Command = 82, FREQ1 = 500, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FREQ1 = 0, SaveSettings = 0 : NULL
#switch in 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
J4_01 = 1 : NULL : WAIT = 0.2
J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5

sdo[0x6411][1] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][1] = 0.8 | 0.2 | 0.5
sdo[0x6411][1] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][1] = 1.6 | 0.2 | 0.5
sdo[0x6411][1] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][1] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][1] = 0 : NULL : WAIT = 0.5
J2_01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

sdo[0x6411][2] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 0.8 | 0.2 | 0.5
sdo[0x6411][2] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 1.6 | 0.2 | 0.5
sdo[0x6411][2] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][2] = 0 : NULL : WAIT = 0.5
J2_02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

sdo[0x6411][3] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 0.8 | 0.2 | 0.5
sdo[0x6411][3] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 1.6 | 0.2 | 0.5
sdo[0x6411][3] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][3] = 0 : NULL : WAIT = 0.5
J2_03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

sdo[0x6411][4] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 0.8 | 0.2 | 0.5
sdo[0x6411][4] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 1.6 | 0.2 | 0.5
sdo[0x6411][4] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][4] = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5

sdo[0x6411][5] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][5] = 0.8 | 0.2 | 0.5
sdo[0x6411][5] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][5] = 1.6 | 0.2 | 0.5
sdo[0x6411][5] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][5] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][5] = 0 : NULL : WAIT = 0.5
J2_05 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

sdo[0x6411][6] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 0.8 | 0.2 | 0.5
sdo[0x6411][6] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 1.6 | 0.2 | 0.5
sdo[0x6411][6] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][6] = 0 : NULL : WAIT = 0.5
J2_06 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

sdo[0x6411][7] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 0.8 | 0.2 | 0.5
sdo[0x6411][7] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 1.6 | 0.2 | 0.5
sdo[0x6411][7] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][7] = 0 : NULL : WAIT = 0.5
J2_07 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

sdo[0x6411][8] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 0.8 | 0.2 | 0.5
sdo[0x6411][8] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 1.6 | 0.2 | 0.5
sdo[0x6411][8] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][8] = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
Command = 82, FREQ1 = 1200, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FREQ1 = 0, SaveSettings = 0 : NULL
#switch in 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
J4_01 = 1 : NULL : WAIT = 0.2
J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5

sdo[0x6411][1] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][1] = 0.8 | 0.2 | 0.5
sdo[0x6411][1] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][1] = 1.6 | 0.2 | 0.5
sdo[0x6411][1] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][1] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][1] = 0 : NULL : WAIT = 0.5
J2_01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

sdo[0x6411][2] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 0.8 | 0.2 | 0.5
sdo[0x6411][2] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 1.6 | 0.2 | 0.5
sdo[0x6411][2] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][2] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][2] = 0 : NULL : WAIT = 0.5
J2_02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

sdo[0x6411][3] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 0.8 | 0.2 | 0.5
sdo[0x6411][3] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 1.6 | 0.2 | 0.5
sdo[0x6411][3] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][3] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][3] = 0 : NULL : WAIT = 0.5
J2_03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

sdo[0x6411][4] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 0.8 | 0.2 | 0.5
sdo[0x6411][4] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 1.6 | 0.2 | 0.5
sdo[0x6411][4] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][4] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][4] = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5

sdo[0x6411][5] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][5] = 0.8 | 0.2 | 0.5
sdo[0x6411][5] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][5] = 1.6 | 0.2 | 0.5
sdo[0x6411][5] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][5] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][5] = 0 : NULL : WAIT = 0.5
J2_05 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

sdo[0x6411][6] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 0.8 | 0.2 | 0.5
sdo[0x6411][6] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 1.6 | 0.2 | 0.5
sdo[0x6411][6] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][6] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][6] = 0 : NULL : WAIT = 0.5
J2_06 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

sdo[0x6411][7] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 0.8 | 0.2 | 0.5
sdo[0x6411][7] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 1.6 | 0.2 | 0.5
sdo[0x6411][7] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][7] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][7] = 0 : NULL : WAIT = 0.5
J2_07 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

sdo[0x6411][8] = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 0.8 | 0.2 | 0.5
sdo[0x6411][8] = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 1.6 | 0.2 | 0.5
sdo[0x6411][8] = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.2 | 0.5
NULL : sdo[0x5003][8] = 3.3 | 0.2 | 0.5
#switch out load line, switch coil
sdo[0x6411][8] = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
SAVE
END
