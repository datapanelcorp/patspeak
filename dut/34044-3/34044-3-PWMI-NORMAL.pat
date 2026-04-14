#34044-3
#Verion 0.0
#PWMi normal test with a 'red coil' 6.4 ohm inductive load. (2.27 amps @ 14.5 VDC)
UUT_DBC = 34044-563.dbc
UUT_DATANAME = 34044-3-PWMI-NORMAL

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
Command = 93, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0, PORT5_MODE = 0, PORT6_MODE = 0, PORT7_MODE = 0, PORT8_MODE = 0 : NULL : WAIT = 0.5
Command = 82, FREQ1 = 100, SaveSettings = 1, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL
Command = 82, SaveSettings = 1 : NULL
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

PWM_CTRL_1B = 0 : MeterAmps = 0.0 | 0.020 | 0.5
PWM_CTRL_1B = 0 : Feedback1B = 0.0 | 0 | 0.5
PWM_CTRL_1B = 100 : MeterAmps = 0.1 | 0.020 | 0.5
PWM_CTRL_1B = 100 : Feedback1B = 0.1 | 0 | 0.5
PWM_CTRL_1B = 200 : MeterAmps = 0.2 | 0.020 | 0.5
PWM_CTRL_1B = 200 : Feedback1B = 0.2 | 0 | 0.5
PWM_CTRL_1B = 300 : MeterAmps = 0.3 | 0.020 | 0.5
PWM_CTRL_1B = 300 : Feedback1B = 0.3 | 0 | 0.5
PWM_CTRL_1B = 400 : MeterAmps = 0.4 | 0.020 | 0.5
PWM_CTRL_1B = 400 : Feedback1B = 0.4 | 0 | 0.5
PWM_CTRL_1B = 500 : MeterAmps = 0.5 | 0.020 | 0.5
PWM_CTRL_1B = 500 : Feedback1B = 0.5 | 0 | 0.5
PWM_CTRL_1B = 600 : MeterAmps = 0.6 | 0.020 | 0.5
PWM_CTRL_1B = 600 : Feedback1B = 0.6 | 0 | 0.5
PWM_CTRL_1B = 700 : MeterAmps = 0.7 | 0.020 | 0.5
PWM_CTRL_1B = 700 : Feedback1B = 0.7 | 0 | 0.5
PWM_CTRL_1B = 800 : MeterAmps = 0.8 | 0.020 | 0.5
PWM_CTRL_1B = 800 : Feedback1B = 0.8 | 0 | 0.5
PWM_CTRL_1B = 900 : MeterAmps = 0.9 | 0.020 | 0.5
PWM_CTRL_1B = 900 : Feedback1B = 0.9 | 0 | 0.5
PWM_CTRL_1B = 1000 : MeterAmps = 1.0 | 0.020 | 0.5
PWM_CTRL_1B = 1000 : Feedback1B = 1.0 | 0 | 0.5
PWM_CTRL_1B = 1100 : MeterAmps = 1.1 | 0.020 | 0.5
PWM_CTRL_1B = 1100 : Feedback1B = 1.1 | 0 | 0.5
PWM_CTRL_1B = 1200 : MeterAmps = 1.2 | 0.020 | 0.5
PWM_CTRL_1B = 1200 : Feedback1B = 1.2 | 0 | 0.5
PWM_CTRL_1B = 1300 : MeterAmps = 1.3 | 0.020 | 0.5
PWM_CTRL_1B = 1300 : Feedback1B = 1.3 | 0 | 0.5
PWM_CTRL_1B = 1400 : MeterAmps = 1.4 | 0.020 | 0.5
PWM_CTRL_1B = 1400 : Feedback1B = 1.4 | 0 | 0.5
PWM_CTRL_1B = 1500 : MeterAmps = 1.5 | 0.020 | 0.5
PWM_CTRL_1B = 1500 : Feedback1B = 1.5 | 0 | 0.5
#switch out load line, switch coil
PWM_CTRL_1B = 0 : NULL : WAIT = 1
J2_02 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2A = 0 : MeterAmps = 0.0 | 0.020 | 0.5
PWM_CTRL_2A = 0 : Feedback2A = 0.0 | 0 | 0.5
PWM_CTRL_2A = 100 : MeterAmps = 0.1 | 0.020 | 0.5
PWM_CTRL_2A = 100 : Feedback2A = 0.1 | 0 | 0.5
PWM_CTRL_2A = 200 : MeterAmps = 0.2 | 0.020 | 0.5
PWM_CTRL_2A = 200 : Feedback2A = 0.2 | 0 | 0.5
PWM_CTRL_2A = 300 : MeterAmps = 0.3 | 0.020 | 0.5
PWM_CTRL_2A = 300 : Feedback2A = 0.3 | 0 | 0.5
PWM_CTRL_2A = 400 : MeterAmps = 0.4 | 0.020 | 0.5
PWM_CTRL_2A = 400 : Feedback2A = 0.4 | 0 | 0.5
PWM_CTRL_2A = 500 : MeterAmps = 0.5 | 0.020 | 0.5
PWM_CTRL_2A = 500 : Feedback2A = 0.5 | 0 | 0.5
PWM_CTRL_2A = 600 : MeterAmps = 0.6 | 0.020 | 0.5
PWM_CTRL_2A = 600 : Feedback2A = 0.6 | 0 | 0.5
PWM_CTRL_2A = 700 : MeterAmps = 0.7 | 0.020 | 0.5
PWM_CTRL_2A = 700 : Feedback2A = 0.7 | 0 | 0.5
PWM_CTRL_2A = 800 : MeterAmps = 0.8 | 0.020 | 0.5
PWM_CTRL_2A = 800 : Feedback2A = 0.8 | 0 | 0.5
PWM_CTRL_2A = 900 : MeterAmps = 0.9 | 0.020 | 0.5
PWM_CTRL_2A = 900 : Feedback2A = 0.9 | 0 | 0.5
PWM_CTRL_2A = 1000 : MeterAmps = 1.0 | 0.020 | 0.5
PWM_CTRL_2A = 1000 : Feedback2A = 1.0 | 0 | 0.5
PWM_CTRL_2A = 1100 : MeterAmps = 1.1 | 0.020 | 0.5
PWM_CTRL_2A = 1100 : Feedback2A = 1.1 | 0 | 0.5
PWM_CTRL_2A = 1200 : MeterAmps = 1.2 | 0.020 | 0.5
PWM_CTRL_2A = 1200 : Feedback2A = 1.2 | 0 | 0.5
PWM_CTRL_2A = 1300 : MeterAmps = 1.3 | 0.020 | 0.5
PWM_CTRL_2A = 1300 : Feedback2A = 1.3 | 0 | 0.5
PWM_CTRL_2A = 1400 : MeterAmps = 1.4 | 0.020 | 0.5
PWM_CTRL_2A = 1400 : Feedback2A = 1.4 | 0 | 0.5
PWM_CTRL_2A = 1500 : MeterAmps = 1.5 | 0.020 | 0.5
PWM_CTRL_2A = 1500 : Feedback2A = 1.5 | 0 | 0.5
#switch out load line, switch coil
PWM_CTRL_2A = 0 : NULL : WAIT = 1
J2_03 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2B = 0 : MeterAmps = 0.0 | 0.020 | 0.5
PWM_CTRL_2B = 0 : Feedback2B = 0.0 | 0 | 0.5
PWM_CTRL_2B = 100 : MeterAmps = 0.1 | 0.020 | 0.5
PWM_CTRL_2B = 100 : Feedback2B = 0.1 | 0 | 0.5
PWM_CTRL_2B = 200 : MeterAmps = 0.2 | 0.020 | 0.5
PWM_CTRL_2B = 200 : Feedback2B = 0.2 | 0 | 0.5
PWM_CTRL_2B = 300 : MeterAmps = 0.3 | 0.020 | 0.5
PWM_CTRL_2B = 300 : Feedback2B = 0.3 | 0 | 0.5
PWM_CTRL_2B = 400 : MeterAmps = 0.4 | 0.020 | 0.5
PWM_CTRL_2B = 400 : Feedback2B = 0.4 | 0 | 0.5
PWM_CTRL_2B = 500 : MeterAmps = 0.5 | 0.020 | 0.5
PWM_CTRL_2B = 500 : Feedback2B = 0.5 | 0 | 0.5
PWM_CTRL_2B = 600 : MeterAmps = 0.6 | 0.020 | 0.5
PWM_CTRL_2B = 600 : Feedback2B = 0.6 | 0 | 0.5
PWM_CTRL_2B = 700 : MeterAmps = 0.7 | 0.020 | 0.5
PWM_CTRL_2B = 700 : Feedback2B = 0.7 | 0 | 0.5
PWM_CTRL_2B = 800 : MeterAmps = 0.8 | 0.020 | 0.5
PWM_CTRL_2B = 800 : Feedback2B = 0.8 | 0 | 0.5
PWM_CTRL_2B = 900 : MeterAmps = 0.9 | 0.020 | 0.5
PWM_CTRL_2B = 900 : Feedback2B = 0.9 | 0 | 0.5
PWM_CTRL_2B = 1000 : MeterAmps = 1.0 | 0.020 | 0.5
PWM_CTRL_2B = 1000 : Feedback2B = 1.0 | 0 | 0.5
PWM_CTRL_2B = 1100 : MeterAmps = 1.1 | 0.020 | 0.5
PWM_CTRL_2B = 1100 : Feedback2B = 1.1 | 0 | 0.5
PWM_CTRL_2B = 1200 : MeterAmps = 1.2 | 0.020 | 0.5
PWM_CTRL_2B = 1200 : Feedback2B = 1.2 | 0 | 0.5
PWM_CTRL_2B = 1300 : MeterAmps = 1.3 | 0.020 | 0.5
PWM_CTRL_2B = 1300 : Feedback2B = 1.3 | 0 | 0.5
PWM_CTRL_2B = 1400 : MeterAmps = 1.4 | 0.020 | 0.5
PWM_CTRL_2B = 1400 : Feedback2B = 1.4 | 0 | 0.5
PWM_CTRL_2B = 1500 : MeterAmps = 1.5 | 0.020 | 0.5
PWM_CTRL_2B = 1500 : Feedback2B = 1.5 | 0 | 0.5
#switch out load line, switch coil
PWM_CTRL_2B = 0 : NULL : WAIT = 1
J2_04 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

