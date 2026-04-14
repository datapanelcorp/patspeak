#34044-3
#Verion 0.0
#PWMi normal test with a 'red coil' 6.4 ohm inductive load. (2.27 amps @ 14.5 VDC)
UUT_DBC = 34044-563.dbc
UUT_DATANAME = 34044-3-PWMI-PARALLEL

#-----setup 34044-----
#disable global modes
#configure PWMi
Command = 83, MODE1A = 1, MODE1B = 4, MODE2A = 4, MODE2B = 4, MODE3A = 1, MODE3B = 4, MODE4A = 4, MODE4B = 4, MODE5A = 4, MODE5B = 4, MODE6A = 4, MODE6B = 4, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5
Command = 84, MODE8A = 4, MODE8B = 4 : NULL : WAIT = 0.5
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.5
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.5
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0, Port5A_Kp = 20.0, Port5A_Ki = 10.0, Port5B_Kp = 20.0 : NULL : WAIT = 0.5
Command = 89, Port5B_Ki = 10.0, Port6A_Kp = 20.0, Port6A_Ki = 10.0, Port6B_Kp = 20.0, Port6B_Ki = 10.0, Port7A_Kp = 20.0, Port7A_Ki = 10.0 : NULL : WAIT = 0.5
Command = 90, Port7B_Kp = 20.0, Port7B_Ki = 10.0, Port8A_Kp = 20.0, Port8A_Ki = 10.0, Port8B_Kp = 20.0, Port8B_Ki = 10.0 : NULL : WAIT = 0.5
Command = 93, PORT1_MODE = 1, PORT2_MODE = 1, PORT3_MODE = 1, PORT4_MODE = 1, PORT5_MODE = 1, PORT6_MODE = 1, PORT7_MODE = 1, PORT8_MODE = 1 : NULL : WAIT = 0.5
Command = 82, FREQ1 = 100, SaveSettings = 1, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1 : NULL
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch outputs to load line
J2_03 = 1, J2_04 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2A = 0 : MeterAmps = 0.0 | 0.025 | 1
PWM_CTRL_2A = 100 : MeterAmps = 0.1 | 0.025 | 1
PWM_CTRL_2A = 200 : MeterAmps = 0.2 | 0.025 | 1
PWM_CTRL_2A = 300 : MeterAmps = 0.3 | 0.025 | 1
PWM_CTRL_2A = 400 : MeterAmps = 0.4 | 0.025 | 1
PWM_CTRL_2A = 500 : MeterAmps = 0.5 | 0.025 | 1
PWM_CTRL_2A = 600 : MeterAmps = 0.6 | 0.025 | 1
PWM_CTRL_2A = 700 : MeterAmps = 0.7 | 0.025 | 1
PWM_CTRL_2A = 800 : MeterAmps = 0.8 | 0.025 | 1
PWM_CTRL_2A = 900 : MeterAmps = 0.9 | 0.025 | 1
PWM_CTRL_2A = 1000 : MeterAmps = 1.0 | 0.025 | 1
PWM_CTRL_2A = 1100 : MeterAmps = 1.1 | 0.025 | 1
PWM_CTRL_2A = 1200 : MeterAmps = 1.2 | 0.025 | 1
PWM_CTRL_2A = 1300 : MeterAmps = 1.3 | 0.025 | 1
PWM_CTRL_2A = 1400 : MeterAmps = 1.4 | 0.025 | 1
PWM_CTRL_2A = 1500 : MeterAmps = 1.5 | 0.025 | 1
PWM_CTRL_2A = 1600 : MeterAmps = 1.6 | 0.025 | 1
PWM_CTRL_2A = 1700 : MeterAmps = 1.7 | 0.025 | 1
PWM_CTRL_2A = 1800 : MeterAmps = 1.8 | 0.025 | 1
PWM_CTRL_2A = 1900 : MeterAmps = 1.9 | 0.025 | 1
PWM_CTRL_2A = 2000 : MeterAmps = 2.0 | 0.025 | 1
#switch out load line, switch coil
PWM_CTRL_2A = 0 : NULL : WAIT = 1
J2_03 = 0, J2_04 = 0 : NULL : WAIT = 0.5
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch outputs to load line
J2_07 = 1, J2_08 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4A = 0 : MeterAmps = 0.0 | 0.025 | 1
PWM_CTRL_4A = 100 : MeterAmps = 0.1 | 0.025 | 1
PWM_CTRL_4A = 200 : MeterAmps = 0.2 | 0.025 | 1
PWM_CTRL_4A = 300 : MeterAmps = 0.3 | 0.025 | 1
PWM_CTRL_4A = 400 : MeterAmps = 0.4 | 0.025 | 1
PWM_CTRL_4A = 500 : MeterAmps = 0.5 | 0.025 | 1
PWM_CTRL_4A = 600 : MeterAmps = 0.6 | 0.025 | 1
PWM_CTRL_4A = 700 : MeterAmps = 0.7 | 0.025 | 1
PWM_CTRL_4A = 800 : MeterAmps = 0.8 | 0.025 | 1
PWM_CTRL_4A = 900 : MeterAmps = 0.9 | 0.025 | 1
PWM_CTRL_4A = 1000 : MeterAmps = 1.0 | 0.025 | 1
PWM_CTRL_4A = 1100 : MeterAmps = 1.1 | 0.025 | 1
PWM_CTRL_4A = 1200 : MeterAmps = 1.2 | 0.025 | 1
PWM_CTRL_4A = 1300 : MeterAmps = 1.3 | 0.025 | 1
PWM_CTRL_4A = 1400 : MeterAmps = 1.4 | 0.025 | 1
PWM_CTRL_4A = 1500 : MeterAmps = 1.5 | 0.025 | 1
PWM_CTRL_4A = 1600 : MeterAmps = 1.6 | 0.025 | 1
PWM_CTRL_4A = 1700 : MeterAmps = 1.7 | 0.025 | 1
PWM_CTRL_4A = 1800 : MeterAmps = 1.8 | 0.025 | 1
PWM_CTRL_4A = 1900 : MeterAmps = 1.9 | 0.025 | 1
PWM_CTRL_4A = 2000 : MeterAmps = 2.0 | 0.025 | 1
#switch out load line, switch coil
PWM_CTRL_4A = 0 : NULL : WAIT = 1
J2_07 = 0, J2_08 = 0 : NULL : WAIT = 0.5
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch outputs to load line
J2_09 = 1, J2_10 = 1 : NULL : WAIT = 0.5

