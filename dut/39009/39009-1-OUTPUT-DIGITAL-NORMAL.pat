#39009-1
#Verion 0.0
#digital normal test using the E-LOAD
#adjusted trip-transition band due to passive resistive calibration
UUT_DBC = 39009-561.dbc
UUT_DATANAME = 39009-1-OUTPUT-DIGITAL-NORMAL

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1, MODE5A = 1, MODE5B = 1, MODE6A = 1, MODE6B = 1, MODE7A = 1, MODE7B = 1 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 1, MODE9B = 1, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1, Enable_Fault_Reset = 1 : NULL : WAIT = 0.5
Command = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0, Enable_Fault_Reset = 0 : NULL

#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1
NULL : OutStat2A = 0 | 0.1 | 0.1
NULL : OutStat2B = 0 | 0.1 | 0.1
NULL : OutStat4A = 0 | 0.1 | 0.1
NULL : OutStat4B = 0 | 0.1 | 0.1
NULL : OutStat6A = 0 | 0.1 | 0.1
NULL : OutStat6B = 0 | 0.1 | 0.1
NULL : OutStat8A = 0 | 0.1 | 0.1
NULL : OutStat8B = 0 | 0.1 | 0.1
NULL : OutStat10A = 0 | 0.1 | 0.1
NULL : OutStat10B = 0 | 0.1 | 0.1
#switch in load line, set current
LdEnable = 1 : NULL : WAIT = 0.1
J3_01 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.0 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.1 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.2 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.3 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.4 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.5 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.6 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.7 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.8 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.9 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.0 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.1 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.2 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.3 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.4 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.5 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.6 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.7 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.8 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.9 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.0 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.1 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.2 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.3 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.4 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.5 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.6 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.7 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.8 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.9 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 3.0 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 3.1 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 3.2 | 0.5 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#end-of-sweep forced fault confirmation (passive resistive calibration)
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.2
NULL : Feedback2A = 0 | 0.1 | 0.1
NULL : OutStat2A = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.05 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.5
Output2A = 0 : NULL : WAIT = 0.1
J3_01 = 0 : NULL : WAIT = 0.5
NULL : OutStat2A = 0 | 0.1 | 0.1
#switch in load line, set current
LdEnable = 1 : NULL : WAIT = 0.1
J3_02 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.0 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.1 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.2 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.3 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.4 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.5 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.6 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.7 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.8 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.9 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.0 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.1 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.2 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.3 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.4 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.5 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.6 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.7 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.8 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.9 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.0 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.1 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.2 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.3 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.4 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.5 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.6 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.7 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.8 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.9 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 3.0 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 3.1 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 3.2 | 0.5 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#end-of-sweep forced fault confirmation (passive resistive calibration)
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.2
NULL : Feedback2B = 0 | 0.1 | 0.1
NULL : OutStat2B = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.05 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.5
Output2B = 0 : NULL : WAIT = 0.1
J3_02 = 0 : NULL : WAIT = 0.5
NULL : OutStat2B = 0 | 0.1 | 0.1
#switch in load line, set current
LdEnable = 1 : NULL : WAIT = 0.1
J3_03 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.0 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.1 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.2 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.3 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.4 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.5 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.6 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.7 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.8 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.9 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.0 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.1 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.2 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.3 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.4 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.5 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.6 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.7 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.8 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.9 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.0 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.1 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.2 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.3 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.4 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.5 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.6 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.7 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.8 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.9 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 3.0 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 3.1 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 3.2 | 0.5 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#end-of-sweep forced fault confirmation (passive resistive calibration)
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.2
NULL : Feedback4A = 0 | 0.1 | 0.1
NULL : OutStat4A = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.05 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.5
Output4A = 0 : NULL : WAIT = 0.1
J3_03 = 0 : NULL : WAIT = 0.5
NULL : OutStat4A = 0 | 0.1 | 0.1
#switch in load line, set current
LdEnable = 1 : NULL : WAIT = 0.1
J3_04 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.0 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.1 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.2 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.3 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.4 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.5 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.6 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.7 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.8 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.9 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.0 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.1 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.2 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.3 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.4 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.5 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.6 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.7 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.8 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.9 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.0 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.1 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.2 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.3 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.4 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.5 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.6 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.7 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.8 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.9 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 3.0 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 3.1 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 3.2 | 0.5 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#end-of-sweep forced fault confirmation (passive resistive calibration)
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.2
NULL : Feedback4B = 0 | 0.1 | 0.1
NULL : OutStat4B = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.05 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.5
Output4B = 0 : NULL : WAIT = 0.1
J3_04 = 0 : NULL : WAIT = 0.5
NULL : OutStat4B = 0 | 0.1 | 0.1
#switch in load line, set current
LdEnable = 1 : NULL : WAIT = 0.1
J3_05 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 0.0 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 0.1 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 0.2 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 0.3 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 0.4 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 0.5 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 0.6 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 0.7 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 0.8 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 0.9 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 1.0 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 1.1 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 1.2 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 1.3 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 1.4 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 1.5 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 1.6 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 1.7 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 1.8 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 1.9 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 2.0 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 2.1 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 2.2 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 2.3 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 2.4 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 2.5 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 2.6 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 2.7 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 2.8 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 2.9 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 3.0 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 3.1 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6A = 3.2 | 0.5 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#end-of-sweep forced fault confirmation (passive resistive calibration)
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.2
NULL : Feedback6A = 0 | 0.1 | 0.1
NULL : OutStat6A = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.05 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.5
Output6A = 0 : NULL : WAIT = 0.1
J3_05 = 0 : NULL : WAIT = 0.5
NULL : OutStat6A = 0 | 0.1 | 0.1
#switch in load line, set current
LdEnable = 1 : NULL : WAIT = 0.1
J3_06 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 0.0 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 0.1 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 0.2 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 0.3 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 0.4 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 0.5 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 0.6 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 0.7 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 0.8 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 0.9 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 1.0 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 1.1 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 1.2 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 1.3 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 1.4 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 1.5 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 1.6 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 1.7 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 1.8 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 1.9 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 2.0 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 2.1 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 2.2 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 2.3 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 2.4 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 2.5 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 2.6 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 2.7 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 2.8 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 2.9 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 3.0 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 3.1 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback6B = 3.2 | 0.5 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#end-of-sweep forced fault confirmation (passive resistive calibration)
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.2
NULL : Feedback6B = 0 | 0.1 | 0.1
NULL : OutStat6B = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.05 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.5
Output6B = 0 : NULL : WAIT = 0.1
J3_06 = 0 : NULL : WAIT = 0.5
NULL : OutStat6B = 0 | 0.1 | 0.1
#switch in load line, set current
LdEnable = 1 : NULL : WAIT = 0.1
J3_07 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 0.0 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 0.1 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 0.2 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 0.3 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 0.4 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 0.5 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 0.6 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 0.7 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 0.8 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 0.9 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 1.0 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 1.1 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 1.2 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 1.3 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 1.4 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 1.5 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 1.6 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 1.7 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 1.8 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 1.9 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 2.0 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 2.1 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 2.2 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 2.3 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 2.4 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 2.5 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 2.6 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 2.7 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 2.8 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 2.9 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 3.0 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 3.1 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8A = 3.2 | 0.5 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#end-of-sweep forced fault confirmation (passive resistive calibration)
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.2
NULL : Feedback8A = 0 | 0.1 | 0.1
NULL : OutStat8A = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.05 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.5
Output8A = 0 : NULL : WAIT = 0.1
J3_07 = 0 : NULL : WAIT = 0.5
NULL : OutStat8A = 0 | 0.1 | 0.1
#switch in load line, set current
LdEnable = 1 : NULL : WAIT = 0.1
J3_08 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 0.0 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 0.1 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 0.2 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 0.3 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 0.4 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 0.5 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 0.6 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 0.7 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 0.8 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 0.9 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 1.0 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 1.1 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 1.2 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 1.3 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 1.4 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 1.5 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 1.6 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 1.7 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 1.8 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 1.9 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 2.0 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 2.1 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 2.2 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 2.3 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 2.4 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 2.5 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 2.6 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 2.7 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 2.8 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 2.9 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 3.0 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 3.1 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback8B = 3.2 | 0.5 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#end-of-sweep forced fault confirmation (passive resistive calibration)
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.2
NULL : Feedback8B = 0 | 0.1 | 0.1
NULL : OutStat8B = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.05 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.5
Output8B = 0 : NULL : WAIT = 0.1
J3_08 = 0 : NULL : WAIT = 0.5
NULL : OutStat8B = 0 | 0.1 | 0.1
#switch in load line, set current
LdEnable = 1 : NULL : WAIT = 0.1
J3_09 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 0.0 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 0.1 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 0.2 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 0.3 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 0.4 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 0.5 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 0.6 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 0.7 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 0.8 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 0.9 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 1.0 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 1.1 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 1.2 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 1.3 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 1.4 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 1.5 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 1.6 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 1.7 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 1.8 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 1.9 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 2.0 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 2.1 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 2.2 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 2.3 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 2.4 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 2.5 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 2.6 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 2.7 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 2.8 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 2.9 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 3.0 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 3.1 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10A = 3.2 | 0.5 | 0.1
NULL : OutStat10A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#end-of-sweep forced fault confirmation (passive resistive calibration)
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.2
NULL : Feedback10A = 0 | 0.1 | 0.1
NULL : OutStat10A = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.05 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.5
Output10A = 0 : NULL : WAIT = 0.1
J3_09 = 0 : NULL : WAIT = 0.5
NULL : OutStat10A = 0 | 0.1 | 0.1
#switch in load line, set current
LdEnable = 1 : NULL : WAIT = 0.1
J3_10 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 0.0 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 0.1 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 0.2 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 0.3 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 0.4 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 0.5 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 0.6 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 0.7 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 0.8 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 0.9 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 1.0 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 1.1 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 1.2 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 1.3 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 1.4 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 1.5 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 1.6 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 1.7 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 1.8 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 1.9 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 2.0 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 2.1 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 2.2 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 2.3 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 2.4 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 2.5 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 2.6 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 2.7 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 2.8 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 2.9 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 3.0 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 3.1 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback10B = 3.2 | 0.5 | 0.1
NULL : OutStat10B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#set current and turn on output and verify feedback
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#trip transition window (passive resistive calibration): no hard assertion

