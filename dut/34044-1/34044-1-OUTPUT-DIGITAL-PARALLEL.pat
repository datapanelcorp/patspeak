#34044-1
#Verion 0.0
#digital parallel test using the E-LOAD
UUT_DBC = 34044-561.dbc
UUT_DATANAME = 34044-1-OUTPUT-DIGITAL-PARALLEL

#-----setup 34044-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL : WAIT = 0.5
Command = 84, MODE8A = 1, MODE8B = 1 : NULL : WAIT = 0.5 : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0 : NULL : WAIT = 0.5 : WAIT = 0.5
Command = 82, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL : WAIT = 0.5
Command = 93, PORT1_MODE = 1, PORT2_MODE = 1, PORT3_MODE = 1, PORT4_MODE = 1 : NULL : WAIT = 0.5
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL : WAIT = 0.5
#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1
#switch outputs to load line
J2_01 = 1, J2_02 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.0 | 0.0 | 0.2
NULL : Feedback1B = 0.0 | 0.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.1 | 0.2 | 0.2
NULL : Feedback1B = 0.1 | 0.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.2 | 0.4 | 0.2
NULL : Feedback1B = 0.2 | 0.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.3 | 0.6 | 0.2
NULL : Feedback1B = 0.3 | 0.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.4 | 0.8 | 0.2
NULL : Feedback1B = 0.4 | 0.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.5 | 1.0 | 0.2
NULL : Feedback1B = 0.5 | 1.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.6 | 1.2 | 0.2
NULL : Feedback1B = 0.6 | 1.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.7 | 1.4 | 0.2
NULL : Feedback1B = 0.7 | 1.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.8 | 1.6 | 0.2
NULL : Feedback1B = 0.8 | 1.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.9 | 1.8 | 0.2
NULL : Feedback1B = 0.9 | 1.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.0 | 2.0 | 0.2
NULL : Feedback1B = 1.0 | 2.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.1 | 2.2 | 0.2
NULL : Feedback1B = 1.1 | 2.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.2 | 2.4 | 0.2
NULL : Feedback1B = 1.2 | 2.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.3 | 2.6 | 0.2
NULL : Feedback1B = 1.3 | 2.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.4 | 2.8 | 0.2
NULL : Feedback1B = 1.4 | 2.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.5 | 3.0 | 0.2
NULL : Feedback1B = 1.5 | 3.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.6 | 3.2 | 0.2
NULL : Feedback1B = 1.6 | 3.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.7 | 3.4 | 0.2
NULL : Feedback1B = 1.7 | 3.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.8 | 3.6 | 0.2
NULL : Feedback1B = 1.8 | 3.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.9 | 3.8 | 0.2
NULL : Feedback1B = 1.9 | 3.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.0 | 4.0 | 0.2
NULL : Feedback1B = 2.0 | 4.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.1 | 4.2 | 0.2
NULL : Feedback1B = 2.1 | 4.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.2 | 4.4 | 0.2
NULL : Feedback1B = 2.2 | 4.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.3 | 4.6 | 0.2
NULL : Feedback1B = 2.3 | 4.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.4 | 4.8 | 0.2
NULL : Feedback1B = 2.4 | 4.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.5 | 5.0 | 0.2
NULL : Feedback1B = 2.5 | 5.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.6 | 5.2 | 0.2
NULL : Feedback1B = 2.6 | 5.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.7 | 5.4 | 0.2
NULL : Feedback1B = 2.7 | 5.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.8 | 5.6 | 0.2
NULL : Feedback1B = 2.8 | 5.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.9 | 5.8 | 0.2
NULL : Feedback1B = 2.9 | 5.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.0 | 6.0 | 0.2
NULL : Feedback1B = 3.0 | 6.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.1 | 6.2 | 0.2
NULL : Feedback1B = 3.1 | 6.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.2 | 6.4 | 0.2
NULL : Feedback1B = 3.2 | 6.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.3 | 6.6 | 0.2
NULL : Feedback1B = 3.3 | 6.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.4 | 6.8 | 0.2
NULL : Feedback1B = 3.4 | 6.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.5 | 7.0 | 0.2
NULL : Feedback1B = 3.5 | 7.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.6 | 7.2 | 0.2
NULL : Feedback1B = 3.6 | 7.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.7 | 7.4 | 0.2
NULL : Feedback1B = 3.7 | 7.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.8 | 7.6 | 0.2
NULL : Feedback1B = 3.8 | 7.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.9 | 7.8 | 0.2
NULL : Feedback1B = 3.9 | 7.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.0 | 8.0 | 0.2
NULL : Feedback1B = 4.0 | 8.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.1 | 8.2 | 0.2
NULL : Feedback1B = 4.1 | 8.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.2 | 8.4 | 0.2
NULL : Feedback1B = 4.2 | 8.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.3 | 8.6 | 0.2
NULL : Feedback1B = 4.3 | 8.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.4 | 8.8 | 0.2
NULL : Feedback1B = 4.4 | 8.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 9000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : OutStat1A = 2 | 0.1 | 0.1
NULL : OutStat1B = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#disconnect outputs from load line, clear current
Output1A = 0 : NULL : WAIT = 0.1
J2_01 = 0, J2_02 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1