PWM_CTRL_3B = 0 : MeterAmps = 0.0 | 0.020 | 0.5
PWM_CTRL_3B = 0 : Feedback3B = 0.0 | 0 | 0.5
PWM_CTRL_3B = 100 : MeterAmps = 0.1 | 0.020 | 0.5
PWM_CTRL_3B = 100 : Feedback3B = 0.1 | 0 | 0.5
PWM_CTRL_3B = 200 : MeterAmps = 0.2 | 0.020 | 0.5
PWM_CTRL_3B = 200 : Feedback3B = 0.2 | 0 | 0.5
PWM_CTRL_3B = 300 : MeterAmps = 0.3 | 0.020 | 0.5
PWM_CTRL_3B = 300 : Feedback3B = 0.3 | 0 | 0.5
PWM_CTRL_3B = 400 : MeterAmps = 0.4 | 0.020 | 0.5
PWM_CTRL_3B = 400 : Feedback3B = 0.4 | 0 | 0.5
PWM_CTRL_3B = 500 : MeterAmps = 0.5 | 0.020 | 0.5
PWM_CTRL_3B = 500 : Feedback3B = 0.5 | 0 | 0.5
PWM_CTRL_3B = 600 : MeterAmps = 0.6 | 0.020 | 0.5
PWM_CTRL_3B = 600 : Feedback3B = 0.6 | 0 | 0.5
PWM_CTRL_3B = 700 : MeterAmps = 0.7 | 0.020 | 0.5
PWM_CTRL_3B = 700 : Feedback3B = 0.7 | 0 | 0.5
PWM_CTRL_3B = 800 : MeterAmps = 0.8 | 0.020 | 0.5
PWM_CTRL_3B = 800 : Feedback3B = 0.8 | 0 | 0.5
PWM_CTRL_3B = 900 : MeterAmps = 0.9 | 0.020 | 0.5
PWM_CTRL_3B = 900 : Feedback3B = 0.9 | 0 | 0.5
PWM_CTRL_3B = 1000 : MeterAmps = 1.0 | 0.020 | 0.5
PWM_CTRL_3B = 1000 : Feedback3B = 1.0 | 0 | 0.5
PWM_CTRL_3B = 1100 : MeterAmps = 1.1 | 0.020 | 0.5
PWM_CTRL_3B = 1100 : Feedback3B = 1.1 | 0 | 0.5
PWM_CTRL_3B = 1200 : MeterAmps = 1.2 | 0.020 | 0.5
PWM_CTRL_3B = 1200 : Feedback3B = 1.2 | 0 | 0.5
PWM_CTRL_3B = 1300 : MeterAmps = 1.3 | 0.020 | 0.5
PWM_CTRL_3B = 1300 : Feedback3B = 1.3 | 0 | 0.5
PWM_CTRL_3B = 1400 : MeterAmps = 1.4 | 0.020 | 0.5
PWM_CTRL_3B = 1400 : Feedback3B = 1.4 | 0 | 0.5
PWM_CTRL_3B = 1500 : MeterAmps = 1.5 | 0.020 | 0.5
PWM_CTRL_3B = 1500 : Feedback3B = 1.5 | 0 | 0.5
#switch out load line, switch coil
PWM_CTRL_3B = 0 : NULL : WAIT = 1
J2_06 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4A = 0 : MeterAmps = 0.0 | 0.020 | 0.5
PWM_CTRL_4A = 0 : Feedback4A = 0.0 | 0 | 0.5
PWM_CTRL_4A = 100 : MeterAmps = 0.1 | 0.020 | 0.5
PWM_CTRL_4A = 100 : Feedback4A = 0.1 | 0 | 0.5
PWM_CTRL_4A = 200 : MeterAmps = 0.2 | 0.020 | 0.5
PWM_CTRL_4A = 200 : Feedback4A = 0.2 | 0 | 0.5
PWM_CTRL_4A = 300 : MeterAmps = 0.3 | 0.020 | 0.5
PWM_CTRL_4A = 300 : Feedback4A = 0.3 | 0 | 0.5
PWM_CTRL_4A = 400 : MeterAmps = 0.4 | 0.020 | 0.5
PWM_CTRL_4A = 400 : Feedback4A = 0.4 | 0 | 0.5
PWM_CTRL_4A = 500 : MeterAmps = 0.5 | 0.020 | 0.5
PWM_CTRL_4A = 500 : Feedback4A = 0.5 | 0 | 0.5
PWM_CTRL_4A = 600 : MeterAmps = 0.6 | 0.020 | 0.5
PWM_CTRL_4A = 600 : Feedback4A = 0.6 | 0 | 0.5
PWM_CTRL_4A = 700 : MeterAmps = 0.7 | 0.020 | 0.5
PWM_CTRL_4A = 700 : Feedback4A = 0.7 | 0 | 0.5
PWM_CTRL_4A = 800 : MeterAmps = 0.8 | 0.020 | 0.5
PWM_CTRL_4A = 800 : Feedback4A = 0.8 | 0 | 0.5
PWM_CTRL_4A = 900 : MeterAmps = 0.9 | 0.020 | 0.5
PWM_CTRL_4A = 900 : Feedback4A = 0.9 | 0 | 0.5
PWM_CTRL_4A = 1000 : MeterAmps = 1.0 | 0.020 | 0.5
PWM_CTRL_4A = 1000 : Feedback4A = 1.0 | 0 | 0.5
PWM_CTRL_4A = 1100 : MeterAmps = 1.1 | 0.020 | 0.5
PWM_CTRL_4A = 1100 : Feedback4A = 1.1 | 0 | 0.5
PWM_CTRL_4A = 1200 : MeterAmps = 1.2 | 0.020 | 0.5
PWM_CTRL_4A = 1200 : Feedback4A = 1.2 | 0 | 0.5
PWM_CTRL_4A = 1300 : MeterAmps = 1.3 | 0.020 | 0.5
PWM_CTRL_4A = 1300 : Feedback4A = 1.3 | 0 | 0.5
PWM_CTRL_4A = 1400 : MeterAmps = 1.4 | 0.020 | 0.5
PWM_CTRL_4A = 1400 : Feedback4A = 1.4 | 0 | 0.5
PWM_CTRL_4A = 1500 : MeterAmps = 1.5 | 0.020 | 0.5
PWM_CTRL_4A = 1500 : Feedback4A = 1.5 | 0 | 0.5
#switch out load line, switch coil
PWM_CTRL_4A = 0 : NULL : WAIT = 1
J2_07 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4B = 0 : MeterAmps = 0.0 | 0.020 | 0.5
PWM_CTRL_4B = 0 : Feedback4B = 0.0 | 0 | 0.5
PWM_CTRL_4B = 100 : MeterAmps = 0.1 | 0.020 | 0.5
PWM_CTRL_4B = 100 : Feedback4B = 0.1 | 0 | 0.5
PWM_CTRL_4B = 200 : MeterAmps = 0.2 | 0.020 | 0.5
PWM_CTRL_4B = 200 : Feedback4B = 0.2 | 0 | 0.5
PWM_CTRL_4B = 300 : MeterAmps = 0.3 | 0.020 | 0.5
PWM_CTRL_4B = 300 : Feedback4B = 0.3 | 0 | 0.5
PWM_CTRL_4B = 400 : MeterAmps = 0.4 | 0.020 | 0.5
PWM_CTRL_4B = 400 : Feedback4B = 0.4 | 0 | 0.5
PWM_CTRL_4B = 500 : MeterAmps = 0.5 | 0.020 | 0.5
PWM_CTRL_4B = 500 : Feedback4B = 0.5 | 0 | 0.5
PWM_CTRL_4B = 600 : MeterAmps = 0.6 | 0.020 | 0.5
PWM_CTRL_4B = 600 : Feedback4B = 0.6 | 0 | 0.5
PWM_CTRL_4B = 700 : MeterAmps = 0.7 | 0.020 | 0.5
PWM_CTRL_4B = 700 : Feedback4B = 0.7 | 0 | 0.5
PWM_CTRL_4B = 800 : MeterAmps = 0.8 | 0.020 | 0.5
PWM_CTRL_4B = 800 : Feedback4B = 0.8 | 0 | 0.5
PWM_CTRL_4B = 900 : MeterAmps = 0.9 | 0.020 | 0.5
PWM_CTRL_4B = 900 : Feedback4B = 0.9 | 0 | 0.5
PWM_CTRL_4B = 1000 : MeterAmps = 1.0 | 0.020 | 0.5
PWM_CTRL_4B = 1000 : Feedback4B = 1.0 | 0 | 0.5
PWM_CTRL_4B = 1100 : MeterAmps = 1.1 | 0.020 | 0.5
PWM_CTRL_4B = 1100 : Feedback4B = 1.1 | 0 | 0.5
PWM_CTRL_4B = 1200 : MeterAmps = 1.2 | 0.020 | 0.5
PWM_CTRL_4B = 1200 : Feedback4B = 1.2 | 0 | 0.5
PWM_CTRL_4B = 1300 : MeterAmps = 1.3 | 0.020 | 0.5
PWM_CTRL_4B = 1300 : Feedback4B = 1.3 | 0 | 0.5
PWM_CTRL_4B = 1400 : MeterAmps = 1.4 | 0.020 | 0.5
PWM_CTRL_4B = 1400 : Feedback4B = 1.4 | 0 | 0.5
PWM_CTRL_4B = 1500 : MeterAmps = 1.5 | 0.020 | 0.5
PWM_CTRL_4B = 1500 : Feedback4B = 1.5 | 0 | 0.5
#switch out load line, switch coil
PWM_CTRL_4B = 0 : NULL : WAIT = 1
J2_08 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_09 = 1 : NULL : WAIT = 0.5