#end-of-sweep forced fault confirmation (passive resistive calibration)
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.2
NULL : Feedback10B = 0 | 0.1 | 0.1
NULL : OutStat10B = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.05 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.5
Output10B = 0 : NULL : WAIT = 0.1
J3_10 = 0 : NULL : WAIT = 0.5
NULL : OutStat10B = 0 | 0.1 | 0.1
#verify fault #1 cleared
NULL : OutStat2A = 0 | 0.1 | 0.1
NULL : OutStat2B = 0 | 0.1 | 0.1
NULL : OutStat4A = 0 | 0.1 | 0.1
NULL : OutStat4B = 0 | 0.1 | 0.1
NULL : OutStat6A = 0 | 0.1 | 0.1
NULL : OutStat6B = 0 | 0.1 | 0.1
NULL : OutStat8A = 0 | 0.1 | 0.1
NULL : OutStat8B = 0 | 0.1 | 0.1
NULL : OutStat10A = 0 | 0.1 | 0.1
NULL : OutStat10B = 0 | 0.1 | 0.1
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1

#verify fault #1 clear
NULL : OutStat2A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output2A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : OutStat2A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output2A = 0 : NULL : WAIT = 0.2

#verify fault #2 clear
NULL : OutStat2A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output2A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : OutStat2A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output2A = 0 : NULL : WAIT = 0.2

