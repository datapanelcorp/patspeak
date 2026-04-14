#34044-1
#Verion 0.0
#input test
UUT_DBC = 34044-561.dbc
UUT_DATANAME = 34044-1-INPUT-420MA

#-----setup 34044-----
Command = 93, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
#switch in 420ma gen
J4_01 = 1 : NULL : WAIT = 0.2
NULL : Input_5B = 0 | 0.1 | 0.1
NULL : Input_6B = 0 | 0.1 | 0.1
NULL : Input_7B = 0 | 0.1 | 0.1
NULL : Input_8B = 0 | 0.1 | 0.1
#promp user
PAUSE- SET GEN TO 5000ma
#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 3, MODE6A = 0, MODE6B = 3, MODE7A = 0, MODE7B = 3 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 3 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Input_5B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.005 | 0.01 | 0.5
#test feedback
NULL : Port_5B = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.2

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 3, MODE6A = 0, MODE6B = 3, MODE7A = 0, MODE7B = 3 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 3 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J2_12 = 1 : NULL : WAIT = 0.1


#Sweep of Input_6B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.005 | 0.01 | 0.5
#test feedback
NULL : Port_6B = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_12 = 0 : NULL : WAIT = 0.2

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 3, MODE6A = 0, MODE6B = 3, MODE7A = 0, MODE7B = 3 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 3 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_02 = 1 : NULL : WAIT = 0.1


#Sweep of Input_7B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.005 | 0.01 | 0.5
#test feedback
NULL : Port_7B = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J3_02 = 0 : NULL : WAIT = 0.2

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 3, MODE6A = 0, MODE6B = 3, MODE7A = 0, MODE7B = 3 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 3 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_04 = 1 : NULL : WAIT = 0.1


#Sweep of Input_8B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.005 | 0.01 | 0.5
#test feedback
NULL : Port_8B = 5.0 | 0.155 | 0.1

#Finished with port
#switch out input
J3_04 = 0 : NULL : WAIT = 0.2

#promp user
PAUSE- SET GEN TO 10000ma
#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 3, MODE6A = 0, MODE6B = 3, MODE7A = 0, MODE7B = 3 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 3 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Input_5B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.01 | 0.01 | 0.5
#test feedback
NULL : Port_5B = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.2

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 3, MODE6A = 0, MODE6B = 3, MODE7A = 0, MODE7B = 3 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 3 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J2_12 = 1 : NULL : WAIT = 0.1


#Sweep of Input_6B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.01 | 0.01 | 0.5
#test feedback
NULL : Port_6B = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_12 = 0 : NULL : WAIT = 0.2

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 3, MODE6A = 0, MODE6B = 3, MODE7A = 0, MODE7B = 3 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 3 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_02 = 1 : NULL : WAIT = 0.1


#Sweep of Input_7B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.01 | 0.01 | 0.5
#test feedback
NULL : Port_7B = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J3_02 = 0 : NULL : WAIT = 0.2

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 3, MODE6A = 0, MODE6B = 3, MODE7A = 0, MODE7B = 3 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 3 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_04 = 1 : NULL : WAIT = 0.1


#Sweep of Input_8B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.01 | 0.01 | 0.5
#test feedback
NULL : Port_8B = 10.0 | 0.155 | 0.1

#Finished with port
#switch out input
J3_04 = 0 : NULL : WAIT = 0.2

#promp user
PAUSE- SET GEN TO 15000ma
#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 3, MODE6A = 0, MODE6B = 3, MODE7A = 0, MODE7B = 3 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 3 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Input_5B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.015 | 0.01 | 0.5
#test feedback
NULL : Port_5B = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.2

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 3, MODE6A = 0, MODE6B = 3, MODE7A = 0, MODE7B = 3 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 3 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J2_12 = 1 : NULL : WAIT = 0.1


#Sweep of Input_6B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.015 | 0.01 | 0.5
#test feedback
NULL : Port_6B = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_12 = 0 : NULL : WAIT = 0.2

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 3, MODE6A = 0, MODE6B = 3, MODE7A = 0, MODE7B = 3 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 3 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_02 = 1 : NULL : WAIT = 0.1


#Sweep of Input_7B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.015 | 0.01 | 0.5
#test feedback
NULL : Port_7B = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J3_02 = 0 : NULL : WAIT = 0.2

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 3, MODE6A = 0, MODE6B = 3, MODE7A = 0, MODE7B = 3 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 3 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_04 = 1 : NULL : WAIT = 0.1


#Sweep of Input_8B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.015 | 0.01 | 0.5
#test feedback
NULL : Port_8B = 15.0 | 0.155 | 0.1

#Finished with port
#switch out input
J3_04 = 0 : NULL : WAIT = 0.2

#promp user
PAUSE- SET GEN TO 20000ma
#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 3, MODE6A = 0, MODE6B = 3, MODE7A = 0, MODE7B = 3 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 3 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Input_5B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.02 | 0.01 | 0.5
#test feedback
NULL : Port_5B = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.2

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 3, MODE6A = 0, MODE6B = 3, MODE7A = 0, MODE7B = 3 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 3 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J2_12 = 1 : NULL : WAIT = 0.1


#Sweep of Input_6B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.02 | 0.01 | 0.5
#test feedback
NULL : Port_6B = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J2_12 = 0 : NULL : WAIT = 0.2

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 3, MODE6A = 0, MODE6B = 3, MODE7A = 0, MODE7B = 3 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 3 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_02 = 1 : NULL : WAIT = 0.1


#Sweep of Input_7B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.02 | 0.01 | 0.5
#test feedback
NULL : Port_7B = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J3_02 = 0 : NULL : WAIT = 0.2

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 3, MODE6A = 0, MODE6B = 3, MODE7A = 0, MODE7B = 3 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 3 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_04 = 1 : NULL : WAIT = 0.1


#Sweep of Input_8B from 5000 to 20000 in 5000 increments

#test ammmeter
NULL : MeterAmps = 0.02 | 0.01 | 0.5
#test feedback
NULL : Port_8B = 20.0 | 0.155 | 0.1

#Finished with port
#switch out input
J3_04 = 0 : NULL : WAIT = 0.2


#Finished with mode
#switch out load line
J3_04 = 0 : NULL : WAIT = 0.1
#switch out 420ma gen
J4_01 = 0 : NULL : WAIT = 0.2
SAVE
END