PWM_CTRL_5A = 0 : MeterAmps = 0.0 | 0.020 | 0.5
PWM_CTRL_5A = 0 : Feedback5A = 0.0 | 0 | 0.5
PWM_CTRL_5A = 100 : MeterAmps = 0.1 | 0.020 | 0.5
PWM_CTRL_5A = 100 : Feedback5A = 0.1 | 0 | 0.5
PWM_CTRL_5A = 200 : MeterAmps = 0.2 | 0.020 | 0.5
PWM_CTRL_5A = 200 : Feedback5A = 0.2 | 0 | 0.5
PWM_CTRL_5A = 300 : MeterAmps = 0.3 | 0.020 | 0.5
PWM_CTRL_5A = 300 : Feedback5A = 0.3 | 0 | 0.5
PWM_CTRL_5A = 400 : MeterAmps = 0.4 | 0.020 | 0.5
PWM_CTRL_5A = 400 : Feedback5A = 0.4 | 0 | 0.5
PWM_CTRL_5A = 500 : MeterAmps = 0.5 | 0.020 | 0.5
PWM_CTRL_5A = 500 : Feedback5A = 0.5 | 0 | 0.5
PWM_CTRL_5A = 600 : MeterAmps = 0.6 | 0.020 | 0.5
PWM_CTRL_5A = 600 : Feedback5A = 0.6 | 0 | 0.5
PWM_CTRL_5A = 700 : MeterAmps = 0.7 | 0.020 | 0.5
PWM_CTRL_5A = 700 : Feedback5A = 0.7 | 0 | 0.5
PWM_CTRL_5A = 800 : MeterAmps = 0.8 | 0.020 | 0.5
PWM_CTRL_5A = 800 : Feedback5A = 0.8 | 0 | 0.5
PWM_CTRL_5A = 900 : MeterAmps = 0.9 | 0.020 | 0.5
PWM_CTRL_5A = 900 : Feedback5A = 0.9 | 0 | 0.5
PWM_CTRL_5A = 1000 : MeterAmps = 1.0 | 0.020 | 0.5
PWM_CTRL_5A = 1000 : Feedback5A = 1.0 | 0 | 0.5
PWM_CTRL_5A = 1100 : MeterAmps = 1.1 | 0.020 | 0.5
PWM_CTRL_5A = 1100 : Feedback5A = 1.1 | 0 | 0.5
PWM_CTRL_5A = 1200 : MeterAmps = 1.2 | 0.020 | 0.5
PWM_CTRL_5A = 1200 : Feedback5A = 1.2 | 0 | 0.5
PWM_CTRL_5A = 1300 : MeterAmps = 1.3 | 0.020 | 0.5
PWM_CTRL_5A = 1300 : Feedback5A = 1.3 | 0 | 0.5
PWM_CTRL_5A = 1400 : MeterAmps = 1.4 | 0.020 | 0.5
PWM_CTRL_5A = 1400 : Feedback5A = 1.4 | 0 | 0.5
PWM_CTRL_5A = 1500 : MeterAmps = 1.5 | 0.020 | 0.5
PWM_CTRL_5A = 1500 : Feedback5A = 1.5 | 0 | 0.5
#switch out load line, switch coil
PWM_CTRL_5A = 0 : NULL : WAIT = 1
J2_09 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_10 = 1 : NULL : WAIT = 0.5

