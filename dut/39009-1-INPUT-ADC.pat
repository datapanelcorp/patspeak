#39009-1
#Verion 0.0
#input test
UUT_DBC = 39009-561.dbc
UUT_DATANAME = 39009-1-INPUT-ADC


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
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
NULL : Input_5B = 0 | 0.1 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 1, MODE2B = 1, MODE3A = 4, MODE3B = 4, MODE4A = 1, MODE4B = 1, MODE5A = 4, MODE5B = 4, MODE6A = 1, MODE6B = 1, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 4, MODE9B = 4, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.1


#Sweep of Port_1A from 1 to 5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 1 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 1.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 2.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 2.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 3.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 3.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 4.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 4.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 5.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 56 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.6 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_01 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 1, MODE2B = 1, MODE3A = 4, MODE3B = 4, MODE4A = 1, MODE4B = 1, MODE5A = 4, MODE5B = 4, MODE6A = 1, MODE6B = 1, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 4, MODE9B = 4, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.1


#Sweep of Port_1B from 1 to 5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 1 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 1.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 2.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 2.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 3.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 3.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 4.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 4.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 5.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 56 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.6 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_02 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 1, MODE2B = 1, MODE3A = 4, MODE3B = 4, MODE4A = 1, MODE4B = 1, MODE5A = 4, MODE5B = 4, MODE6A = 1, MODE6B = 1, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 4, MODE9B = 4, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_03 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3A from 1 to 5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 1 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 1.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 2.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 2.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 3.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 3.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 4.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 4.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 5.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 56 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.6 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_03 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 1, MODE2B = 1, MODE3A = 4, MODE3B = 4, MODE4A = 1, MODE4B = 1, MODE5A = 4, MODE5B = 4, MODE6A = 1, MODE6B = 1, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 4, MODE9B = 4, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_04 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3B from 1 to 5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 1 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 1.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 2.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 2.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 3.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 3.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 4.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 4.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 5.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 56 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.6 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_04 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 1, MODE2B = 1, MODE3A = 4, MODE3B = 4, MODE4A = 1, MODE4B = 1, MODE5A = 4, MODE5B = 4, MODE6A = 1, MODE6B = 1, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 4, MODE9B = 4, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_05 = 1 : NULL : WAIT = 0.1


#Sweep of Port_5A from 1 to 5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 1 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 1.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 2.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 2.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 3.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 3.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 4.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 4.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 5.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 0 | 0.1 | 0.1
NULL : Input_5A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 56 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.6 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 0 | 0.1 | 0.1
NULL : Input_5A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_05 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 1, MODE2B = 1, MODE3A = 4, MODE3B = 4, MODE4A = 1, MODE4B = 1, MODE5A = 4, MODE5B = 4, MODE6A = 1, MODE6B = 1, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 4, MODE9B = 4, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_06 = 1 : NULL : WAIT = 0.1


#Sweep of Port_5B from 1 to 5 in 0.5 increments

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
NULL : Port_5B = 0 | 0.1 | 0.1
NULL : Input_5B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 56 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.6 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0 | 0.1 | 0.1
NULL : Input_5B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_06 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 1, MODE2B = 1, MODE3A = 4, MODE3B = 4, MODE4A = 1, MODE4B = 1, MODE5A = 4, MODE5B = 4, MODE6A = 1, MODE6B = 1, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 4, MODE9B = 4, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_07 = 1 : NULL : WAIT = 0.1


#Sweep of Port_7A from 1 to 5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 1 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 1.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 2.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 2.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 3.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 3.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 4.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 4.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 5.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 0 | 0.1 | 0.1
NULL : Input_7A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 56 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.6 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 0 | 0.1 | 0.1
NULL : Input_7A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_07 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 1, MODE2B = 1, MODE3A = 4, MODE3B = 4, MODE4A = 1, MODE4B = 1, MODE5A = 4, MODE5B = 4, MODE6A = 1, MODE6B = 1, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 4, MODE9B = 4, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_08 = 1 : NULL : WAIT = 0.1


