#34044-3
#Verion 0.0
#PWMi h-bridge test with 2.2 Ohm resistive load. (6.59 amps @ 14.5 VDC)
UUT_DBC = 34044-563.dbc
UUT_DATANAME = 34044-3-PWMI-BRIDGE

#-----setup 34044-----
#disable global modes
#configure PWMi
Command = 83, MODE1A = 1, MODE1B = 4, MODE2A = 4, MODE2B = 4, MODE3A = 1, MODE3B = 4, MODE4A = 4, MODE4B = 4, MODE5A = 4, MODE5B = 4, MODE6A = 4, MODE6B = 4, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5
Command = 84, MODE8A = 4, MODE8B = 4 : NULL : WAIT = 0.5
Command = 84, Port1A_Kp = 5.0, Port1A_Ki = 2.0, Port1B_Kp = 5.0, Port1B_Ki = 2.0, Port2A_Kp = 5.0, Port2A_Ki = 2.0 : NULL : WAIT = 0.5
Command = 85, Port2B_Kp = 5.0, Port2B_Ki = 2.0, Port3A_Kp = 5.0, Port3A_Ki = 2.0, Port3B_Kp = 5.0, Port3B_Ki = 2.0 : NULL : WAIT = 0.5
Command = 86, Port4A_Kp = 5.0, Port4A_Ki = 2.0, Port4B_Kp = 5.0, Port4B_Ki = 2.0, Port5A_Kp = 5.0, Port5A_Ki = 2.0, Port5B_Kp = 5.0 : NULL : WAIT = 0.5
Command = 89, Port5B_Ki = 2.0, Port6A_Kp = 5.0, Port6A_Ki = 2.0, Port6B_Kp = 5.0, Port6B_Ki = 2.0, Port7A_Kp = 5.0, Port7A_Ki = 2.0 : NULL : WAIT = 0.5
Command = 90, Port7B_Kp = 5.0, Port7B_Ki = 2.0, Port8A_Kp = 5.0, Port8A_Ki = 2.0, Port8B_Kp = 5.0, Port8B_Ki = 2.0 : NULL : WAIT = 0.5
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2, PORT5_MODE = 2, PORT6_MODE = 2, PORT7_MODE = 2, PORT8_MODE = 2 : NULL : WAIT = 0.5
Command = 82, FREQ1 = 100, SaveSettings = 1, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1 : NULL
#clean DBC signals
Command = 0 : NULL : WAIT = 0.5
MODE1 = 0, MODE2 = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0, MODE8A = 0, MODE8B = 0 : NULL : WAIT = 0.5

#prompt user to switch
PAUSE-please verify load connection
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1