PWM_CTRL_5B = 0 : MeterAmps = 0.0 | 0.020 | 0.5
PWM_CTRL_5B = 0 : Feedback5B = 0.0 | 0 | 0.5
PWM_CTRL_5B = 100 : MeterAmps = 0.1 | 0.020 | 0.5
PWM_CTRL_5B = 100 : Feedback5B = 0.1 | 0 | 0.5
PWM_CTRL_5B = 200 : MeterAmps = 0.2 | 0.020 | 0.5
PWM_CTRL_5B = 200 : Feedback5B = 0.2 | 0 | 0.5
PWM_CTRL_5B = 300 : MeterAmps = 0.3 | 0.020 | 0.5
PWM_CTRL_5B = 300 : Feedback5B = 0.3 | 0 | 0.5
PWM_CTRL_5B = 400 : MeterAmps = 0.4 | 0.020 | 0.5
PWM_CTRL_5B = 400 : Feedback5B = 0.4 | 0 | 0.5
PWM_CTRL_5B = 500 : MeterAmps = 0.5 | 0.020 | 0.5
PWM_CTRL_5B = 500 : Feedback5B = 0.5 | 0 | 0.5
PWM_CTRL_5B = 600 : MeterAmps = 0.6 | 0.020 | 0.5
PWM_CTRL_5B = 600 : Feedback5B = 0.6 | 0 | 0.5
PWM_CTRL_5B = 700 : MeterAmps = 0.7 | 0.020 | 0.5
PWM_CTRL_5B = 700 : Feedback5B = 0.7 | 0 | 0.5
PWM_CTRL_5B = 800 : MeterAmps = 0.8 | 0.020 | 0.5
PWM_CTRL_5B = 800 : Feedback5B = 0.8 | 0 | 0.5
PWM_CTRL_5B = 900 : MeterAmps = 0.9 | 0.020 | 0.5
PWM_CTRL_5B = 900 : Feedback5B = 0.9 | 0 | 0.5
PWM_CTRL_5B = 1000 : MeterAmps = 1.0 | 0.020 | 0.5
PWM_CTRL_5B = 1000 : Feedback5B = 1.0 | 0 | 0.5
PWM_CTRL_5B = 1100 : MeterAmps = 1.1 | 0.020 | 0.5
PWM_CTRL_5B = 1100 : Feedback5B = 1.1 | 0 | 0.5
PWM_CTRL_5B = 1200 : MeterAmps = 1.2 | 0.020 | 0.5
PWM_CTRL_5B = 1200 : Feedback5B = 1.2 | 0 | 0.5
PWM_CTRL_5B = 1300 : MeterAmps = 1.3 | 0.020 | 0.5
PWM_CTRL_5B = 1300 : Feedback5B = 1.3 | 0 | 0.5
PWM_CTRL_5B = 1400 : MeterAmps = 1.4 | 0.020 | 0.5
PWM_CTRL_5B = 1400 : Feedback5B = 1.4 | 0 | 0.5
PWM_CTRL_5B = 1500 : MeterAmps = 1.5 | 0.020 | 0.5
PWM_CTRL_5B = 1500 : Feedback5B = 1.5 | 0 | 0.5
#switch out load line, switch coil
PWM_CTRL_5B = 0 : NULL : WAIT = 1
J2_10 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_11 = 1 : NULL : WAIT = 0.5