#switch outputs to load line
J2_03 = 1, J2_04 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.0 | 0.0 | 0.2
NULL : Feedback2B = 0.0 | 0.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.1 | 0.2 | 0.2
NULL : Feedback2B = 0.1 | 0.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.2 | 0.4 | 0.2
NULL : Feedback2B = 0.2 | 0.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.3 | 0.6 | 0.2
NULL : Feedback2B = 0.3 | 0.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.4 | 0.8 | 0.2
NULL : Feedback2B = 0.4 | 0.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.5 | 1.0 | 0.2
NULL : Feedback2B = 0.5 | 1.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.6 | 1.2 | 0.2
NULL : Feedback2B = 0.6 | 1.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.7 | 1.4 | 0.2
NULL : Feedback2B = 0.7 | 1.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.8 | 1.6 | 0.2
NULL : Feedback2B = 0.8 | 1.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.9 | 1.8 | 0.2
NULL : Feedback2B = 0.9 | 1.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.0 | 2.0 | 0.2
NULL : Feedback2B = 1.0 | 2.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.1 | 2.2 | 0.2
NULL : Feedback2B = 1.1 | 2.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.2 | 2.4 | 0.2
NULL : Feedback2B = 1.2 | 2.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.3 | 2.6 | 0.2
NULL : Feedback2B = 1.3 | 2.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.4 | 2.8 | 0.2
NULL : Feedback2B = 1.4 | 2.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.5 | 3.0 | 0.2
NULL : Feedback2B = 1.5 | 3.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.6 | 3.2 | 0.2
NULL : Feedback2B = 1.6 | 3.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.7 | 3.4 | 0.2
NULL : Feedback2B = 1.7 | 3.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.8 | 3.6 | 0.2
NULL : Feedback2B = 1.8 | 3.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.9 | 3.8 | 0.2
NULL : Feedback2B = 1.9 | 3.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.0 | 4.0 | 0.2
NULL : Feedback2B = 2.0 | 4.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.1 | 4.2 | 0.2
NULL : Feedback2B = 2.1 | 4.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.2 | 4.4 | 0.2
NULL : Feedback2B = 2.2 | 4.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4600, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.3 | 4.6 | 0.2
NULL : Feedback2B = 2.3 | 4.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4800, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.4 | 4.8 | 0.2
NULL : Feedback2B = 2.4 | 4.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5000, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.5 | 5.0 | 0.2
NULL : Feedback2B = 2.5 | 5.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5200, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.6 | 5.2 | 0.2
NULL : Feedback2B = 2.6 | 5.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5400, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.7 | 5.4 | 0.2
NULL : Feedback2B = 2.7 | 5.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5600, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.8 | 5.6 | 0.2
NULL : Feedback2B = 2.8 | 5.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5800, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.9 | 5.8 | 0.2
NULL : Feedback2B = 2.9 | 5.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6000, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.0 | 6.0 | 0.2
NULL : Feedback2B = 3.0 | 6.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6200, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.1 | 6.2 | 0.2
NULL : Feedback2B = 3.1 | 6.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6400, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.2 | 6.4 | 0.2
NULL : Feedback2B = 3.2 | 6.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6600, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.3 | 6.6 | 0.2
NULL : Feedback2B = 3.3 | 6.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6800, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.4 | 6.8 | 0.2
NULL : Feedback2B = 3.4 | 6.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7000, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.5 | 7.0 | 0.2
NULL : Feedback2B = 3.5 | 7.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7200, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.6 | 7.2 | 0.2
NULL : Feedback2B = 3.6 | 7.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7400, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.7 | 7.4 | 0.2
NULL : Feedback2B = 3.7 | 7.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7600, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.8 | 7.6 | 0.2
NULL : Feedback2B = 3.8 | 7.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7800, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.9 | 7.8 | 0.2
NULL : Feedback2B = 3.9 | 7.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8000, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.0 | 8.0 | 0.2
NULL : Feedback2B = 4.0 | 8.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8200, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.1 | 8.2 | 0.2
NULL : Feedback2B = 4.1 | 8.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8400, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.2 | 8.4 | 0.2
NULL : Feedback2B = 4.2 | 8.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8600, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.3 | 8.6 | 0.2
NULL : Feedback2B = 4.3 | 8.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8800, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.4 | 8.8 | 0.2
NULL : Feedback2B = 4.4 | 8.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 9000, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : OutStat2A = 2 | 0.1 | 0.1
NULL : OutStat2B = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#disconnect outputs from load line, clear current
Output2A = 0 : NULL : WAIT = 0.1
J2_03 = 0, J2_04 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1

