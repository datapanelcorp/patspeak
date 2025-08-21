#34044-1
#Verion 0.0
#input test
UUT_DBC = 34044-561.dbc
UUT_DATANAME = 34044-1-INPUT-RATIO-14_5

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


#-----setup main supply-----
#setup meter
J0_10_MAIN_SUPPLY = 1 : NULL : WAIT = 1
PAUSE-VERIFY MAIN SUPPLY IS SET TO 14.5
NULL : MeterVolts = 14.5 | 0.1 | 0.1
J0_10_MAIN_SUPPLY = 0 : NULL : WAIT = 1

#setup PS1
PwrRemote = 1 : NULL : WAIT = 0.1
PwrSetCurrent = 20 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 1 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1

J4_03 = 1 : NULL : WAIT = 0.2
#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 9, MODE6A = 0, MODE6B = 9, MODE7A = 0, MODE7B = 9 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 9 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Input_5B from 1 to 14.5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.06896551724137931 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.10344827586206896 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.13793103448275862 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.1724137931034483 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.20689655172413793 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.2413793103448276 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.27586206896551724 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.3103448275862069 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.3448275862068966 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.3793103448275862 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.41379310344827586 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.4482758620689655 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.4827586206896552 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.5172413793103449 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.5517241379310345 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.5862068965517241 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.6206896551724138 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.6551724137931034 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.6896551724137931 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.7241379310344828 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.7586206896551724 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.7931034482758621 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.8275862068965517 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.8620689655172413 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.896551724137931 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.9310344827586207 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 0.9655172413793104 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_5B = 1.0 | 0.1 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.1

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 9, MODE6A = 0, MODE6B = 9, MODE7A = 0, MODE7B = 9 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 9 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_12 = 1 : NULL : WAIT = 0.1


#Sweep of Input_6B from 1 to 14.5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.06896551724137931 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.10344827586206896 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.13793103448275862 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.1724137931034483 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.20689655172413793 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.2413793103448276 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.27586206896551724 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.3103448275862069 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.3448275862068966 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.3793103448275862 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.41379310344827586 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.4482758620689655 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.4827586206896552 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.5172413793103449 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.5517241379310345 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.5862068965517241 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.6206896551724138 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.6551724137931034 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.6896551724137931 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.7241379310344828 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.7586206896551724 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.7931034482758621 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.8275862068965517 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.8620689655172413 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.896551724137931 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.9310344827586207 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 0.9655172413793104 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_6B = 1.0 | 0.1 | 0.1

#Finished with port
#switch out input
J2_12 = 0 : NULL : WAIT = 0.1

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 9, MODE6A = 0, MODE6B = 9, MODE7A = 0, MODE7B = 9 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 9 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J3_02 = 1 : NULL : WAIT = 0.1


#Sweep of Input_7B from 1 to 14.5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.06896551724137931 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.10344827586206896 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.13793103448275862 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.1724137931034483 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.20689655172413793 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.2413793103448276 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.27586206896551724 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.3103448275862069 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.3448275862068966 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.3793103448275862 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.41379310344827586 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.4482758620689655 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.4827586206896552 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.5172413793103449 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.5517241379310345 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.5862068965517241 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.6206896551724138 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.6551724137931034 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.6896551724137931 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.7241379310344828 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.7586206896551724 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.7931034482758621 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.8275862068965517 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.8620689655172413 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.896551724137931 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.9310344827586207 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 0.9655172413793104 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_7B = 1.0 | 0.1 | 0.1

#Finished with port
#switch out input
J3_02 = 0 : NULL : WAIT = 0.1

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 0, MODE5B = 9, MODE6A = 0, MODE6B = 9, MODE7A = 0, MODE7B = 9 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 0, MODE8B = 9 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J3_04 = 1 : NULL : WAIT = 0.1


#Sweep of Input_8B from 1 to 14.5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.06896551724137931 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.10344827586206896 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.13793103448275862 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.1724137931034483 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.20689655172413793 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.2413793103448276 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.27586206896551724 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.3103448275862069 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.3448275862068966 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.3793103448275862 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.41379310344827586 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.4482758620689655 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.4827586206896552 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.5172413793103449 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.5517241379310345 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.5862068965517241 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.6206896551724138 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.6551724137931034 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.6896551724137931 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.7241379310344828 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.7586206896551724 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.7931034482758621 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.8275862068965517 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.8620689655172413 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.896551724137931 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.9310344827586207 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 0.9655172413793104 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : Port_8B = 1.0 | 0.1 | 0.1

#Finished with port
#switch out input
J3_04 = 0 : NULL : WAIT = 0.1

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
J4_03 = 0 : NULL : WAIT = 0.2
SAVE
END