PWM_CTRL_6A = 0 : MeterAmps = 0.0 | 0.020 | 0.5
PWM_CTRL_6A = 0 : Feedback6A = 0.0 | 0 | 0.5
PWM_CTRL_6A = 100 : MeterAmps = 0.1 | 0.020 | 0.5
PWM_CTRL_6A = 100 : Feedback6A = 0.1 | 0 | 0.5
PWM_CTRL_6A = 200 : MeterAmps = 0.2 | 0.020 | 0.5
PWM_CTRL_6A = 200 : Feedback6A = 0.2 | 0 | 0.5
PWM_CTRL_6A = 300 : MeterAmps = 0.3 | 0.020 | 0.5
PWM_CTRL_6A = 300 : Feedback6A = 0.3 | 0 | 0.5
PWM_CTRL_6A = 400 : MeterAmps = 0.4 | 0.020 | 0.5
PWM_CTRL_6A = 400 : Feedback6A = 0.4 | 0 | 0.5
PWM_CTRL_6A = 500 : MeterAmps = 0.5 | 0.020 | 0.5
PWM_CTRL_6A = 500 : Feedback6A = 0.5 | 0 | 0.5
PWM_CTRL_6A = 600 : MeterAmps = 0.6 | 0.020 | 0.5
PWM_CTRL_6A = 600 : Feedback6A = 0.6 | 0 | 0.5
PWM_CTRL_6A = 700 : MeterAmps = 0.7 | 0.020 | 0.5
PWM_CTRL_6A = 700 : Feedback6A = 0.7 | 0 | 0.5
PWM_CTRL_6A = 800 : MeterAmps = 0.8 | 0.020 | 0.5
PWM_CTRL_6A = 800 : Feedback6A = 0.8 | 0 | 0.5
PWM_CTRL_6A = 900 : MeterAmps = 0.9 | 0.020 | 0.5
PWM_CTRL_6A = 900 : Feedback6A = 0.9 | 0 | 0.5
PWM_CTRL_6A = 1000 : MeterAmps = 1.0 | 0.020 | 0.5
PWM_CTRL_6A = 1000 : Feedback6A = 1.0 | 0 | 0.5
PWM_CTRL_6A = 1100 : MeterAmps = 1.1 | 0.020 | 0.5
PWM_CTRL_6A = 1100 : Feedback6A = 1.1 | 0 | 0.5
PWM_CTRL_6A = 1200 : MeterAmps = 1.2 | 0.020 | 0.5
PWM_CTRL_6A = 1200 : Feedback6A = 1.2 | 0 | 0.5
PWM_CTRL_6A = 1300 : MeterAmps = 1.3 | 0.020 | 0.5
PWM_CTRL_6A = 1300 : Feedback6A = 1.3 | 0 | 0.5
PWM_CTRL_6A = 1400 : MeterAmps = 1.4 | 0.020 | 0.5
PWM_CTRL_6A = 1400 : Feedback6A = 1.4 | 0 | 0.5
PWM_CTRL_6A = 1500 : MeterAmps = 1.5 | 0.020 | 0.5
PWM_CTRL_6A = 1500 : Feedback6A = 1.5 | 0 | 0.5
#switch out load line, switch coil
PWM_CTRL_6A = 0 : NULL : WAIT = 1
J2_11 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_12 = 1 : NULL : WAIT = 0.5

