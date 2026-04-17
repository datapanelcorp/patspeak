#43009-1
#Verion 0.0
#input test
UUT_DBC = 43009-560.dbc
UUT_DATANAME = 43009-1-INPUT-ALL


#cycle IGN to clean slate
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

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
Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1 : NULL : WAIT = 0.5
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_1A from 1 to 5 in 0.5 increments
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.050 | 1
#switch input to load line
J1_01 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.050 | 0.1
#test feedback
NULL : Port_1A = 1 | 0.050 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.050 | 0.1
#test feedback
NULL : Port_1A = 1.5 | 0.050 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.050 | 0.1
#test feedback
NULL : Port_1A = 2.0 | 0.050 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.050 | 0.1
#test feedback
NULL : Port_1A = 2.5 | 0.050 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.050 | 0.1
#test feedback
NULL : Port_1A = 3.0 | 0.050 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.050 | 0.1
#test feedback
NULL : Port_1A = 3.5 | 0.050 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.050 | 0.1
#test feedback
NULL : Port_1A = 4.0 | 0.050 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.050 | 0.1
#test feedback
NULL : Port_1A = 4.5 | 0.050 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.050 | 0.1
#test feedback
NULL : Port_1A = 5.0 | 0.050 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.050 | 0.1
#test feedback
NULL : Port_1A = 5.5 | 0.050 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.050 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL
#test power supply
NULL : MeterVolts = 6.1 | 0.050 | 0.1
#test feedback
NULL : Port_1A = 0 | 0.1 | 0.1
NULL : Input_1A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_01 = 0 : NULL : WAIT = 0.1

Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1 : NULL : WAIT = 0.5
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_1B from 1 to 5 in 0.5 increments
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.050 | 1
#switch input to load line
J1_02 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.050 | 0.1
#test feedback
NULL : Port_1B = 1 | 0.050 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.050 | 0.1
#test feedback
NULL : Port_1B = 1.5 | 0.050 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.050 | 0.1
#test feedback
NULL : Port_1B = 2.0 | 0.050 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.050 | 0.1
#test feedback
NULL : Port_1B = 2.5 | 0.050 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.050 | 0.1
#test feedback
NULL : Port_1B = 3.0 | 0.050 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.050 | 0.1
#test feedback
NULL : Port_1B = 3.5 | 0.050 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.050 | 0.1
#test feedback
NULL : Port_1B = 4.0 | 0.050 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.050 | 0.1
#test feedback
NULL : Port_1B = 4.5 | 0.050 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.050 | 0.1
#test feedback
NULL : Port_1B = 5.0 | 0.050 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.050 | 0.1
#test feedback
NULL : Port_1B = 5.5 | 0.050 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.050 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL
#test power supply
NULL : MeterVolts = 6.1 | 0.050 | 0.1
#test feedback
NULL : Port_1B = 0 | 0.1 | 0.1
NULL : Input_1B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_02 = 0 : NULL : WAIT = 0.1

Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1 : NULL : WAIT = 0.5
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_2A from 1 to 5 in 0.5 increments
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.050 | 1
#switch input to load line
J1_03 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.050 | 0.1
#test feedback
NULL : Port_2A = 1 | 0.050 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.050 | 0.1
#test feedback
NULL : Port_2A = 1.5 | 0.050 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.050 | 0.1
#test feedback
NULL : Port_2A = 2.0 | 0.050 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.050 | 0.1
#test feedback
NULL : Port_2A = 2.5 | 0.050 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.050 | 0.1
#test feedback
NULL : Port_2A = 3.0 | 0.050 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.050 | 0.1
#test feedback
NULL : Port_2A = 3.5 | 0.050 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.050 | 0.1
#test feedback
NULL : Port_2A = 4.0 | 0.050 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.050 | 0.1
#test feedback
NULL : Port_2A = 4.5 | 0.050 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.050 | 0.1
#test feedback
NULL : Port_2A = 5.0 | 0.050 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.050 | 0.1
#test feedback
NULL : Port_2A = 5.5 | 0.050 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.050 | 0.1
#test feedback
NULL : Port_2A = 0 | 0.1 | 0.1
NULL : Input_2A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL
#test power supply
NULL : MeterVolts = 6.1 | 0.050 | 0.1
#test feedback
NULL : Port_2A = 0 | 0.1 | 0.1
NULL : Input_2A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_03 = 0 : NULL : WAIT = 0.1

Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1 : NULL : WAIT = 0.5
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_2B from 1 to 5 in 0.5 increments
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.050 | 1
#switch input to load line
J1_04 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.050 | 0.1
#test feedback
NULL : Port_2B = 1 | 0.050 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.050 | 0.1
#test feedback
NULL : Port_2B = 1.5 | 0.050 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.050 | 0.1
#test feedback
NULL : Port_2B = 2.0 | 0.050 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.050 | 0.1
#test feedback
NULL : Port_2B = 2.5 | 0.050 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.050 | 0.1
#test feedback
NULL : Port_2B = 3.0 | 0.050 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.050 | 0.1
#test feedback
NULL : Port_2B = 3.5 | 0.050 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.050 | 0.1
#test feedback
NULL : Port_2B = 4.0 | 0.050 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.050 | 0.1
#test feedback
NULL : Port_2B = 4.5 | 0.050 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.050 | 0.1
#test feedback
NULL : Port_2B = 5.0 | 0.050 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.050 | 0.1
#test feedback
NULL : Port_2B = 5.5 | 0.050 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.050 | 0.1
#test feedback
NULL : Port_2B = 0 | 0.1 | 0.1
NULL : Input_2B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL
#test power supply
NULL : MeterVolts = 6.1 | 0.050 | 0.1
#test feedback
NULL : Port_2B = 0 | 0.1 | 0.1
NULL : Input_2B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_04 = 0 : NULL : WAIT = 0.1

Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1 : NULL : WAIT = 0.5
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_3A from 1 to 5 in 0.5 increments
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.050 | 1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.050 | 0.1
#test feedback
NULL : Port_3A = 1 | 0.050 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.050 | 0.1
#test feedback
NULL : Port_3A = 1.5 | 0.050 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.050 | 0.1
#test feedback
NULL : Port_3A = 2.0 | 0.050 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.050 | 0.1
#test feedback
NULL : Port_3A = 2.5 | 0.050 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.050 | 0.1
#test feedback
NULL : Port_3A = 3.0 | 0.050 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.050 | 0.1
#test feedback
NULL : Port_3A = 3.5 | 0.050 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.050 | 0.1
#test feedback
NULL : Port_3A = 4.0 | 0.050 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.050 | 0.1
#test feedback
NULL : Port_3A = 4.5 | 0.050 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.050 | 0.1
#test feedback
NULL : Port_3A = 5.0 | 0.050 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.050 | 0.1
#test feedback
NULL : Port_3A = 5.5 | 0.050 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.050 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL
#test power supply
NULL : MeterVolts = 6.1 | 0.050 | 0.1
#test feedback
NULL : Port_3A = 0 | 0.1 | 0.1
NULL : Input_3A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_05 = 0 : NULL : WAIT = 0.1

Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1 : NULL : WAIT = 0.5
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_3B from 1 to 5 in 0.5 increments
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.050 | 1
#switch input to load line
J1_06 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.050 | 0.1
#test feedback
NULL : Port_3B = 1 | 0.050 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.050 | 0.1
#test feedback
NULL : Port_3B = 1.5 | 0.050 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.050 | 0.1
#test feedback
NULL : Port_3B = 2.0 | 0.050 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.050 | 0.1
#test feedback
NULL : Port_3B = 2.5 | 0.050 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.050 | 0.1
#test feedback
NULL : Port_3B = 3.0 | 0.050 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.050 | 0.1
#test feedback
NULL : Port_3B = 3.5 | 0.050 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.050 | 0.1
#test feedback
NULL : Port_3B = 4.0 | 0.050 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.050 | 0.1
#test feedback
NULL : Port_3B = 4.5 | 0.050 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.050 | 0.1
#test feedback
NULL : Port_3B = 5.0 | 0.050 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.050 | 0.1
#test feedback
NULL : Port_3B = 5.5 | 0.050 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.050 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL
#test power supply
NULL : MeterVolts = 6.1 | 0.050 | 0.1
#test feedback
NULL : Port_3B = 0 | 0.1 | 0.1
NULL : Input_3B = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_06 = 0 : NULL : WAIT = 0.1

Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1 : NULL : WAIT = 0.5
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_4A from 1 to 5 in 0.5 increments
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.050 | 1
#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.050 | 0.1
#test feedback
NULL : Port_4A = 1 | 0.050 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.050 | 0.1
#test feedback
NULL : Port_4A = 1.5 | 0.050 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.050 | 0.1
#test feedback
NULL : Port_4A = 2.0 | 0.050 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.050 | 0.1
#test feedback
NULL : Port_4A = 2.5 | 0.050 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.050 | 0.1
#test feedback
NULL : Port_4A = 3.0 | 0.050 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.050 | 0.1
#test feedback
NULL : Port_4A = 3.5 | 0.050 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.050 | 0.1
#test feedback
NULL : Port_4A = 4.0 | 0.050 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.050 | 0.1
#test feedback
NULL : Port_4A = 4.5 | 0.050 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.050 | 0.1
#test feedback
NULL : Port_4A = 5.0 | 0.050 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.050 | 0.1
#test feedback
NULL : Port_4A = 5.5 | 0.050 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.050 | 0.1
#test feedback
NULL : Port_4A = 0 | 0.1 | 0.1
NULL : Input_4A = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL
#test power supply
NULL : MeterVolts = 6.1 | 0.050 | 0.1
#test feedback
NULL : Port_4A = 0 | 0.1 | 0.1
NULL : Input_4A = 2 | 0.1 | 0.1

