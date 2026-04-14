#34044-1
#Verion 0.0
#PWMi normal test with a 'red coil' 6.4 ohm inductive load. (2.27 amps @ 14.5 VDC)
UUT_DBC = 34044-561.dbc
UUT_DATANAME = 34044-1-OUTPUT-PWMI-NORMAL

#-----setup 34044-----
#disable global modes
#configure PWMi
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4: NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, MODE8A = 4, MODE8B = 4 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.5
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.5
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.5
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL : WAIT = 0.5
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, FREQ1 = 100, SaveSettings = 1, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FREQ1 = 0, SaveSettings = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5

PWM_CTRL_1A = 0 : MeterAmps = 0.0 | 0.155 | 0.5
PWM_CTRL_1A = 0 : Feedback1A = 0.0 | 0.155 | 0.5
PWM_CTRL_1A = 100 : MeterAmps = 0.1 | 0.155 | 0.5
PWM_CTRL_1A = 100 : Feedback1A = 0.1 | 0.155 | 0.5
PWM_CTRL_1A = 200 : MeterAmps = 0.2 | 0.155 | 0.5
PWM_CTRL_1A = 200 : Feedback1A = 0.2 | 0.155 | 0.5
PWM_CTRL_1A = 300 : MeterAmps = 0.3 | 0.155 | 0.5
PWM_CTRL_1A = 300 : Feedback1A = 0.3 | 0.155 | 0.5
PWM_CTRL_1A = 400 : MeterAmps = 0.4 | 0.155 | 0.5
PWM_CTRL_1A = 400 : Feedback1A = 0.4 | 0.155 | 0.5
PWM_CTRL_1A = 500 : MeterAmps = 0.5 | 0.155 | 0.5
PWM_CTRL_1A = 500 : Feedback1A = 0.5 | 0.155 | 0.5
PWM_CTRL_1A = 600 : MeterAmps = 0.6 | 0.155 | 0.5
PWM_CTRL_1A = 600 : Feedback1A = 0.6 | 0.155 | 0.5
PWM_CTRL_1A = 700 : MeterAmps = 0.7 | 0.155 | 0.5
PWM_CTRL_1A = 700 : Feedback1A = 0.7 | 0.155 | 0.5
PWM_CTRL_1A = 800 : MeterAmps = 0.8 | 0.155 | 0.5
PWM_CTRL_1A = 800 : Feedback1A = 0.8 | 0.155 | 0.5
PWM_CTRL_1A = 900 : MeterAmps = 0.9 | 0.155 | 0.5
PWM_CTRL_1A = 900 : Feedback1A = 0.9 | 0.155 | 0.5
PWM_CTRL_1A = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
PWM_CTRL_1A = 1000 : Feedback1A = 1.0 | 0.155 | 0.5
PWM_CTRL_1A = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
PWM_CTRL_1A = 1100 : Feedback1A = 1.1 | 0.155 | 0.5
PWM_CTRL_1A = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
PWM_CTRL_1A = 1200 : Feedback1A = 1.2 | 0.155 | 0.5
PWM_CTRL_1A = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
PWM_CTRL_1A = 1300 : Feedback1A = 1.3 | 0.155 | 0.5
PWM_CTRL_1A = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
PWM_CTRL_1A = 1400 : Feedback1A = 1.4 | 0.155 | 0.5
PWM_CTRL_1A = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
PWM_CTRL_1A = 1500 : Feedback1A = 1.5 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_1A = 0 : NULL : WAIT = 1
J2_01 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