PWM_CTRL_6B = 0 : MeterAmps = 0.0 | 0.020 | 0.5
PWM_CTRL_6B = 0 : Feedback6B = 0.0 | 0 | 0.5
PWM_CTRL_6B = 100 : MeterAmps = 0.1 | 0.020 | 0.5
PWM_CTRL_6B = 100 : Feedback6B = 0.1 | 0 | 0.5
PWM_CTRL_6B = 200 : MeterAmps = 0.2 | 0.020 | 0.5
PWM_CTRL_6B = 200 : Feedback6B = 0.2 | 0 | 0.5
PWM_CTRL_6B = 300 : MeterAmps = 0.3 | 0.020 | 0.5
PWM_CTRL_6B = 300 : Feedback6B = 0.3 | 0 | 0.5
PWM_CTRL_6B = 400 : MeterAmps = 0.4 | 0.020 | 0.5
PWM_CTRL_6B = 400 : Feedback6B = 0.4 | 0 | 0.5
PWM_CTRL_6B = 500 : MeterAmps = 0.5 | 0.020 | 0.5
PWM_CTRL_6B = 500 : Feedback6B = 0.5 | 0 | 0.5
PWM_CTRL_6B = 600 : MeterAmps = 0.6 | 0.020 | 0.5
PWM_CTRL_6B = 600 : Feedback6B = 0.6 | 0 | 0.5
PWM_CTRL_6B = 700 : MeterAmps = 0.7 | 0.020 | 0.5
PWM_CTRL_6B = 700 : Feedback6B = 0.7 | 0 | 0.5
PWM_CTRL_6B = 800 : MeterAmps = 0.8 | 0.020 | 0.5
PWM_CTRL_6B = 800 : Feedback6B = 0.8 | 0 | 0.5
PWM_CTRL_6B = 900 : MeterAmps = 0.9 | 0.020 | 0.5
PWM_CTRL_6B = 900 : Feedback6B = 0.9 | 0 | 0.5
PWM_CTRL_6B = 1000 : MeterAmps = 1.0 | 0.020 | 0.5
PWM_CTRL_6B = 1000 : Feedback6B = 1.0 | 0 | 0.5
PWM_CTRL_6B = 1100 : MeterAmps = 1.1 | 0.020 | 0.5
PWM_CTRL_6B = 1100 : Feedback6B = 1.1 | 0 | 0.5
PWM_CTRL_6B = 1200 : MeterAmps = 1.2 | 0.020 | 0.5
PWM_CTRL_6B = 1200 : Feedback6B = 1.2 | 0 | 0.5
PWM_CTRL_6B = 1300 : MeterAmps = 1.3 | 0.020 | 0.5
PWM_CTRL_6B = 1300 : Feedback6B = 1.3 | 0 | 0.5
PWM_CTRL_6B = 1400 : MeterAmps = 1.4 | 0.020 | 0.5
PWM_CTRL_6B = 1400 : Feedback6B = 1.4 | 0 | 0.5
PWM_CTRL_6B = 1500 : MeterAmps = 1.5 | 0.020 | 0.5
PWM_CTRL_6B = 1500 : Feedback6B = 1.5 | 0 | 0.5
#switch out load line, switch coil
PWM_CTRL_6B = 0 : NULL : WAIT = 1
J2_12 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5