#turn on output
Command = 81, PWM_CTRL_2A = 0, BRIDGE2_DIR = 1 : Feedback2A = 0.0 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 0, BRIDGE2_DIR = 2 : Feedback2B = 0.0 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 100, BRIDGE2_DIR = 1 : Feedback2A = 0.1 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 100, BRIDGE2_DIR = 2 : Feedback2B = 0.1 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 200, BRIDGE2_DIR = 1 : Feedback2A = 0.2 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 200, BRIDGE2_DIR = 2 : Feedback2B = 0.2 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 300, BRIDGE2_DIR = 1 : Feedback2A = 0.3 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 300, BRIDGE2_DIR = 2 : Feedback2B = 0.3 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 400, BRIDGE2_DIR = 1 : Feedback2A = 0.4 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 400, BRIDGE2_DIR = 2 : Feedback2B = 0.4 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 500, BRIDGE2_DIR = 1 : Feedback2A = 0.5 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 500, BRIDGE2_DIR = 2 : Feedback2B = 0.5 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 600, BRIDGE2_DIR = 1 : Feedback2A = 0.6 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 600, BRIDGE2_DIR = 2 : Feedback2B = 0.6 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 700, BRIDGE2_DIR = 1 : Feedback2A = 0.7 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 700, BRIDGE2_DIR = 2 : Feedback2B = 0.7 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 800, BRIDGE2_DIR = 1 : Feedback2A = 0.8 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 800, BRIDGE2_DIR = 2 : Feedback2B = 0.8 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 900, BRIDGE2_DIR = 1 : Feedback2A = 0.9 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 900, BRIDGE2_DIR = 2 : Feedback2B = 0.9 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 1000, BRIDGE2_DIR = 1 : Feedback2A = 1.0 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 1000, BRIDGE2_DIR = 2 : Feedback2B = 1.0 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 1100, BRIDGE2_DIR = 1 : Feedback2A = 1.1 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 1100, BRIDGE2_DIR = 2 : Feedback2B = 1.1 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 1200, BRIDGE2_DIR = 1 : Feedback2A = 1.2 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 1200, BRIDGE2_DIR = 2 : Feedback2B = 1.2 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 1300, BRIDGE2_DIR = 1 : Feedback2A = 1.3 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 1300, BRIDGE2_DIR = 2 : Feedback2B = 1.3 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 1400, BRIDGE2_DIR = 1 : Feedback2A = 1.4 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 1400, BRIDGE2_DIR = 2 : Feedback2B = 1.4 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 1500, BRIDGE2_DIR = 1 : Feedback2A = 1.5 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 1500, BRIDGE2_DIR = 2 : Feedback2B = 1.5 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 1600, BRIDGE2_DIR = 1 : Feedback2A = 1.6 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 1600, BRIDGE2_DIR = 2 : Feedback2B = 1.6 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 1700, BRIDGE2_DIR = 1 : Feedback2A = 1.7 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 1700, BRIDGE2_DIR = 2 : Feedback2B = 1.7 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 1800, BRIDGE2_DIR = 1 : Feedback2A = 1.8 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 1800, BRIDGE2_DIR = 2 : Feedback2B = 1.8 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 1900, BRIDGE2_DIR = 1 : Feedback2A = 1.9 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 1900, BRIDGE2_DIR = 2 : Feedback2B = 1.9 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 2000, BRIDGE2_DIR = 1 : Feedback2A = 2.0 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 2000, BRIDGE2_DIR = 2 : Feedback2B = 2.0 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 2100, BRIDGE2_DIR = 1 : Feedback2A = 2.1 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 2100, BRIDGE2_DIR = 2 : Feedback2B = 2.1 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 2200, BRIDGE2_DIR = 1 : Feedback2A = 2.2 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 2200, BRIDGE2_DIR = 2 : Feedback2B = 2.2 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 2300, BRIDGE2_DIR = 1 : Feedback2A = 2.3 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 2300, BRIDGE2_DIR = 2 : Feedback2B = 2.3 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 2400, BRIDGE2_DIR = 1 : Feedback2A = 2.4 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 2400, BRIDGE2_DIR = 2 : Feedback2B = 2.4 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 2500, BRIDGE2_DIR = 1 : Feedback2A = 2.5 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 2500, BRIDGE2_DIR = 2 : Feedback2B = 2.5 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_2A = 2600, BRIDGE2_DIR = 1 : Feedback2A = 2.6 | 0.1 | 0.5
Command = 81, PWM_CTRL_2A = 2600, BRIDGE2_DIR = 2 : Feedback2B = 2.6 | 0.1 | 0.5
#turn off output
PWM_CTRL_2A = 0 : NULL : WAIT = 1
#prompt user to switch
PAUSE-please verify load connection
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1