PWM_CTRL_1B = 0 : MeterAmps = 0.0 | 0.155 | 0.5
PWM_CTRL_1B = 0 : Feedback1B = 0.0 | 0.155 | 0.5
PWM_CTRL_1B = 100 : MeterAmps = 0.1 | 0.155 | 0.5
PWM_CTRL_1B = 100 : Feedback1B = 0.1 | 0.155 | 0.5
PWM_CTRL_1B = 200 : MeterAmps = 0.2 | 0.155 | 0.5
PWM_CTRL_1B = 200 : Feedback1B = 0.2 | 0.155 | 0.5
PWM_CTRL_1B = 300 : MeterAmps = 0.3 | 0.155 | 0.5
PWM_CTRL_1B = 300 : Feedback1B = 0.3 | 0.155 | 0.5
PWM_CTRL_1B = 400 : MeterAmps = 0.4 | 0.155 | 0.5
PWM_CTRL_1B = 400 : Feedback1B = 0.4 | 0.155 | 0.5
PWM_CTRL_1B = 500 : MeterAmps = 0.5 | 0.155 | 0.5
PWM_CTRL_1B = 500 : Feedback1B = 0.5 | 0.155 | 0.5
PWM_CTRL_1B = 600 : MeterAmps = 0.6 | 0.155 | 0.5
PWM_CTRL_1B = 600 : Feedback1B = 0.6 | 0.155 | 0.5
PWM_CTRL_1B = 700 : MeterAmps = 0.7 | 0.155 | 0.5
PWM_CTRL_1B = 700 : Feedback1B = 0.7 | 0.155 | 0.5
PWM_CTRL_1B = 800 : MeterAmps = 0.8 | 0.155 | 0.5
PWM_CTRL_1B = 800 : Feedback1B = 0.8 | 0.155 | 0.5
PWM_CTRL_1B = 900 : MeterAmps = 0.9 | 0.155 | 0.5
PWM_CTRL_1B = 900 : Feedback1B = 0.9 | 0.155 | 0.5
PWM_CTRL_1B = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
PWM_CTRL_1B = 1000 : Feedback1B = 1.0 | 0.155 | 0.5
PWM_CTRL_1B = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
PWM_CTRL_1B = 1100 : Feedback1B = 1.1 | 0.155 | 0.5
PWM_CTRL_1B = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
PWM_CTRL_1B = 1200 : Feedback1B = 1.2 | 0.155 | 0.5
PWM_CTRL_1B = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
PWM_CTRL_1B = 1300 : Feedback1B = 1.3 | 0.155 | 0.5
PWM_CTRL_1B = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
PWM_CTRL_1B = 1400 : Feedback1B = 1.4 | 0.155 | 0.5
PWM_CTRL_1B = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
PWM_CTRL_1B = 1500 : Feedback1B = 1.5 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_1B = 0 : NULL : WAIT = 1
J2_02 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2A = 0 : MeterAmps = 0.0 | 0.155 | 0.5
PWM_CTRL_2A = 0 : Feedback2A = 0.0 | 0.155 | 0.5
PWM_CTRL_2A = 100 : MeterAmps = 0.1 | 0.155 | 0.5
PWM_CTRL_2A = 100 : Feedback2A = 0.1 | 0.155 | 0.5
PWM_CTRL_2A = 200 : MeterAmps = 0.2 | 0.155 | 0.5
PWM_CTRL_2A = 200 : Feedback2A = 0.2 | 0.155 | 0.5
PWM_CTRL_2A = 300 : MeterAmps = 0.3 | 0.155 | 0.5
PWM_CTRL_2A = 300 : Feedback2A = 0.3 | 0.155 | 0.5
PWM_CTRL_2A = 400 : MeterAmps = 0.4 | 0.155 | 0.5
PWM_CTRL_2A = 400 : Feedback2A = 0.4 | 0.155 | 0.5
PWM_CTRL_2A = 500 : MeterAmps = 0.5 | 0.155 | 0.5
PWM_CTRL_2A = 500 : Feedback2A = 0.5 | 0.155 | 0.5
PWM_CTRL_2A = 600 : MeterAmps = 0.6 | 0.155 | 0.5
PWM_CTRL_2A = 600 : Feedback2A = 0.6 | 0.155 | 0.5
PWM_CTRL_2A = 700 : MeterAmps = 0.7 | 0.155 | 0.5
PWM_CTRL_2A = 700 : Feedback2A = 0.7 | 0.155 | 0.5
PWM_CTRL_2A = 800 : MeterAmps = 0.8 | 0.155 | 0.5
PWM_CTRL_2A = 800 : Feedback2A = 0.8 | 0.155 | 0.5
PWM_CTRL_2A = 900 : MeterAmps = 0.9 | 0.155 | 0.5
PWM_CTRL_2A = 900 : Feedback2A = 0.9 | 0.155 | 0.5
PWM_CTRL_2A = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
PWM_CTRL_2A = 1000 : Feedback2A = 1.0 | 0.155 | 0.5
PWM_CTRL_2A = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
PWM_CTRL_2A = 1100 : Feedback2A = 1.1 | 0.155 | 0.5
PWM_CTRL_2A = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
PWM_CTRL_2A = 1200 : Feedback2A = 1.2 | 0.155 | 0.5
PWM_CTRL_2A = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
PWM_CTRL_2A = 1300 : Feedback2A = 1.3 | 0.155 | 0.5
PWM_CTRL_2A = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
PWM_CTRL_2A = 1400 : Feedback2A = 1.4 | 0.155 | 0.5
PWM_CTRL_2A = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
PWM_CTRL_2A = 1500 : Feedback2A = 1.5 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_2A = 0 : NULL : WAIT = 1
J2_03 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2B = 0 : MeterAmps = 0.0 | 0.155 | 0.5
PWM_CTRL_2B = 0 : Feedback2B = 0.0 | 0.155 | 0.5
PWM_CTRL_2B = 100 : MeterAmps = 0.1 | 0.155 | 0.5
PWM_CTRL_2B = 100 : Feedback2B = 0.1 | 0.155 | 0.5
PWM_CTRL_2B = 200 : MeterAmps = 0.2 | 0.155 | 0.5
PWM_CTRL_2B = 200 : Feedback2B = 0.2 | 0.155 | 0.5
PWM_CTRL_2B = 300 : MeterAmps = 0.3 | 0.155 | 0.5
PWM_CTRL_2B = 300 : Feedback2B = 0.3 | 0.155 | 0.5
PWM_CTRL_2B = 400 : MeterAmps = 0.4 | 0.155 | 0.5
PWM_CTRL_2B = 400 : Feedback2B = 0.4 | 0.155 | 0.5
PWM_CTRL_2B = 500 : MeterAmps = 0.5 | 0.155 | 0.5
PWM_CTRL_2B = 500 : Feedback2B = 0.5 | 0.155 | 0.5
PWM_CTRL_2B = 600 : MeterAmps = 0.6 | 0.155 | 0.5
PWM_CTRL_2B = 600 : Feedback2B = 0.6 | 0.155 | 0.5
PWM_CTRL_2B = 700 : MeterAmps = 0.7 | 0.155 | 0.5
PWM_CTRL_2B = 700 : Feedback2B = 0.7 | 0.155 | 0.5
PWM_CTRL_2B = 800 : MeterAmps = 0.8 | 0.155 | 0.5
PWM_CTRL_2B = 800 : Feedback2B = 0.8 | 0.155 | 0.5
PWM_CTRL_2B = 900 : MeterAmps = 0.9 | 0.155 | 0.5
PWM_CTRL_2B = 900 : Feedback2B = 0.9 | 0.155 | 0.5
PWM_CTRL_2B = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
PWM_CTRL_2B = 1000 : Feedback2B = 1.0 | 0.155 | 0.5
PWM_CTRL_2B = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
PWM_CTRL_2B = 1100 : Feedback2B = 1.1 | 0.155 | 0.5
PWM_CTRL_2B = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
PWM_CTRL_2B = 1200 : Feedback2B = 1.2 | 0.155 | 0.5
PWM_CTRL_2B = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
PWM_CTRL_2B = 1300 : Feedback2B = 1.3 | 0.155 | 0.5
PWM_CTRL_2B = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
PWM_CTRL_2B = 1400 : Feedback2B = 1.4 | 0.155 | 0.5
PWM_CTRL_2B = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
PWM_CTRL_2B = 1500 : Feedback2B = 1.5 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_2B = 0 : NULL : WAIT = 1
J2_04 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5