PWM_CTRL_5A = 0 : MeterAmps = 0.0 | 0.025 | 1
PWM_CTRL_5A = 100 : MeterAmps = 0.1 | 0.025 | 1
PWM_CTRL_5A = 200 : MeterAmps = 0.2 | 0.025 | 1
PWM_CTRL_5A = 300 : MeterAmps = 0.3 | 0.025 | 1
PWM_CTRL_5A = 400 : MeterAmps = 0.4 | 0.025 | 1
PWM_CTRL_5A = 500 : MeterAmps = 0.5 | 0.025 | 1
PWM_CTRL_5A = 600 : MeterAmps = 0.6 | 0.025 | 1
PWM_CTRL_5A = 700 : MeterAmps = 0.7 | 0.025 | 1
PWM_CTRL_5A = 800 : MeterAmps = 0.8 | 0.025 | 1
PWM_CTRL_5A = 900 : MeterAmps = 0.9 | 0.025 | 1
PWM_CTRL_5A = 1000 : MeterAmps = 1.0 | 0.025 | 1
PWM_CTRL_5A = 1100 : MeterAmps = 1.1 | 0.025 | 1
PWM_CTRL_5A = 1200 : MeterAmps = 1.2 | 0.025 | 1
PWM_CTRL_5A = 1300 : MeterAmps = 1.3 | 0.025 | 1
PWM_CTRL_5A = 1400 : MeterAmps = 1.4 | 0.025 | 1
PWM_CTRL_5A = 1500 : MeterAmps = 1.5 | 0.025 | 1
PWM_CTRL_5A = 1600 : MeterAmps = 1.6 | 0.025 | 1
PWM_CTRL_5A = 1700 : MeterAmps = 1.7 | 0.025 | 1
PWM_CTRL_5A = 1800 : MeterAmps = 1.8 | 0.025 | 1
PWM_CTRL_5A = 1900 : MeterAmps = 1.9 | 0.025 | 1
PWM_CTRL_5A = 2000 : MeterAmps = 2.0 | 0.025 | 1
#switch out load line, switch coil
PWM_CTRL_5A = 0 : NULL : WAIT = 1
J2_09 = 0, J2_10 = 0 : NULL : WAIT = 0.5
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch outputs to load line
J2_11 = 1, J2_12 = 1 : NULL : WAIT = 0.5

