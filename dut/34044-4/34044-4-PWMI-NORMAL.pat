#34044-4
#Verion 0.0
#PWMi normal test with a 'red coil' 6.4 ohm inductive load. (2.27 amps @ 14.5 VDC)
UUT_DBC = 34044-564.dbc
UUT_DATANAME = 34044-4-PWMI-NORMAL

#-----setup 34044-----
#disable global modes
#configure PWMi
Command = 83, MODE1A = 1, MODE1B = 4, MODE2A = 4, MODE2B = 4, MODE3A = 1, MODE3B = 4, MODE4A = 4, MODE4B = 4, MODE5A = 4, MODE5B = 4, MODE6A = 4, MODE6B = 4, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5
Command = 84, MODE8A = 4, MODE8B = 4 : NULL : WAIT = 0.5
Command = 84, Port1_Kp = 20.0, Port1_Ki = 10.0, Port2_Kp = 20.0, Port2_Ki = 10.0, Port3_Kp = 20.0, Port3_Ki = 10.0 : NULL : WAIT = 0.5
Command = 85, Port4_Kp = 20.0, Port4_Ki = 10.0, Port5_Kp = 20.0, Port5_Ki = 10.0, Port6_Kp = 20.0, Port6_Ki = 10.0 : NULL : WAIT = 0.5
Command = 86, Port7_Kp = 20.0, Port7_Ki = 10.0, Port8_Kp = 20.0, Port8_Ki = 10.0 : NULL : WAIT = 0.5
Command = 93, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0, PORT5_MODE = 0, PORT6_MODE = 0, PORT7_MODE = 0, PORT8_MODE = 0 : NULL : WAIT = 0.5
Command = 82, FREQ1 = 100, SaveSettings = 1, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1 : NULL: WAIT = 0.5
Command = 82, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL: WAIT = 0.5
Command = 82, SaveSettings = 1 : NULL : WAIT = 0.5
Command = 0 : NULL
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5
PWM_SIGN_PORT2 = 0 : NULL : WAIT = 0.5

PWM_CTRL_PORT2 = 0 : MeterAmps = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT2 = 0 : Port2AmpData = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT2 = 50 : MeterAmps = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT2 = 50 : Port2AmpData = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT2 = 100 : MeterAmps = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT2 = 100 : Port2AmpData = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT2 = 150 : MeterAmps = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT2 = 150 : Port2AmpData = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT2 = 200 : MeterAmps = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT2 = 200 : Port2AmpData = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT2 = 250 : MeterAmps = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT2 = 250 : Port2AmpData = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT2 = 300 : MeterAmps = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT2 = 300 : Port2AmpData = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT2 = 350 : MeterAmps = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT2 = 350 : Port2AmpData = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT2 = 400 : MeterAmps = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT2 = 400 : Port2AmpData = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT2 = 450 : MeterAmps = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT2 = 450 : Port2AmpData = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT2 = 500 : MeterAmps = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT2 = 500 : Port2AmpData = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT2 = 550 : MeterAmps = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT2 = 550 : Port2AmpData = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT2 = 600 : MeterAmps = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT2 = 600 : Port2AmpData = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT2 = 650 : MeterAmps = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT2 = 650 : Port2AmpData = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT2 = 700 : MeterAmps = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT2 = 700 : Port2AmpData = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT2 = 750 : MeterAmps = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT2 = 750 : Port2AmpData = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT2 = 800 : MeterAmps = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT2 = 800 : Port2AmpData = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT2 = 850 : MeterAmps = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT2 = 850 : Port2AmpData = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT2 = 900 : MeterAmps = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT2 = 900 : Port2AmpData = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT2 = 950 : MeterAmps = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT2 = 950 : Port2AmpData = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1000 : MeterAmps = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1000 : Port2AmpData = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1050 : MeterAmps = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1050 : Port2AmpData = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1100 : MeterAmps = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1100 : Port2AmpData = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1150 : MeterAmps = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1150 : Port2AmpData = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1200 : MeterAmps = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1200 : Port2AmpData = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1250 : MeterAmps = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1250 : Port2AmpData = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1300 : MeterAmps = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1300 : Port2AmpData = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1350 : MeterAmps = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1350 : Port2AmpData = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1400 : MeterAmps = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1400 : Port2AmpData = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1450 : MeterAmps = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1450 : Port2AmpData = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1500 : MeterAmps = 1.5 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1500 : Port2AmpData = 1.5 | 0.02 | 0.8
#switch out load line, switch coil
PWM_CTRL_PORT2 = 0 : NULL : WAIT = 1
J2_03 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5
PWM_SIGN_PORT2 = 1 : NULL : WAIT = 0.5