PWM_CTRL_7A = 0 : MeterAmps = 0.0 | 0.020 | 0.5
PWM_CTRL_7A = 0 : Feedback7A = 0.0 | 0 | 0.5
PWM_CTRL_7A = 100 : MeterAmps = 0.1 | 0.020 | 0.5
PWM_CTRL_7A = 100 : Feedback7A = 0.1 | 0 | 0.5
PWM_CTRL_7A = 200 : MeterAmps = 0.2 | 0.020 | 0.5
PWM_CTRL_7A = 200 : Feedback7A = 0.2 | 0 | 0.5
PWM_CTRL_7A = 300 : MeterAmps = 0.3 | 0.020 | 0.5
PWM_CTRL_7A = 300 : Feedback7A = 0.3 | 0 | 0.5
PWM_CTRL_7A = 400 : MeterAmps = 0.4 | 0.020 | 0.5
PWM_CTRL_7A = 400 : Feedback7A = 0.4 | 0 | 0.5
PWM_CTRL_7A = 500 : MeterAmps = 0.5 | 0.020 | 0.5
PWM_CTRL_7A = 500 : Feedback7A = 0.5 | 0 | 0.5
PWM_CTRL_7A = 600 : MeterAmps = 0.6 | 0.020 | 0.5
PWM_CTRL_7A = 600 : Feedback7A = 0.6 | 0 | 0.5
PWM_CTRL_7A = 700 : MeterAmps = 0.7 | 0.020 | 0.5
PWM_CTRL_7A = 700 : Feedback7A = 0.7 | 0 | 0.5
PWM_CTRL_7A = 800 : MeterAmps = 0.8 | 0.020 | 0.5
PWM_CTRL_7A = 800 : Feedback7A = 0.8 | 0 | 0.5
PWM_CTRL_7A = 900 : MeterAmps = 0.9 | 0.020 | 0.5
PWM_CTRL_7A = 900 : Feedback7A = 0.9 | 0 | 0.5
PWM_CTRL_7A = 1000 : MeterAmps = 1.0 | 0.020 | 0.5
PWM_CTRL_7A = 1000 : Feedback7A = 1.0 | 0 | 0.5
PWM_CTRL_7A = 1100 : MeterAmps = 1.1 | 0.020 | 0.5
PWM_CTRL_7A = 1100 : Feedback7A = 1.1 | 0 | 0.5
PWM_CTRL_7A = 1200 : MeterAmps = 1.2 | 0.020 | 0.5
PWM_CTRL_7A = 1200 : Feedback7A = 1.2 | 0 | 0.5
PWM_CTRL_7A = 1300 : MeterAmps = 1.3 | 0.020 | 0.5
PWM_CTRL_7A = 1300 : Feedback7A = 1.3 | 0 | 0.5
PWM_CTRL_7A = 1400 : MeterAmps = 1.4 | 0.020 | 0.5
PWM_CTRL_7A = 1400 : Feedback7A = 1.4 | 0 | 0.5
PWM_CTRL_7A = 1500 : MeterAmps = 1.5 | 0.020 | 0.5
PWM_CTRL_7A = 1500 : Feedback7A = 1.5 | 0 | 0.5
#switch out load line, switch coil
PWM_CTRL_7A = 0 : NULL : WAIT = 1
J3_01 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5

PWM_CTRL_7B = 0 : MeterAmps = 0.0 | 0.020 | 0.5
PWM_CTRL_7B = 0 : Feedback7B = 0.0 | 0 | 0.5
PWM_CTRL_7B = 100 : MeterAmps = 0.1 | 0.020 | 0.5
PWM_CTRL_7B = 100 : Feedback7B = 0.1 | 0 | 0.5
PWM_CTRL_7B = 200 : MeterAmps = 0.2 | 0.020 | 0.5
PWM_CTRL_7B = 200 : Feedback7B = 0.2 | 0 | 0.5
PWM_CTRL_7B = 300 : MeterAmps = 0.3 | 0.020 | 0.5
PWM_CTRL_7B = 300 : Feedback7B = 0.3 | 0 | 0.5
PWM_CTRL_7B = 400 : MeterAmps = 0.4 | 0.020 | 0.5
PWM_CTRL_7B = 400 : Feedback7B = 0.4 | 0 | 0.5
PWM_CTRL_7B = 500 : MeterAmps = 0.5 | 0.020 | 0.5
PWM_CTRL_7B = 500 : Feedback7B = 0.5 | 0 | 0.5
PWM_CTRL_7B = 600 : MeterAmps = 0.6 | 0.020 | 0.5
PWM_CTRL_7B = 600 : Feedback7B = 0.6 | 0 | 0.5
PWM_CTRL_7B = 700 : MeterAmps = 0.7 | 0.020 | 0.5
PWM_CTRL_7B = 700 : Feedback7B = 0.7 | 0 | 0.5
PWM_CTRL_7B = 800 : MeterAmps = 0.8 | 0.020 | 0.5
PWM_CTRL_7B = 800 : Feedback7B = 0.8 | 0 | 0.5
PWM_CTRL_7B = 900 : MeterAmps = 0.9 | 0.020 | 0.5
PWM_CTRL_7B = 900 : Feedback7B = 0.9 | 0 | 0.5
PWM_CTRL_7B = 1000 : MeterAmps = 1.0 | 0.020 | 0.5
PWM_CTRL_7B = 1000 : Feedback7B = 1.0 | 0 | 0.5
PWM_CTRL_7B = 1100 : MeterAmps = 1.1 | 0.020 | 0.5
PWM_CTRL_7B = 1100 : Feedback7B = 1.1 | 0 | 0.5
PWM_CTRL_7B = 1200 : MeterAmps = 1.2 | 0.020 | 0.5
PWM_CTRL_7B = 1200 : Feedback7B = 1.2 | 0 | 0.5
PWM_CTRL_7B = 1300 : MeterAmps = 1.3 | 0.020 | 0.5
PWM_CTRL_7B = 1300 : Feedback7B = 1.3 | 0 | 0.5
PWM_CTRL_7B = 1400 : MeterAmps = 1.4 | 0.020 | 0.5
PWM_CTRL_7B = 1400 : Feedback7B = 1.4 | 0 | 0.5
PWM_CTRL_7B = 1500 : MeterAmps = 1.5 | 0.020 | 0.5
PWM_CTRL_7B = 1500 : Feedback7B = 1.5 | 0 | 0.5
#switch out load line, switch coil
PWM_CTRL_7B = 0 : NULL : WAIT = 1
J3_02 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5