#verify fault #3 clear
NULL : OutStat2A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output2A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : OutStat2A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output2A = 0 : NULL : WAIT = 0.2

#verify fault #4 clear
NULL : OutStat2A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output2A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : OutStat2A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output2A = 0 : NULL : WAIT = 0.2

#verify fault #5 sticks
NULL : OutStat2A = 2 | 0 | 0.1
#switch out load line, clear current
Output2A = 0 : NULL : WAIT = 0.1
J3_01 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1

#verify fault #1 clear
NULL : OutStat2B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output2B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : OutStat2B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output2B = 0 : NULL : WAIT = 0.2

#verify fault #2 clear
NULL : OutStat2B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output2B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : OutStat2B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output2B = 0 : NULL : WAIT = 0.2

#verify fault #3 clear
NULL : OutStat2B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output2B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : OutStat2B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output2B = 0 : NULL : WAIT = 0.2

#verify fault #4 clear
NULL : OutStat2B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output2B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : OutStat2B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output2B = 0 : NULL : WAIT = 0.2

#verify fault #5 sticks
NULL : OutStat2B = 2 | 0 | 0.1
#switch out load line, clear current
Output2B = 0 : NULL : WAIT = 0.1
J3_02 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1

#verify fault #1 clear
NULL : OutStat4A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output4A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : OutStat4A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output4A = 0 : NULL : WAIT = 0.2