PWM_CTRL_PORT2 = 0 : MeterAmps = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT2 = 0 : Port2AmpData = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT2 = 50 : MeterAmps = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT2 = 50 : Port2AmpData = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT2 = 100 : MeterAmps = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT2 = 100 : Port2AmpData = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT2 = 150 : MeterAmps = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT2 = 150 : Port2AmpData = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT2 = 200 : MeterAmps = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT2 = 200 : Port2AmpData = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT2 = 250 : MeterAmps = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT2 = 250 : Port2AmpData = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT2 = 300 : MeterAmps = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT2 = 300 : Port2AmpData = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT2 = 350 : MeterAmps = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT2 = 350 : Port2AmpData = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT2 = 400 : MeterAmps = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT2 = 400 : Port2AmpData = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT2 = 450 : MeterAmps = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT2 = 450 : Port2AmpData = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT2 = 500 : MeterAmps = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT2 = 500 : Port2AmpData = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT2 = 550 : MeterAmps = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT2 = 550 : Port2AmpData = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT2 = 600 : MeterAmps = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT2 = 600 : Port2AmpData = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT2 = 650 : MeterAmps = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT2 = 650 : Port2AmpData = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT2 = 700 : MeterAmps = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT2 = 700 : Port2AmpData = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT2 = 750 : MeterAmps = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT2 = 750 : Port2AmpData = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT2 = 800 : MeterAmps = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT2 = 800 : Port2AmpData = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT2 = 850 : MeterAmps = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT2 = 850 : Port2AmpData = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT2 = 900 : MeterAmps = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT2 = 900 : Port2AmpData = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT2 = 950 : MeterAmps = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT2 = 950 : Port2AmpData = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1000 : MeterAmps = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1000 : Port2AmpData = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1050 : MeterAmps = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1050 : Port2AmpData = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1100 : MeterAmps = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1100 : Port2AmpData = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1150 : MeterAmps = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1150 : Port2AmpData = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1200 : MeterAmps = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1200 : Port2AmpData = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1250 : MeterAmps = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1250 : Port2AmpData = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1300 : MeterAmps = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1300 : Port2AmpData = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1350 : MeterAmps = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1350 : Port2AmpData = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1400 : MeterAmps = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1400 : Port2AmpData = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1450 : MeterAmps = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1450 : Port2AmpData = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1500 : MeterAmps = 1.5 | 0.02 | 0.8
PWM_CTRL_PORT2 = 1500 : Port2AmpData = 1.5 | 0.02 | 0.8
#switch out load line, switch coil
PWM_CTRL_PORT2 = 0 : NULL : WAIT = 1
J2_04 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5
PWM_SIGN_PORT4 = 0 : NULL : WAIT = 0.5

PWM_CTRL_PORT4 = 0 : MeterAmps = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT4 = 0 : Port4AmpData = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT4 = 50 : MeterAmps = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT4 = 50 : Port4AmpData = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT4 = 100 : MeterAmps = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT4 = 100 : Port4AmpData = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT4 = 150 : MeterAmps = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT4 = 150 : Port4AmpData = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT4 = 200 : MeterAmps = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT4 = 200 : Port4AmpData = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT4 = 250 : MeterAmps = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT4 = 250 : Port4AmpData = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT4 = 300 : MeterAmps = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT4 = 300 : Port4AmpData = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT4 = 350 : MeterAmps = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT4 = 350 : Port4AmpData = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT4 = 400 : MeterAmps = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT4 = 400 : Port4AmpData = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT4 = 450 : MeterAmps = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT4 = 450 : Port4AmpData = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT4 = 500 : MeterAmps = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT4 = 500 : Port4AmpData = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT4 = 550 : MeterAmps = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT4 = 550 : Port4AmpData = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT4 = 600 : MeterAmps = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT4 = 600 : Port4AmpData = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT4 = 650 : MeterAmps = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT4 = 650 : Port4AmpData = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT4 = 700 : MeterAmps = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT4 = 700 : Port4AmpData = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT4 = 750 : MeterAmps = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT4 = 750 : Port4AmpData = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT4 = 800 : MeterAmps = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT4 = 800 : Port4AmpData = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT4 = 850 : MeterAmps = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT4 = 850 : Port4AmpData = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT4 = 900 : MeterAmps = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT4 = 900 : Port4AmpData = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT4 = 950 : MeterAmps = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT4 = 950 : Port4AmpData = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1000 : MeterAmps = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1000 : Port4AmpData = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1050 : MeterAmps = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1050 : Port4AmpData = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1100 : MeterAmps = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1100 : Port4AmpData = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1150 : MeterAmps = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1150 : Port4AmpData = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1200 : MeterAmps = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1200 : Port4AmpData = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1250 : MeterAmps = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1250 : Port4AmpData = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1300 : MeterAmps = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1300 : Port4AmpData = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1350 : MeterAmps = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1350 : Port4AmpData = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1400 : MeterAmps = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1400 : Port4AmpData = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1450 : MeterAmps = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1450 : Port4AmpData = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1500 : MeterAmps = 1.5 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1500 : Port4AmpData = 1.5 | 0.02 | 0.8
#switch out load line, switch coil
PWM_CTRL_PORT4 = 0 : NULL : WAIT = 1
J2_07 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5
PWM_SIGN_PORT4 = 1 : NULL : WAIT = 0.5

