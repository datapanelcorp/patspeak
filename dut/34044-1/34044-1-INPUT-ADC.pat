#34044-1
#Verion 0.0
#input test
UUT_DBC = 34044-561.dbc
UUT_DATANAME = 34044-1-INPUT-ADC

#-----setup 34044-----
Command = 93, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL

#-----setup pat-----
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
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1

J4_03 = 1 : NULL : WAIT = 0.2
NULL : Input_5B = 0 | 0.1 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 4, MODE6A = 0, MODE6B = 4, MODE7A = 0, MODE7B = 4 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 4 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 1 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Input_5B from 1 to 5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 1 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 1.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 2.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 2.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 3.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 3.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 4.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 4.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 5.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 5.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0 | 0.1 | 0.1
NULL : Input_5B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.1

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 4, MODE6A = 0, MODE6B = 4, MODE7A = 0, MODE7B = 4 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 4 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 1 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_12 = 1 : NULL : WAIT = 0.1


#Sweep of Input_6B from 1 to 5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 1 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 1.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 2.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 2.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 3.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 3.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 4.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 4.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 5.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 5.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0 | 0.1 | 0.1
NULL : Input_6B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_12 = 0 : NULL : WAIT = 0.1

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 4, MODE6A = 0, MODE6B = 4, MODE7A = 0, MODE7B = 4 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 4 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 1 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J3_02 = 1 : NULL : WAIT = 0.1


#Sweep of Input_7B from 1 to 5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 1 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 1.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 2.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 2.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 3.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 3.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 4.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 4.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 5.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 5.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0 | 0.1 | 0.1
NULL : Input_7B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J3_02 = 0 : NULL : WAIT = 0.1

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 4, MODE6A = 0, MODE6B = 4, MODE7A = 0, MODE7B = 4 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 4 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 1 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J3_04 = 1 : NULL : WAIT = 0.1


#Sweep of Input_8B from 1 to 5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 1 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 1.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 2.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 2.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 3.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 3.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 4.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 4.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 5.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 5.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0 | 0.1 | 0.1
NULL : Input_8B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J3_04 = 0 : NULL : WAIT = 0.1


#Finished with mode
#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 5, MODE6A = 0, MODE6B = 5, MODE7A = 0, MODE7B = 5 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 5 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 1 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Input_5B from 1 to 10 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 1 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 1.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 2.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 2.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 3.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 3.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 4.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 4.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 5.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 5.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 6.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 6.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 7.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 7.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 8.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 8.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 9.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 9.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 10.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 10.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 11.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0 | 0.1 | 0.1
NULL : Input_5B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.1

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 5, MODE6A = 0, MODE6B = 5, MODE7A = 0, MODE7B = 5 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 5 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 1 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_12 = 1 : NULL : WAIT = 0.1


#Sweep of Input_6B from 1 to 10 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 1 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 1.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 2.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 2.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 3.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 3.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 4.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 4.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 5.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 5.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 6.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 6.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 7.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 7.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 8.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 8.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 9.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 9.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 10.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 10.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 11.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0 | 0.1 | 0.1
NULL : Input_6B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_12 = 0 : NULL : WAIT = 0.1

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 5, MODE6A = 0, MODE6B = 5, MODE7A = 0, MODE7B = 5 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 5 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 1 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J3_02 = 1 : NULL : WAIT = 0.1


#Sweep of Input_7B from 1 to 10 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 1 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 1.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 2.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 2.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 3.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 3.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 4.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 4.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 5.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 5.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 6.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 6.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 7.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 7.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 8.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 8.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 9.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 9.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 10.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 10.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 11.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0 | 0.1 | 0.1
NULL : Input_7B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J3_02 = 0 : NULL : WAIT = 0.1

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 5, MODE6A = 0, MODE6B = 5, MODE7A = 0, MODE7B = 5 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 5 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 1 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J3_04 = 1 : NULL : WAIT = 0.1


#Sweep of Input_8B from 1 to 10 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 1 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 1.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 2.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 2.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 3.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 3.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 4.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 4.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 5.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 5.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 6.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 6.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 7.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 7.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 8.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 8.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 9.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 9.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 10.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 10.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 11.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0 | 0.1 | 0.1
NULL : Input_8B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J3_04 = 0 : NULL : WAIT = 0.1


