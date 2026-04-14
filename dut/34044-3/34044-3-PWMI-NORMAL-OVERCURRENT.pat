#34044-3
#Verion 0.0
#PWMi normal test with a 2.1 Ohm resistive load. (6.9 amps @ 14.5 VDC)
#PWMi overshoot should cause the output to overcurrent
UUT_DBC = 34044-563.dbc
UUT_DATANAME = 34044-3-PWMI-NORMAL-OVERCURRENT

#-----setup 34044-----
#disable global modes
#configure PWMi
Command = 83, MODE1A = 1, MODE1B = 4, MODE2A = 4, MODE2B = 4, MODE3A = 1, MODE3B = 4, MODE4A = 4, MODE4B = 4, MODE5A = 4, MODE5B = 4, MODE6A = 4, MODE6B = 4, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5
Command = 84, MODE8A = 4, MODE8B = 4 : NULL : WAIT = 0.5
Command = 84, Port1A_Kp = 80.0, Port1A_Ki = 50.0, Port1B_Kp = 80.0, Port1B_Ki = 50.0, Port2A_Kp = 80.0, Port2A_Ki = 50.0 : NULL : WAIT = 0.5
Command = 85, Port2B_Kp = 80.0, Port2B_Ki = 50.0, Port3A_Kp = 80.0, Port3A_Ki = 50.0, Port3B_Kp = 80.0, Port3B_Ki = 50.0 : NULL : WAIT = 0.5
Command = 86, Port4A_Kp = 80.0, Port4A_Ki = 50.0, Port4B_Kp = 80.0, Port4B_Ki = 50.0, Port5A_Kp = 80.0, Port5A_Ki = 50.0, Port5B_Kp = 80.0 : NULL : WAIT = 0.5
Command = 89, Port5B_Ki = 50.0, Port6A_Kp = 80.0, Port6A_Ki = 50.0, Port6B_Kp = 80.0, Port6B_Ki = 50.0, Port7A_Kp = 80.0, Port7A_Ki = 50.0 : NULL : WAIT = 0.5
Command = 90, Port7B_Kp = 80.0, Port7B_Ki = 50.0, Port8A_Kp = 80.0, Port8A_Ki = 50.0, Port8B_Kp = 80.0, Port8B_Ki = 50.0 : NULL : WAIT = 0.5
Command = 93, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0, PORT5_MODE = 0, PORT6_MODE = 0, PORT7_MODE = 0, PORT8_MODE = 0 : NULL : WAIT = 0.5
Command = 82, FREQ1 = 100, SaveSettings = 1, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL
Command = 82, SaveSettings = 1 : NULL
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

PWM_CTRL_1B = 4000 : OutStat1B = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_1B = 0 : NULL : WAIT = 1
J2_02 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2A = 4000 : OutStat2A = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_2A = 0 : NULL : WAIT = 1
J2_03 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2B = 4000 : OutStat2B = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_2B = 0 : NULL : WAIT = 1
J2_04 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

PWM_CTRL_3B = 4000 : OutStat3B = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_3B = 0 : NULL : WAIT = 1
J2_06 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4A = 4000 : OutStat4A = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_4A = 0 : NULL : WAIT = 1
J2_07 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4B = 4000 : OutStat4B = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_4B = 0 : NULL : WAIT = 1
J2_08 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_09 = 1 : NULL : WAIT = 0.5

PWM_CTRL_5A = 4000 : OutStat5A = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_5A = 0 : NULL : WAIT = 1
J2_09 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_10 = 1 : NULL : WAIT = 0.5

PWM_CTRL_5B = 4000 : OutStat5B = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_5B = 0 : NULL : WAIT = 1
J2_10 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_11 = 1 : NULL : WAIT = 0.5

PWM_CTRL_6A = 4000 : OutStat6A = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_6A = 0 : NULL : WAIT = 1
J2_11 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_12 = 1 : NULL : WAIT = 0.5

PWM_CTRL_6B = 4000 : OutStat6B = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_6B = 0 : NULL : WAIT = 1
J2_12 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5

PWM_CTRL_7A = 4000 : OutStat7A = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_7A = 0 : NULL : WAIT = 1
J3_01 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5

PWM_CTRL_7B = 4000 : OutStat7B = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_7B = 0 : NULL : WAIT = 1
J3_02 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5

PWM_CTRL_8A = 4000 : OutStat8A = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_8A = 0 : NULL : WAIT = 1
J3_03 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5

PWM_CTRL_8B = 4000 : OutStat8B = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_8B = 0 : NULL : WAIT = 1
J3_04 = 0 : NULL : WAIT = 1
SAVE
END