#turn on output
Command = 81, PWM_CTRL_4A = 0, BRIDGE4_DIR = 1 : Feedback4A = 0.0 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 0, BRIDGE4_DIR = 2 : Feedback4B = 0.0 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 100, BRIDGE4_DIR = 1 : Feedback4A = 0.1 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 100, BRIDGE4_DIR = 2 : Feedback4B = 0.1 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 200, BRIDGE4_DIR = 1 : Feedback4A = 0.2 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 200, BRIDGE4_DIR = 2 : Feedback4B = 0.2 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 300, BRIDGE4_DIR = 1 : Feedback4A = 0.3 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 300, BRIDGE4_DIR = 2 : Feedback4B = 0.3 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 400, BRIDGE4_DIR = 1 : Feedback4A = 0.4 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 400, BRIDGE4_DIR = 2 : Feedback4B = 0.4 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 500, BRIDGE4_DIR = 1 : Feedback4A = 0.5 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 500, BRIDGE4_DIR = 2 : Feedback4B = 0.5 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 600, BRIDGE4_DIR = 1 : Feedback4A = 0.6 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 600, BRIDGE4_DIR = 2 : Feedback4B = 0.6 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 700, BRIDGE4_DIR = 1 : Feedback4A = 0.7 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 700, BRIDGE4_DIR = 2 : Feedback4B = 0.7 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 800, BRIDGE4_DIR = 1 : Feedback4A = 0.8 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 800, BRIDGE4_DIR = 2 : Feedback4B = 0.8 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 900, BRIDGE4_DIR = 1 : Feedback4A = 0.9 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 900, BRIDGE4_DIR = 2 : Feedback4B = 0.9 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 1000, BRIDGE4_DIR = 1 : Feedback4A = 1.0 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 1000, BRIDGE4_DIR = 2 : Feedback4B = 1.0 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 1100, BRIDGE4_DIR = 1 : Feedback4A = 1.1 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 1100, BRIDGE4_DIR = 2 : Feedback4B = 1.1 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 1200, BRIDGE4_DIR = 1 : Feedback4A = 1.2 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 1200, BRIDGE4_DIR = 2 : Feedback4B = 1.2 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 1300, BRIDGE4_DIR = 1 : Feedback4A = 1.3 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 1300, BRIDGE4_DIR = 2 : Feedback4B = 1.3 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 1400, BRIDGE4_DIR = 1 : Feedback4A = 1.4 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 1400, BRIDGE4_DIR = 2 : Feedback4B = 1.4 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 1500, BRIDGE4_DIR = 1 : Feedback4A = 1.5 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 1500, BRIDGE4_DIR = 2 : Feedback4B = 1.5 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 1600, BRIDGE4_DIR = 1 : Feedback4A = 1.6 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 1600, BRIDGE4_DIR = 2 : Feedback4B = 1.6 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 1700, BRIDGE4_DIR = 1 : Feedback4A = 1.7 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 1700, BRIDGE4_DIR = 2 : Feedback4B = 1.7 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 1800, BRIDGE4_DIR = 1 : Feedback4A = 1.8 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 1800, BRIDGE4_DIR = 2 : Feedback4B = 1.8 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 1900, BRIDGE4_DIR = 1 : Feedback4A = 1.9 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 1900, BRIDGE4_DIR = 2 : Feedback4B = 1.9 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 2000, BRIDGE4_DIR = 1 : Feedback4A = 2.0 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 2000, BRIDGE4_DIR = 2 : Feedback4B = 2.0 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 2100, BRIDGE4_DIR = 1 : Feedback4A = 2.1 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 2100, BRIDGE4_DIR = 2 : Feedback4B = 2.1 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 2200, BRIDGE4_DIR = 1 : Feedback4A = 2.2 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 2200, BRIDGE4_DIR = 2 : Feedback4B = 2.2 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 2300, BRIDGE4_DIR = 1 : Feedback4A = 2.3 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 2300, BRIDGE4_DIR = 2 : Feedback4B = 2.3 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 2400, BRIDGE4_DIR = 1 : Feedback4A = 2.4 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 2400, BRIDGE4_DIR = 2 : Feedback4B = 2.4 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 2500, BRIDGE4_DIR = 1 : Feedback4A = 2.5 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 2500, BRIDGE4_DIR = 2 : Feedback4B = 2.5 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_4A = 2600, BRIDGE4_DIR = 1 : Feedback4A = 2.6 | 0.1 | 0.5
Command = 81, PWM_CTRL_4A = 2600, BRIDGE4_DIR = 2 : Feedback4B = 2.6 | 0.1 | 0.5
#turn off output
PWM_CTRL_4A = 0 : NULL : WAIT = 1
#prompt user to switch
PAUSE-please verify load connection
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1

