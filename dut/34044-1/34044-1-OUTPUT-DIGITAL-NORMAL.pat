#34044-1
#Verion 0.0
#digital normal test using the E-LOAD
UUT_DBC = 34044-561.dbc
UUT_DATANAME = 34044-1-OUTPUT-DIGITAL-NORMAL

#-----setup 34044-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1, MODE5A = 1, MODE5B = 1, MODE6A = 1, MODE6B = 1, MODE7A = 1, MODE7B = 1 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 93, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL : WAIT = 0.5
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL : WAIT = 0.5
Command = 82, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1, Enable_Fault_Reset = 1 : NULL : WAIT = 0.5
Command = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0, Enable_Fault_Reset = 0 : NULL

#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1
NULL : OutStat1A = 0 | 0.1 | 0.1
NULL : OutStat1B = 0 | 0.1 | 0.1
NULL : OutStat2A = 0 | 0.1 | 0.1
NULL : OutStat2B = 0 | 0.1 | 0.1
NULL : OutStat3A = 0 | 0.1 | 0.1
NULL : OutStat3B = 0 | 0.1 | 0.1
NULL : OutStat4A = 0 | 0.1 | 0.1
NULL : OutStat4B = 0 | 0.1 | 0.1
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 0.0 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 0.1 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 0.2 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 0.3 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 0.4 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 0.5 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 0.6 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 0.7 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 0.8 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 0.9 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 1.0 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 1.1 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 1.2 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 1.3 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 1.4 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 1.5 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 1.6 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 1.7 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 1.8 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 1.9 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 2.0 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 2.1 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 2.2 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 2.3 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 2.4 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 2.5 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 2.6 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 2.7 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 2.8 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 2.9 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 3.0 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 3.1 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 3.2 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 3.3 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 3.4 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 3.5 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 3.6 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 3.7 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 3.8 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 3.9 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 4.0 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 4.1 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 4.2 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 4.3 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1A = 4.4 | 0.1 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : Feedback1A = 0 | 0.1 | 0.1
NULL : OutStat1A = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output1A = 0 : NULL : WAIT = 0.1
J2_01 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : OutStat1A = 0 | 0.1 | 0.1
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 0.0 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 0.1 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 0.2 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 0.3 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 0.4 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 0.5 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 0.6 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 0.7 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 0.8 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 0.9 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 1.0 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 1.1 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 1.2 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 1.3 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 1.4 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 1.5 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 1.6 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 1.7 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 1.8 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 1.9 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 2.0 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 2.1 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 2.2 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 2.3 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 2.4 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 2.5 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 2.6 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 2.7 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 2.8 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 2.9 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 3.0 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 3.1 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 3.2 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 3.3 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 3.4 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 3.5 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 3.6 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 3.7 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 3.8 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 3.9 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 4.0 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 4.1 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 4.2 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 4.3 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback1B = 4.4 | 0.1 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output1B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : Feedback1B = 0 | 0.1 | 0.1
NULL : OutStat1B = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output1B = 0 : NULL : WAIT = 0.1
J2_02 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : OutStat1B = 0 | 0.1 | 0.1
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.0 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.1 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.2 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.3 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.4 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.5 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.6 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.7 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.8 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 0.9 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.0 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.1 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.2 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.3 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.4 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.5 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.6 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.7 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.8 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 1.9 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.0 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.1 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.2 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.3 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.4 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.5 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.6 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.7 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.8 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 2.9 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 3.0 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 3.1 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 3.2 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 3.3 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 3.4 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 3.5 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 3.6 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 3.7 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 3.8 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 3.9 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 4.0 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 4.1 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 4.2 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 4.3 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2A = 4.4 | 0.1 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : Feedback2A = 0 | 0.1 | 0.1
NULL : OutStat2A = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output2A = 0 : NULL : WAIT = 0.1
J2_03 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : OutStat2A = 0 | 0.1 | 0.1
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.0 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.1 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.2 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.3 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.4 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.5 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.6 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.7 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.8 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 0.9 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.0 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.1 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.2 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.3 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.4 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.5 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.6 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.7 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.8 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 1.9 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.0 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.1 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.2 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.3 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.4 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.5 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.6 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.7 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.8 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 2.9 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 3.0 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 3.1 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 3.2 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 3.3 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 3.4 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 3.5 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 3.6 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 3.7 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 3.8 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 3.9 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 4.0 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 4.1 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 4.2 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 4.3 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback2B = 4.4 | 0.1 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : Feedback2B = 0 | 0.1 | 0.1
NULL : OutStat2B = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output2B = 0 : NULL : WAIT = 0.1
J2_04 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : OutStat2B = 0 | 0.1 | 0.1
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 0.0 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 0.1 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 0.2 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 0.3 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 0.4 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 0.5 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 0.6 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 0.7 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 0.8 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 0.9 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 1.0 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 1.1 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 1.2 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 1.3 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 1.4 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 1.5 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 1.6 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 1.7 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 1.8 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 1.9 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 2.0 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 2.1 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 2.2 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 2.3 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 2.4 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 2.5 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 2.6 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 2.7 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 2.8 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 2.9 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 3.0 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 3.1 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 3.2 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 3.3 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 3.4 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 3.5 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 3.6 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 3.7 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 3.8 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 3.9 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 4.0 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 4.1 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 4.2 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 4.3 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3A = 4.4 | 0.1 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : Feedback3A = 0 | 0.1 | 0.1
NULL : OutStat3A = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output3A = 0 : NULL : WAIT = 0.1
J2_05 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : OutStat3A = 0 | 0.1 | 0.1
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 0.0 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 0.1 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 0.2 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 0.3 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 0.4 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 0.5 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 0.6 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 0.7 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 0.8 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 0.9 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 1.0 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 1.1 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 1.2 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 1.3 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 1.4 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 1.5 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 1.6 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 1.7 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 1.8 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 1.9 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 2.0 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 2.1 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 2.2 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 2.3 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 2.4 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 2.5 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 2.6 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 2.7 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 2.8 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 2.9 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 3.0 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 3.1 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 3.2 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 3.3 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 3.4 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 3.5 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 3.6 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 3.7 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 3.8 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 3.9 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 4.0 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 4.1 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 4.2 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 4.3 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback3B = 4.4 | 0.1 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output3B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : Feedback3B = 0 | 0.1 | 0.1
NULL : OutStat3B = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output3B = 0 : NULL : WAIT = 0.1
J2_06 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : OutStat3B = 0 | 0.1 | 0.1
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.0 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.1 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.2 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.3 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.4 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.5 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.6 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.7 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.8 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 0.9 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.0 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.1 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.2 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.3 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.4 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.5 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.6 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.7 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.8 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 1.9 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.0 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.1 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.2 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.3 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.4 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.5 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.6 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.7 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.8 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 2.9 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 3.0 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 3.1 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 3.2 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 3.3 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 3.4 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 3.5 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 3.6 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 3.7 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 3.8 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 3.9 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 4.0 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 4.1 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 4.2 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 4.3 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4A = 4.4 | 0.1 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : Feedback4A = 0 | 0.1 | 0.1
NULL : OutStat4A = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output4A = 0 : NULL : WAIT = 0.1
J2_07 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : OutStat4A = 0 | 0.1 | 0.1
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.0 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.1 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.2 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.3 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.4 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.5 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.6 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.7 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.8 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 0.9 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.0 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.1 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.2 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.3 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.4 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.5 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.6 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.7 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.8 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 1900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 1.9 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.0 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.1 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.2 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.3 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.4 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.5 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.6 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.7 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.8 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 2900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 2.9 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 3.0 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 3.1 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 3.2 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 3.3 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 3.4 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3500: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 3.5 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3600: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 3.6 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3700: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 3.7 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3800: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 3.8 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 3900: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 3.9 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4000: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 4.0 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4100: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 4.1 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4200: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 4.2 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4300: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 4.3 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4400: NULL : WAIT = 0.1
#verify reading from load
NULL : Feedback4B = 4.4 | 0.1 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.4 | 0.1 | 0.1