#switch outputs to load line
J2_05 = 1, J2_06 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.0 | 0.0 | 0.2
NULL : Feedback3B = 0.0 | 0.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.1 | 0.2 | 0.2
NULL : Feedback3B = 0.1 | 0.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.2 | 0.4 | 0.2
NULL : Feedback3B = 0.2 | 0.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.3 | 0.6 | 0.2
NULL : Feedback3B = 0.3 | 0.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.4 | 0.8 | 0.2
NULL : Feedback3B = 0.4 | 0.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.5 | 1.0 | 0.2
NULL : Feedback3B = 0.5 | 1.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.6 | 1.2 | 0.2
NULL : Feedback3B = 0.6 | 1.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.7 | 1.4 | 0.2
NULL : Feedback3B = 0.7 | 1.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.8 | 1.6 | 0.2
NULL : Feedback3B = 0.8 | 1.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.9 | 1.8 | 0.2
NULL : Feedback3B = 0.9 | 1.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.0 | 2.0 | 0.2
NULL : Feedback3B = 1.0 | 2.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.1 | 2.2 | 0.2
NULL : Feedback3B = 1.1 | 2.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.2 | 2.4 | 0.2
NULL : Feedback3B = 1.2 | 2.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.3 | 2.6 | 0.2
NULL : Feedback3B = 1.3 | 2.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.4 | 2.8 | 0.2
NULL : Feedback3B = 1.4 | 2.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.5 | 3.0 | 0.2
NULL : Feedback3B = 1.5 | 3.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.6 | 3.2 | 0.2
NULL : Feedback3B = 1.6 | 3.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.7 | 3.4 | 0.2
NULL : Feedback3B = 1.7 | 3.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.8 | 3.6 | 0.2
NULL : Feedback3B = 1.8 | 3.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.9 | 3.8 | 0.2
NULL : Feedback3B = 1.9 | 3.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.0 | 4.0 | 0.2
NULL : Feedback3B = 2.0 | 4.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.1 | 4.2 | 0.2
NULL : Feedback3B = 2.1 | 4.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.2 | 4.4 | 0.2
NULL : Feedback3B = 2.2 | 4.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.3 | 4.6 | 0.2
NULL : Feedback3B = 2.3 | 4.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.4 | 4.8 | 0.2
NULL : Feedback3B = 2.4 | 4.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.5 | 5.0 | 0.2
NULL : Feedback3B = 2.5 | 5.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.6 | 5.2 | 0.2
NULL : Feedback3B = 2.6 | 5.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.7 | 5.4 | 0.2
NULL : Feedback3B = 2.7 | 5.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.8 | 5.6 | 0.2
NULL : Feedback3B = 2.8 | 5.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.9 | 5.8 | 0.2
NULL : Feedback3B = 2.9 | 5.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.0 | 6.0 | 0.2
NULL : Feedback3B = 3.0 | 6.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.1 | 6.2 | 0.2
NULL : Feedback3B = 3.1 | 6.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.2 | 6.4 | 0.2
NULL : Feedback3B = 3.2 | 6.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.3 | 6.6 | 0.2
NULL : Feedback3B = 3.3 | 6.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.4 | 6.8 | 0.2
NULL : Feedback3B = 3.4 | 6.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.5 | 7.0 | 0.2
NULL : Feedback3B = 3.5 | 7.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.6 | 7.2 | 0.2
NULL : Feedback3B = 3.6 | 7.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.7 | 7.4 | 0.2
NULL : Feedback3B = 3.7 | 7.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.8 | 7.6 | 0.2
NULL : Feedback3B = 3.8 | 7.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.9 | 7.8 | 0.2
NULL : Feedback3B = 3.9 | 7.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.0 | 8.0 | 0.2
NULL : Feedback3B = 4.0 | 8.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.1 | 8.2 | 0.2
NULL : Feedback3B = 4.1 | 8.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.2 | 8.4 | 0.2
NULL : Feedback3B = 4.2 | 8.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.3 | 8.6 | 0.2
NULL : Feedback3B = 4.3 | 8.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.4 | 8.8 | 0.2
NULL : Feedback3B = 4.4 | 8.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 9000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : OutStat3A = 2 | 0.1 | 0.1
NULL : OutStat3B = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#disconnect outputs from load line, clear current
Output3A = 0 : NULL : WAIT = 0.1
J2_05 = 0, J2_06 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1

