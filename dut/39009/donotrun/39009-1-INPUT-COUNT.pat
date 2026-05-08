#39009-1
#Verion 0.0
#input test
UUT_DBC = 39009-561.dbc
UUT_DATANAME = 39009-1-INPUT-COUNT

#setup meter
LdRemote = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1

#setup PS1
PwrRemote = 1 : NULL : WAIT = 0.1
PwrSetCurrent = 20 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 1 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1

#switch in scope
J4_03 = 1 : NULL : WAIT = 0.2
#****** OVERFLOW, SET POINT = 0, MAX COUNT = 5, NO OUTPUT INTERLOCK
#-----setup 34044-----
#configure Port Modes
Command = 83, MODE1A = 8, MODE1B = 8, MODE2A = 3, MODE2B = 3, MODE3A = 8, MODE3B = 8, MODE4A = 3, MODE4B = 3 : NULL : WAIT = 0.2
Command = 83, MODE5A = 8, MODE5B = 8, MODE6A = 3, MODE6B = 3, MODE7A = 8, MODE7B = 8 : NULL : WAIT = 0.2
Command = 84, MODE8A = 3, MODE8B = 3, MODE9A = 8, MODE9B = 8, MODE10A = 3, MODE10B = 3, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL : WAIT = 0.2
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL : WAIT = 0.2
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL : WAIT = 0.5

Command = 84, MODE8A = 8, MODE8B = 0 : NULL : WAIT = 0.2
Command = 0, MODE8A = 0, MODE8B = 0 : NULL

Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL

Command = 87, Counter_1A_Reset = 1, Counter_1B_Reset = 1, Counter_1A_ON_OFF = 1, Counter_2B_ON_OFF = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, Counter_7A_Reset = 0, Counter_1B_Reset = 0, Counter_1A_ON_OFF = 0, Counter_1B_ON_OFF = 0 : NULL

#switch in test supply
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL : WAIT = 1
#switch in input
J2_01 = 1 : NULL : WAIT = 0.2

#testing count events
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 1 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 2 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 3 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 4 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 5 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 6 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 7 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 8 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 9 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 10 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 11 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 12 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 13 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 14 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 15 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 16 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 17 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 18 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 19 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 20 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1A = 21 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1A = 0 | 0 | 0.1

#switch out input
J2_01 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#turn off output and switch out is off
PWM_CTRL_3A = 0 : NULL : WAIT = 0.2
#disable counter
Command = 87, Counter_1A_ON_OFF = 1 : NULL : WAIT = 0.2
Command = 0, Counter_1A_ON_OFF = 0 : NULL
#verify count
NULL : Hertz_Count_Input1A = 21 | 0 | 0.1
#send counter reset
Command = 87, Counter_1A_Reset = 1 : NULL : WAIT = 0.2
Command = 0, Counter_1A_Reset = 0 : NULL
#verify count reset
NULL : Hertz_Count_Input1A = 0 | 0 | 0.1

#-----setup 34044-----
#configure Port Modes
Command = 83, MODE1A = 8, MODE1B = 8, MODE2A = 3, MODE2B = 3, MODE3A = 8, MODE3B = 8, MODE4A = 3, MODE4B = 3 : NULL : WAIT = 0.2
Command = 83, MODE5A = 8, MODE5B = 8, MODE6A = 3, MODE6B = 3, MODE7A = 8, MODE7B = 8 : NULL : WAIT = 0.2
Command = 84, MODE8A = 3, MODE8B = 3, MODE9A = 8, MODE9B = 8, MODE10A = 3, MODE10B = 3, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL : WAIT = 0.2
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL : WAIT = 0.2
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL : WAIT = 0.5

Command = 84, MODE8A = 8, MODE8B = 0 : NULL : WAIT = 0.2
Command = 0, MODE8A = 0, MODE8B = 0 : NULL

Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL

Command = 87, Counter_1A_Reset = 1, Counter_1B_Reset = 1, Counter_1A_ON_OFF = 1, Counter_2B_ON_OFF = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, Counter_7A_Reset = 0, Counter_1B_Reset = 0, Counter_1A_ON_OFF = 0, Counter_1B_ON_OFF = 0 : NULL

#switch in test supply
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL : WAIT = 1
#switch in input
J2_02 = 1 : NULL : WAIT = 0.2

#testing count events
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 1 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 2 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 3 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 4 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 5 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 6 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 7 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 8 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 9 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 10 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 11 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 12 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 13 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 14 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 15 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 16 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 17 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 18 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 19 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 20 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input1B = 21 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL
NULL : Input_1B = 0 | 0 | 0.1

#switch out input
J2_02 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#turn off output and switch out is off
PWM_CTRL_4A = 0 : NULL : WAIT = 0.2
#disable counter
Command = 87, Counter_1B_ON_OFF = 1 : NULL : WAIT = 0.2
Command = 0, Counter_1B_ON_OFF = 0 : NULL
#verify count
NULL : Hertz_Count_Input1B = 21 | 0 | 0.1
#send counter reset
Command = 87, Counter_1B_Reset = 1 : NULL : WAIT = 0.2
Command = 0, Counter_1B_Reset = 0 : NULL
#verify count reset
NULL : Hertz_Count_Input1B = 0 | 0 | 0.1

#switch out load line
J2_02 = 0 : NULL : WAIT = 0.1
#switch out scope
J4_03 = 1 : NULL : WAIT = 0.2
#switch out power supply
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
SAVE
END