PWM_CTRL_3A = 0 : MeterAmps = 0.0 | 0.155 | 0.5
PWM_CTRL_3A = 0 : Feedback3A = 0.0 | 0.155 | 0.5
PWM_CTRL_3A = 100 : MeterAmps = 0.1 | 0.155 | 0.5
PWM_CTRL_3A = 100 : Feedback3A = 0.1 | 0.155 | 0.5
PWM_CTRL_3A = 200 : MeterAmps = 0.2 | 0.155 | 0.5
PWM_CTRL_3A = 200 : Feedback3A = 0.2 | 0.155 | 0.5
PWM_CTRL_3A = 300 : MeterAmps = 0.3 | 0.155 | 0.5
PWM_CTRL_3A = 300 : Feedback3A = 0.3 | 0.155 | 0.5
PWM_CTRL_3A = 400 : MeterAmps = 0.4 | 0.155 | 0.5
PWM_CTRL_3A = 400 : Feedback3A = 0.4 | 0.155 | 0.5
PWM_CTRL_3A = 500 : MeterAmps = 0.5 | 0.155 | 0.5
PWM_CTRL_3A = 500 : Feedback3A = 0.5 | 0.155 | 0.5
PWM_CTRL_3A = 600 : MeterAmps = 0.6 | 0.155 | 0.5
PWM_CTRL_3A = 600 : Feedback3A = 0.6 | 0.155 | 0.5
PWM_CTRL_3A = 700 : MeterAmps = 0.7 | 0.155 | 0.5
PWM_CTRL_3A = 700 : Feedback3A = 0.7 | 0.155 | 0.5
PWM_CTRL_3A = 800 : MeterAmps = 0.8 | 0.155 | 0.5
PWM_CTRL_3A = 800 : Feedback3A = 0.8 | 0.155 | 0.5
PWM_CTRL_3A = 900 : MeterAmps = 0.9 | 0.155 | 0.5
PWM_CTRL_3A = 900 : Feedback3A = 0.9 | 0.155 | 0.5
PWM_CTRL_3A = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
PWM_CTRL_3A = 1000 : Feedback3A = 1.0 | 0.155 | 0.5
PWM_CTRL_3A = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
PWM_CTRL_3A = 1100 : Feedback3A = 1.1 | 0.155 | 0.5
PWM_CTRL_3A = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
PWM_CTRL_3A = 1200 : Feedback3A = 1.2 | 0.155 | 0.5
PWM_CTRL_3A = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
PWM_CTRL_3A = 1300 : Feedback3A = 1.3 | 0.155 | 0.5
PWM_CTRL_3A = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
PWM_CTRL_3A = 1400 : Feedback3A = 1.4 | 0.155 | 0.5
PWM_CTRL_3A = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
PWM_CTRL_3A = 1500 : Feedback3A = 1.5 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_3A = 0 : NULL : WAIT = 1
J2_05 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