#turn on output
Command = 81, PWM_CTRL_5A = 0, BRIDGE5_DIR = 1 : Feedback5A = 0.0 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 0, BRIDGE5_DIR = 2 : Feedback5B = 0.0 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 100, BRIDGE5_DIR = 1 : Feedback5A = 0.1 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 100, BRIDGE5_DIR = 2 : Feedback5B = 0.1 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 200, BRIDGE5_DIR = 1 : Feedback5A = 0.2 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 200, BRIDGE5_DIR = 2 : Feedback5B = 0.2 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 300, BRIDGE5_DIR = 1 : Feedback5A = 0.3 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 300, BRIDGE5_DIR = 2 : Feedback5B = 0.3 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 400, BRIDGE5_DIR = 1 : Feedback5A = 0.4 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 400, BRIDGE5_DIR = 2 : Feedback5B = 0.4 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 500, BRIDGE5_DIR = 1 : Feedback5A = 0.5 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 500, BRIDGE5_DIR = 2 : Feedback5B = 0.5 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 600, BRIDGE5_DIR = 1 : Feedback5A = 0.6 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 600, BRIDGE5_DIR = 2 : Feedback5B = 0.6 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 700, BRIDGE5_DIR = 1 : Feedback5A = 0.7 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 700, BRIDGE5_DIR = 2 : Feedback5B = 0.7 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 800, BRIDGE5_DIR = 1 : Feedback5A = 0.8 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 800, BRIDGE5_DIR = 2 : Feedback5B = 0.8 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 900, BRIDGE5_DIR = 1 : Feedback5A = 0.9 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 900, BRIDGE5_DIR = 2 : Feedback5B = 0.9 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 1000, BRIDGE5_DIR = 1 : Feedback5A = 1.0 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 1000, BRIDGE5_DIR = 2 : Feedback5B = 1.0 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 1100, BRIDGE5_DIR = 1 : Feedback5A = 1.1 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 1100, BRIDGE5_DIR = 2 : Feedback5B = 1.1 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 1200, BRIDGE5_DIR = 1 : Feedback5A = 1.2 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 1200, BRIDGE5_DIR = 2 : Feedback5B = 1.2 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 1300, BRIDGE5_DIR = 1 : Feedback5A = 1.3 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 1300, BRIDGE5_DIR = 2 : Feedback5B = 1.3 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 1400, BRIDGE5_DIR = 1 : Feedback5A = 1.4 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 1400, BRIDGE5_DIR = 2 : Feedback5B = 1.4 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 1500, BRIDGE5_DIR = 1 : Feedback5A = 1.5 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 1500, BRIDGE5_DIR = 2 : Feedback5B = 1.5 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 1600, BRIDGE5_DIR = 1 : Feedback5A = 1.6 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 1600, BRIDGE5_DIR = 2 : Feedback5B = 1.6 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 1700, BRIDGE5_DIR = 1 : Feedback5A = 1.7 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 1700, BRIDGE5_DIR = 2 : Feedback5B = 1.7 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 1800, BRIDGE5_DIR = 1 : Feedback5A = 1.8 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 1800, BRIDGE5_DIR = 2 : Feedback5B = 1.8 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 1900, BRIDGE5_DIR = 1 : Feedback5A = 1.9 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 1900, BRIDGE5_DIR = 2 : Feedback5B = 1.9 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 2000, BRIDGE5_DIR = 1 : Feedback5A = 2.0 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 2000, BRIDGE5_DIR = 2 : Feedback5B = 2.0 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 2100, BRIDGE5_DIR = 1 : Feedback5A = 2.1 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 2100, BRIDGE5_DIR = 2 : Feedback5B = 2.1 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 2200, BRIDGE5_DIR = 1 : Feedback5A = 2.2 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 2200, BRIDGE5_DIR = 2 : Feedback5B = 2.2 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 2300, BRIDGE5_DIR = 1 : Feedback5A = 2.3 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 2300, BRIDGE5_DIR = 2 : Feedback5B = 2.3 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 2400, BRIDGE5_DIR = 1 : Feedback5A = 2.4 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 2400, BRIDGE5_DIR = 2 : Feedback5B = 2.4 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 2500, BRIDGE5_DIR = 1 : Feedback5A = 2.5 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 2500, BRIDGE5_DIR = 2 : Feedback5B = 2.5 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_5A = 2600, BRIDGE5_DIR = 1 : Feedback5A = 2.6 | 0.1 | 0.5
Command = 81, PWM_CTRL_5A = 2600, BRIDGE5_DIR = 2 : Feedback5B = 2.6 | 0.1 | 0.5
#turn off output
PWM_CTRL_5A = 0 : NULL : WAIT = 1
#prompt user to switch
PAUSE-please verify load connection
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1

