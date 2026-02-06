#43019-1
#Verion 0.0
#input test
UUT_DBC = 43019-560.dbc
UUT_DATANAME = 43019-1-INPUT-ALL


#-----setup pat-----
#setup meter
LdRemote = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1

#setup PS1
PwrRemote = 1 : NULL : WAIT = 0.1
PwrSetCurrent = 100 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 1 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1

J4_03 = 1 : NULL : WAIT = 0.2
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
#-----setup 43019-----
#configure as Outputs to 4 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A =4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_1A from 1 to 5 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_01 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 1 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 1.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 2.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 2.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 3.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 3.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 4.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 4.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 5.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 5.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL
#test power supply
NULL : MeterVolts = 6.1 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_01 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 4 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A =4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_1B from 1 to 5 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_02 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 1 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 1.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 2.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 2.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 3.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 3.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 4.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 4.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 5.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 5.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL
#test power supply
NULL : MeterVolts = 6.1 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_02 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 4 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A =4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_2A from 1 to 5 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_03 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 1 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 1.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 2.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 2.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 3.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 3.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 4.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 4.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 5.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 5.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 0 | 0.1 | 0.1
NULL : Input_2A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL
#test power supply
NULL : MeterVolts = 6.1 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 0 | 0.1 | 0.1
NULL : Input_2A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_03 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 4 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A =4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_2B from 1 to 5 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_04 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 1 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 1.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 2.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 2.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 3.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 3.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 4.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 4.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 5.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 5.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 0 | 0.1 | 0.1
NULL : Input_2B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL
#test power supply
NULL : MeterVolts = 6.1 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 0 | 0.1 | 0.1
NULL : Input_2B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_04 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 4 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A =4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_3A from 1 to 5 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 1 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 1.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 2.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 2.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 3.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 3.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 4.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 4.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 5.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 5.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL
#test power supply
NULL : MeterVolts = 6.1 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_05 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 4 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A =4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_3B from 1 to 5 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_06 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 1 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 1.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 2.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 2.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 3.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 3.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 4.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 4.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 5.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 5.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL
#test power supply
NULL : MeterVolts = 6.1 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_06 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 4 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A =4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_4A from 1 to 5 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 1 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 1.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 2.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 2.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 3.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 3.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 4.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 4.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 5.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 5.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 0 | 0.1 | 0.1
NULL : Input_4A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL
#test power supply
NULL : MeterVolts = 6.1 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 0 | 0.1 | 0.1
NULL : Input_4A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_07 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 4 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A =4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_4B from 1 to 5 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_08 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 1 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 1.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 2.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 2.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 3.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 3.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 4.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 4.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 5.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 5.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 0 | 0.1 | 0.1
NULL : Input_4B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL
#test power supply
NULL : MeterVolts = 6.1 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 0 | 0.1 | 0.1
NULL : Input_4B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_08 = 0 : NULL : WAIT = 0.1