PWM_CTRL_PORT4 = 0 : MeterAmps = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT4 = 0 : Port4AmpData = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT4 = 50 : MeterAmps = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT4 = 50 : Port4AmpData = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT4 = 100 : MeterAmps = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT4 = 100 : Port4AmpData = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT4 = 150 : MeterAmps = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT4 = 150 : Port4AmpData = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT4 = 200 : MeterAmps = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT4 = 200 : Port4AmpData = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT4 = 250 : MeterAmps = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT4 = 250 : Port4AmpData = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT4 = 300 : MeterAmps = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT4 = 300 : Port4AmpData = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT4 = 350 : MeterAmps = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT4 = 350 : Port4AmpData = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT4 = 400 : MeterAmps = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT4 = 400 : Port4AmpData = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT4 = 450 : MeterAmps = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT4 = 450 : Port4AmpData = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT4 = 500 : MeterAmps = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT4 = 500 : Port4AmpData = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT4 = 550 : MeterAmps = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT4 = 550 : Port4AmpData = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT4 = 600 : MeterAmps = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT4 = 600 : Port4AmpData = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT4 = 650 : MeterAmps = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT4 = 650 : Port4AmpData = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT4 = 700 : MeterAmps = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT4 = 700 : Port4AmpData = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT4 = 750 : MeterAmps = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT4 = 750 : Port4AmpData = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT4 = 800 : MeterAmps = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT4 = 800 : Port4AmpData = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT4 = 850 : MeterAmps = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT4 = 850 : Port4AmpData = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT4 = 900 : MeterAmps = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT4 = 900 : Port4AmpData = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT4 = 950 : MeterAmps = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT4 = 950 : Port4AmpData = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1000 : MeterAmps = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1000 : Port4AmpData = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1050 : MeterAmps = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1050 : Port4AmpData = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1100 : MeterAmps = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1100 : Port4AmpData = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1150 : MeterAmps = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1150 : Port4AmpData = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1200 : MeterAmps = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1200 : Port4AmpData = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1250 : MeterAmps = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1250 : Port4AmpData = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1300 : MeterAmps = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1300 : Port4AmpData = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1350 : MeterAmps = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1350 : Port4AmpData = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1400 : MeterAmps = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1400 : Port4AmpData = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1450 : MeterAmps = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1450 : Port4AmpData = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1500 : MeterAmps = 1.5 | 0.02 | 0.8
PWM_CTRL_PORT4 = 1500 : Port4AmpData = 1.5 | 0.02 | 0.8
#switch out load line, switch coil
PWM_CTRL_PORT4 = 0 : NULL : WAIT = 1
J2_08 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_09 = 1 : NULL : WAIT = 0.5
PWM_SIGN_PORT5 = 0 : NULL : WAIT = 0.5