#Finished with port
#switch out input
J1_07 = 0 : NULL : WAIT = 0.1

Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1 : NULL : WAIT = 0.5
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#Sweep of Port_4B from 1 to 5 in 0.5 increments
PwrSetVoltage = 10 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1
#test power supply
NULL : MeterVolts = 1 | 0.050 | 1
#switch input to load line
J1_08 = 1 : NULL : WAIT = 0.1

#set power supply
PwrSetVoltage = 10 : NULL
#test power supply
NULL : MeterVolts = 1 | 0.050 | 0.1
#test feedback
NULL : Port_4B = 1 | 0.050 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL
#test power supply
NULL : MeterVolts = 1.5 | 0.050 | 0.1
#test feedback
NULL : Port_4B = 1.5 | 0.050 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL
#test power supply
NULL : MeterVolts = 2.0 | 0.050 | 0.1
#test feedback
NULL : Port_4B = 2.0 | 0.050 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL
#test power supply
NULL : MeterVolts = 2.5 | 0.050 | 0.1
#test feedback
NULL : Port_4B = 2.5 | 0.050 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL
#test power supply
NULL : MeterVolts = 3.0 | 0.050 | 0.1
#test feedback
NULL : Port_4B = 3.0 | 0.050 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL
#test power supply
NULL : MeterVolts = 3.5 | 0.050 | 0.1
#test feedback
NULL : Port_4B = 3.5 | 0.050 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL
#test power supply
NULL : MeterVolts = 4.0 | 0.050 | 0.1
#test feedback
NULL : Port_4B = 4.0 | 0.050 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL
#test power supply
NULL : MeterVolts = 4.5 | 0.050 | 0.1
#test feedback
NULL : Port_4B = 4.5 | 0.050 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL
#test power supply
NULL : MeterVolts = 5.0 | 0.050 | 0.1
#test feedback
NULL : Port_4B = 5.0 | 0.050 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL
#test power supply
NULL : MeterVolts = 5.5 | 0.050 | 0.1
#test feedback
NULL : Port_4B = 5.5 | 0.050 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL
#test power supply
NULL : MeterVolts = 6.0 | 0.050 | 0.1
#test feedback
NULL : Port_4B = 0 | 0.1 | 0.1
NULL : Input_4B = 2 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 61 : NULL
#test power supply
NULL : MeterVolts = 6.1 | 0.050 | 0.1
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
