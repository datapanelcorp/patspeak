#39009-1
#Verion 0.0
#input test
UUT_DBC = 39009-561.dbc
UUT_DATANAME = 39009-1-INPUT-420MA-AUTO

#switch in 420ma gen
J4_05 = 1 : NULL : WAIT = 0.2
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
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 3, MODE1B = 3, MODE2A = 1, MODE2B = 1, MODE3A = 3, MODE3B = 3, MODE4A = 1, MODE4B = 1, MODE5A = 3, MODE5B = 3, MODE6A = 1, MODE6B = 1, MODE7A = 3, MODE7B = 3 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 3, MODE9B = 3, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
MrSignalMode = 0 : NULL : WAIT = 0.1
MrSignalEnable = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.2
MrSignalSetValue = 5.0 : NULL : WAIT = 0.5
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.1
#warm-up first meter sample
NULL : NULL : WAIT = 0.8


#Sweep of Port_1A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_1A = 5.0 | 0.155 | 0.1 : TIMEOUT = 12

#Finished with port
#switch out input
J2_01 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.1


#Sweep of Port_1B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_1B = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_02 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_03 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_3A = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_03 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_04 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_3B = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_04 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_05 = 1 : NULL : WAIT = 0.1


#Sweep of Port_5A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_5A = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_05 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_06 = 1 : NULL : WAIT = 0.1


#Sweep of Port_5B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_5B = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_06 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_07 = 1 : NULL : WAIT = 0.1


#Sweep of Port_7A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_7A = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_07 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_08 = 1 : NULL : WAIT = 0.1


#Sweep of Port_7B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_7B = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_08 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_09 = 1 : NULL : WAIT = 0.1


#Sweep of Port_9A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_9A = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_09 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Port_9B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_9B = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.2

MrSignalSetValue = 10.0 : NULL : WAIT = 0.5
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.1
#warm-up first meter sample
NULL : NULL : WAIT = 0.8


#Sweep of Port_1A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_1A = 10.0 | 0.155 | 0.1 : TIMEOUT = 12

#Finished with port
#switch out input
J2_01 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.1


#Sweep of Port_1B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_1B = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_02 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_03 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_3A = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_03 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_04 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_3B = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_04 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_05 = 1 : NULL : WAIT = 0.1


#Sweep of Port_5A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_5A = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_05 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_06 = 1 : NULL : WAIT = 0.1


#Sweep of Port_5B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_5B = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_06 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_07 = 1 : NULL : WAIT = 0.1


#Sweep of Port_7A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_7A = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_07 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_08 = 1 : NULL : WAIT = 0.1


#Sweep of Port_7B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_7B = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_08 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_09 = 1 : NULL : WAIT = 0.1


#Sweep of Port_9A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_9A = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_09 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Port_9B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_9B = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.2

MrSignalSetValue = 15.0 : NULL : WAIT = 0.5
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.1
#warm-up first meter sample
NULL : NULL : WAIT = 0.8


#Sweep of Port_1A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_1A = 15.0 | 0.155 | 0.1 : TIMEOUT = 12

#Finished with port
#switch out input
J2_01 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.1


#Sweep of Port_1B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_1B = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_02 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_03 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_3A = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_03 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_04 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_3B = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_04 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_05 = 1 : NULL : WAIT = 0.1


#Sweep of Port_5A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_5A = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_05 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_06 = 1 : NULL : WAIT = 0.1


#Sweep of Port_5B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_5B = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_06 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_07 = 1 : NULL : WAIT = 0.1


#Sweep of Port_7A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_7A = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_07 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_08 = 1 : NULL : WAIT = 0.1


#Sweep of Port_7B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_7B = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_08 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_09 = 1 : NULL : WAIT = 0.1


#Sweep of Port_9A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_9A = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_09 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Port_9B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_9B = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.2

MrSignalSetValue = 20.0 : NULL : WAIT = 0.5
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.1
#warm-up first meter sample
NULL : NULL : WAIT = 0.8


#Sweep of Port_1A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_1A = 20.0 | 0.155 | 0.1 : TIMEOUT = 12

#Finished with port
#switch out input
J2_01 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.1


#Sweep of Port_1B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_1B = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_02 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_03 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_3A = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_03 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_04 = 1 : NULL : WAIT = 0.1


#Sweep of Port_3B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_3B = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_04 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_05 = 1 : NULL : WAIT = 0.1


#Sweep of Port_5A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_5A = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_05 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_06 = 1 : NULL : WAIT = 0.1


#Sweep of Port_5B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_5B = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_06 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_07 = 1 : NULL : WAIT = 0.1


#Sweep of Port_7A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_7A = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_07 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_08 = 1 : NULL : WAIT = 0.1


#Sweep of Port_7B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_7B = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_08 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_09 = 1 : NULL : WAIT = 0.1


#Sweep of Port_9A from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_9A = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_09 = 0 : NULL : WAIT = 0.2

#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Port_9B from 5000 to 20000 in 5000 increments

#test feedback
NULL : Port_9B = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.2


#Finished with mode
#switch out load line
J2_10 = 0 : NULL : WAIT = 0.1
MrSignalSetValue = 0.0 : NULL : WAIT = 0.2
MrSignalEnable = 0 : NULL : WAIT = 0.2
#switch out 420ma gen
J4_05 = 0 : NULL : WAIT = 0.2
SAVE
END
