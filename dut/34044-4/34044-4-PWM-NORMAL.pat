#34044-4
#Verion 0.0
#PWM test with 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
UUT_DBC = 34044-564.dbc
UUT_DATANAME = 34044-4-PWM-NORMAL

#-----setup 34044-----
#disable global modes
#configure Ports
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 3, MODE2B = 3, MODE3A = 1, MODE3B = 1, MODE4A = 3, MODE4B = 3, MODE5A = 3, MODE5B = 3, MODE6A = 3, MODE6B = 3, MODE7A = 3, MODE7B = 3 : NULL : WAIT = 0.5
Command = 84, MODE8A = 3, MODE8B = 3 : NULL : WAIT = 0.5
Command = 82, FREQ1 = 1000, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1, SaveSettings = 1 : NULL : WAIT = 0.5
Command = 82, FREQ1 = 40, SaveSettings = 1 : NULL : WAIT = 0.5
Command = 0 : NULL : WAIT = 0.1
#switch in coil
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT2 = 0 : NULL : WAIT = 0.5
PWM_CTRL_PORT2 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port2AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT2 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port2AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT2 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port2AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT2 = 0 : NULL : WAIT = 0.5
J2_03 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT2 = 1 : NULL : WAIT = 0.5
PWM_CTRL_PORT2 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port2AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT2 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port2AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT2 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port2AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT2 = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT4 = 0 : NULL : WAIT = 0.5
PWM_CTRL_PORT4 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port4AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT4 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port4AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT4 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port4AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT4 = 0 : NULL : WAIT = 0.5
J2_07 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT4 = 1 : NULL : WAIT = 0.5
PWM_CTRL_PORT4 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port4AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT4 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port4AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT4 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port4AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT4 = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_09 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT5 = 0 : NULL : WAIT = 0.5
PWM_CTRL_PORT5 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port5AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT5 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port5AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT5 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port5AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT5 = 0 : NULL : WAIT = 0.5
J2_09 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_10 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT5 = 1 : NULL : WAIT = 0.5
PWM_CTRL_PORT5 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port5AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT5 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port5AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT5 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port5AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT5 = 0 : NULL : WAIT = 0.5
J2_10 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_11 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT6 = 0 : NULL : WAIT = 0.5
PWM_CTRL_PORT6 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port6AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT6 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port6AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT6 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port6AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT6 = 0 : NULL : WAIT = 0.5
J2_11 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_12 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT6 = 1 : NULL : WAIT = 0.5
PWM_CTRL_PORT6 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port6AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT6 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port6AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT6 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port6AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT6 = 0 : NULL : WAIT = 0.5
J2_12 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT7 = 0 : NULL : WAIT = 0.5
PWM_CTRL_PORT7 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port7AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT7 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port7AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT7 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port7AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT7 = 0 : NULL : WAIT = 0.5
J3_01 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT7 = 1 : NULL : WAIT = 0.5
PWM_CTRL_PORT7 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port7AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT7 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port7AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT7 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port7AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT7 = 0 : NULL : WAIT = 0.5
J3_02 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT8 = 0 : NULL : WAIT = 0.5
PWM_CTRL_PORT8 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port8AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT8 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port8AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT8 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port8AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT8 = 0 : NULL : WAIT = 0.5
J3_03 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT8 = 1 : NULL : WAIT = 0.5
PWM_CTRL_PORT8 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port8AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT8 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port8AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT8 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port8AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT8 = 0 : NULL : WAIT = 0.5
J3_04 = 0 : NULL : WAIT = 0.5
Command = 82, FREQ1 = 500, SaveSettings = 1 : NULL : WAIT = 0.5
Command = 0 : NULL : WAIT = 0.1
#switch in coil
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT2 = 0 : NULL : WAIT = 0.5
PWM_CTRL_PORT2 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port2AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT2 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port2AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT2 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port2AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT2 = 0 : NULL : WAIT = 0.5
J2_03 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT2 = 1 : NULL : WAIT = 0.5
PWM_CTRL_PORT2 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port2AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT2 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port2AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT2 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port2AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT2 = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT4 = 0 : NULL : WAIT = 0.5
PWM_CTRL_PORT4 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port4AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT4 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port4AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT4 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port4AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT4 = 0 : NULL : WAIT = 0.5
J2_07 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT4 = 1 : NULL : WAIT = 0.5
PWM_CTRL_PORT4 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port4AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT4 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port4AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT4 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port4AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT4 = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_09 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT5 = 0 : NULL : WAIT = 0.5
PWM_CTRL_PORT5 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port5AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT5 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port5AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT5 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port5AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT5 = 0 : NULL : WAIT = 0.5
J2_09 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_10 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT5 = 1 : NULL : WAIT = 0.5
PWM_CTRL_PORT5 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port5AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT5 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port5AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT5 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port5AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT5 = 0 : NULL : WAIT = 0.5
J2_10 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_11 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT6 = 0 : NULL : WAIT = 0.5
PWM_CTRL_PORT6 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port6AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT6 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port6AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT6 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port6AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT6 = 0 : NULL : WAIT = 0.5
J2_11 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_12 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT6 = 1 : NULL : WAIT = 0.5
PWM_CTRL_PORT6 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port6AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT6 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port6AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT6 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port6AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT6 = 0 : NULL : WAIT = 0.5
J2_12 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT7 = 0 : NULL : WAIT = 0.5
PWM_CTRL_PORT7 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port7AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT7 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port7AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT7 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port7AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT7 = 0 : NULL : WAIT = 0.5
J3_01 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT7 = 1 : NULL : WAIT = 0.5
PWM_CTRL_PORT7 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port7AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT7 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port7AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT7 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port7AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT7 = 0 : NULL : WAIT = 0.5
J3_02 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT8 = 0 : NULL : WAIT = 0.5
PWM_CTRL_PORT8 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port8AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT8 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port8AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT8 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port8AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT8 = 0 : NULL : WAIT = 0.5
J3_03 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT8 = 1 : NULL : WAIT = 0.5
PWM_CTRL_PORT8 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port8AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT8 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port8AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT8 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port8AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT8 = 0 : NULL : WAIT = 0.5
J3_04 = 0 : NULL : WAIT = 0.5
Command = 82, FREQ1 = 1200, SaveSettings = 1 : NULL : WAIT = 0.5
Command = 0 : NULL : WAIT = 0.1
#switch in coil
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT2 = 0 : NULL : WAIT = 0.5
PWM_CTRL_PORT2 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port2AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT2 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port2AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT2 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port2AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT2 = 0 : NULL : WAIT = 0.5
J2_03 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT2 = 1 : NULL : WAIT = 0.5
PWM_CTRL_PORT2 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port2AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT2 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port2AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT2 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port2AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT2 = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT4 = 0 : NULL : WAIT = 0.5
PWM_CTRL_PORT4 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port4AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT4 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port4AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT4 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port4AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT4 = 0 : NULL : WAIT = 0.5
J2_07 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT4 = 1 : NULL : WAIT = 0.5
PWM_CTRL_PORT4 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port4AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT4 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port4AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT4 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port4AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT4 = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_09 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT5 = 0 : NULL : WAIT = 0.5
PWM_CTRL_PORT5 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port5AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT5 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port5AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT5 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port5AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT5 = 0 : NULL : WAIT = 0.5
J2_09 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_10 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT5 = 1 : NULL : WAIT = 0.5
PWM_CTRL_PORT5 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port5AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT5 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port5AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT5 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port5AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT5 = 0 : NULL : WAIT = 0.5
J2_10 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_11 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT6 = 0 : NULL : WAIT = 0.5
PWM_CTRL_PORT6 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port6AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT6 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port6AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT6 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port6AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT6 = 0 : NULL : WAIT = 0.5
J2_11 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_12 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT6 = 1 : NULL : WAIT = 0.5
PWM_CTRL_PORT6 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port6AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT6 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port6AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT6 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port6AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT6 = 0 : NULL : WAIT = 0.5
J2_12 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT7 = 0 : NULL : WAIT = 0.5
PWM_CTRL_PORT7 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port7AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT7 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port7AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT7 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port7AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT7 = 0 : NULL : WAIT = 0.5
J3_01 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT7 = 1 : NULL : WAIT = 0.5
PWM_CTRL_PORT7 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port7AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT7 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port7AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT7 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port7AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT7 = 0 : NULL : WAIT = 0.5
J3_02 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT8 = 0 : NULL : WAIT = 0.5
PWM_CTRL_PORT8 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port8AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT8 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port8AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT8 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port8AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT8 = 0 : NULL : WAIT = 0.5
J3_03 = 0 : NULL : WAIT = 0.5
J4_02 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5

PWM_SIGN_PORT8 = 1 : NULL : WAIT = 0.5
PWM_CTRL_PORT8 = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.155 | 0.5
NULL : Port8AmpData = 0.8 | 0.2 | 0.5
PWM_CTRL_PORT8 = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.155 | 0.5
NULL : Port8AmpData = 1.6 | 0.2 | 0.5
PWM_CTRL_PORT8 = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.155 | 0.5
NULL : Port8AmpData = 3.3 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_PORT8 = 0 : NULL : WAIT = 0.5
J3_04 = 0 : NULL : WAIT = 0.5
SAVE
END