#verify fault #2 clear
NULL : OutStat4A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output4A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : OutStat4A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output4A = 0 : NULL : WAIT = 0.2

#verify fault #3 clear
NULL : OutStat4A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output4A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : OutStat4A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output4A = 0 : NULL : WAIT = 0.2

#verify fault #4 clear
NULL : OutStat4A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output4A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : OutStat4A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output4A = 0 : NULL : WAIT = 0.2

#verify fault #5 sticks
NULL : OutStat4A = 2 | 0 | 0.1
#switch out load line, clear current
Output4A = 0 : NULL : WAIT = 0.1
J3_03 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1

#verify fault #1 clear
NULL : OutStat4B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output4B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : OutStat4B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output4B = 0 : NULL : WAIT = 0.2

#verify fault #2 clear
NULL : OutStat4B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output4B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : OutStat4B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output4B = 0 : NULL : WAIT = 0.2

#verify fault #3 clear
NULL : OutStat4B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output4B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : OutStat4B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output4B = 0 : NULL : WAIT = 0.2

#verify fault #4 clear
NULL : OutStat4B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output4B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : OutStat4B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output4B = 0 : NULL : WAIT = 0.2

#verify fault #5 sticks
NULL : OutStat4B = 2 | 0 | 0.1
#switch out load line, clear current
Output4B = 0 : NULL : WAIT = 0.1
J3_04 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J3_05 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1

#verify fault #1 clear
NULL : OutStat6A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output6A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : OutStat6A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output6A = 0 : NULL : WAIT = 0.2

#verify fault #2 clear
NULL : OutStat6A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output6A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : OutStat6A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output6A = 0 : NULL : WAIT = 0.2

#verify fault #3 clear
NULL : OutStat6A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output6A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : OutStat6A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output6A = 0 : NULL : WAIT = 0.2

#verify fault #4 clear
NULL : OutStat6A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output6A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : OutStat6A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output6A = 0 : NULL : WAIT = 0.2

#verify fault #5 sticks
NULL : OutStat6A = 2 | 0 | 0.1
#switch out load line, clear current
Output6A = 0 : NULL : WAIT = 0.1
J3_05 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J3_06 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1

#verify fault #1 clear
NULL : OutStat6B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output6B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : OutStat6B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output6B = 0 : NULL : WAIT = 0.2

#verify fault #2 clear
NULL : OutStat6B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output6B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : OutStat6B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output6B = 0 : NULL : WAIT = 0.2

#verify fault #3 clear
NULL : OutStat6B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output6B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : OutStat6B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output6B = 0 : NULL : WAIT = 0.2

#verify fault #4 clear
NULL : OutStat6B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output6B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : OutStat6B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output6B = 0 : NULL : WAIT = 0.2