#turn on output
Command = 81, PWM_CTRL_6A = 0, BRIDGE6_DIR = 1 : Feedback6A = 0.0 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 0, BRIDGE6_DIR = 2 : Feedback6B = 0.0 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 100, BRIDGE6_DIR = 1 : Feedback6A = 0.1 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 100, BRIDGE6_DIR = 2 : Feedback6B = 0.1 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 200, BRIDGE6_DIR = 1 : Feedback6A = 0.2 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 200, BRIDGE6_DIR = 2 : Feedback6B = 0.2 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 300, BRIDGE6_DIR = 1 : Feedback6A = 0.3 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 300, BRIDGE6_DIR = 2 : Feedback6B = 0.3 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 400, BRIDGE6_DIR = 1 : Feedback6A = 0.4 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 400, BRIDGE6_DIR = 2 : Feedback6B = 0.4 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 500, BRIDGE6_DIR = 1 : Feedback6A = 0.5 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 500, BRIDGE6_DIR = 2 : Feedback6B = 0.5 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 600, BRIDGE6_DIR = 1 : Feedback6A = 0.6 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 600, BRIDGE6_DIR = 2 : Feedback6B = 0.6 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 700, BRIDGE6_DIR = 1 : Feedback6A = 0.7 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 700, BRIDGE6_DIR = 2 : Feedback6B = 0.7 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 800, BRIDGE6_DIR = 1 : Feedback6A = 0.8 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 800, BRIDGE6_DIR = 2 : Feedback6B = 0.8 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 900, BRIDGE6_DIR = 1 : Feedback6A = 0.9 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 900, BRIDGE6_DIR = 2 : Feedback6B = 0.9 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 1000, BRIDGE6_DIR = 1 : Feedback6A = 1.0 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 1000, BRIDGE6_DIR = 2 : Feedback6B = 1.0 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 1100, BRIDGE6_DIR = 1 : Feedback6A = 1.1 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 1100, BRIDGE6_DIR = 2 : Feedback6B = 1.1 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 1200, BRIDGE6_DIR = 1 : Feedback6A = 1.2 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 1200, BRIDGE6_DIR = 2 : Feedback6B = 1.2 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 1300, BRIDGE6_DIR = 1 : Feedback6A = 1.3 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 1300, BRIDGE6_DIR = 2 : Feedback6B = 1.3 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 1400, BRIDGE6_DIR = 1 : Feedback6A = 1.4 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 1400, BRIDGE6_DIR = 2 : Feedback6B = 1.4 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 1500, BRIDGE6_DIR = 1 : Feedback6A = 1.5 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 1500, BRIDGE6_DIR = 2 : Feedback6B = 1.5 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 1600, BRIDGE6_DIR = 1 : Feedback6A = 1.6 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 1600, BRIDGE6_DIR = 2 : Feedback6B = 1.6 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 1700, BRIDGE6_DIR = 1 : Feedback6A = 1.7 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 1700, BRIDGE6_DIR = 2 : Feedback6B = 1.7 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 1800, BRIDGE6_DIR = 1 : Feedback6A = 1.8 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 1800, BRIDGE6_DIR = 2 : Feedback6B = 1.8 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 1900, BRIDGE6_DIR = 1 : Feedback6A = 1.9 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 1900, BRIDGE6_DIR = 2 : Feedback6B = 1.9 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 2000, BRIDGE6_DIR = 1 : Feedback6A = 2.0 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 2000, BRIDGE6_DIR = 2 : Feedback6B = 2.0 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 2100, BRIDGE6_DIR = 1 : Feedback6A = 2.1 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 2100, BRIDGE6_DIR = 2 : Feedback6B = 2.1 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 2200, BRIDGE6_DIR = 1 : Feedback6A = 2.2 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 2200, BRIDGE6_DIR = 2 : Feedback6B = 2.2 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 2300, BRIDGE6_DIR = 1 : Feedback6A = 2.3 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 2300, BRIDGE6_DIR = 2 : Feedback6B = 2.3 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 2400, BRIDGE6_DIR = 1 : Feedback6A = 2.4 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 2400, BRIDGE6_DIR = 2 : Feedback6B = 2.4 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 2500, BRIDGE6_DIR = 1 : Feedback6A = 2.5 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 2500, BRIDGE6_DIR = 2 : Feedback6B = 2.5 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_6A = 2600, BRIDGE6_DIR = 1 : Feedback6A = 2.6 | 0.1 | 0.5
Command = 81, PWM_CTRL_6A = 2600, BRIDGE6_DIR = 2 : Feedback6B = 2.6 | 0.1 | 0.5
#turn off output
PWM_CTRL_6A = 0 : NULL : WAIT = 1
#prompt user to switch
PAUSE-please verify load connection
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1