PWM_CTRL_3B = 0 : MeterAmps = 0.0 | 0.155 | 0.5
PWM_CTRL_3B = 0 : Feedback3B = 0.0 | 0.155 | 0.5
PWM_CTRL_3B = 100 : MeterAmps = 0.1 | 0.155 | 0.5
PWM_CTRL_3B = 100 : Feedback3B = 0.1 | 0.155 | 0.5
PWM_CTRL_3B = 200 : MeterAmps = 0.2 | 0.155 | 0.5
PWM_CTRL_3B = 200 : Feedback3B = 0.2 | 0.155 | 0.5
PWM_CTRL_3B = 300 : MeterAmps = 0.3 | 0.155 | 0.5
PWM_CTRL_3B = 300 : Feedback3B = 0.3 | 0.155 | 0.5
PWM_CTRL_3B = 400 : MeterAmps = 0.4 | 0.155 | 0.5
PWM_CTRL_3B = 400 : Feedback3B = 0.4 | 0.155 | 0.5
PWM_CTRL_3B = 500 : MeterAmps = 0.5 | 0.155 | 0.5
PWM_CTRL_3B = 500 : Feedback3B = 0.5 | 0.155 | 0.5
PWM_CTRL_3B = 600 : MeterAmps = 0.6 | 0.155 | 0.5
PWM_CTRL_3B = 600 : Feedback3B = 0.6 | 0.155 | 0.5
PWM_CTRL_3B = 700 : MeterAmps = 0.7 | 0.155 | 0.5
PWM_CTRL_3B = 700 : Feedback3B = 0.7 | 0.155 | 0.5
PWM_CTRL_3B = 800 : MeterAmps = 0.8 | 0.155 | 0.5
PWM_CTRL_3B = 800 : Feedback3B = 0.8 | 0.155 | 0.5
PWM_CTRL_3B = 900 : MeterAmps = 0.9 | 0.155 | 0.5
PWM_CTRL_3B = 900 : Feedback3B = 0.9 | 0.155 | 0.5
PWM_CTRL_3B = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
PWM_CTRL_3B = 1000 : Feedback3B = 1.0 | 0.155 | 0.5
PWM_CTRL_3B = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
PWM_CTRL_3B = 1100 : Feedback3B = 1.1 | 0.155 | 0.5
PWM_CTRL_3B = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
PWM_CTRL_3B = 1200 : Feedback3B = 1.2 | 0.155 | 0.5
PWM_CTRL_3B = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
PWM_CTRL_3B = 1300 : Feedback3B = 1.3 | 0.155 | 0.5
PWM_CTRL_3B = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
PWM_CTRL_3B = 1400 : Feedback3B = 1.4 | 0.155 | 0.5
PWM_CTRL_3B = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
PWM_CTRL_3B = 1500 : Feedback3B = 1.5 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_3B = 0 : NULL : WAIT = 1
J2_06 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4A = 0 : MeterAmps = 0.0 | 0.155 | 0.5
PWM_CTRL_4A = 0 : Feedback4A = 0.0 | 0.155 | 0.5
PWM_CTRL_4A = 100 : MeterAmps = 0.1 | 0.155 | 0.5
PWM_CTRL_4A = 100 : Feedback4A = 0.1 | 0.155 | 0.5
PWM_CTRL_4A = 200 : MeterAmps = 0.2 | 0.155 | 0.5
PWM_CTRL_4A = 200 : Feedback4A = 0.2 | 0.155 | 0.5
PWM_CTRL_4A = 300 : MeterAmps = 0.3 | 0.155 | 0.5
PWM_CTRL_4A = 300 : Feedback4A = 0.3 | 0.155 | 0.5
PWM_CTRL_4A = 400 : MeterAmps = 0.4 | 0.155 | 0.5
PWM_CTRL_4A = 400 : Feedback4A = 0.4 | 0.155 | 0.5
PWM_CTRL_4A = 500 : MeterAmps = 0.5 | 0.155 | 0.5
PWM_CTRL_4A = 500 : Feedback4A = 0.5 | 0.155 | 0.5
PWM_CTRL_4A = 600 : MeterAmps = 0.6 | 0.155 | 0.5
PWM_CTRL_4A = 600 : Feedback4A = 0.6 | 0.155 | 0.5
PWM_CTRL_4A = 700 : MeterAmps = 0.7 | 0.155 | 0.5
PWM_CTRL_4A = 700 : Feedback4A = 0.7 | 0.155 | 0.5
PWM_CTRL_4A = 800 : MeterAmps = 0.8 | 0.155 | 0.5
PWM_CTRL_4A = 800 : Feedback4A = 0.8 | 0.155 | 0.5
PWM_CTRL_4A = 900 : MeterAmps = 0.9 | 0.155 | 0.5
PWM_CTRL_4A = 900 : Feedback4A = 0.9 | 0.155 | 0.5
PWM_CTRL_4A = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
PWM_CTRL_4A = 1000 : Feedback4A = 1.0 | 0.155 | 0.5
PWM_CTRL_4A = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
PWM_CTRL_4A = 1100 : Feedback4A = 1.1 | 0.155 | 0.5
PWM_CTRL_4A = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
PWM_CTRL_4A = 1200 : Feedback4A = 1.2 | 0.155 | 0.5
PWM_CTRL_4A = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
PWM_CTRL_4A = 1300 : Feedback4A = 1.3 | 0.155 | 0.5
PWM_CTRL_4A = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
PWM_CTRL_4A = 1400 : Feedback4A = 1.4 | 0.155 | 0.5
PWM_CTRL_4A = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
PWM_CTRL_4A = 1500 : Feedback4A = 1.5 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_4A = 0 : NULL : WAIT = 1
J2_07 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4B = 0 : MeterAmps = 0.0 | 0.155 | 0.5
PWM_CTRL_4B = 0 : Feedback4B = 0.0 | 0.155 | 0.5
PWM_CTRL_4B = 100 : MeterAmps = 0.1 | 0.155 | 0.5
PWM_CTRL_4B = 100 : Feedback4B = 0.1 | 0.155 | 0.5
PWM_CTRL_4B = 200 : MeterAmps = 0.2 | 0.155 | 0.5
PWM_CTRL_4B = 200 : Feedback4B = 0.2 | 0.155 | 0.5
PWM_CTRL_4B = 300 : MeterAmps = 0.3 | 0.155 | 0.5
PWM_CTRL_4B = 300 : Feedback4B = 0.3 | 0.155 | 0.5
PWM_CTRL_4B = 400 : MeterAmps = 0.4 | 0.155 | 0.5
PWM_CTRL_4B = 400 : Feedback4B = 0.4 | 0.155 | 0.5
PWM_CTRL_4B = 500 : MeterAmps = 0.5 | 0.155 | 0.5
PWM_CTRL_4B = 500 : Feedback4B = 0.5 | 0.155 | 0.5
PWM_CTRL_4B = 600 : MeterAmps = 0.6 | 0.155 | 0.5
PWM_CTRL_4B = 600 : Feedback4B = 0.6 | 0.155 | 0.5
PWM_CTRL_4B = 700 : MeterAmps = 0.7 | 0.155 | 0.5
PWM_CTRL_4B = 700 : Feedback4B = 0.7 | 0.155 | 0.5
PWM_CTRL_4B = 800 : MeterAmps = 0.8 | 0.155 | 0.5
PWM_CTRL_4B = 800 : Feedback4B = 0.8 | 0.155 | 0.5
PWM_CTRL_4B = 900 : MeterAmps = 0.9 | 0.155 | 0.5
PWM_CTRL_4B = 900 : Feedback4B = 0.9 | 0.155 | 0.5
PWM_CTRL_4B = 1000 : MeterAmps = 1.0 | 0.155 | 0.5
PWM_CTRL_4B = 1000 : Feedback4B = 1.0 | 0.155 | 0.5
PWM_CTRL_4B = 1100 : MeterAmps = 1.1 | 0.155 | 0.5
PWM_CTRL_4B = 1100 : Feedback4B = 1.1 | 0.155 | 0.5
PWM_CTRL_4B = 1200 : MeterAmps = 1.2 | 0.155 | 0.5
PWM_CTRL_4B = 1200 : Feedback4B = 1.2 | 0.155 | 0.5
PWM_CTRL_4B = 1300 : MeterAmps = 1.3 | 0.155 | 0.5
PWM_CTRL_4B = 1300 : Feedback4B = 1.3 | 0.155 | 0.5
PWM_CTRL_4B = 1400 : MeterAmps = 1.4 | 0.155 | 0.5
PWM_CTRL_4B = 1400 : Feedback4B = 1.4 | 0.155 | 0.5
PWM_CTRL_4B = 1500 : MeterAmps = 1.5 | 0.155 | 0.5
PWM_CTRL_4B = 1500 : Feedback4B = 1.5 | 0.155 | 0.5
#switch out load line, switch coil
PWM_CTRL_4B = 0 : NULL : WAIT = 1
J2_08 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
SAVE
END