#switch outputs to load line
J2_07 = 1, J2_08 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.0 | 0.0 | 0.2
NULL : Feedback4B = 0.0 | 0.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.1 | 0.2 | 0.2
NULL : Feedback4B = 0.1 | 0.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.2 | 0.4 | 0.2
NULL : Feedback4B = 0.2 | 0.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.3 | 0.6 | 0.2
NULL : Feedback4B = 0.3 | 0.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.4 | 0.8 | 0.2
NULL : Feedback4B = 0.4 | 0.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.5 | 1.0 | 0.2
NULL : Feedback4B = 0.5 | 1.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.6 | 1.2 | 0.2
NULL : Feedback4B = 0.6 | 1.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.7 | 1.4 | 0.2
NULL : Feedback4B = 0.7 | 1.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.8 | 1.6 | 0.2
NULL : Feedback4B = 0.8 | 1.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.9 | 1.8 | 0.2
NULL : Feedback4B = 0.9 | 1.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.0 | 2.0 | 0.2
NULL : Feedback4B = 1.0 | 2.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.1 | 2.2 | 0.2
NULL : Feedback4B = 1.1 | 2.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.2 | 2.4 | 0.2
NULL : Feedback4B = 1.2 | 2.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.3 | 2.6 | 0.2
NULL : Feedback4B = 1.3 | 2.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.4 | 2.8 | 0.2
NULL : Feedback4B = 1.4 | 2.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.5 | 3.0 | 0.2
NULL : Feedback4B = 1.5 | 3.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.6 | 3.2 | 0.2
NULL : Feedback4B = 1.6 | 3.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.7 | 3.4 | 0.2
NULL : Feedback4B = 1.7 | 3.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.8 | 3.6 | 0.2
NULL : Feedback4B = 1.8 | 3.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.9 | 3.8 | 0.2
NULL : Feedback4B = 1.9 | 3.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.0 | 4.0 | 0.2
NULL : Feedback4B = 2.0 | 4.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.1 | 4.2 | 0.2
NULL : Feedback4B = 2.1 | 4.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.2 | 4.4 | 0.2
NULL : Feedback4B = 2.2 | 4.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4600, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.3 | 4.6 | 0.2
NULL : Feedback4B = 2.3 | 4.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 4800, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 4.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.4 | 4.8 | 0.2
NULL : Feedback4B = 2.4 | 4.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5000, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.5 | 5.0 | 0.2
NULL : Feedback4B = 2.5 | 5.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5200, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.6 | 5.2 | 0.2
NULL : Feedback4B = 2.6 | 5.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5400, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.7 | 5.4 | 0.2
NULL : Feedback4B = 2.7 | 5.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5600, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.8 | 5.6 | 0.2
NULL : Feedback4B = 2.8 | 5.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 5800, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 5.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.9 | 5.8 | 0.2
NULL : Feedback4B = 2.9 | 5.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6000, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.0 | 6.0 | 0.2
NULL : Feedback4B = 3.0 | 6.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6200, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.1 | 6.2 | 0.2
NULL : Feedback4B = 3.1 | 6.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6400, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.2 | 6.4 | 0.2
NULL : Feedback4B = 3.2 | 6.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6600, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.3 | 6.6 | 0.2
NULL : Feedback4B = 3.3 | 6.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 6800, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 6.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.4 | 6.8 | 0.2
NULL : Feedback4B = 3.4 | 6.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7000, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.5 | 7.0 | 0.2
NULL : Feedback4B = 3.5 | 7.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7200, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.6 | 7.2 | 0.2
NULL : Feedback4B = 3.6 | 7.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7400, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.7 | 7.4 | 0.2
NULL : Feedback4B = 3.7 | 7.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7600, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.8 | 7.6 | 0.2
NULL : Feedback4B = 3.8 | 7.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 7800, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 7.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.9 | 7.8 | 0.2
NULL : Feedback4B = 3.9 | 7.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8000, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.0 | 8.0 | 0.2
NULL : Feedback4B = 4.0 | 8.0 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8200, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.1 | 8.2 | 0.2
NULL : Feedback4B = 4.1 | 8.2 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8400, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.2 | 8.4 | 0.2
NULL : Feedback4B = 4.2 | 8.4 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8600, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.3 | 8.6 | 0.2
NULL : Feedback4B = 4.3 | 8.6 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 8800, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : MeterCurrent = 8.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.4 | 8.8 | 0.2
NULL : Feedback4B = 4.4 | 8.8 | 0.2

#set current and turn on output and verify feedback
LdCurrentSet = 9000, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : OutStat4A = 2 | 0.1 | 0.1
NULL : OutStat4B = 2 | 0.1 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#disconnect outputs from load line, clear current
Output4A = 0 : NULL : WAIT = 0.1
J2_07 = 0, J2_08 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1

LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
SAVE
END