#Sweep of Port_7B from 1 to 5 in 0.5 increments

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
NULL : Port_7B = 0 | 0.1 | 0.1
NULL : Input_7B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 56 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.6 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0 | 0.1 | 0.1
NULL : Input_7B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_08 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 1, MODE2B = 1, MODE3A = 4, MODE3B = 4, MODE4A = 1, MODE4B = 1, MODE5A = 4, MODE5B = 4, MODE6A = 1, MODE6B = 1, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 4, MODE9B = 4, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_09 = 1 : NULL : WAIT = 0.1


#Sweep of Port_9A from 1 to 5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 1 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 1.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 2.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 2.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 3.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 3.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 4.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 4.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 5.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 0 | 0.1 | 0.1
NULL : Input_9A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 56 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.6 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 0 | 0.1 | 0.1
NULL : Input_9A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_09 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 1, MODE2B = 1, MODE3A = 4, MODE3B = 4, MODE4A = 1, MODE4B = 1, MODE5A = 4, MODE5B = 4, MODE6A = 1, MODE6B = 1, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 4, MODE9B = 4, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Port_9B from 1 to 5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 1 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 1.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 2.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 2.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 3.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 3.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 4.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 4.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 5.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 0 | 0.1 | 0.1
NULL : Input_9B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 56 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.6 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 0 | 0.1 | 0.1
NULL : Input_9B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.1


#Finished with mode
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 6, MODE1B = 6, MODE2A = 1, MODE2B = 1, MODE3A = 6, MODE3B = 6, MODE4A = 1, MODE4B = 1, MODE5A = 6, MODE5B = 6, MODE6A = 1, MODE6B = 1, MODE7A = 6, MODE7B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 6, MODE9B = 6, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.1


#Sweep of Port_1A from 1 to 32 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 1 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 1.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 2.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 2.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 3.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 3.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 4.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 4.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 5.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 5.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 6.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 6.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 7.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 7.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 8.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 8.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 9.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 9.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 10.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 10.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 11.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 11.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 12.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 12.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 13.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 13.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 14.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 14.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 15.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 15.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 16.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 16.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 17.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 17.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 18.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 18.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 19.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 19.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 20.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 20.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 21.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 21.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 22.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 22.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 23.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 23.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 24.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 24.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 25.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 25.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 26.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 26.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 27.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 27.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 28.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 28.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 29.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 29.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 30.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 30.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 31.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 31.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 32.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 32.5 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 33.0 | 0.155 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 336 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.6 | 0.155 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_01 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 6, MODE1B = 6, MODE2A = 1, MODE2B = 1, MODE3A = 6, MODE3B = 6, MODE4A = 1, MODE4B = 1, MODE5A = 6, MODE5B = 6, MODE6A = 1, MODE6B = 1, MODE7A = 6, MODE7B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 6, MODE9B = 6, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.1


#Sweep of Port_1B from 1 to 32 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 1 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 1.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 2.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 2.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 3.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 3.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 4.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 4.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 5.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 5.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 6.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 6.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 7.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 7.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 8.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 8.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 9.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 9.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 10.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 10.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 11.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 11.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 12.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 12.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 13.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 13.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 14.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 14.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 15.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 15.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 16.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 16.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 17.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 17.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 18.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 18.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 19.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 19.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 20.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 20.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 21.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 21.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 22.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 22.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 23.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 23.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 24.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 24.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 25.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 25.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 26.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 26.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 27.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 27.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 28.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 28.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 29.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 29.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 30.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 30.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 31.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 31.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 32.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 32.5 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 33.0 | 0.155 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 336 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.6 | 0.155 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_02 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 6, MODE1B = 6, MODE2A = 1, MODE2B = 1, MODE3A = 6, MODE3B = 6, MODE4A = 1, MODE4B = 1, MODE5A = 6, MODE5B = 6, MODE6A = 1, MODE6B = 1, MODE7A = 6, MODE7B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 6, MODE9B = 6, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_03 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3A from 1 to 32 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 1 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 1.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 2.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 2.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 3.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 3.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 4.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 4.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 5.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 5.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 6.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 6.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 7.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 7.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 8.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 8.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 9.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 9.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 10.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 10.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 11.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 11.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 12.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 12.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 13.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 13.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 14.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 14.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 15.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 15.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 16.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 16.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 17.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 17.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 18.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 18.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 19.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 19.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 20.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 20.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 21.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 21.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 22.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 22.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 23.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 23.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 24.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 24.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 25.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 25.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 26.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 26.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 27.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 27.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 28.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 28.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 29.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 29.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 30.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 30.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 31.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 31.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 32.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 32.5 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 33.0 | 0.155 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 336 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.6 | 0.155 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_03 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 6, MODE1B = 6, MODE2A = 1, MODE2B = 1, MODE3A = 6, MODE3B = 6, MODE4A = 1, MODE4B = 1, MODE5A = 6, MODE5B = 6, MODE6A = 1, MODE6B = 1, MODE7A = 6, MODE7B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 6, MODE9B = 6, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_04 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3B from 1 to 32 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 1 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 1.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 2.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 2.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 3.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 3.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 4.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 4.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 5.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 5.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 6.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 6.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 7.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 7.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 8.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 8.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 9.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 9.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 10.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 10.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 11.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 11.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 12.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 12.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 13.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 13.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 14.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 14.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 15.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 15.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 16.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 16.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 17.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 17.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 18.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 18.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 19.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 19.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 20.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 20.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 21.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 21.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 22.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 22.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 23.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 23.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 24.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 24.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 25.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 25.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 26.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 26.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 27.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 27.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 28.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 28.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 29.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 29.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 30.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 30.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 31.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 31.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 32.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 32.5 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 33.0 | 0.155 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 336 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.6 | 0.155 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_04 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 6, MODE1B = 6, MODE2A = 1, MODE2B = 1, MODE3A = 6, MODE3B = 6, MODE4A = 1, MODE4B = 1, MODE5A = 6, MODE5B = 6, MODE6A = 1, MODE6B = 1, MODE7A = 6, MODE7B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 6, MODE9B = 6, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_05 = 1 : NULL : WAIT = 0.1