PWM_CTRL_PORT5 = 0 : MeterAmps = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT5 = 0 : Port5AmpData = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT5 = 50 : MeterAmps = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT5 = 50 : Port5AmpData = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT5 = 100 : MeterAmps = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT5 = 100 : Port5AmpData = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT5 = 150 : MeterAmps = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT5 = 150 : Port5AmpData = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT5 = 200 : MeterAmps = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT5 = 200 : Port5AmpData = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT5 = 250 : MeterAmps = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT5 = 250 : Port5AmpData = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT5 = 300 : MeterAmps = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT5 = 300 : Port5AmpData = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT5 = 350 : MeterAmps = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT5 = 350 : Port5AmpData = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT5 = 400 : MeterAmps = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT5 = 400 : Port5AmpData = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT5 = 450 : MeterAmps = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT5 = 450 : Port5AmpData = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT5 = 500 : MeterAmps = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT5 = 500 : Port5AmpData = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT5 = 550 : MeterAmps = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT5 = 550 : Port5AmpData = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT5 = 600 : MeterAmps = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT5 = 600 : Port5AmpData = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT5 = 650 : MeterAmps = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT5 = 650 : Port5AmpData = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT5 = 700 : MeterAmps = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT5 = 700 : Port5AmpData = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT5 = 750 : MeterAmps = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT5 = 750 : Port5AmpData = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT5 = 800 : MeterAmps = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT5 = 800 : Port5AmpData = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT5 = 850 : MeterAmps = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT5 = 850 : Port5AmpData = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT5 = 900 : MeterAmps = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT5 = 900 : Port5AmpData = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT5 = 950 : MeterAmps = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT5 = 950 : Port5AmpData = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1000 : MeterAmps = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1000 : Port5AmpData = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1050 : MeterAmps = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1050 : Port5AmpData = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1100 : MeterAmps = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1100 : Port5AmpData = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1150 : MeterAmps = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1150 : Port5AmpData = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1200 : MeterAmps = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1200 : Port5AmpData = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1250 : MeterAmps = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1250 : Port5AmpData = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1300 : MeterAmps = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1300 : Port5AmpData = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1350 : MeterAmps = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1350 : Port5AmpData = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1400 : MeterAmps = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1400 : Port5AmpData = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1450 : MeterAmps = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1450 : Port5AmpData = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1500 : MeterAmps = 1.5 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1500 : Port5AmpData = 1.5 | 0.02 | 0.8
#switch out load line, switch coil
PWM_CTRL_PORT5 = 0 : NULL : WAIT = 1
J2_09 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_10 = 1 : NULL : WAIT = 0.5
PWM_SIGN_PORT5 = 1 : NULL : WAIT = 0.5

PWM_CTRL_PORT5 = 0 : MeterAmps = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT5 = 0 : Port5AmpData = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT5 = 50 : MeterAmps = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT5 = 50 : Port5AmpData = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT5 = 100 : MeterAmps = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT5 = 100 : Port5AmpData = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT5 = 150 : MeterAmps = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT5 = 150 : Port5AmpData = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT5 = 200 : MeterAmps = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT5 = 200 : Port5AmpData = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT5 = 250 : MeterAmps = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT5 = 250 : Port5AmpData = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT5 = 300 : MeterAmps = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT5 = 300 : Port5AmpData = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT5 = 350 : MeterAmps = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT5 = 350 : Port5AmpData = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT5 = 400 : MeterAmps = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT5 = 400 : Port5AmpData = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT5 = 450 : MeterAmps = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT5 = 450 : Port5AmpData = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT5 = 500 : MeterAmps = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT5 = 500 : Port5AmpData = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT5 = 550 : MeterAmps = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT5 = 550 : Port5AmpData = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT5 = 600 : MeterAmps = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT5 = 600 : Port5AmpData = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT5 = 650 : MeterAmps = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT5 = 650 : Port5AmpData = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT5 = 700 : MeterAmps = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT5 = 700 : Port5AmpData = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT5 = 750 : MeterAmps = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT5 = 750 : Port5AmpData = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT5 = 800 : MeterAmps = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT5 = 800 : Port5AmpData = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT5 = 850 : MeterAmps = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT5 = 850 : Port5AmpData = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT5 = 900 : MeterAmps = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT5 = 900 : Port5AmpData = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT5 = 950 : MeterAmps = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT5 = 950 : Port5AmpData = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1000 : MeterAmps = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1000 : Port5AmpData = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1050 : MeterAmps = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1050 : Port5AmpData = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1100 : MeterAmps = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1100 : Port5AmpData = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1150 : MeterAmps = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1150 : Port5AmpData = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1200 : MeterAmps = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1200 : Port5AmpData = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1250 : MeterAmps = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1250 : Port5AmpData = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1300 : MeterAmps = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1300 : Port5AmpData = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1350 : MeterAmps = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1350 : Port5AmpData = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1400 : MeterAmps = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1400 : Port5AmpData = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1450 : MeterAmps = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1450 : Port5AmpData = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1500 : MeterAmps = 1.5 | 0.02 | 0.8
PWM_CTRL_PORT5 = 1500 : Port5AmpData = 1.5 | 0.02 | 0.8
#switch out load line, switch coil
PWM_CTRL_PORT5 = 0 : NULL : WAIT = 1
J2_10 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_11 = 1 : NULL : WAIT = 0.5
PWM_SIGN_PORT6 = 0 : NULL : WAIT = 0.5

