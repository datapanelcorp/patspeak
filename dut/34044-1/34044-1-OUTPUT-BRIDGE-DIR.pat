#34044-1
#Verion 0.0
UUT_DBC = 34044-561.dbc
#Digital h-bridge test with 4 Ohm resistive load. (3.62 amps @ 14.5 VDC)
UUT_DATANAME = 34044-1-OUTPUT-BRIDGE-DIR

#-----setup 34044-----
#disable global modes
#prompt user to switch
PAUSE-please verify load connection BRIDGE1_DIR
#configure to mode 0
Command = 83, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#configure to mode 1
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#turn on digtial A output
Command = 81, Output1A = 1, BRIDGE1_DIR = 1 : NULL
NULL : Feedback1A = 3.3 | 0.4 | 0.1
#turn off
Command = 81, Output1A = 0 : NULL : WAIT = 0.1
#turn on digtial B output
Command = 81, Output1B = 1, BRIDGE1_DIR = 2 : NULL
NULL : Feedback1B = 3.3 | 0.4 | 0.1
#turn off
Command = 81, Output1B = 0 : NULL : WAIT = 0.1
#configure to mode 2
Command = 83, MODE1A = 2, MODE1B = 2, MODE2A = 2, MODE2B = 2, MODE3A = 2, MODE3B = 2, MODE4A = 2, MODE4B = 2 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#test data at 25%, 50% and 100%
#turn on pwm data A output
PWM_CTRL_1A = 1000, BRIDGE1_DIR = 1 : NULL
NULL : Feedback1A = 0.8 | 0.4 | 0.1
#turn off
PWM_CTRL_1A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_1A = 1000, BRIDGE1_DIR = 2 : NULL
NULL : Feedback1B = 0.8 | 0.4 | 0.1
#turn off
PWM_CTRL_1A = 0 : NULL : WAIT = 0.1
#turn on pwm data A output
PWM_CTRL_1A = 2000, BRIDGE1_DIR = 1 : NULL
NULL : Feedback1A = 1.6 | 0.4 | 0.1
#turn off
PWM_CTRL_1A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_1A = 2000, BRIDGE1_DIR = 2 : NULL
NULL : Feedback1B = 1.6 | 0.4 | 0.1
#turn off
PWM_CTRL_1A = 0 : NULL : WAIT = 0.1
#turn on pwm data A output
PWM_CTRL_1A = 4000, BRIDGE1_DIR = 1 : NULL
NULL : Feedback1A = 3.3 | 0.4 | 0.1
#turn off
PWM_CTRL_1A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_1A = 4000, BRIDGE1_DIR = 2 : NULL
NULL : Feedback1B = 3.3 | 0.4 | 0.1
#turn off
PWM_CTRL_1A = 0 : NULL : WAIT = 0.1
#configure to mode 3
Command = 83, MODE1A = 3, MODE1B = 3, MODE2A = 3, MODE2B = 3, MODE3A = 3, MODE3B = 3, MODE4A = 3, MODE4B = 3 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#test percent at 25%, 50% and 100%
#turn on pwm percent A output
PWM_CTRL_1A = 250, BRIDGE1_DIR = 1 : NULL
NULL : Feedback1A = 0.8 | 0.4 | 0.1
#turn off
PWM_CTRL_1A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_1A = 250, BRIDGE1_DIR = 2 : NULL
NULL : Feedback1B = 0.8 | 0.4 | 0.1
#turn off
PWM_CTRL_1A = 0 : NULL : WAIT = 0.1
#turn on pwm percent A output
PWM_CTRL_1A = 500, BRIDGE1_DIR = 1 : NULL
NULL : Feedback1A = 1.6 | 0.4 | 0.1
#turn off
PWM_CTRL_1A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_1A = 500, BRIDGE1_DIR = 2 : NULL
NULL : Feedback1B = 1.6 | 0.4 | 0.1
#turn off
PWM_CTRL_1A = 0 : NULL : WAIT = 0.1
#turn on pwm percent A output
PWM_CTRL_1A = 1000, BRIDGE1_DIR = 1 : NULL
NULL : Feedback1A = 3.3 | 0.4 | 0.1
#turn off
PWM_CTRL_1A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_1A = 1000, BRIDGE1_DIR = 2 : NULL
NULL : Feedback1B = 3.3 | 0.4 | 0.1
#turn off
PWM_CTRL_1A = 0 : NULL : WAIT = 0.1
#configure to mode 4
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#test PWMi in 500ma increments
#turn on output
PWM_CTRL_1A = 0, BRIDGE1_DIR = 1 : Feedback1A = 0.0 | 0.155 | 0.2
PWM_CTRL_1A = 0, BRIDGE1_DIR = 2 : Feedback1B = 0.0 | 0.155 | 0.2
#turn on output
PWM_CTRL_1A = 500, BRIDGE1_DIR = 1 : Feedback1A = 0.5 | 0.155 | 0.2
PWM_CTRL_1A = 500, BRIDGE1_DIR = 2 : Feedback1B = 0.5 | 0.155 | 0.2
#turn on output
PWM_CTRL_1A = 1000, BRIDGE1_DIR = 1 : Feedback1A = 1.0 | 0.155 | 0.2
PWM_CTRL_1A = 1000, BRIDGE1_DIR = 2 : Feedback1B = 1.0 | 0.155 | 0.2
#turn on output
PWM_CTRL_1A = 1500, BRIDGE1_DIR = 1 : Feedback1A = 1.5 | 0.155 | 0.2
PWM_CTRL_1A = 1500, BRIDGE1_DIR = 2 : Feedback1B = 1.5 | 0.155 | 0.2
#turn on output
PWM_CTRL_1A = 2000, BRIDGE1_DIR = 1 : Feedback1A = 2.0 | 0.155 | 0.2
PWM_CTRL_1A = 2000, BRIDGE1_DIR = 2 : Feedback1B = 2.0 | 0.155 | 0.2
#turn on output
PWM_CTRL_1A = 2500, BRIDGE1_DIR = 1 : Feedback1A = 2.5 | 0.155 | 0.2
PWM_CTRL_1A = 2500, BRIDGE1_DIR = 2 : Feedback1B = 2.5 | 0.155 | 0.2
#turn on output
PWM_CTRL_1A = 3000, BRIDGE1_DIR = 1 : Feedback1A = 3.0 | 0.155 | 0.2
PWM_CTRL_1A = 3000, BRIDGE1_DIR = 2 : Feedback1B = 3.0 | 0.155 | 0.2
#turn on output
PWM_CTRL_1A = 3500, BRIDGE1_DIR = 1 : Feedback1A = 3.5 | 0.155 | 0.2
PWM_CTRL_1A = 3500, BRIDGE1_DIR = 2 : Feedback1B = 3.5 | 0.155 | 0.2
PWM_CTRL_1A = 0, BRIDGE1_DIR = 0 : NULL : WAIT = 0.1
#prompt user to switch
PAUSE-please verify load connection BRIDGE2_DIR
#configure to mode 0
Command = 83, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#configure to mode 1
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#turn on digtial A output
Command = 81, Output2A = 1, BRIDGE2_DIR = 1 : NULL
NULL : Feedback2A = 3.3 | 0.4 | 0.1
#turn off
Command = 81, Output2A = 0 : NULL : WAIT = 0.1
#turn on digtial B output
Command = 81, Output2B = 1, BRIDGE2_DIR = 2 : NULL
NULL : Feedback2B = 3.3 | 0.4 | 0.1
#turn off
Command = 81, Output2B = 0 : NULL : WAIT = 0.1
#configure to mode 2
Command = 83, MODE1A = 2, MODE1B = 2, MODE2A = 2, MODE2B = 2, MODE3A = 2, MODE3B = 2, MODE4A = 2, MODE4B = 2 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#test data at 25%, 50% and 100%
#turn on pwm data A output
PWM_CTRL_2A = 1000, BRIDGE2_DIR = 1 : NULL
NULL : Feedback2A = 0.8 | 0.4 | 0.1
#turn off
PWM_CTRL_2A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_2A = 1000, BRIDGE2_DIR = 2 : NULL
NULL : Feedback2B = 0.8 | 0.4 | 0.1
#turn off
PWM_CTRL_2A = 0 : NULL : WAIT = 0.1
#turn on pwm data A output
PWM_CTRL_2A = 2000, BRIDGE2_DIR = 1 : NULL
NULL : Feedback2A = 1.6 | 0.4 | 0.1
#turn off
PWM_CTRL_2A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_2A = 2000, BRIDGE2_DIR = 2 : NULL
NULL : Feedback2B = 1.6 | 0.4 | 0.1
#turn off
PWM_CTRL_2A = 0 : NULL : WAIT = 0.1
#turn on pwm data A output
PWM_CTRL_2A = 4000, BRIDGE2_DIR = 1 : NULL
NULL : Feedback2A = 3.3 | 0.4 | 0.1
#turn off
PWM_CTRL_2A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_2A = 4000, BRIDGE2_DIR = 2 : NULL
NULL : Feedback2B = 3.3 | 0.4 | 0.1
#turn off
PWM_CTRL_2A = 0 : NULL : WAIT = 0.1
#configure to mode 3
Command = 83, MODE1A = 3, MODE1B = 3, MODE2A = 3, MODE2B = 3, MODE3A = 3, MODE3B = 3, MODE4A = 3, MODE4B = 3 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#test percent at 25%, 50% and 100%
#turn on pwm percent A output
PWM_CTRL_2A = 250, BRIDGE2_DIR = 1 : NULL
NULL : Feedback2A = 0.8 | 0.4 | 0.1
#turn off
PWM_CTRL_2A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_2A = 250, BRIDGE2_DIR = 2 : NULL
NULL : Feedback2B = 0.8 | 0.4 | 0.1
#turn off
PWM_CTRL_2A = 0 : NULL : WAIT = 0.1
#turn on pwm percent A output
PWM_CTRL_2A = 500, BRIDGE2_DIR = 1 : NULL
NULL : Feedback2A = 1.6 | 0.4 | 0.1
#turn off
PWM_CTRL_2A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_2A = 500, BRIDGE2_DIR = 2 : NULL
NULL : Feedback2B = 1.6 | 0.4 | 0.1
#turn off
PWM_CTRL_2A = 0 : NULL : WAIT = 0.1
#turn on pwm percent A output
PWM_CTRL_2A = 1000, BRIDGE2_DIR = 1 : NULL
NULL : Feedback2A = 3.3 | 0.4 | 0.1
#turn off
PWM_CTRL_2A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_2A = 1000, BRIDGE2_DIR = 2 : NULL
NULL : Feedback2B = 3.3 | 0.4 | 0.1
#turn off
PWM_CTRL_2A = 0 : NULL : WAIT = 0.1
#configure to mode 4
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#test PWMi in 500ma increments
#turn on output
PWM_CTRL_2A = 0, BRIDGE2_DIR = 1 : Feedback2A = 0.0 | 0.155 | 0.2
PWM_CTRL_2A = 0, BRIDGE2_DIR = 2 : Feedback2B = 0.0 | 0.155 | 0.2
#turn on output
PWM_CTRL_2A = 500, BRIDGE2_DIR = 1 : Feedback2A = 0.5 | 0.155 | 0.2
PWM_CTRL_2A = 500, BRIDGE2_DIR = 2 : Feedback2B = 0.5 | 0.155 | 0.2
#turn on output
PWM_CTRL_2A = 1000, BRIDGE2_DIR = 1 : Feedback2A = 1.0 | 0.155 | 0.2
PWM_CTRL_2A = 1000, BRIDGE2_DIR = 2 : Feedback2B = 1.0 | 0.155 | 0.2
#turn on output
PWM_CTRL_2A = 1500, BRIDGE2_DIR = 1 : Feedback2A = 1.5 | 0.155 | 0.2
PWM_CTRL_2A = 1500, BRIDGE2_DIR = 2 : Feedback2B = 1.5 | 0.155 | 0.2
#turn on output
PWM_CTRL_2A = 2000, BRIDGE2_DIR = 1 : Feedback2A = 2.0 | 0.155 | 0.2
PWM_CTRL_2A = 2000, BRIDGE2_DIR = 2 : Feedback2B = 2.0 | 0.155 | 0.2
#turn on output
PWM_CTRL_2A = 2500, BRIDGE2_DIR = 1 : Feedback2A = 2.5 | 0.155 | 0.2
PWM_CTRL_2A = 2500, BRIDGE2_DIR = 2 : Feedback2B = 2.5 | 0.155 | 0.2
#turn on output
PWM_CTRL_2A = 3000, BRIDGE2_DIR = 1 : Feedback2A = 3.0 | 0.155 | 0.2
PWM_CTRL_2A = 3000, BRIDGE2_DIR = 2 : Feedback2B = 3.0 | 0.155 | 0.2
#turn on output
PWM_CTRL_2A = 3500, BRIDGE2_DIR = 1 : Feedback2A = 3.5 | 0.155 | 0.2
PWM_CTRL_2A = 3500, BRIDGE2_DIR = 2 : Feedback2B = 3.5 | 0.155 | 0.2
PWM_CTRL_2A = 0, BRIDGE2_DIR = 0 : NULL : WAIT = 0.1
#prompt user to switch
PAUSE-please verify load connection BRIDGE3_DIR
#configure to mode 0
Command = 83, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#configure to mode 1
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#turn on digtial A output
Command = 81, Output3A = 1, BRIDGE3_DIR = 1 : NULL
NULL : Feedback3A = 3.3 | 0.4 | 0.1
#turn off
Command = 81, Output3A = 0 : NULL : WAIT = 0.1
#turn on digtial B output
Command = 81, Output3B = 1, BRIDGE3_DIR = 2 : NULL
NULL : Feedback3B = 3.3 | 0.4 | 0.1
#turn off
Command = 81, Output3B = 0 : NULL : WAIT = 0.1
#configure to mode 2
Command = 83, MODE1A = 2, MODE1B = 2, MODE2A = 2, MODE2B = 2, MODE3A = 2, MODE3B = 2, MODE4A = 2, MODE4B = 2 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#test data at 25%, 50% and 100%
#turn on pwm data A output
PWM_CTRL_3A = 1000, BRIDGE3_DIR = 1 : NULL
NULL : Feedback3A = 0.8 | 0.4 | 0.1
#turn off
PWM_CTRL_3A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_3A = 1000, BRIDGE3_DIR = 2 : NULL
NULL : Feedback3B = 0.8 | 0.4 | 0.1
#turn off
PWM_CTRL_3A = 0 : NULL : WAIT = 0.1
#turn on pwm data A output
PWM_CTRL_3A = 2000, BRIDGE3_DIR = 1 : NULL
NULL : Feedback3A = 1.6 | 0.4 | 0.1
#turn off
PWM_CTRL_3A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_3A = 2000, BRIDGE3_DIR = 2 : NULL
NULL : Feedback3B = 1.6 | 0.4 | 0.1
#turn off
PWM_CTRL_3A = 0 : NULL : WAIT = 0.1
#turn on pwm data A output
PWM_CTRL_3A = 4000, BRIDGE3_DIR = 1 : NULL
NULL : Feedback3A = 3.3 | 0.4 | 0.1
#turn off
PWM_CTRL_3A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_3A = 4000, BRIDGE3_DIR = 2 : NULL
NULL : Feedback3B = 3.3 | 0.4 | 0.1
#turn off
PWM_CTRL_3A = 0 : NULL : WAIT = 0.1
#configure to mode 3
Command = 83, MODE1A = 3, MODE1B = 3, MODE2A = 3, MODE2B = 3, MODE3A = 3, MODE3B = 3, MODE4A = 3, MODE4B = 3 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#test percent at 25%, 50% and 100%
#turn on pwm percent A output
PWM_CTRL_3A = 250, BRIDGE3_DIR = 1 : NULL
NULL : Feedback3A = 0.8 | 0.4 | 0.1
#turn off
PWM_CTRL_3A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_3A = 250, BRIDGE3_DIR = 2 : NULL
NULL : Feedback3B = 0.8 | 0.4 | 0.1
#turn off
PWM_CTRL_3A = 0 : NULL : WAIT = 0.1
#turn on pwm percent A output
PWM_CTRL_3A = 500, BRIDGE3_DIR = 1 : NULL
NULL : Feedback3A = 1.6 | 0.4 | 0.1
#turn off
PWM_CTRL_3A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_3A = 500, BRIDGE3_DIR = 2 : NULL
NULL : Feedback3B = 1.6 | 0.4 | 0.1
#turn off
PWM_CTRL_3A = 0 : NULL : WAIT = 0.1
#turn on pwm percent A output
PWM_CTRL_3A = 1000, BRIDGE3_DIR = 1 : NULL
NULL : Feedback3A = 3.3 | 0.4 | 0.1
#turn off
PWM_CTRL_3A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_3A = 1000, BRIDGE3_DIR = 2 : NULL
NULL : Feedback3B = 3.3 | 0.4 | 0.1
#turn off
PWM_CTRL_3A = 0 : NULL : WAIT = 0.1
#configure to mode 4
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#test PWMi in 500ma increments
#turn on output
PWM_CTRL_3A = 0, BRIDGE3_DIR = 1 : Feedback3A = 0.0 | 0.155 | 0.2
PWM_CTRL_3A = 0, BRIDGE3_DIR = 2 : Feedback3B = 0.0 | 0.155 | 0.2
#turn on output
PWM_CTRL_3A = 500, BRIDGE3_DIR = 1 : Feedback3A = 0.5 | 0.155 | 0.2
PWM_CTRL_3A = 500, BRIDGE3_DIR = 2 : Feedback3B = 0.5 | 0.155 | 0.2
#turn on output
PWM_CTRL_3A = 1000, BRIDGE3_DIR = 1 : Feedback3A = 1.0 | 0.155 | 0.2
PWM_CTRL_3A = 1000, BRIDGE3_DIR = 2 : Feedback3B = 1.0 | 0.155 | 0.2
#turn on output
PWM_CTRL_3A = 1500, BRIDGE3_DIR = 1 : Feedback3A = 1.5 | 0.155 | 0.2
PWM_CTRL_3A = 1500, BRIDGE3_DIR = 2 : Feedback3B = 1.5 | 0.155 | 0.2
#turn on output
PWM_CTRL_3A = 2000, BRIDGE3_DIR = 1 : Feedback3A = 2.0 | 0.155 | 0.2
PWM_CTRL_3A = 2000, BRIDGE3_DIR = 2 : Feedback3B = 2.0 | 0.155 | 0.2
#turn on output
PWM_CTRL_3A = 2500, BRIDGE3_DIR = 1 : Feedback3A = 2.5 | 0.155 | 0.2
PWM_CTRL_3A = 2500, BRIDGE3_DIR = 2 : Feedback3B = 2.5 | 0.155 | 0.2
#turn on output
PWM_CTRL_3A = 3000, BRIDGE3_DIR = 1 : Feedback3A = 3.0 | 0.155 | 0.2
PWM_CTRL_3A = 3000, BRIDGE3_DIR = 2 : Feedback3B = 3.0 | 0.155 | 0.2
#turn on output
PWM_CTRL_3A = 3500, BRIDGE3_DIR = 1 : Feedback3A = 3.5 | 0.155 | 0.2
PWM_CTRL_3A = 3500, BRIDGE3_DIR = 2 : Feedback3B = 3.5 | 0.155 | 0.2
PWM_CTRL_3A = 0, BRIDGE3_DIR = 0 : NULL : WAIT = 0.1
#prompt user to switch
PAUSE-please verify load connection BRIDGE4_DIR
#configure to mode 0
Command = 83, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#configure to mode 1
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#turn on digtial A output
Command = 81, Output4A = 1, BRIDGE4_DIR = 1 : NULL
NULL : Feedback4A = 3.3 | 0.4 | 0.1
#turn off
Command = 81, Output4A = 0 : NULL : WAIT = 0.1
#turn on digtial B output
Command = 81, Output4B = 1, BRIDGE4_DIR = 2 : NULL
NULL : Feedback4B = 3.3 | 0.4 | 0.1
#turn off
Command = 81, Output4B = 0 : NULL : WAIT = 0.1
#configure to mode 2
Command = 83, MODE1A = 2, MODE1B = 2, MODE2A = 2, MODE2B = 2, MODE3A = 2, MODE3B = 2, MODE4A = 2, MODE4B = 2 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#test data at 25%, 50% and 100%
#turn on pwm data A output
PWM_CTRL_4A = 1000, BRIDGE4_DIR = 1 : NULL
NULL : Feedback4A = 0.8 | 0.4 | 0.1
#turn off
PWM_CTRL_4A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_4A = 1000, BRIDGE4_DIR = 2 : NULL
NULL : Feedback4B = 0.8 | 0.4 | 0.1
#turn off
PWM_CTRL_4A = 0 : NULL : WAIT = 0.1
#turn on pwm data A output
PWM_CTRL_4A = 2000, BRIDGE4_DIR = 1 : NULL
NULL : Feedback4A = 1.6 | 0.4 | 0.1
#turn off
PWM_CTRL_4A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_4A = 2000, BRIDGE4_DIR = 2 : NULL
NULL : Feedback4B = 1.6 | 0.4 | 0.1
#turn off
PWM_CTRL_4A = 0 : NULL : WAIT = 0.1
#turn on pwm data A output
PWM_CTRL_4A = 4000, BRIDGE4_DIR = 1 : NULL
NULL : Feedback4A = 3.3 | 0.4 | 0.1
#turn off
PWM_CTRL_4A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_4A = 4000, BRIDGE4_DIR = 2 : NULL
NULL : Feedback4B = 3.3 | 0.4 | 0.1
#turn off
PWM_CTRL_4A = 0 : NULL : WAIT = 0.1
#configure to mode 3
Command = 83, MODE1A = 3, MODE1B = 3, MODE2A = 3, MODE2B = 3, MODE3A = 3, MODE3B = 3, MODE4A = 3, MODE4B = 3 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#test percent at 25%, 50% and 100%
#turn on pwm percent A output
PWM_CTRL_4A = 250, BRIDGE4_DIR = 1 : NULL
NULL : Feedback4A = 0.8 | 0.4 | 0.1
#turn off
PWM_CTRL_4A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_4A = 250, BRIDGE4_DIR = 2 : NULL
NULL : Feedback4B = 0.8 | 0.4 | 0.1
#turn off
PWM_CTRL_4A = 0 : NULL : WAIT = 0.1
#turn on pwm percent A output
PWM_CTRL_4A = 500, BRIDGE4_DIR = 1 : NULL
NULL : Feedback4A = 1.6 | 0.4 | 0.1
#turn off
PWM_CTRL_4A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_4A = 500, BRIDGE4_DIR = 2 : NULL
NULL : Feedback4B = 1.6 | 0.4 | 0.1
#turn off
PWM_CTRL_4A = 0 : NULL : WAIT = 0.1
#turn on pwm percent A output
PWM_CTRL_4A = 1000, BRIDGE4_DIR = 1 : NULL
NULL : Feedback4A = 3.3 | 0.4 | 0.1
#turn off
PWM_CTRL_4A = 0 : NULL : WAIT = 0.1
#turn on pwm data B output
PWM_CTRL_4A = 1000, BRIDGE4_DIR = 2 : NULL
NULL : Feedback4B = 3.3 | 0.4 | 0.1
#turn off
PWM_CTRL_4A = 0 : NULL : WAIT = 0.1
#configure to mode 4
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.1
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 84, Port1A_Kp = 20.0, Port1A_Ki = 10.0, Port1B_Kp = 20.0, Port1B_Ki = 10.0, Port2A_Kp = 20.0, Port2A_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL
Command = 85, Port2B_Kp = 20.0, Port2B_Ki = 10.0, Port3A_Kp = 20.0, Port3A_Ki = 10.0, Port3B_Kp = 20.0, Port3B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL
Command = 86, Port4A_Kp = 20.0, Port4A_Ki = 10.0, Port4B_Kp = 20.0, Port4B_Ki = 10.0 : NULL : WAIT = 0.1
Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2 : NULL : WAIT = 0.1
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
Command = 82, SaveSettings = 1, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1
Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#test PWMi in 500ma increments
#turn on output
PWM_CTRL_4A = 0, BRIDGE4_DIR = 1 : Feedback4A = 0.0 | 0.155 | 0.2
PWM_CTRL_4A = 0, BRIDGE4_DIR = 2 : Feedback4B = 0.0 | 0.155 | 0.2
#turn on output
PWM_CTRL_4A = 500, BRIDGE4_DIR = 1 : Feedback4A = 0.5 | 0.155 | 0.2
PWM_CTRL_4A = 500, BRIDGE4_DIR = 2 : Feedback4B = 0.5 | 0.155 | 0.2
#turn on output
PWM_CTRL_4A = 1000, BRIDGE4_DIR = 1 : Feedback4A = 1.0 | 0.155 | 0.2
PWM_CTRL_4A = 1000, BRIDGE4_DIR = 2 : Feedback4B = 1.0 | 0.155 | 0.2
#turn on output
PWM_CTRL_4A = 1500, BRIDGE4_DIR = 1 : Feedback4A = 1.5 | 0.155 | 0.2
PWM_CTRL_4A = 1500, BRIDGE4_DIR = 2 : Feedback4B = 1.5 | 0.155 | 0.2
#turn on output
PWM_CTRL_4A = 2000, BRIDGE4_DIR = 1 : Feedback4A = 2.0 | 0.155 | 0.2
PWM_CTRL_4A = 2000, BRIDGE4_DIR = 2 : Feedback4B = 2.0 | 0.155 | 0.2
#turn on output
PWM_CTRL_4A = 2500, BRIDGE4_DIR = 1 : Feedback4A = 2.5 | 0.155 | 0.2
PWM_CTRL_4A = 2500, BRIDGE4_DIR = 2 : Feedback4B = 2.5 | 0.155 | 0.2
#turn on output
PWM_CTRL_4A = 3000, BRIDGE4_DIR = 1 : Feedback4A = 3.0 | 0.155 | 0.2
PWM_CTRL_4A = 3000, BRIDGE4_DIR = 2 : Feedback4B = 3.0 | 0.155 | 0.2
#turn on output
PWM_CTRL_4A = 3500, BRIDGE4_DIR = 1 : Feedback4A = 3.5 | 0.155 | 0.2
PWM_CTRL_4A = 3500, BRIDGE4_DIR = 2 : Feedback4B = 3.5 | 0.155 | 0.2
PWM_CTRL_4A = 0, BRIDGE4_DIR = 0 : NULL : WAIT = 0.1
SAVE
END