#Sweep of Port_5A from 1 to 32 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 1 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 1.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 2.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 2.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 3.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 3.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 4.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 4.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 5.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 5.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 6.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 6.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 7.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 7.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 8.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 8.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 9.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 9.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 10.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 10.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 11.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 11.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 12.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 12.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 13.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 13.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 14.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 14.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 15.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 15.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 16.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 16.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 17.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 17.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 18.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 18.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 19.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 19.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 20.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 20.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 21.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 21.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 22.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 22.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 23.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 23.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 24.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 24.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 25.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 25.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 26.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 26.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 27.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 27.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 28.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 28.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 29.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 29.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 30.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 30.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 31.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 31.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 32.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 32.5 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 33.0 | 0.155 | 0.1
NULL : Input_5A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 0 | 0.1 | 0.1
NULL : Input_5A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 336 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.6 | 0.155 | 0.1
#test feedback
NULL : Port_5A = 0 | 0.1 | 0.1
NULL : Input_5A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_05 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 6, MODE1B = 6, MODE2A = 1, MODE2B = 1, MODE3A = 6, MODE3B = 6, MODE4A = 1, MODE4B = 1, MODE5A = 6, MODE5B = 6, MODE6A = 1, MODE6B = 1, MODE7A = 6, MODE7B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 6, MODE9B = 6, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_06 = 1 : NULL : WAIT = 0.1


#Sweep of Port_5B from 1 to 32 in 0.5 increments

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
NULL : Port_5B = 0 | 0.1 | 0.1
NULL : Input_5B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 336 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.6 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0 | 0.1 | 0.1
NULL : Input_5B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_06 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 6, MODE1B = 6, MODE2A = 1, MODE2B = 1, MODE3A = 6, MODE3B = 6, MODE4A = 1, MODE4B = 1, MODE5A = 6, MODE5B = 6, MODE6A = 1, MODE6B = 1, MODE7A = 6, MODE7B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 6, MODE9B = 6, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_07 = 1 : NULL : WAIT = 0.1