PWM_CTRL_PORT6 = 0 : MeterAmps = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT6 = 0 : Port6AmpData = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT6 = 50 : MeterAmps = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT6 = 50 : Port6AmpData = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT6 = 100 : MeterAmps = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT6 = 100 : Port6AmpData = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT6 = 150 : MeterAmps = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT6 = 150 : Port6AmpData = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT6 = 200 : MeterAmps = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT6 = 200 : Port6AmpData = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT6 = 250 : MeterAmps = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT6 = 250 : Port6AmpData = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT6 = 300 : MeterAmps = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT6 = 300 : Port6AmpData = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT6 = 350 : MeterAmps = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT6 = 350 : Port6AmpData = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT6 = 400 : MeterAmps = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT6 = 400 : Port6AmpData = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT6 = 450 : MeterAmps = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT6 = 450 : Port6AmpData = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT6 = 500 : MeterAmps = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT6 = 500 : Port6AmpData = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT6 = 550 : MeterAmps = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT6 = 550 : Port6AmpData = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT6 = 600 : MeterAmps = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT6 = 600 : Port6AmpData = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT6 = 650 : MeterAmps = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT6 = 650 : Port6AmpData = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT6 = 700 : MeterAmps = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT6 = 700 : Port6AmpData = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT6 = 750 : MeterAmps = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT6 = 750 : Port6AmpData = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT6 = 800 : MeterAmps = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT6 = 800 : Port6AmpData = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT6 = 850 : MeterAmps = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT6 = 850 : Port6AmpData = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT6 = 900 : MeterAmps = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT6 = 900 : Port6AmpData = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT6 = 950 : MeterAmps = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT6 = 950 : Port6AmpData = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1000 : MeterAmps = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1000 : Port6AmpData = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1050 : MeterAmps = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1050 : Port6AmpData = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1100 : MeterAmps = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1100 : Port6AmpData = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1150 : MeterAmps = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1150 : Port6AmpData = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1200 : MeterAmps = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1200 : Port6AmpData = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1250 : MeterAmps = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1250 : Port6AmpData = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1300 : MeterAmps = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1300 : Port6AmpData = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1350 : MeterAmps = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1350 : Port6AmpData = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1400 : MeterAmps = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1400 : Port6AmpData = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1450 : MeterAmps = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1450 : Port6AmpData = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1500 : MeterAmps = 1.5 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1500 : Port6AmpData = 1.5 | 0.02 | 0.8
#switch out load line, switch coil
PWM_CTRL_PORT6 = 0 : NULL : WAIT = 1
J2_11 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_12 = 1 : NULL : WAIT = 0.5
PWM_SIGN_PORT6 = 1 : NULL : WAIT = 0.5

PWM_CTRL_PORT6 = 0 : MeterAmps = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT6 = 0 : Port6AmpData = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT6 = 50 : MeterAmps = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT6 = 50 : Port6AmpData = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT6 = 100 : MeterAmps = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT6 = 100 : Port6AmpData = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT6 = 150 : MeterAmps = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT6 = 150 : Port6AmpData = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT6 = 200 : MeterAmps = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT6 = 200 : Port6AmpData = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT6 = 250 : MeterAmps = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT6 = 250 : Port6AmpData = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT6 = 300 : MeterAmps = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT6 = 300 : Port6AmpData = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT6 = 350 : MeterAmps = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT6 = 350 : Port6AmpData = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT6 = 400 : MeterAmps = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT6 = 400 : Port6AmpData = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT6 = 450 : MeterAmps = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT6 = 450 : Port6AmpData = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT6 = 500 : MeterAmps = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT6 = 500 : Port6AmpData = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT6 = 550 : MeterAmps = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT6 = 550 : Port6AmpData = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT6 = 600 : MeterAmps = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT6 = 600 : Port6AmpData = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT6 = 650 : MeterAmps = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT6 = 650 : Port6AmpData = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT6 = 700 : MeterAmps = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT6 = 700 : Port6AmpData = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT6 = 750 : MeterAmps = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT6 = 750 : Port6AmpData = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT6 = 800 : MeterAmps = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT6 = 800 : Port6AmpData = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT6 = 850 : MeterAmps = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT6 = 850 : Port6AmpData = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT6 = 900 : MeterAmps = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT6 = 900 : Port6AmpData = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT6 = 950 : MeterAmps = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT6 = 950 : Port6AmpData = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1000 : MeterAmps = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1000 : Port6AmpData = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1050 : MeterAmps = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1050 : Port6AmpData = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1100 : MeterAmps = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1100 : Port6AmpData = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1150 : MeterAmps = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1150 : Port6AmpData = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1200 : MeterAmps = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1200 : Port6AmpData = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1250 : MeterAmps = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1250 : Port6AmpData = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1300 : MeterAmps = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1300 : Port6AmpData = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1350 : MeterAmps = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1350 : Port6AmpData = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1400 : MeterAmps = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1400 : Port6AmpData = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1450 : MeterAmps = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1450 : Port6AmpData = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1500 : MeterAmps = 1.5 | 0.02 | 0.8
PWM_CTRL_PORT6 = 1500 : Port6AmpData = 1.5 | 0.02 | 0.8
#switch out load line, switch coil
PWM_CTRL_PORT6 = 0 : NULL : WAIT = 1
J2_12 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5
PWM_SIGN_PORT7 = 0 : NULL : WAIT = 0.5

