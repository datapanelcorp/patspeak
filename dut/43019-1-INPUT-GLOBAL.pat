#43019-1
#Verion 0.0
#input test
UUT_DBC = 43019-560.dbc
UUT_DATANAME = 43019-1-INPUT-GLOBAL


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
#configure Global to 4 with Ports as 1 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A =1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 4, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_1A from 4 to 5 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 40 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 4 | 0.155 | 1
#switch input to load line
J1_01 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 4 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 4.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 5.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 5.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.1 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_01 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 4 with Ports as 1 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A =1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 4, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_1B from 4 to 5 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 40 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 4 | 0.155 | 1
#switch input to load line
J1_02 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 4 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 4.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 5.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 5.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.1 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_02 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 4 with Ports as 1 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A =1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 4, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_2A from 4 to 5 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 40 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 4 | 0.155 | 1
#switch input to load line
J1_03 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 4 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 4.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 5.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 5.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 0 | 0.1 | 0.1
NULL : Input_2A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.1 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 0 | 0.1 | 0.1
NULL : Input_2A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_03 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 4 with Ports as 1 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A =1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 4, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_2B from 4 to 5 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 40 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 4 | 0.155 | 1
#switch input to load line
J1_04 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 4 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 4.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 5.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 5.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 0 | 0.1 | 0.1
NULL : Input_2B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.1 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 0 | 0.1 | 0.1
NULL : Input_2B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_04 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 4 with Ports as 1 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A =1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 4, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_3A from 4 to 5 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 40 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 4 | 0.155 | 1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 4 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 4.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 5.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 5.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.1 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_05 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 4 with Ports as 1 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A =1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 4, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_3B from 4 to 5 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 40 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 4 | 0.155 | 1
#switch input to load line
J1_06 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 4 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 4.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 5.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 5.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.1 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_06 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 4 with Ports as 1 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A =1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 4, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_4A from 4 to 5 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 40 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 4 | 0.155 | 1
#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 4 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 4.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 5.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 5.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 0 | 0.1 | 0.1
NULL : Input_4A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.1 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 0 | 0.1 | 0.1
NULL : Input_4A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_07 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 4 with Ports as 1 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A =1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 4, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_4B from 4 to 5 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 40 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 4 | 0.155 | 1
#switch input to load line
J1_08 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 4 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 4.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 5.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 5.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 0 | 0.1 | 0.1
NULL : Input_4B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL : WAIT = 0.1
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
#configure Global to 5 with Ports as 4 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A =4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 5, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_1A from 9 to 10 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 90 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 9 | 0.155 | 1
#switch input to load line
J1_01 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 9 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 9.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 10.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 10.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 11.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 116 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.6 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 117 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.7 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_01 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 5 with Ports as 4 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A =4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 5, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_1B from 9 to 10 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 90 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 9 | 0.155 | 1
#switch input to load line
J1_02 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 9 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 9.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 10.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 10.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 11.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 116 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.6 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 117 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.7 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_02 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 5 with Ports as 4 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A =4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 5, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_2A from 9 to 10 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 90 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 9 | 0.155 | 1
#switch input to load line
J1_03 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 9 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 9.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 10.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 10.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 11.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 0 | 0.1 | 0.1
NULL : Input_2A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 116 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.6 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 0 | 0.1 | 0.1
NULL : Input_2A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 117 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.7 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 0 | 0.1 | 0.1
NULL : Input_2A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_03 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 5 with Ports as 4 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A =4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 5, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_2B from 9 to 10 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 90 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 9 | 0.155 | 1
#switch input to load line
J1_04 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 9 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 9.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 10.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 10.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 11.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 0 | 0.1 | 0.1
NULL : Input_2B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 116 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.6 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 0 | 0.1 | 0.1
NULL : Input_2B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 117 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.7 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 0 | 0.1 | 0.1
NULL : Input_2B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_04 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 5 with Ports as 4 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A =4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 5, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_3A from 9 to 10 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 90 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 9 | 0.155 | 1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 9 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 9.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 10.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 10.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 11.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 116 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.6 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 117 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.7 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_05 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 5 with Ports as 4 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A =4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 5, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_3B from 9 to 10 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 90 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 9 | 0.155 | 1
#switch input to load line
J1_06 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 9 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 9.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 10.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 10.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 11.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 116 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.6 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 117 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.7 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_06 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 5 with Ports as 4 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A =4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 5, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_4A from 9 to 10 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 90 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 9 | 0.155 | 1
#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 9 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 9.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 10.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 10.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 11.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 0 | 0.1 | 0.1
NULL : Input_4A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 116 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.6 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 0 | 0.1 | 0.1
NULL : Input_4A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 117 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.7 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 0 | 0.1 | 0.1
NULL : Input_4A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_07 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 5 with Ports as 4 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A =4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 5, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_4B from 9 to 10 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 90 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 9 | 0.155 | 1
#switch input to load line
J1_08 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 9 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 9.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 10.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 10.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 11.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 0 | 0.1 | 0.1
NULL : Input_4B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 116 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.6 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 0 | 0.1 | 0.1
NULL : Input_4B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 117 : NULL : WAIT = 0.1
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
#configure Global to 6 with Ports as 2 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 2, MODE1B = 2, MODE2A =2, MODE2B = 2, MODE3A = 2, MODE3B = 2, MODE4A = 2, MODE4B = 2 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 6, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_1A from 31 to 32 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 310 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 31 | 0.155 | 1
#switch input to load line
J1_01 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 31 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 31.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 32.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 32.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 33.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 33.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 34.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 34.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 35.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 35.5 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 36.0 | 0.155 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_01 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 6 with Ports as 2 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 2, MODE1B = 2, MODE2A =2, MODE2B = 2, MODE3A = 2, MODE3B = 2, MODE4A = 2, MODE4B = 2 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 6, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_1B from 31 to 32 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 310 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 31 | 0.155 | 1
#switch input to load line
J1_02 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 31 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 31.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 32.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 32.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 33.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 33.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 34.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 34.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 35.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 35.5 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 36.0 | 0.155 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_02 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 6 with Ports as 2 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 2, MODE1B = 2, MODE2A =2, MODE2B = 2, MODE3A = 2, MODE3B = 2, MODE4A = 2, MODE4B = 2 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 6, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_2A from 31 to 32 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 310 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 31 | 0.155 | 1
#switch input to load line
J1_03 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 31 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 31.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 32.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 32.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 33.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 33.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 34.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 34.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 35.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 35.5 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 36.0 | 0.155 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 0 | 0.1 | 0.1
NULL : Input_2A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_2A = 0 | 0.1 | 0.1
NULL : Input_2A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_03 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 6 with Ports as 2 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 2, MODE1B = 2, MODE2A =2, MODE2B = 2, MODE3A = 2, MODE3B = 2, MODE4A = 2, MODE4B = 2 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 6, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_2B from 31 to 32 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 310 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 31 | 0.155 | 1
#switch input to load line
J1_04 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 31 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 31.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 32.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 32.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 33.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 33.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 34.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 34.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 35.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 35.5 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 36.0 | 0.155 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 0 | 0.1 | 0.1
NULL : Input_2B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_2B = 0 | 0.1 | 0.1
NULL : Input_2B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_04 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 6 with Ports as 2 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 2, MODE1B = 2, MODE2A =2, MODE2B = 2, MODE3A = 2, MODE3B = 2, MODE4A = 2, MODE4B = 2 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 6, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_3A from 31 to 32 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 310 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 31 | 0.155 | 1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 31 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 31.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 32.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 32.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 33.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 33.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 34.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 34.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 35.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 35.5 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 36.0 | 0.155 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_05 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 6 with Ports as 2 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 2, MODE1B = 2, MODE2A =2, MODE2B = 2, MODE3A = 2, MODE3B = 2, MODE4A = 2, MODE4B = 2 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 6, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_3B from 31 to 32 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 310 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 31 | 0.155 | 1
#switch input to load line
J1_06 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 31 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 31.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 32.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 32.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 33.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 33.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 34.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 34.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 35.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 35.5 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 36.0 | 0.155 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_06 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 6 with Ports as 2 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 2, MODE1B = 2, MODE2A =2, MODE2B = 2, MODE3A = 2, MODE3B = 2, MODE4A = 2, MODE4B = 2 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 6, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_4A from 31 to 32 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 310 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 31 | 0.155 | 1
#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 31 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 31.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 32.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 32.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 33.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 33.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 34.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 34.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 35.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 35.5 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 36.0 | 0.155 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 0 | 0.1 | 0.1
NULL : Input_4A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : Port_4A = 0 | 0.1 | 0.1
NULL : Input_4A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_07 = 0 : NULL : WAIT = 0.1

#-----setup 43019-----
#configure Global to 6 with Ports as 2 
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 2, MODE1B = 2, MODE2A =2, MODE2B = 2, MODE3A = 2, MODE3B = 2, MODE4A = 2, MODE4B = 2 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, MODE2 = 6, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
#Sweep of Port_4B from 31 to 32 in 0.5 increments
J0_07_GND_LOAD = 0 : NULL : WAIT = 1
PwrSetVoltage = 310 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
NULL : MeterVolts = 31 | 0.155 | 1
#switch input to load line
J1_08 = 1 : NULL : WAIT = 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 31 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 31.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 32.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 32.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 33.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 33.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 34.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 34.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 35.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 35.5 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 36.0 | 0.155 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : Port_4B = 0 | 0.1 | 0.1
NULL : Input_4B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL : WAIT = 0.1
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