#turn on output
Command = 81, PWM_CTRL_7A = 0, BRIDGE7_DIR = 1 : Feedback7A = 0.0 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 0, BRIDGE7_DIR = 2 : Feedback7B = 0.0 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 100, BRIDGE7_DIR = 1 : Feedback7A = 0.1 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 100, BRIDGE7_DIR = 2 : Feedback7B = 0.1 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 200, BRIDGE7_DIR = 1 : Feedback7A = 0.2 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 200, BRIDGE7_DIR = 2 : Feedback7B = 0.2 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 300, BRIDGE7_DIR = 1 : Feedback7A = 0.3 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 300, BRIDGE7_DIR = 2 : Feedback7B = 0.3 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 400, BRIDGE7_DIR = 1 : Feedback7A = 0.4 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 400, BRIDGE7_DIR = 2 : Feedback7B = 0.4 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 500, BRIDGE7_DIR = 1 : Feedback7A = 0.5 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 500, BRIDGE7_DIR = 2 : Feedback7B = 0.5 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 600, BRIDGE7_DIR = 1 : Feedback7A = 0.6 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 600, BRIDGE7_DIR = 2 : Feedback7B = 0.6 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 700, BRIDGE7_DIR = 1 : Feedback7A = 0.7 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 700, BRIDGE7_DIR = 2 : Feedback7B = 0.7 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 800, BRIDGE7_DIR = 1 : Feedback7A = 0.8 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 800, BRIDGE7_DIR = 2 : Feedback7B = 0.8 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 900, BRIDGE7_DIR = 1 : Feedback7A = 0.9 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 900, BRIDGE7_DIR = 2 : Feedback7B = 0.9 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 1000, BRIDGE7_DIR = 1 : Feedback7A = 1.0 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 1000, BRIDGE7_DIR = 2 : Feedback7B = 1.0 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 1100, BRIDGE7_DIR = 1 : Feedback7A = 1.1 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 1100, BRIDGE7_DIR = 2 : Feedback7B = 1.1 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 1200, BRIDGE7_DIR = 1 : Feedback7A = 1.2 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 1200, BRIDGE7_DIR = 2 : Feedback7B = 1.2 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 1300, BRIDGE7_DIR = 1 : Feedback7A = 1.3 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 1300, BRIDGE7_DIR = 2 : Feedback7B = 1.3 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 1400, BRIDGE7_DIR = 1 : Feedback7A = 1.4 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 1400, BRIDGE7_DIR = 2 : Feedback7B = 1.4 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 1500, BRIDGE7_DIR = 1 : Feedback7A = 1.5 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 1500, BRIDGE7_DIR = 2 : Feedback7B = 1.5 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 1600, BRIDGE7_DIR = 1 : Feedback7A = 1.6 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 1600, BRIDGE7_DIR = 2 : Feedback7B = 1.6 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 1700, BRIDGE7_DIR = 1 : Feedback7A = 1.7 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 1700, BRIDGE7_DIR = 2 : Feedback7B = 1.7 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 1800, BRIDGE7_DIR = 1 : Feedback7A = 1.8 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 1800, BRIDGE7_DIR = 2 : Feedback7B = 1.8 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 1900, BRIDGE7_DIR = 1 : Feedback7A = 1.9 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 1900, BRIDGE7_DIR = 2 : Feedback7B = 1.9 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 2000, BRIDGE7_DIR = 1 : Feedback7A = 2.0 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 2000, BRIDGE7_DIR = 2 : Feedback7B = 2.0 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 2100, BRIDGE7_DIR = 1 : Feedback7A = 2.1 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 2100, BRIDGE7_DIR = 2 : Feedback7B = 2.1 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 2200, BRIDGE7_DIR = 1 : Feedback7A = 2.2 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 2200, BRIDGE7_DIR = 2 : Feedback7B = 2.2 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 2300, BRIDGE7_DIR = 1 : Feedback7A = 2.3 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 2300, BRIDGE7_DIR = 2 : Feedback7B = 2.3 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 2400, BRIDGE7_DIR = 1 : Feedback7A = 2.4 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 2400, BRIDGE7_DIR = 2 : Feedback7B = 2.4 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 2500, BRIDGE7_DIR = 1 : Feedback7A = 2.5 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 2500, BRIDGE7_DIR = 2 : Feedback7B = 2.5 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_7A = 2600, BRIDGE7_DIR = 1 : Feedback7A = 2.6 | 0.1 | 0.5
Command = 81, PWM_CTRL_7A = 2600, BRIDGE7_DIR = 2 : Feedback7B = 2.6 | 0.1 | 0.5
#turn off output
PWM_CTRL_7A = 0 : NULL : WAIT = 1
#prompt user to switch
PAUSE-please verify load connection
J4_02 = 1, J4_03 = 1 : NULL : WAIT = 1