PWM_CTRL_PORT7 = 0 : MeterAmps = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT7 = 0 : Port7AmpData = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT7 = 50 : MeterAmps = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT7 = 50 : Port7AmpData = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT7 = 100 : MeterAmps = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT7 = 100 : Port7AmpData = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT7 = 150 : MeterAmps = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT7 = 150 : Port7AmpData = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT7 = 200 : MeterAmps = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT7 = 200 : Port7AmpData = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT7 = 250 : MeterAmps = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT7 = 250 : Port7AmpData = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT7 = 300 : MeterAmps = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT7 = 300 : Port7AmpData = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT7 = 350 : MeterAmps = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT7 = 350 : Port7AmpData = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT7 = 400 : MeterAmps = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT7 = 400 : Port7AmpData = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT7 = 450 : MeterAmps = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT7 = 450 : Port7AmpData = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT7 = 500 : MeterAmps = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT7 = 500 : Port7AmpData = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT7 = 550 : MeterAmps = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT7 = 550 : Port7AmpData = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT7 = 600 : MeterAmps = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT7 = 600 : Port7AmpData = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT7 = 650 : MeterAmps = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT7 = 650 : Port7AmpData = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT7 = 700 : MeterAmps = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT7 = 700 : Port7AmpData = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT7 = 750 : MeterAmps = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT7 = 750 : Port7AmpData = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT7 = 800 : MeterAmps = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT7 = 800 : Port7AmpData = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT7 = 850 : MeterAmps = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT7 = 850 : Port7AmpData = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT7 = 900 : MeterAmps = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT7 = 900 : Port7AmpData = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT7 = 950 : MeterAmps = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT7 = 950 : Port7AmpData = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1000 : MeterAmps = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1000 : Port7AmpData = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1050 : MeterAmps = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1050 : Port7AmpData = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1100 : MeterAmps = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1100 : Port7AmpData = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1150 : MeterAmps = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1150 : Port7AmpData = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1200 : MeterAmps = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1200 : Port7AmpData = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1250 : MeterAmps = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1250 : Port7AmpData = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1300 : MeterAmps = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1300 : Port7AmpData = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1350 : MeterAmps = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1350 : Port7AmpData = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1400 : MeterAmps = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1400 : Port7AmpData = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1450 : MeterAmps = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1450 : Port7AmpData = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1500 : MeterAmps = 1.5 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1500 : Port7AmpData = 1.5 | 0.02 | 0.8
#switch out load line, switch coil
PWM_CTRL_PORT7 = 0 : NULL : WAIT = 1
J3_01 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5
PWM_SIGN_PORT7 = 1 : NULL : WAIT = 0.5