PWM_CTRL_6A = 0 : MeterAmps = 0.0 | 0.025 | 1
PWM_CTRL_6A = 100 : MeterAmps = 0.1 | 0.025 | 1
PWM_CTRL_6A = 200 : MeterAmps = 0.2 | 0.025 | 1
PWM_CTRL_6A = 300 : MeterAmps = 0.3 | 0.025 | 1
PWM_CTRL_6A = 400 : MeterAmps = 0.4 | 0.025 | 1
PWM_CTRL_6A = 500 : MeterAmps = 0.5 | 0.025 | 1
PWM_CTRL_6A = 600 : MeterAmps = 0.6 | 0.025 | 1
PWM_CTRL_6A = 700 : MeterAmps = 0.7 | 0.025 | 1
PWM_CTRL_6A = 800 : MeterAmps = 0.8 | 0.025 | 1
PWM_CTRL_6A = 900 : MeterAmps = 0.9 | 0.025 | 1
PWM_CTRL_6A = 1000 : MeterAmps = 1.0 | 0.025 | 1
PWM_CTRL_6A = 1100 : MeterAmps = 1.1 | 0.025 | 1
PWM_CTRL_6A = 1200 : MeterAmps = 1.2 | 0.025 | 1
PWM_CTRL_6A = 1300 : MeterAmps = 1.3 | 0.025 | 1
PWM_CTRL_6A = 1400 : MeterAmps = 1.4 | 0.025 | 1
PWM_CTRL_6A = 1500 : MeterAmps = 1.5 | 0.025 | 1
PWM_CTRL_6A = 1600 : MeterAmps = 1.6 | 0.025 | 1
PWM_CTRL_6A = 1700 : MeterAmps = 1.7 | 0.025 | 1
PWM_CTRL_6A = 1800 : MeterAmps = 1.8 | 0.025 | 1
PWM_CTRL_6A = 1900 : MeterAmps = 1.9 | 0.025 | 1
PWM_CTRL_6A = 2000 : MeterAmps = 2.0 | 0.025 | 1
#switch out load line, switch coil
PWM_CTRL_6A = 0 : NULL : WAIT = 1
J2_11 = 0, J2_12 = 0 : NULL : WAIT = 0.5
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch outputs to load line
J3_01 = 1, J3_02 = 1 : NULL : WAIT = 0.5