#set current and turn on output and verify feedback
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
LdCurrentSet = 4500: NULL : WAIT = 0.1
#verify fault #1
NULL : Feedback4B = 0 | 0.1 | 0.1
NULL : OutStat4B = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output4B = 0 : NULL : WAIT = 0.1
J2_08 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : OutStat4B = 0 | 0.1 | 0.1
#verify fault #1 cleared
NULL : OutStat1A = 0 | 0.1 | 0.1
NULL : OutStat1B = 0 | 0.1 | 0.1
NULL : OutStat2A = 0 | 0.1 | 0.1
NULL : OutStat2B = 0 | 0.1 | 0.1
NULL : OutStat3A = 0 | 0.1 | 0.1
NULL : OutStat3B = 0 | 0.1 | 0.1
NULL : OutStat4A = 0 | 0.1 | 0.1
NULL : OutStat4B = 0 | 0.1 | 0.1
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1

#verify fault #1 clear
NULL : OutStat1A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output1A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : OutStat1A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output1A = 0 : NULL : WAIT = 0.2

#verify fault #2 clear
NULL : OutStat1A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output1A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : OutStat1A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output1A = 0 : NULL : WAIT = 0.2

#verify fault #3 clear
NULL : OutStat1A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output1A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : OutStat1A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output1A = 0 : NULL : WAIT = 0.2