PWM_CTRL_PORT7 = 0 : MeterAmps = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT7 = 0 : Port7AmpData = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT7 = 50 : MeterAmps = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT7 = 50 : Port7AmpData = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT7 = 100 : MeterAmps = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT7 = 100 : Port7AmpData = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT7 = 150 : MeterAmps = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT7 = 150 : Port7AmpData = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT7 = 200 : MeterAmps = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT7 = 200 : Port7AmpData = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT7 = 250 : MeterAmps = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT7 = 250 : Port7AmpData = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT7 = 300 : MeterAmps = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT7 = 300 : Port7AmpData = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT7 = 350 : MeterAmps = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT7 = 350 : Port7AmpData = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT7 = 400 : MeterAmps = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT7 = 400 : Port7AmpData = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT7 = 450 : MeterAmps = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT7 = 450 : Port7AmpData = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT7 = 500 : MeterAmps = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT7 = 500 : Port7AmpData = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT7 = 550 : MeterAmps = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT7 = 550 : Port7AmpData = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT7 = 600 : MeterAmps = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT7 = 600 : Port7AmpData = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT7 = 650 : MeterAmps = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT7 = 650 : Port7AmpData = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT7 = 700 : MeterAmps = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT7 = 700 : Port7AmpData = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT7 = 750 : MeterAmps = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT7 = 750 : Port7AmpData = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT7 = 800 : MeterAmps = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT7 = 800 : Port7AmpData = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT7 = 850 : MeterAmps = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT7 = 850 : Port7AmpData = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT7 = 900 : MeterAmps = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT7 = 900 : Port7AmpData = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT7 = 950 : MeterAmps = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT7 = 950 : Port7AmpData = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1000 : MeterAmps = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1000 : Port7AmpData = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1050 : MeterAmps = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1050 : Port7AmpData = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1100 : MeterAmps = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1100 : Port7AmpData = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1150 : MeterAmps = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1150 : Port7AmpData = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1200 : MeterAmps = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1200 : Port7AmpData = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1250 : MeterAmps = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1250 : Port7AmpData = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1300 : MeterAmps = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1300 : Port7AmpData = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1350 : MeterAmps = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1350 : Port7AmpData = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1400 : MeterAmps = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1400 : Port7AmpData = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1450 : MeterAmps = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1450 : Port7AmpData = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1500 : MeterAmps = 1.5 | 0.02 | 0.8
PWM_CTRL_PORT7 = 1500 : Port7AmpData = 1.5 | 0.02 | 0.8
#switch out load line, switch coil
PWM_CTRL_PORT7 = 0 : NULL : WAIT = 1
J3_02 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5
PWM_SIGN_PORT8 = 0 : NULL : WAIT = 0.5

PWM_CTRL_PORT8 = 0 : MeterAmps = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT8 = 0 : Port8AmpData = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT8 = 50 : MeterAmps = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT8 = 50 : Port8AmpData = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT8 = 100 : MeterAmps = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT8 = 100 : Port8AmpData = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT8 = 150 : MeterAmps = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT8 = 150 : Port8AmpData = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT8 = 200 : MeterAmps = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT8 = 200 : Port8AmpData = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT8 = 250 : MeterAmps = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT8 = 250 : Port8AmpData = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT8 = 300 : MeterAmps = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT8 = 300 : Port8AmpData = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT8 = 350 : MeterAmps = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT8 = 350 : Port8AmpData = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT8 = 400 : MeterAmps = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT8 = 400 : Port8AmpData = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT8 = 450 : MeterAmps = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT8 = 450 : Port8AmpData = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT8 = 500 : MeterAmps = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT8 = 500 : Port8AmpData = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT8 = 550 : MeterAmps = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT8 = 550 : Port8AmpData = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT8 = 600 : MeterAmps = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT8 = 600 : Port8AmpData = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT8 = 650 : MeterAmps = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT8 = 650 : Port8AmpData = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT8 = 700 : MeterAmps = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT8 = 700 : Port8AmpData = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT8 = 750 : MeterAmps = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT8 = 750 : Port8AmpData = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT8 = 800 : MeterAmps = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT8 = 800 : Port8AmpData = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT8 = 850 : MeterAmps = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT8 = 850 : Port8AmpData = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT8 = 900 : MeterAmps = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT8 = 900 : Port8AmpData = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT8 = 950 : MeterAmps = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT8 = 950 : Port8AmpData = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1000 : MeterAmps = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1000 : Port8AmpData = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1050 : MeterAmps = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1050 : Port8AmpData = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1100 : MeterAmps = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1100 : Port8AmpData = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1150 : MeterAmps = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1150 : Port8AmpData = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1200 : MeterAmps = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1200 : Port8AmpData = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1250 : MeterAmps = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1250 : Port8AmpData = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1300 : MeterAmps = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1300 : Port8AmpData = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1350 : MeterAmps = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1350 : Port8AmpData = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1400 : MeterAmps = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1400 : Port8AmpData = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1450 : MeterAmps = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1450 : Port8AmpData = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1500 : MeterAmps = 1.5 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1500 : Port8AmpData = 1.5 | 0.02 | 0.8
#switch out load line, switch coil
PWM_CTRL_PORT8 = 0 : NULL : WAIT = 1
J3_03 = 0 : NULL : WAIT = 1
J4_01 = 0, J4_03 = 1 : NULL : WAIT = 0.5
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5
PWM_SIGN_PORT8 = 1 : NULL : WAIT = 0.5

