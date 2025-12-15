#34044-1
#Verion 0.0
#input test
UUT_DBC = 34044-561.dbc
UUT_DATANAME = 34044-1-INPUT-COUNT

#-----setup 34044-----
Command = 93, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
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
Command = 83, MODE1A = 3, MODE1B = 3, MODE2A = 3, MODE2B = 3, MODE3A = 3, MODE3B = 3, MODE4A = 3, MODE4B = 3 : NULL : WAIT = 0.2
Command = 83, MODE5A = 8, MODE5B = 0, MODE6A = 8, MODE6B = 0, MODE7A = 8, MODE7B = 0 : NULL : WAIT = 0.2
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL : WAIT = 0.2
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL : WAIT = 0.2

Command = 84, MODE8A = 8, MODE8B = 0 : NULL : WAIT = 0.2
Command = 0, MODE8A = 0, MODE8B = 0 : NULL

Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL

Command = 87, Counter_7A_Reset = 1, Counter_8A_Reset = 1, Counter_7A_ON_OFF = 1, Counter_8A_ON_OFF = 1, LowBYTE_Counter_7A_Setpoint = 0, LowBYTE_Counter_8A_Setpoint = 0 : NULL : WAIT = 0.2
Command = 87, Counter_7A_Enable_Overflow = 1, Counter_8A_Enable_Overflow = 0 : NULL : WAIT = 0.2
Command = 87, Counter_7A_Enable_OUT3A = 0, Counter_8A_Enable_OUT4A = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, Counter_7A_Reset = 0, Counter_8A_Reset = 0, Counter_7A_ON_OFF = 0, Counter_8A_ON_OFF = 0, LowBYTE_Counter_7A_Setpoint = 0, LowBYTE_Counter_8A_Setpoint = 0 : NULL
Command = 0, Counter_7A_Enable_OUT3A = 0, Counter_8A_Enable_OUT4A = 0, Counter_7A_Enable_Overflow = 0, Counter_8A_Enable_Overflow = 0 : NULL

#verify setpoint
NULL : DutyCycle_SP_Input7A = 0 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL : WAIT = 1
#switch in input
J3_01 = 1 : NULL : WAIT = 0.2

#testing count events
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 1 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 2 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 3 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 4 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 5 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 6 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 7 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 8 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 9 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 10 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 11 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 12 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 13 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 14 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 15 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 16 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 17 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 18 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 19 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 20 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input7A = 21 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_7A = 0 | 0 | 0.1

#switch out input
J3_01 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#turn off output and switch out is off
PWM_CTRL_3A = 0 : NULL : WAIT = 0.2
#disable counter
Command = 87, Counter_7A_ON_OFF = 1 : NULL : WAIT = 0.2
Command = 0, Counter_7A_ON_OFF = 0 : NULL
#verify count
NULL : Hertz_Count_Input7A = 21 | 0 | 0.1
#send counter reset
Command = 87, Counter_7A_Reset = 1 : NULL : WAIT = 0.2
Command = 0, Counter_7A_Reset = 0 : NULL
#verify count reset
NULL : Hertz_Count_Input7A = 0 | 0 | 0.1

#-----setup 34044-----
#configure Port Modes
Command = 83, MODE1A = 3, MODE1B = 3, MODE2A = 3, MODE2B = 3, MODE3A = 3, MODE3B = 3, MODE4A = 3, MODE4B = 3 : NULL : WAIT = 0.2
Command = 83, MODE5A = 8, MODE5B = 0, MODE6A = 8, MODE6B = 0, MODE7A = 8, MODE7B = 0 : NULL : WAIT = 0.2
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL : WAIT = 0.2
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL : WAIT = 0.2

Command = 84, MODE8A = 8, MODE8B = 0 : NULL : WAIT = 0.2
Command = 0, MODE8A = 0, MODE8B = 0 : NULL

Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL

Command = 87, Counter_7A_Reset = 1, Counter_8A_Reset = 1, Counter_7A_ON_OFF = 1, Counter_8A_ON_OFF = 1, LowBYTE_Counter_7A_Setpoint = 0, LowBYTE_Counter_8A_Setpoint = 0 : NULL : WAIT = 0.2
Command = 87, Counter_7A_Enable_Overflow = 0, Counter_8A_Enable_Overflow = 1 : NULL : WAIT = 0.2
Command = 87, Counter_7A_Enable_OUT3A = 0, Counter_8A_Enable_OUT4A = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, Counter_7A_Reset = 0, Counter_8A_Reset = 0, Counter_7A_ON_OFF = 0, Counter_8A_ON_OFF = 0, LowBYTE_Counter_7A_Setpoint = 0, LowBYTE_Counter_8A_Setpoint = 0 : NULL
Command = 0, Counter_7A_Enable_OUT3A = 0, Counter_8A_Enable_OUT4A = 0, Counter_7A_Enable_Overflow = 0, Counter_8A_Enable_Overflow = 0 : NULL

#verify setpoint
NULL : DutyCycle_SP_Input8A = 0 | 0 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 140 : NULL : WAIT = 1
#switch in input
J3_03 = 1 : NULL : WAIT = 0.2

#testing count events
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 1 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 2 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 3 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 4 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 5 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 6 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 7 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 8 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 9 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 10 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 11 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 12 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 13 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 14 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 15 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 16 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 17 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 18 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 19 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 20 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input8A = 21 | 0 | 0.1
PwrSetVoltage = 140 : NULL
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
NULL : Input_8A = 0 | 0 | 0.1

#switch out input
J3_03 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#turn off output and switch out is off
PWM_CTRL_4A = 0 : NULL : WAIT = 0.2
#disable counter
Command = 87, Counter_8A_ON_OFF = 1 : NULL : WAIT = 0.2
Command = 0, Counter_8A_ON_OFF = 0 : NULL
#verify count
NULL : Hertz_Count_Input8A = 21 | 0 | 0.1
#send counter reset
Command = 87, Counter_8A_Reset = 1 : NULL : WAIT = 0.2
Command = 0, Counter_8A_Reset = 0 : NULL
#verify count reset
NULL : Hertz_Count_Input8A = 0 | 0 | 0.1

#switch out load line
J3_03 = 0 : NULL : WAIT = 0.1
#switch out power supply
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
#switch out scope
J4_03 = 1 : NULL : WAIT = 0.2
SAVE
END