#verify fault #4 clear
NULL : OutStat1A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output1A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : OutStat1A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output1A = 0 : NULL : WAIT = 0.2

#verify fault #5 sticks
NULL : OutStat1A = 2 | 0 | 0.1
#switch out load line, clear current
Output1A = 0 : NULL : WAIT = 0.1
J2_01 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1

#verify fault #1 clear
NULL : OutStat1B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output1B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : OutStat1B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output1B = 0 : NULL : WAIT = 0.2

#verify fault #2 clear
NULL : OutStat1B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output1B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : OutStat1B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output1B = 0 : NULL : WAIT = 0.2

#verify fault #3 clear
NULL : OutStat1B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output1B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : OutStat1B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output1B = 0 : NULL : WAIT = 0.2

#verify fault #4 clear
NULL : OutStat1B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output1B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : OutStat1B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output1B = 0 : NULL : WAIT = 0.2

#verify fault #5 sticks
NULL : OutStat1B = 2 | 0 | 0.1
#switch out load line, clear current
Output1B = 0 : NULL : WAIT = 0.1
J2_02 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5
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
J2_03 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5
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
J2_04 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1

#verify fault #1 clear
NULL : OutStat3A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output3A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : OutStat3A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output3A = 0 : NULL : WAIT = 0.2

#verify fault #2 clear
NULL : OutStat3A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output3A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : OutStat3A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output3A = 0 : NULL : WAIT = 0.2

#verify fault #3 clear
NULL : OutStat3A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output3A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : OutStat3A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output3A = 0 : NULL : WAIT = 0.2

#verify fault #4 clear
NULL : OutStat3A = 0 | 0 | 0.1
#turn ON output
Command = 81, Output3A = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : OutStat3A = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output3A = 0 : NULL : WAIT = 0.2

#verify fault #5 sticks
NULL : OutStat3A = 2 | 0 | 0.1
#switch out load line, clear current
Output3A = 0 : NULL : WAIT = 0.1
J2_05 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5000: NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1

#verify fault #1 clear
NULL : OutStat3B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output3B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #2
NULL : OutStat3B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output3B = 0 : NULL : WAIT = 0.2

#verify fault #2 clear
NULL : OutStat3B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output3B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #3
NULL : OutStat3B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output3B = 0 : NULL : WAIT = 0.2

#verify fault #3 clear
NULL : OutStat3B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output3B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #4
NULL : OutStat3B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output3B = 0 : NULL : WAIT = 0.2

#verify fault #4 clear
NULL : OutStat3B = 0 | 0 | 0.1
#turn ON output
Command = 81, Output3B = 1 : NULL : WAIT = 0.2
#enable load
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault #5
NULL : OutStat3B = 2 | 0 | 0.1
#disable load
LdEnable = 0 : NULL : WAIT = 0.1
#turn OFF output
Command = 81, Output3B = 0 : NULL : WAIT = 0.2

#verify fault #5 sticks
NULL : OutStat3B = 2 | 0 | 0.1
#switch out load line, clear current
Output3B = 0 : NULL : WAIT = 0.1
J2_06 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5
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
J2_07 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5
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
J2_08 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : OutStat1A = 2 | 0.1 | 0.1
NULL : OutStat1B = 2 | 0.1 | 0.1
NULL : OutStat2A = 2 | 0.1 | 0.1
NULL : OutStat2B = 2 | 0.1 | 0.1
NULL : OutStat3A = 2 | 0.1 | 0.1
NULL : OutStat3B = 2 | 0.1 | 0.1
NULL : OutStat4A = 2 | 0.1 | 0.1
NULL : OutStat4B = 2 | 0.1 | 0.1
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
SAVE
END