#verify fault #5 sticks
NULL : OutStat6B = 2 | 0 | 0.1
#switch out load line, clear current
Output6B = 0 : NULL : WAIT = 0.1
J3_06 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J3_07 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1

#verify fault #1 clear
NULL : OutStat8A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output8A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : OutStat8A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output8A = 0 : NULL : WAIT = 0.2

#verify fault #2 clear
NULL : OutStat8A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output8A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : OutStat8A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output8A = 0 : NULL : WAIT = 0.2

#verify fault #3 clear
NULL : OutStat8A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output8A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : OutStat8A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output8A = 0 : NULL : WAIT = 0.2

#verify fault #4 clear
NULL : OutStat8A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output8A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : OutStat8A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output8A = 0 : NULL : WAIT = 0.2

#verify fault #5 sticks
NULL : OutStat8A = 2 | 0 | 0.1
#switch out load line, clear current
Output8A = 0 : NULL : WAIT = 0.1
J3_07 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J3_08 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1

#verify fault #1 clear
NULL : OutStat8B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output8B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : OutStat8B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output8B = 0 : NULL : WAIT = 0.2

#verify fault #2 clear
NULL : OutStat8B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output8B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : OutStat8B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output8B = 0 : NULL : WAIT = 0.2

#verify fault #3 clear
NULL : OutStat8B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output8B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : OutStat8B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output8B = 0 : NULL : WAIT = 0.2

#verify fault #4 clear
NULL : OutStat8B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output8B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : OutStat8B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output8B = 0 : NULL : WAIT = 0.2

#verify fault #5 sticks
NULL : OutStat8B = 2 | 0 | 0.1
#switch out load line, clear current
Output8B = 0 : NULL : WAIT = 0.1
J3_08 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J3_09 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1

#verify fault #1 clear
NULL : OutStat10A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output10A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : OutStat10A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output10A = 0 : NULL : WAIT = 0.2

#verify fault #2 clear
NULL : OutStat10A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output10A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : OutStat10A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output10A = 0 : NULL : WAIT = 0.2

#verify fault #3 clear
NULL : OutStat10A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output10A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : OutStat10A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output10A = 0 : NULL : WAIT = 0.2

#verify fault #4 clear
NULL : OutStat10A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output10A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : OutStat10A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output10A = 0 : NULL : WAIT = 0.2

#verify fault #5 sticks
NULL : OutStat10A = 2 | 0 | 0.1
#switch out load line, clear current
Output10A = 0 : NULL : WAIT = 0.1
J3_09 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J3_10 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1

#verify fault #1 clear
NULL : OutStat10B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output10B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : OutStat10B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output10B = 0 : NULL : WAIT = 0.2

#verify fault #2 clear
NULL : OutStat10B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output10B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : OutStat10B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output10B = 0 : NULL : WAIT = 0.2

#verify fault #3 clear
NULL : OutStat10B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output10B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : OutStat10B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output10B = 0 : NULL : WAIT = 0.2

#verify fault #4 clear
NULL : OutStat10B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output10B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : OutStat10B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output10B = 0 : NULL : WAIT = 0.2

#verify fault #5 sticks
NULL : OutStat10B = 2 | 0 | 0.1
#switch out load line, clear current
Output10B = 0 : NULL : WAIT = 0.1
J3_10 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : OutStat2A = 2 | 0.1 | 0.1
NULL : OutStat2B = 2 | 0.1 | 0.1
NULL : OutStat4A = 2 | 0.1 | 0.1
NULL : OutStat4B = 2 | 0.1 | 0.1
NULL : OutStat6A = 2 | 0.1 | 0.1
NULL : OutStat6B = 2 | 0.1 | 0.1
NULL : OutStat8A = 2 | 0.1 | 0.1
NULL : OutStat8B = 2 | 0.1 | 0.1
NULL : OutStat10A = 2 | 0.1 | 0.1
NULL : OutStat10B = 2 | 0.1 | 0.1
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
SAVE
END