PWM_CTRL_PORT8 = 0 : MeterAmps = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT8 = 0 : Port8AmpData = 0.0 | 0.02 | 0.8
PWM_CTRL_PORT8 = 50 : MeterAmps = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT8 = 50 : Port8AmpData = 0.05 | 0.02 | 0.8
PWM_CTRL_PORT8 = 100 : MeterAmps = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT8 = 100 : Port8AmpData = 0.1 | 0.02 | 0.8
PWM_CTRL_PORT8 = 150 : MeterAmps = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT8 = 150 : Port8AmpData = 0.15 | 0.02 | 0.8
PWM_CTRL_PORT8 = 200 : MeterAmps = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT8 = 200 : Port8AmpData = 0.2 | 0.02 | 0.8
PWM_CTRL_PORT8 = 250 : MeterAmps = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT8 = 250 : Port8AmpData = 0.25 | 0.02 | 0.8
PWM_CTRL_PORT8 = 300 : MeterAmps = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT8 = 300 : Port8AmpData = 0.3 | 0.02 | 0.8
PWM_CTRL_PORT8 = 350 : MeterAmps = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT8 = 350 : Port8AmpData = 0.35 | 0.02 | 0.8
PWM_CTRL_PORT8 = 400 : MeterAmps = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT8 = 400 : Port8AmpData = 0.4 | 0.02 | 0.8
PWM_CTRL_PORT8 = 450 : MeterAmps = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT8 = 450 : Port8AmpData = 0.45 | 0.02 | 0.8
PWM_CTRL_PORT8 = 500 : MeterAmps = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT8 = 500 : Port8AmpData = 0.5 | 0.02 | 0.8
PWM_CTRL_PORT8 = 550 : MeterAmps = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT8 = 550 : Port8AmpData = 0.55 | 0.02 | 0.8
PWM_CTRL_PORT8 = 600 : MeterAmps = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT8 = 600 : Port8AmpData = 0.6 | 0.02 | 0.8
PWM_CTRL_PORT8 = 650 : MeterAmps = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT8 = 650 : Port8AmpData = 0.65 | 0.02 | 0.8
PWM_CTRL_PORT8 = 700 : MeterAmps = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT8 = 700 : Port8AmpData = 0.7 | 0.02 | 0.8
PWM_CTRL_PORT8 = 750 : MeterAmps = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT8 = 750 : Port8AmpData = 0.75 | 0.02 | 0.8
PWM_CTRL_PORT8 = 800 : MeterAmps = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT8 = 800 : Port8AmpData = 0.8 | 0.02 | 0.8
PWM_CTRL_PORT8 = 850 : MeterAmps = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT8 = 850 : Port8AmpData = 0.85 | 0.02 | 0.8
PWM_CTRL_PORT8 = 900 : MeterAmps = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT8 = 900 : Port8AmpData = 0.9 | 0.02 | 0.8
PWM_CTRL_PORT8 = 950 : MeterAmps = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT8 = 950 : Port8AmpData = 0.95 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1000 : MeterAmps = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1000 : Port8AmpData = 1.0 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1050 : MeterAmps = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1050 : Port8AmpData = 1.05 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1100 : MeterAmps = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1100 : Port8AmpData = 1.1 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1150 : MeterAmps = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1150 : Port8AmpData = 1.15 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1200 : MeterAmps = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1200 : Port8AmpData = 1.2 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1250 : MeterAmps = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1250 : Port8AmpData = 1.25 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1300 : MeterAmps = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1300 : Port8AmpData = 1.3 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1350 : MeterAmps = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1350 : Port8AmpData = 1.35 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1400 : MeterAmps = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1400 : Port8AmpData = 1.4 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1450 : MeterAmps = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1450 : Port8AmpData = 1.45 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1500 : MeterAmps = 1.5 | 0.02 | 0.8
PWM_CTRL_PORT8 = 1500 : Port8AmpData = 1.5 | 0.02 | 0.8
#switch out load line, switch coil
PWM_CTRL_PORT8 = 0 : NULL : WAIT = 1
J3_04 = 0 : NULL : WAIT = 1
J4_02 = 0, J4_03 = 1 : NULL : WAIT = 0.5
SAVE
END