#Finished with mode
#cycle IGN to clean slate
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1
#-----setup 43019-----
#configure as Outputs to 5 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 5, MODE1B = 5, MODE2A =5, MODE2B = 5, MODE3A = 5, MODE3B = 5, MODE4A = 5, MODE4B = 5 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_1A from 1 to 10 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_01 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 1 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 1.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 2.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 2.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 3.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 3.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 4.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 4.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 5.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 5.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 6.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 6.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 7.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 7.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 8.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 8.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 9.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 9.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 10.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 10.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 11.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 116 : NULL
#test power supply
NULL : MeterVolts = 11.6 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 117 : NULL
#test power supply
NULL : MeterVolts = 11.7 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_01 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 5 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 5, MODE1B = 5, MODE2A =5, MODE2B = 5, MODE3A = 5, MODE3B = 5, MODE4A = 5, MODE4B = 5 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_1B from 1 to 10 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_02 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 1 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 1.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 2.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 2.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 3.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 3.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 4.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 4.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 5.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 5.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 6.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 6.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 7.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 7.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 8.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 8.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 9.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 9.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 10.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 10.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 11.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 116 : NULL
#test power supply
NULL : MeterVolts = 11.6 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 117 : NULL
#test power supply
NULL : MeterVolts = 11.7 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_02 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 5 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 5, MODE1B = 5, MODE2A =5, MODE2B = 5, MODE3A = 5, MODE3B = 5, MODE4A = 5, MODE4B = 5 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_2A from 1 to 10 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_03 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 1 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 1.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 2.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 2.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 3.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 3.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 4.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 4.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 5.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 5.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 6.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 6.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 7.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 7.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 8.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 8.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 9.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 9.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 10.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 10.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 11.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 0 | 0.1 | 0.1
NULL : Input_2A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 116 : NULL
#test power supply
NULL : MeterVolts = 11.6 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 0 | 0.1 | 0.1
NULL : Input_2A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 117 : NULL
#test power supply
NULL : MeterVolts = 11.7 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 0 | 0.1 | 0.1
NULL : Input_2A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_03 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 5 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 5, MODE1B = 5, MODE2A =5, MODE2B = 5, MODE3A = 5, MODE3B = 5, MODE4A = 5, MODE4B = 5 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_2B from 1 to 10 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_04 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 1 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 1.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 2.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 2.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 3.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 3.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 4.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 4.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 5.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 5.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 6.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 6.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 7.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 7.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 8.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 8.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 9.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 9.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 10.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 10.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 11.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 0 | 0.1 | 0.1
NULL : Input_2B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 116 : NULL
#test power supply
NULL : MeterVolts = 11.6 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 0 | 0.1 | 0.1
NULL : Input_2B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 117 : NULL
#test power supply
NULL : MeterVolts = 11.7 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 0 | 0.1 | 0.1
NULL : Input_2B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_04 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 5 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 5, MODE1B = 5, MODE2A =5, MODE2B = 5, MODE3A = 5, MODE3B = 5, MODE4A = 5, MODE4B = 5 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_3A from 1 to 10 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 1 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 1.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 2.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 2.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 3.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 3.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 4.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 4.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 5.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 5.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 6.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 6.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 7.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 7.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 8.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 8.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 9.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 9.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 10.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 10.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 11.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 116 : NULL
#test power supply
NULL : MeterVolts = 11.6 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 117 : NULL
#test power supply
NULL : MeterVolts = 11.7 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_05 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 5 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 5, MODE1B = 5, MODE2A =5, MODE2B = 5, MODE3A = 5, MODE3B = 5, MODE4A = 5, MODE4B = 5 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_3B from 1 to 10 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_06 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 1 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 1.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 2.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 2.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 3.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 3.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 4.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 4.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 5.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 5.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 6.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 6.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 7.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 7.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 8.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 8.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 9.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 9.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 10.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 10.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 11.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 116 : NULL
#test power supply
NULL : MeterVolts = 11.6 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 117 : NULL
#test power supply
NULL : MeterVolts = 11.7 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_06 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 5 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 5, MODE1B = 5, MODE2A =5, MODE2B = 5, MODE3A = 5, MODE3B = 5, MODE4A = 5, MODE4B = 5 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_4A from 1 to 10 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 1 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 1.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 2.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 2.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 3.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 3.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 4.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 4.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 5.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 5.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 6.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 6.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 7.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 7.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 8.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 8.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 9.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 9.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 10.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 10.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 11.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 0 | 0.1 | 0.1
NULL : Input_4A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 116 : NULL
#test power supply
NULL : MeterVolts = 11.6 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 0 | 0.1 | 0.1
NULL : Input_4A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 117 : NULL
#test power supply
NULL : MeterVolts = 11.7 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 0 | 0.1 | 0.1
NULL : Input_4A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_07 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 5 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 5, MODE1B = 5, MODE2A =5, MODE2B = 5, MODE3A = 5, MODE3B = 5, MODE4A = 5, MODE4B = 5 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_4B from 1 to 10 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_08 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 1 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 1.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 2.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 2.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 3.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 3.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 4.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 4.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 5.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 5.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 6.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 6.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 7.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 7.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 8.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 8.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 9.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 9.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 10.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 10.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 11.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 0 | 0.1 | 0.1
NULL : Input_4B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 116 : NULL
#test power supply
NULL : MeterVolts = 11.6 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 0 | 0.1 | 0.1
NULL : Input_4B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 117 : NULL
#test power supply
NULL : MeterVolts = 11.7 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 0 | 0.1 | 0.1
NULL : Input_4B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_08 = 0 : NULL : WAIT = 0.1