PWM_CTRL_7A = 0 : MeterAmps = 0.0 | 0.025 | 1
PWM_CTRL_7A = 100 : MeterAmps = 0.1 | 0.025 | 1
PWM_CTRL_7A = 200 : MeterAmps = 0.2 | 0.025 | 1
PWM_CTRL_7A = 300 : MeterAmps = 0.3 | 0.025 | 1
PWM_CTRL_7A = 400 : MeterAmps = 0.4 | 0.025 | 1
PWM_CTRL_7A = 500 : MeterAmps = 0.5 | 0.025 | 1
PWM_CTRL_7A = 600 : MeterAmps = 0.6 | 0.025 | 1
PWM_CTRL_7A = 700 : MeterAmps = 0.7 | 0.025 | 1
PWM_CTRL_7A = 800 : MeterAmps = 0.8 | 0.025 | 1
PWM_CTRL_7A = 900 : MeterAmps = 0.9 | 0.025 | 1
PWM_CTRL_7A = 1000 : MeterAmps = 1.0 | 0.025 | 1
PWM_CTRL_7A = 1100 : MeterAmps = 1.1 | 0.025 | 1
PWM_CTRL_7A = 1200 : MeterAmps = 1.2 | 0.025 | 1
PWM_CTRL_7A = 1300 : MeterAmps = 1.3 | 0.025 | 1
PWM_CTRL_7A = 1400 : MeterAmps = 1.4 | 0.025 | 1
PWM_CTRL_7A = 1500 : MeterAmps = 1.5 | 0.025 | 1
PWM_CTRL_7A = 1600 : MeterAmps = 1.6 | 0.025 | 1
PWM_CTRL_7A = 1700 : MeterAmps = 1.7 | 0.025 | 1
PWM_CTRL_7A = 1800 : MeterAmps = 1.8 | 0.025 | 1
PWM_CTRL_7A = 1900 : MeterAmps = 1.9 | 0.025 | 1
PWM_CTRL_7A = 2000 : MeterAmps = 2.0 | 0.025 | 1
#switch out load line, switch coil
PWM_CTRL_7A = 0 : NULL : WAIT = 1
J3_01 = 0, J3_02 = 0 : NULL : WAIT = 0.5
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch outputs to load line
J3_03 = 1, J3_04 = 1 : NULL : WAIT = 0.5

PWM_CTRL_8A = 0 : MeterAmps = 0.0 | 0.025 | 1
PWM_CTRL_8A = 100 : MeterAmps = 0.1 | 0.025 | 1
PWM_CTRL_8A = 200 : MeterAmps = 0.2 | 0.025 | 1
PWM_CTRL_8A = 300 : MeterAmps = 0.3 | 0.025 | 1
PWM_CTRL_8A = 400 : MeterAmps = 0.4 | 0.025 | 1
PWM_CTRL_8A = 500 : MeterAmps = 0.5 | 0.025 | 1
PWM_CTRL_8A = 600 : MeterAmps = 0.6 | 0.025 | 1
PWM_CTRL_8A = 700 : MeterAmps = 0.7 | 0.025 | 1
PWM_CTRL_8A = 800 : MeterAmps = 0.8 | 0.025 | 1
PWM_CTRL_8A = 900 : MeterAmps = 0.9 | 0.025 | 1
PWM_CTRL_8A = 1000 : MeterAmps = 1.0 | 0.025 | 1
PWM_CTRL_8A = 1100 : MeterAmps = 1.1 | 0.025 | 1
PWM_CTRL_8A = 1200 : MeterAmps = 1.2 | 0.025 | 1
PWM_CTRL_8A = 1300 : MeterAmps = 1.3 | 0.025 | 1
PWM_CTRL_8A = 1400 : MeterAmps = 1.4 | 0.025 | 1
PWM_CTRL_8A = 1500 : MeterAmps = 1.5 | 0.025 | 1
PWM_CTRL_8A = 1600 : MeterAmps = 1.6 | 0.025 | 1
PWM_CTRL_8A = 1700 : MeterAmps = 1.7 | 0.025 | 1
PWM_CTRL_8A = 1800 : MeterAmps = 1.8 | 0.025 | 1
PWM_CTRL_8A = 1900 : MeterAmps = 1.9 | 0.025 | 1
PWM_CTRL_8A = 2000 : MeterAmps = 2.0 | 0.025 | 1
#switch out load line, switch coil
PWM_CTRL_8A = 0 : NULL : WAIT = 1
J3_03 = 0, J3_04 = 0 : NULL : WAIT = 0.5
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
SAVE
END