#turn on output
Command = 81, PWM_CTRL_8A = 0, BRIDGE8_DIR = 1 : Feedback8A = 0.0 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 0, BRIDGE8_DIR = 2 : Feedback8B = 0.0 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 100, BRIDGE8_DIR = 1 : Feedback8A = 0.1 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 100, BRIDGE8_DIR = 2 : Feedback8B = 0.1 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 200, BRIDGE8_DIR = 1 : Feedback8A = 0.2 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 200, BRIDGE8_DIR = 2 : Feedback8B = 0.2 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 300, BRIDGE8_DIR = 1 : Feedback8A = 0.3 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 300, BRIDGE8_DIR = 2 : Feedback8B = 0.3 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 400, BRIDGE8_DIR = 1 : Feedback8A = 0.4 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 400, BRIDGE8_DIR = 2 : Feedback8B = 0.4 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 500, BRIDGE8_DIR = 1 : Feedback8A = 0.5 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 500, BRIDGE8_DIR = 2 : Feedback8B = 0.5 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 600, BRIDGE8_DIR = 1 : Feedback8A = 0.6 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 600, BRIDGE8_DIR = 2 : Feedback8B = 0.6 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 700, BRIDGE8_DIR = 1 : Feedback8A = 0.7 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 700, BRIDGE8_DIR = 2 : Feedback8B = 0.7 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 800, BRIDGE8_DIR = 1 : Feedback8A = 0.8 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 800, BRIDGE8_DIR = 2 : Feedback8B = 0.8 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 900, BRIDGE8_DIR = 1 : Feedback8A = 0.9 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 900, BRIDGE8_DIR = 2 : Feedback8B = 0.9 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 1000, BRIDGE8_DIR = 1 : Feedback8A = 1.0 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 1000, BRIDGE8_DIR = 2 : Feedback8B = 1.0 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 1100, BRIDGE8_DIR = 1 : Feedback8A = 1.1 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 1100, BRIDGE8_DIR = 2 : Feedback8B = 1.1 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 1200, BRIDGE8_DIR = 1 : Feedback8A = 1.2 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 1200, BRIDGE8_DIR = 2 : Feedback8B = 1.2 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 1300, BRIDGE8_DIR = 1 : Feedback8A = 1.3 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 1300, BRIDGE8_DIR = 2 : Feedback8B = 1.3 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 1400, BRIDGE8_DIR = 1 : Feedback8A = 1.4 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 1400, BRIDGE8_DIR = 2 : Feedback8B = 1.4 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 1500, BRIDGE8_DIR = 1 : Feedback8A = 1.5 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 1500, BRIDGE8_DIR = 2 : Feedback8B = 1.5 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 1600, BRIDGE8_DIR = 1 : Feedback8A = 1.6 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 1600, BRIDGE8_DIR = 2 : Feedback8B = 1.6 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 1700, BRIDGE8_DIR = 1 : Feedback8A = 1.7 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 1700, BRIDGE8_DIR = 2 : Feedback8B = 1.7 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 1800, BRIDGE8_DIR = 1 : Feedback8A = 1.8 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 1800, BRIDGE8_DIR = 2 : Feedback8B = 1.8 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 1900, BRIDGE8_DIR = 1 : Feedback8A = 1.9 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 1900, BRIDGE8_DIR = 2 : Feedback8B = 1.9 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 2000, BRIDGE8_DIR = 1 : Feedback8A = 2.0 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 2000, BRIDGE8_DIR = 2 : Feedback8B = 2.0 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 2100, BRIDGE8_DIR = 1 : Feedback8A = 2.1 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 2100, BRIDGE8_DIR = 2 : Feedback8B = 2.1 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 2200, BRIDGE8_DIR = 1 : Feedback8A = 2.2 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 2200, BRIDGE8_DIR = 2 : Feedback8B = 2.2 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 2300, BRIDGE8_DIR = 1 : Feedback8A = 2.3 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 2300, BRIDGE8_DIR = 2 : Feedback8B = 2.3 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 2400, BRIDGE8_DIR = 1 : Feedback8A = 2.4 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 2400, BRIDGE8_DIR = 2 : Feedback8B = 2.4 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 2500, BRIDGE8_DIR = 1 : Feedback8A = 2.5 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 2500, BRIDGE8_DIR = 2 : Feedback8B = 2.5 | 0.1 | 0.5
#turn on output
Command = 81, PWM_CTRL_8A = 2600, BRIDGE8_DIR = 1 : Feedback8A = 2.6 | 0.1 | 0.5
Command = 81, PWM_CTRL_8A = 2600, BRIDGE8_DIR = 2 : Feedback8B = 2.6 | 0.1 | 0.5
#turn off output
PWM_CTRL_8A = 0 : NULL : WAIT = 1
SAVE
END