#Finished with mode
#cycle IGN to clean slate
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1
#-----setup 43019-----
#configure as Outputs to 6 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 6, MODE1B = 6, MODE2A =6, MODE2B = 6, MODE3A = 6, MODE3B = 6, MODE4A = 6, MODE4B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_1A from 1 to 32 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_01 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 1 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 1.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 2.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 2.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 3.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 3.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 4.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 4.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 5.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 5.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 6.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 6.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 7.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 7.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 8.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 8.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 9.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 9.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 10.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 10.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 11.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 11.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 12.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 12.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 13.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 13.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 14.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 14.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 15.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 15.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 16.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 16.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 17.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 17.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 18.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 18.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 19.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 19.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 20.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 20.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 21.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 21.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 22.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 22.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 23.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 23.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 24.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 24.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 25.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 25.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 26.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 26.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 27.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 27.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 28.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 28.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 29.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 29.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 30.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 30.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 31.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 31.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 32.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 32.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 33.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 33.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 34.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 34.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 35.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 35.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 36.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_01 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 6 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 6, MODE1B = 6, MODE2A =6, MODE2B = 6, MODE3A = 6, MODE3B = 6, MODE4A = 6, MODE4B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_1B from 1 to 32 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_02 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 1 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 1.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 2.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 2.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 3.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 3.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 4.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 4.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 5.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 5.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 6.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 6.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 7.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 7.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 8.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 8.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 9.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 9.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 10.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 10.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 11.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 11.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 12.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 12.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 13.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 13.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 14.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 14.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 15.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 15.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 16.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 16.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 17.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 17.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 18.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 18.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 19.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 19.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 20.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 20.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 21.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 21.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 22.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 22.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 23.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 23.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 24.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 24.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 25.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 25.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 26.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 26.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 27.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 27.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 28.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 28.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 29.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 29.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 30.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 30.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 31.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 31.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 32.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 32.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 33.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 33.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 34.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 34.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 35.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 35.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 36.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_02 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 6 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 6, MODE1B = 6, MODE2A =6, MODE2B = 6, MODE3A = 6, MODE3B = 6, MODE4A = 6, MODE4B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_2A from 1 to 32 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_03 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 1 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 1.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 2.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 2.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 3.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 3.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 4.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 4.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 5.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 5.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 6.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 6.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 7.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 7.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 8.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 8.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 9.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 9.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 10.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 10.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 11.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 11.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 12.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 12.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 13.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 13.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 14.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 14.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 15.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 15.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 16.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 16.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 17.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 17.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 18.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 18.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 19.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 19.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 20.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 20.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 21.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 21.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 22.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 22.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 23.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 23.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 24.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 24.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 25.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 25.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 26.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 26.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 27.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 27.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 28.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 28.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 29.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 29.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 30.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 30.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 31.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 31.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 32.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 32.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 33.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 33.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 34.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 34.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 35.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 35.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 36.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 0 | 0.1 | 0.1
NULL : Input_2A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 0 | 0.1 | 0.1
NULL : Input_2A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_03 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 6 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 6, MODE1B = 6, MODE2A =6, MODE2B = 6, MODE3A = 6, MODE3B = 6, MODE4A = 6, MODE4B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_2B from 1 to 32 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_04 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 1 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 1.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 2.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 2.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 3.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 3.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 4.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 4.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 5.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 5.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 6.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 6.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 7.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 7.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 8.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 8.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 9.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 9.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 10.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 10.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 11.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 11.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 12.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 12.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 13.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 13.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 14.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 14.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 15.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 15.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 16.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 16.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 17.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 17.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 18.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 18.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 19.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 19.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 20.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 20.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 21.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 21.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 22.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 22.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 23.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 23.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 24.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 24.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 25.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 25.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 26.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 26.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 27.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 27.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 28.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 28.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 29.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 29.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 30.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 30.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 31.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 31.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 32.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 32.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 33.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 33.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 34.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 34.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 35.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 35.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 36.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 0 | 0.1 | 0.1
NULL : Input_2B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 0 | 0.1 | 0.1
NULL : Input_2B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_04 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 6 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 6, MODE1B = 6, MODE2A =6, MODE2B = 6, MODE3A = 6, MODE3B = 6, MODE4A = 6, MODE4B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_3A from 1 to 32 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 1 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 1.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 2.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 2.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 3.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 3.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 4.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 4.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 5.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 5.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 6.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 6.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 7.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 7.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 8.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 8.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 9.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 9.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 10.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 10.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 11.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 11.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 12.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 12.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 13.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 13.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 14.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 14.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 15.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 15.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 16.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 16.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 17.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 17.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 18.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 18.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 19.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 19.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 20.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 20.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 21.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 21.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 22.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 22.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 23.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 23.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 24.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 24.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 25.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 25.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 26.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 26.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 27.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 27.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 28.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 28.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 29.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 29.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 30.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 30.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 31.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 31.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 32.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 32.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 33.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 33.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 34.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 34.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 35.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 35.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 36.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_05 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 6 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 6, MODE1B = 6, MODE2A =6, MODE2B = 6, MODE3A = 6, MODE3B = 6, MODE4A = 6, MODE4B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_3B from 1 to 32 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_06 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 1 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 1.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 2.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 2.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 3.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 3.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 4.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 4.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 5.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 5.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 6.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 6.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 7.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 7.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 8.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 8.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 9.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 9.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 10.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 10.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 11.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 11.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 12.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 12.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 13.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 13.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 14.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 14.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 15.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 15.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 16.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 16.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 17.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 17.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 18.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 18.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 19.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 19.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 20.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 20.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 21.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 21.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 22.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 22.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 23.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 23.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 24.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 24.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 25.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 25.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 26.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 26.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 27.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 27.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 28.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 28.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 29.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 29.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 30.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 30.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 31.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 31.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 32.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 32.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 33.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 33.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 34.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 34.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 35.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 35.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 36.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_06 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 6 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 6, MODE1B = 6, MODE2A =6, MODE2B = 6, MODE3A = 6, MODE3B = 6, MODE4A = 6, MODE4B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_4A from 1 to 32 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 1 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 1.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 2.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 2.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 3.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 3.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 4.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 4.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 5.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 5.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 6.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 6.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 7.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 7.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 8.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 8.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 9.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 9.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 10.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 10.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 11.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 11.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 12.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 12.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 13.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 13.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 14.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 14.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 15.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 15.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 16.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 16.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 17.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 17.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 18.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 18.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 19.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 19.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 20.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 20.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 21.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 21.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 22.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 22.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 23.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 23.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 24.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 24.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 25.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 25.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 26.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 26.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 27.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 27.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 28.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 28.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 29.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 29.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 30.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 30.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 31.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 31.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 32.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 32.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 33.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 33.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 34.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 34.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 35.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 35.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 36.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 0 | 0.1 | 0.1
NULL : Input_4A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 0 | 0.1 | 0.1
NULL : Input_4A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_07 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure as Outputs to 6 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 6, MODE1B = 6, MODE2A =6, MODE2B = 6, MODE3A = 6, MODE3B = 6, MODE4A = 6, MODE4B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_4B from 1 to 32 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 1
#switch input to load line
J1_08 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 1 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 1.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 2.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 2.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 3.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 3.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 4.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 4.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 5.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 5.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 6.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 6.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 7.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 7.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 8.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 8.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 9.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 9.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 10.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 10.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 11.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 11.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 12.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 12.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 13.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 13.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 14.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 14.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 15.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 15.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 16.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 16.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 17.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 17.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 18.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 18.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 19.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 19.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 20.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 20.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 21.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 21.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 22.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 22.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 23.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 23.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 24.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 24.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 25.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 25.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 26.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 26.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 27.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 27.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 28.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 28.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 29.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 29.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 30.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 30.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 31.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 31.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 32.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 32.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 33.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 33.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 34.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 34.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 35.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 35.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 36.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 0 | 0.1 | 0.1
NULL : Input_4B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 0 | 0.1 | 0.1
NULL : Input_4B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_08 = 0 : NULL : WAIT = 0.1


#Finished with mode
#cycle IGN to clean slate
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1
#switch out load line, set current
J1_08 = 0 : NULL : WAIT = 0.1
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
J4_03 = 0 : NULL : WAIT = 0.2
SAVE
END