#Sweep of Port_7A from 1 to 32 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 1 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 1.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 2.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 2.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 3.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 3.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 4.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 4.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 5.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 5.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 6.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 6.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 7.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 7.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 8.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 8.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 9.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 9.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 10.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 10.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 11.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 11.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 12.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 12.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 13.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 13.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 14.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 14.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 15.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 15.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 16.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 16.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 17.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 17.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 18.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 18.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 19.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 19.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 20.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 20.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 21.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 21.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 22.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 22.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 23.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 23.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 24.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 24.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 25.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 25.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 26.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 26.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 27.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 27.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 28.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 28.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 29.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 29.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 30.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 30.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 31.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 31.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 32.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 32.5 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 33.0 | 0.155 | 0.1
NULL : Input_7A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 0 | 0.1 | 0.1
NULL : Input_7A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 336 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.6 | 0.155 | 0.1
#test feedback
NULL : Port_7A = 0 | 0.1 | 0.1
NULL : Input_7A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_07 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 6, MODE1B = 6, MODE2A = 1, MODE2B = 1, MODE3A = 6, MODE3B = 6, MODE4A = 1, MODE4B = 1, MODE5A = 6, MODE5B = 6, MODE6A = 1, MODE6B = 1, MODE7A = 6, MODE7B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 6, MODE9B = 6, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_08 = 1 : NULL : WAIT = 0.1


#Sweep of Port_7B from 1 to 32 in 0.5 increments

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
NULL : Port_7B = 0 | 0.1 | 0.1
NULL : Input_7B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 336 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.6 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0 | 0.1 | 0.1
NULL : Input_7B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_08 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 6, MODE1B = 6, MODE2A = 1, MODE2B = 1, MODE3A = 6, MODE3B = 6, MODE4A = 1, MODE4B = 1, MODE5A = 6, MODE5B = 6, MODE6A = 1, MODE6B = 1, MODE7A = 6, MODE7B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 6, MODE9B = 6, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_09 = 1 : NULL : WAIT = 0.1


#Sweep of Port_9A from 1 to 32 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 1 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 1.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 2.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 2.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 3.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 3.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 4.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 4.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 5.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 5.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 6.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 6.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 7.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 7.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 8.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 8.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 9.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 9.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 10.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 10.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 11.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 11.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 12.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 12.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 13.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 13.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 14.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 14.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 15.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 15.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 16.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 16.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 17.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 17.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 18.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 18.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 19.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 19.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 20.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 20.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 21.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 21.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 22.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 22.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 23.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 23.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 24.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 24.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 25.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 25.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 26.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 26.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 27.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 27.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 28.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 28.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 29.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 29.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 30.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 30.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 31.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 31.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 32.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 32.5 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 33.0 | 0.155 | 0.1
NULL : Input_9A = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 0 | 0.1 | 0.1
NULL : Input_9A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 336 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.6 | 0.155 | 0.1
#test feedback
NULL : Port_9A = 0 | 0.1 | 0.1
NULL : Input_9A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_09 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 6, MODE1B = 6, MODE2A = 1, MODE2B = 1, MODE3A = 6, MODE3B = 6, MODE4A = 1, MODE4B = 1, MODE5A = 6, MODE5B = 6, MODE6A = 1, MODE6B = 1, MODE7A = 6, MODE7B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 6, MODE9B = 6, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Port_9B from 1 to 32 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 1 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 1.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 2.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 2.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 3.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 3.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 4.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 4.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 5.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 5.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 6.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 6.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 7.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 7.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 8.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 8.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 9.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 9.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 10.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 10.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 11.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 11.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 12.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 12.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 13.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 13.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 14.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 14.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 15.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 15.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 16.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 16.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 17.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 17.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 18.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 18.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 19.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 19.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 20.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 20.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 21.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 21.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 22.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 22.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 23.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 23.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 24.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 24.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 25.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 25.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 26.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 26.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 27.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 27.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 28.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 28.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 29.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 29.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 30.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 30.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 31.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 31.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 32.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 32.5 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 33.0 | 0.155 | 0.1
NULL : Input_9B = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 0 | 0.1 | 0.1
NULL : Input_9B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 336 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.6 | 0.155 | 0.1
#test feedback
NULL : Port_9B = 0 | 0.1 | 0.1
NULL : Input_9B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.1


#Finished with mode
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
#switch out load line, set current
J2_10 = 0 : NULL : WAIT = 0.1
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
NULL : Input_1A = 2 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1
NULL : Input_5A = 2 | 0.1 | 0.1
NULL : Input_5B = 2 | 0.1 | 0.1
NULL : Input_7A = 2 | 0.1 | 0.1
NULL : Input_7B = 2 | 0.1 | 0.1
NULL : Input_9A = 2 | 0.1 | 0.1
NULL : Input_9B = 2 | 0.1 | 0.1
J4_03 = 0 : NULL : WAIT = 0.2
SAVE
END