#Finished with mode
#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 6, MODE6A = 0, MODE6B = 6, MODE7A = 0, MODE7B = 6 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 6 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 1 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Input_5B from 1 to 32 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 1 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 1.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 2.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 2.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 3.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 3.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 4.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 4.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 5.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 5.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 6.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 6.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 7.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 7.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 8.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 8.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 9.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 9.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 10.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 10.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 11.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 11.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 12.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 12.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 13.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 13.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 14.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 14.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 15.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 15.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 16.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 16.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 17.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 17.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 18.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 18.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 19.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 19.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 20.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 20.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 21.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 21.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 22.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 22.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 23.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 23.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 24.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 24.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 25.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 25.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 26.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 26.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 27.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 27.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 28.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 28.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 29.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 29.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 30.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 30.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 31.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 31.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 32.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 32.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 33.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 33.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 34.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 34.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 35.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 35.5 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 36.0 | 0.155 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0 | 0.1 | 0.1
NULL : Input_5B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0 | 0.1 | 0.1
NULL : Input_5B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.1

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 6, MODE6A = 0, MODE6B = 6, MODE7A = 0, MODE7B = 6 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 6 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 1 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_12 = 1 : NULL : WAIT = 0.1


#Sweep of Input_6B from 1 to 32 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 1 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 1.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 2.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 2.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 3.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 3.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 4.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 4.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 5.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 5.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 6.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 6.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 7.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 7.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 8.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 8.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 9.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 9.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 10.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 10.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 11.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 11.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 12.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 12.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 13.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 13.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 14.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 14.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 15.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 15.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 16.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 16.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 17.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 17.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 18.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 18.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 19.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 19.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 20.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 20.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 21.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 21.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 22.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 22.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 23.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 23.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 24.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 24.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 25.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 25.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 26.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 26.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 27.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 27.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 28.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 28.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 29.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 29.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 30.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 30.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 31.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 31.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 32.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 32.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 33.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 33.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 34.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 34.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 35.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 35.5 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 36.0 | 0.155 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0 | 0.1 | 0.1
NULL : Input_6B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0 | 0.1 | 0.1
NULL : Input_6B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_12 = 0 : NULL : WAIT = 0.1

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 6, MODE6A = 0, MODE6B = 6, MODE7A = 0, MODE7B = 6 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 6 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 1 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J3_02 = 1 : NULL : WAIT = 0.1


#Sweep of Input_7B from 1 to 32 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 1 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 1.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 2.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 2.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 3.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 3.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 4.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 4.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 5.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 5.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 6.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 6.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 7.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 7.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 8.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 8.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 9.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 9.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 10.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 10.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 11.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 11.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 12.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 12.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 13.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 13.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 14.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 14.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 15.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 15.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 16.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 16.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 17.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 17.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 18.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 18.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 19.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 19.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 20.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 20.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 21.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 21.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 22.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 22.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 23.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 23.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 24.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 24.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 25.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 25.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 26.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 26.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 27.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 27.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 28.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 28.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 29.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 29.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 30.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 30.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 31.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 31.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 32.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 32.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 33.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 33.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 34.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 34.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 35.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 35.5 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 36.0 | 0.155 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0 | 0.1 | 0.1
NULL : Input_7B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0 | 0.1 | 0.1
NULL : Input_7B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J3_02 = 0 : NULL : WAIT = 0.1

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 6, MODE6A = 0, MODE6B = 6, MODE7A = 0, MODE7B = 6 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 6 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 1 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J3_04 = 1 : NULL : WAIT = 0.1


#Sweep of Input_8B from 1 to 32 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 1 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 1.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 2.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 2.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 3.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 3.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 4.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 4.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 5.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 5.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 6.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 6.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 7.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 7.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 8.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 8.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 9.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 9.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 10.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 10.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 11.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 11.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 12.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 12.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 13.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 13.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 14.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 14.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 15.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 15.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 16.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 16.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 17.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 17.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 18.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 18.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 19.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 19.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 20.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 20.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 21.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 21.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 22.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 22.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 23.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 23.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 24.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 24.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 25.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 25.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 26.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 26.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 27.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 27.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 28.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 28.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 29.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 29.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 30.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 30.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 31.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 31.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 32.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 32.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 33.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 33.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 34.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 34.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 35.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 35.5 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 36.0 | 0.155 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0 | 0.1 | 0.1
NULL : Input_8B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0 | 0.1 | 0.1
NULL : Input_8B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J3_04 = 0 : NULL : WAIT = 0.1


#Finished with mode
#switch out load line, set current
J3_04 = 0 : NULL : WAIT = 0.1
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
#tear down PS1
PwrSetCurrent = 0 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 0 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1
PwrRemote = 0 : NULL : WAIT = 0.1
NULL : Input_5B = 2 | 0.1 | 0.1
NULL : Input_6B = 2 | 0.1 | 0.1
NULL : Input_7B = 2 | 0.1 | 0.1
NULL : Input_8B = 2 | 0.1 | 0.1
J4_03 = 0 : NULL : WAIT = 0.2
SAVE
END