PWM_CTRL_8A = 0 : MeterAmps = 0.0 | 0.020 | 0.5
PWM_CTRL_8A = 0 : Feedback8A = 0.0 | 0 | 0.5
PWM_CTRL_8A = 100 : MeterAmps = 0.1 | 0.020 | 0.5
PWM_CTRL_8A = 100 : Feedback8A = 0.1 | 0 | 0.5
PWM_CTRL_8A = 200 : MeterAmps = 0.2 | 0.020 | 0.5
PWM_CTRL_8A = 200 : Feedback8A = 0.2 | 0 | 0.5
PWM_CTRL_8A = 300 : MeterAmps = 0.3 | 0.020 | 0.5
PWM_CTRL_8A = 300 : Feedback8A = 0.3 | 0 | 0.5
PWM_CTRL_8A = 400 : MeterAmps = 0.4 | 0.020 | 0.5
PWM_CTRL_8A = 400 : Feedback8A = 0.4 | 0 | 0.5
PWM_CTRL_8A = 500 : MeterAmps = 0.5 | 0.020 | 0.5
PWM_CTRL_8A = 500 : Feedback8A = 0.5 | 0 | 0.5
PWM_CTRL_8A = 600 : MeterAmps = 0.6 | 0.020 | 0.5
PWM_CTRL_8A = 600 : Feedback8A = 0.6 | 0 | 0.5
PWM_CTRL_8A = 700 : MeterAmps = 0.7 | 0.020 | 0.5
PWM_CTRL_8A = 700 : Feedback8A = 0.7 | 0 | 0.5
PWM_CTRL_8A = 800 : MeterAmps = 0.8 | 0.020 | 0.5
PWM_CTRL_8A = 800 : Feedback8A = 0.8 | 0 | 0.5
PWM_CTRL_8A = 900 : MeterAmps = 0.9 | 0.020 | 0.5
PWM_CTRL_8A = 900 : Feedback8A = 0.9 | 0 | 0.5
PWM_CTRL_8A = 1000 : MeterAmps = 1.0 | 0.020 | 0.5
PWM_CTRL_8A = 1000 : Feedback8A = 1.0 | 0 | 0.5
PWM_CTRL_8A = 1100 : MeterAmps = 1.1 | 0.020 | 0.5
PWM_CTRL_8A = 1100 : Feedback8A = 1.1 | 0 | 0.5
PWM_CTRL_8A = 1200 : MeterAmps = 1.2 | 0.020 | 0.5
PWM_CTRL_8A = 1200 : Feedback8A = 1.2 | 0 | 0.5
PWM_CTRL_8A = 1300 : MeterAmps = 1.3 | 0.020 | 0.5
PWM_CTRL_8A = 1300 : Feedback8A = 1.3 | 0 | 0.5
PWM_CTRL_8A = 1400 : MeterAmps = 1.4 | 0.020 | 0.5
PWM_CTRL_8A = 1400 : Feedback8A = 1.4 | 0 | 0.5
PWM_CTRL_8A = 1500 : MeterAmps = 1.5 | 0.020 | 0.5
PWM_CTRL_8A = 1500 : Feedback8A = 1.5 | 0 | 0.5
#switch out load line, switch coil
PWM_CTRL_8A = 0 : NULL : WAIT = 1
J3_03 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5

PWM_CTRL_8B = 0 : MeterAmps = 0.0 | 0.020 | 0.5
PWM_CTRL_8B = 0 : Feedback8B = 0.0 | 0 | 0.5
PWM_CTRL_8B = 100 : MeterAmps = 0.1 | 0.020 | 0.5
PWM_CTRL_8B = 100 : Feedback8B = 0.1 | 0 | 0.5
PWM_CTRL_8B = 200 : MeterAmps = 0.2 | 0.020 | 0.5
PWM_CTRL_8B = 200 : Feedback8B = 0.2 | 0 | 0.5
PWM_CTRL_8B = 300 : MeterAmps = 0.3 | 0.020 | 0.5
PWM_CTRL_8B = 300 : Feedback8B = 0.3 | 0 | 0.5
PWM_CTRL_8B = 400 : MeterAmps = 0.4 | 0.020 | 0.5
PWM_CTRL_8B = 400 : Feedback8B = 0.4 | 0 | 0.5
PWM_CTRL_8B = 500 : MeterAmps = 0.5 | 0.020 | 0.5
PWM_CTRL_8B = 500 : Feedback8B = 0.5 | 0 | 0.5
PWM_CTRL_8B = 600 : MeterAmps = 0.6 | 0.020 | 0.5
PWM_CTRL_8B = 600 : Feedback8B = 0.6 | 0 | 0.5
PWM_CTRL_8B = 700 : MeterAmps = 0.7 | 0.020 | 0.5
PWM_CTRL_8B = 700 : Feedback8B = 0.7 | 0 | 0.5
PWM_CTRL_8B = 800 : MeterAmps = 0.8 | 0.020 | 0.5
PWM_CTRL_8B = 800 : Feedback8B = 0.8 | 0 | 0.5
PWM_CTRL_8B = 900 : MeterAmps = 0.9 | 0.020 | 0.5
PWM_CTRL_8B = 900 : Feedback8B = 0.9 | 0 | 0.5
PWM_CTRL_8B = 1000 : MeterAmps = 1.0 | 0.020 | 0.5
PWM_CTRL_8B = 1000 : Feedback8B = 1.0 | 0 | 0.5
PWM_CTRL_8B = 1100 : MeterAmps = 1.1 | 0.020 | 0.5
PWM_CTRL_8B = 1100 : Feedback8B = 1.1 | 0 | 0.5
PWM_CTRL_8B = 1200 : MeterAmps = 1.2 | 0.020 | 0.5
PWM_CTRL_8B = 1200 : Feedback8B = 1.2 | 0 | 0.5
PWM_CTRL_8B = 1300 : MeterAmps = 1.3 | 0.020 | 0.5
PWM_CTRL_8B = 1300 : Feedback8B = 1.3 | 0 | 0.5
PWM_CTRL_8B = 1400 : MeterAmps = 1.4 | 0.020 | 0.5
PWM_CTRL_8B = 1400 : Feedback8B = 1.4 | 0 | 0.5
PWM_CTRL_8B = 1500 : MeterAmps = 1.5 | 0.020 | 0.5
PWM_CTRL_8B = 1500 : Feedback8B = 1.5 | 0 | 0.5
#switch out load line, switch coil
PWM_CTRL_8B = 0 : NULL : WAIT = 1
J3_04 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
SAVE
END
