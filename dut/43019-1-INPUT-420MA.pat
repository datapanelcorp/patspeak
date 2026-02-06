#43019-1
#Verion 0.0
#input test
UUT_DBC = 43019-560.dbc
UUT_DATANAME = 43019-1-INPUT-420MA

#switch in 420ma gen
J4_05 = 1 : NULL : WAIT = 0.2
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 3, MODE1B = 3, MODE2A = 3, MODE2B = 3, MODE3A = 3, MODE3B = 3, MODE4A = 3, MODE4B = 3 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
MrSignalMode = 0 : NULL : WAIT = 0.1
MrSignalEnable = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.2
MrSignalSetValue = 5.0 : NULL : WAIT = 0.5
#switch input to load line
J1_01 = 1 : NULL : WAIT = 0.1


#Sweep of Port_1A from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.005 | 0.0001 | 0.5
#test feedback
NULL : Port_1A = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_01 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_02 = 1 : NULL : WAIT = 0.1


#Sweep of Port_1B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.005 | 0.0001 | 0.5
#test feedback
NULL : Port_1B = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_02 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_03 = 1 : NULL : WAIT = 0.1


#Sweep of Port_2A from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.005 | 0.0001 | 0.5
#test feedback
NULL : Port_2A = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_03 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_04 = 1 : NULL : WAIT = 0.1


#Sweep of Port2B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.005 | 0.0001 | 0.5
#test feedback
NULL : Port2B = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_04 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3A from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.005 | 0.0001 | 0.5
#test feedback
NULL : Port_3A = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_05 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_06 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.005 | 0.0001 | 0.5
#test feedback
NULL : Port_3B = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_06 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.1


#Sweep of Port_4A from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.005 | 0.0001 | 0.5
#test feedback
NULL : Port_4A = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_07 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_08 = 1 : NULL : WAIT = 0.1


#Sweep of Port_4B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.005 | 0.0001 | 0.5
#test feedback
NULL : Port_4B = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_08 = 0 : NULL : WAIT = 0.2

MrSignalSetValue = 10.0 : NULL : WAIT = 0.5
#switch input to load line
J1_01 = 1 : NULL : WAIT = 0.1


#Sweep of Port_1A from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.01 | 0.0001 | 0.5
#test feedback
NULL : Port_1A = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_01 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_02 = 1 : NULL : WAIT = 0.1


#Sweep of Port_1B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.01 | 0.0001 | 0.5
#test feedback
NULL : Port_1B = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_02 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_03 = 1 : NULL : WAIT = 0.1


#Sweep of Port_2A from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.01 | 0.0001 | 0.5
#test feedback
NULL : Port_2A = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_03 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_04 = 1 : NULL : WAIT = 0.1


#Sweep of Port2B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.01 | 0.0001 | 0.5
#test feedback
NULL : Port2B = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_04 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3A from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.01 | 0.0001 | 0.5
#test feedback
NULL : Port_3A = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_05 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_06 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.01 | 0.0001 | 0.5
#test feedback
NULL : Port_3B = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_06 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.1


#Sweep of Port_4A from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.01 | 0.0001 | 0.5
#test feedback
NULL : Port_4A = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_07 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_08 = 1 : NULL : WAIT = 0.1


#Sweep of Port_4B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.01 | 0.0001 | 0.5
#test feedback
NULL : Port_4B = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_08 = 0 : NULL : WAIT = 0.2

MrSignalSetValue = 15.0 : NULL : WAIT = 0.5
#switch input to load line
J1_01 = 1 : NULL : WAIT = 0.1


#Sweep of Port_1A from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.015 | 0.0001 | 0.5
#test feedback
NULL : Port_1A = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_01 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_02 = 1 : NULL : WAIT = 0.1


#Sweep of Port_1B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.015 | 0.0001 | 0.5
#test feedback
NULL : Port_1B = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_02 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_03 = 1 : NULL : WAIT = 0.1


#Sweep of Port_2A from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.015 | 0.0001 | 0.5
#test feedback
NULL : Port_2A = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_03 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_04 = 1 : NULL : WAIT = 0.1


#Sweep of Port2B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.015 | 0.0001 | 0.5
#test feedback
NULL : Port2B = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_04 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3A from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.015 | 0.0001 | 0.5
#test feedback
NULL : Port_3A = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_05 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_06 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.015 | 0.0001 | 0.5
#test feedback
NULL : Port_3B = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_06 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.1


#Sweep of Port_4A from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.015 | 0.0001 | 0.5
#test feedback
NULL : Port_4A = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_07 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_08 = 1 : NULL : WAIT = 0.1


#Sweep of Port_4B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.015 | 0.0001 | 0.5
#test feedback
NULL : Port_4B = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_08 = 0 : NULL : WAIT = 0.2

MrSignalSetValue = 20.0 : NULL : WAIT = 0.5
#switch input to load line
J1_01 = 1 : NULL : WAIT = 0.1


#Sweep of Port_1A from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.02 | 0.0001 | 0.5
#test feedback
NULL : Port_1A = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_01 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_02 = 1 : NULL : WAIT = 0.1


#Sweep of Port_1B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.02 | 0.0001 | 0.5
#test feedback
NULL : Port_1B = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_02 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_03 = 1 : NULL : WAIT = 0.1


#Sweep of Port_2A from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.02 | 0.0001 | 0.5
#test feedback
NULL : Port_2A = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_03 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_04 = 1 : NULL : WAIT = 0.1


#Sweep of Port2B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.02 | 0.0001 | 0.5
#test feedback
NULL : Port2B = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_04 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3A from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.02 | 0.0001 | 0.5
#test feedback
NULL : Port_3A = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_05 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_06 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.02 | 0.0001 | 0.5
#test feedback
NULL : Port_3B = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_06 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.1


#Sweep of Port_4A from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.02 | 0.0001 | 0.5
#test feedback
NULL : Port_4A = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_07 = 0 : NULL : WAIT = 0.2

#switch input to load line
J1_08 = 1 : NULL : WAIT = 0.1


#Sweep of Port_4B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.02 | 0.0001 | 0.5
#test feedback
NULL : Port_4B = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J1_08 = 0 : NULL : WAIT = 0.2


#Finished with mode
#switch out load line
J1_08 = 0 : NULL : WAIT = 0.1
#switch out 420ma gen
J4_05 = 0 : NULL : WAIT = 0.2
SAVE
END
