#34044-3
#Verion 0.0
#digital parallel test using the E-LOAD
UUT_DBC = 34044-563.dbc
UUT_DATANAME = 34044-3-DIGITAL-PARALLEL

#-----setup 34044-----
#disable global modes
#configure as Output Digital ON/OFF
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1, MODE5A = 1, MODE5B = 1, MODE6A = 1, MODE6B = 1, MODE7A = 1, MODE7B = 1 : NULL : WAIT = 0.5
Command = 84, MODE8A = 1, MODE8B = 1 : NULL : WAIT = 0.5
Command = 93, PORT1_MODE = 1, PORT2_MODE = 1, PORT3_MODE = 1, PORT4_MODE = 1, PORT5_MODE = 1, PORT6_MODE = 1, PORT7_MODE = 1, PORT8_MODE = 1 : NULL : WAIT = 0.5
Command = 82, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL
Command = 82, SaveSettings = 1 : NULL
#clean DBC signals
Command = 0 : NULL : WAIT = 0.5
MODE1 = 0, MODE2 = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0, MODE8A = 0, MODE8B = 0 : NULL : WAIT = 0.5
PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0, PORT5_MODE = 0, PORT6_MODE = 0, PORT7_MODE = 0, PORT8_MODE = 0 : NULL : WAIT = 0.5

#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1
#switch outputs to load line
J2_01 = 1, J2_02 = 1 : NULL : WAIT = 0.5

#set current and turn on output
LdCurrentSet = 0, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.0 | 0.0 | 0.2
NULL : Feedback1B = 0.0 | 0.0 | 0.2

#set current and turn on output
LdCurrentSet = 100, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.05 | 0.1 | 0.2
NULL : Feedback1B = 0.05 | 0.1 | 0.2

#set current and turn on output
LdCurrentSet = 200, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.1 | 0.2 | 0.2
NULL : Feedback1B = 0.1 | 0.2 | 0.2

#set current and turn on output
LdCurrentSet = 300, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.15 | 0.3 | 0.2
NULL : Feedback1B = 0.15 | 0.3 | 0.2

#set current and turn on output
LdCurrentSet = 400, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.2 | 0.4 | 0.2
NULL : Feedback1B = 0.2 | 0.4 | 0.2

#set current and turn on output
LdCurrentSet = 500, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.25 | 0.5 | 0.2
NULL : Feedback1B = 0.25 | 0.5 | 0.2

#set current and turn on output
LdCurrentSet = 600, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.3 | 0.6 | 0.2
NULL : Feedback1B = 0.3 | 0.6 | 0.2

#set current and turn on output
LdCurrentSet = 700, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.35 | 0.7 | 0.2
NULL : Feedback1B = 0.35 | 0.7 | 0.2

#set current and turn on output
LdCurrentSet = 800, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.4 | 0.8 | 0.2
NULL : Feedback1B = 0.4 | 0.8 | 0.2

#set current and turn on output
LdCurrentSet = 900, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.45 | 0.9 | 0.2
NULL : Feedback1B = 0.45 | 0.9 | 0.2

#set current and turn on output
LdCurrentSet = 1000, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.5 | 1.0 | 0.2
NULL : Feedback1B = 0.5 | 1.0 | 0.2

#set current and turn on output
LdCurrentSet = 1100, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.55 | 1.1 | 0.2
NULL : Feedback1B = 0.55 | 1.1 | 0.2

#set current and turn on output
LdCurrentSet = 1200, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.6 | 1.2 | 0.2
NULL : Feedback1B = 0.6 | 1.2 | 0.2

#set current and turn on output
LdCurrentSet = 1300, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.65 | 1.3 | 0.2
NULL : Feedback1B = 0.65 | 1.3 | 0.2

#set current and turn on output
LdCurrentSet = 1400, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.7 | 1.4 | 0.2
NULL : Feedback1B = 0.7 | 1.4 | 0.2

#set current and turn on output
LdCurrentSet = 1500, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.75 | 1.5 | 0.2
NULL : Feedback1B = 0.75 | 1.5 | 0.2

#set current and turn on output
LdCurrentSet = 1600, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.8 | 1.6 | 0.2
NULL : Feedback1B = 0.8 | 1.6 | 0.2

#set current and turn on output
LdCurrentSet = 1700, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.85 | 1.7 | 0.2
NULL : Feedback1B = 0.85 | 1.7 | 0.2

#set current and turn on output
LdCurrentSet = 1800, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.9 | 1.8 | 0.2
NULL : Feedback1B = 0.9 | 1.8 | 0.2

#set current and turn on output
LdCurrentSet = 1900, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 0.95 | 1.9 | 0.2
NULL : Feedback1B = 0.95 | 1.9 | 0.2

#set current and turn on output
LdCurrentSet = 2000, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.0 | 2.0 | 0.2
NULL : Feedback1B = 1.0 | 2.0 | 0.2

#set current and turn on output
LdCurrentSet = 2100, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.05 | 2.1 | 0.2
NULL : Feedback1B = 1.05 | 2.1 | 0.2

#set current and turn on output
LdCurrentSet = 2200, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.1 | 2.2 | 0.2
NULL : Feedback1B = 1.1 | 2.2 | 0.2

#set current and turn on output
LdCurrentSet = 2300, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.15 | 2.3 | 0.2
NULL : Feedback1B = 1.15 | 2.3 | 0.2

#set current and turn on output
LdCurrentSet = 2400, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.2 | 2.4 | 0.2
NULL : Feedback1B = 1.2 | 2.4 | 0.2

#set current and turn on output
LdCurrentSet = 2500, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.25 | 2.5 | 0.2
NULL : Feedback1B = 1.25 | 2.5 | 0.2

#set current and turn on output
LdCurrentSet = 2600, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.3 | 2.6 | 0.2
NULL : Feedback1B = 1.3 | 2.6 | 0.2

#set current and turn on output
LdCurrentSet = 2700, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.35 | 2.7 | 0.2
NULL : Feedback1B = 1.35 | 2.7 | 0.2

#set current and turn on output
LdCurrentSet = 2800, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.4 | 2.8 | 0.2
NULL : Feedback1B = 1.4 | 2.8 | 0.2

#set current and turn on output
LdCurrentSet = 2900, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.45 | 2.9 | 0.2
NULL : Feedback1B = 1.45 | 2.9 | 0.2

#set current and turn on output
LdCurrentSet = 3000, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.5 | 3.0 | 0.2
NULL : Feedback1B = 1.5 | 3.0 | 0.2

#set current and turn on output
LdCurrentSet = 3100, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.55 | 3.1 | 0.2
NULL : Feedback1B = 1.55 | 3.1 | 0.2

#set current and turn on output
LdCurrentSet = 3200, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.6 | 3.2 | 0.2
NULL : Feedback1B = 1.6 | 3.2 | 0.2

#set current and turn on output
LdCurrentSet = 3300, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.65 | 3.3 | 0.2
NULL : Feedback1B = 1.65 | 3.3 | 0.2

#set current and turn on output
LdCurrentSet = 3400, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.7 | 3.4 | 0.2
NULL : Feedback1B = 1.7 | 3.4 | 0.2

#set current and turn on output
LdCurrentSet = 3500, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.75 | 3.5 | 0.2
NULL : Feedback1B = 1.75 | 3.5 | 0.2

#set current and turn on output
LdCurrentSet = 3600, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.8 | 3.6 | 0.2
NULL : Feedback1B = 1.8 | 3.6 | 0.2

#set current and turn on output
LdCurrentSet = 3700, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.85 | 3.7 | 0.2
NULL : Feedback1B = 1.85 | 3.7 | 0.2

#set current and turn on output
LdCurrentSet = 3800, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.9 | 3.8 | 0.2
NULL : Feedback1B = 1.9 | 3.8 | 0.2

#set current and turn on output
LdCurrentSet = 3900, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 1.95 | 3.9 | 0.2
NULL : Feedback1B = 1.95 | 3.9 | 0.2

#set current and turn on output
LdCurrentSet = 4000, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.0 | 4.0 | 0.2
NULL : Feedback1B = 2.0 | 4.0 | 0.2

#set current and turn on output
LdCurrentSet = 4100, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.05 | 4.1 | 0.2
NULL : Feedback1B = 2.05 | 4.1 | 0.2

#set current and turn on output
LdCurrentSet = 4200, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.1 | 4.2 | 0.2
NULL : Feedback1B = 2.1 | 4.2 | 0.2

#set current and turn on output
LdCurrentSet = 4300, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.15 | 4.3 | 0.2
NULL : Feedback1B = 2.15 | 4.3 | 0.2

#set current and turn on output
LdCurrentSet = 4400, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.2 | 4.4 | 0.2
NULL : Feedback1B = 2.2 | 4.4 | 0.2

#set current and turn on output
LdCurrentSet = 4500, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.25 | 4.5 | 0.2
NULL : Feedback1B = 2.25 | 4.5 | 0.2

#set current and turn on output
LdCurrentSet = 4600, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.3 | 4.6 | 0.2
NULL : Feedback1B = 2.3 | 4.6 | 0.2

#set current and turn on output
LdCurrentSet = 4700, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.35 | 4.7 | 0.2
NULL : Feedback1B = 2.35 | 4.7 | 0.2

#set current and turn on output
LdCurrentSet = 4800, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.4 | 4.8 | 0.2
NULL : Feedback1B = 2.4 | 4.8 | 0.2

#set current and turn on output
LdCurrentSet = 4900, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.45 | 4.9 | 0.2
NULL : Feedback1B = 2.45 | 4.9 | 0.2

#set current and turn on output
LdCurrentSet = 5000, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.5 | 5.0 | 0.2
NULL : Feedback1B = 2.5 | 5.0 | 0.2

#set current and turn on output
LdCurrentSet = 5100, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.55 | 5.1 | 0.2
NULL : Feedback1B = 2.55 | 5.1 | 0.2

#set current and turn on output
LdCurrentSet = 5200, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.6 | 5.2 | 0.2
NULL : Feedback1B = 2.6 | 5.2 | 0.2

#set current and turn on output
LdCurrentSet = 5300, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.65 | 5.3 | 0.2
NULL : Feedback1B = 2.65 | 5.3 | 0.2

#set current and turn on output
LdCurrentSet = 5400, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.7 | 5.4 | 0.2
NULL : Feedback1B = 2.7 | 5.4 | 0.2

#set current and turn on output
LdCurrentSet = 5500, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.75 | 5.5 | 0.2
NULL : Feedback1B = 2.75 | 5.5 | 0.2

#set current and turn on output
LdCurrentSet = 5600, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.8 | 5.6 | 0.2
NULL : Feedback1B = 2.8 | 5.6 | 0.2

#set current and turn on output
LdCurrentSet = 5700, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.85 | 5.7 | 0.2
NULL : Feedback1B = 2.85 | 5.7 | 0.2

#set current and turn on output
LdCurrentSet = 5800, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.9 | 5.8 | 0.2
NULL : Feedback1B = 2.9 | 5.8 | 0.2

#set current and turn on output
LdCurrentSet = 5900, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 2.95 | 5.9 | 0.2
NULL : Feedback1B = 2.95 | 5.9 | 0.2

#set current and turn on output
LdCurrentSet = 6000, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.0 | 6.0 | 0.2
NULL : Feedback1B = 3.0 | 6.0 | 0.2

#set current and turn on output
LdCurrentSet = 6100, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.05 | 6.1 | 0.2
NULL : Feedback1B = 3.05 | 6.1 | 0.2

#set current and turn on output
LdCurrentSet = 6200, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.1 | 6.2 | 0.2
NULL : Feedback1B = 3.1 | 6.2 | 0.2

#set current and turn on output
LdCurrentSet = 6300, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.15 | 6.3 | 0.2
NULL : Feedback1B = 3.15 | 6.3 | 0.2

#set current and turn on output
LdCurrentSet = 6400, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.2 | 6.4 | 0.2
NULL : Feedback1B = 3.2 | 6.4 | 0.2

#set current and turn on output
LdCurrentSet = 6500, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.25 | 6.5 | 0.2
NULL : Feedback1B = 3.25 | 6.5 | 0.2

#set current and turn on output
LdCurrentSet = 6600, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.3 | 6.6 | 0.2
NULL : Feedback1B = 3.3 | 6.6 | 0.2

#set current and turn on output
LdCurrentSet = 6700, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.35 | 6.7 | 0.2
NULL : Feedback1B = 3.35 | 6.7 | 0.2

#set current and turn on output
LdCurrentSet = 6800, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.4 | 6.8 | 0.2
NULL : Feedback1B = 3.4 | 6.8 | 0.2

#set current and turn on output
LdCurrentSet = 6900, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.45 | 6.9 | 0.2
NULL : Feedback1B = 3.45 | 6.9 | 0.2

#set current and turn on output
LdCurrentSet = 7000, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.5 | 7.0 | 0.2
NULL : Feedback1B = 3.5 | 7.0 | 0.2

#set current and turn on output
LdCurrentSet = 7100, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.55 | 7.1 | 0.2
NULL : Feedback1B = 3.55 | 7.1 | 0.2

#set current and turn on output
LdCurrentSet = 7200, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.6 | 7.2 | 0.2
NULL : Feedback1B = 3.6 | 7.2 | 0.2

#set current and turn on output
LdCurrentSet = 7300, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.65 | 7.3 | 0.2
NULL : Feedback1B = 3.65 | 7.3 | 0.2

#set current and turn on output
LdCurrentSet = 7400, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.7 | 7.4 | 0.2
NULL : Feedback1B = 3.7 | 7.4 | 0.2

#set current and turn on output
LdCurrentSet = 7500, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.75 | 7.5 | 0.2
NULL : Feedback1B = 3.75 | 7.5 | 0.2

#set current and turn on output
LdCurrentSet = 7600, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.8 | 7.6 | 0.2
NULL : Feedback1B = 3.8 | 7.6 | 0.2

#set current and turn on output
LdCurrentSet = 7700, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.85 | 7.7 | 0.2
NULL : Feedback1B = 3.85 | 7.7 | 0.2

#set current and turn on output
LdCurrentSet = 7800, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.9 | 7.8 | 0.2
NULL : Feedback1B = 3.9 | 7.8 | 0.2

#set current and turn on output
LdCurrentSet = 7900, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 3.95 | 7.9 | 0.2
NULL : Feedback1B = 3.95 | 7.9 | 0.2

#set current and turn on output
LdCurrentSet = 8000, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.0 | 8.0 | 0.2
NULL : Feedback1B = 4.0 | 8.0 | 0.2

#set current and turn on output
LdCurrentSet = 8100, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.05 | 8.1 | 0.2
NULL : Feedback1B = 4.05 | 8.1 | 0.2

#set current and turn on output
LdCurrentSet = 8200, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.1 | 8.2 | 0.2
NULL : Feedback1B = 4.1 | 8.2 | 0.2

#set current and turn on output
LdCurrentSet = 8300, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.15 | 8.3 | 0.2
NULL : Feedback1B = 4.15 | 8.3 | 0.2

#set current and turn on output
LdCurrentSet = 8400, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.2 | 8.4 | 0.2
NULL : Feedback1B = 4.2 | 8.4 | 0.2

#set current and turn on output
LdCurrentSet = 8500, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.25 | 8.5 | 0.2
NULL : Feedback1B = 4.25 | 8.5 | 0.2

#set current and turn on output
LdCurrentSet = 8600, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.3 | 8.6 | 0.2
NULL : Feedback1B = 4.3 | 8.6 | 0.2

#set current and turn on output
LdCurrentSet = 8700, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.700000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.35 | 8.7 | 0.2
NULL : Feedback1B = 4.35 | 8.7 | 0.2

#set current and turn on output
LdCurrentSet = 8800, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.4 | 8.8 | 0.2
NULL : Feedback1B = 4.4 | 8.8 | 0.2

#set current and turn on output
LdCurrentSet = 8900, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.45 | 8.9 | 0.2
NULL : Feedback1B = 4.45 | 8.9 | 0.2

#set current and turn on output
LdCurrentSet = 9000, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.5 | 9.0 | 0.2
NULL : Feedback1B = 4.5 | 9.0 | 0.2

#set current and turn on output
LdCurrentSet = 9100, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.55 | 9.1 | 0.2
NULL : Feedback1B = 4.55 | 9.1 | 0.2

#set current and turn on output
LdCurrentSet = 9200, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.200000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.6 | 9.2 | 0.2
NULL : Feedback1B = 4.6 | 9.2 | 0.2

#set current and turn on output
LdCurrentSet = 9300, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.65 | 9.3 | 0.2
NULL : Feedback1B = 4.65 | 9.3 | 0.2

#set current and turn on output
LdCurrentSet = 9400, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.7 | 9.4 | 0.2
NULL : Feedback1B = 4.7 | 9.4 | 0.2

#set current and turn on output
LdCurrentSet = 9500, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.75 | 9.5 | 0.2
NULL : Feedback1B = 4.75 | 9.5 | 0.2

#set current and turn on output
LdCurrentSet = 9600, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.8 | 9.6 | 0.2
NULL : Feedback1B = 4.8 | 9.6 | 0.2

#set current and turn on output
LdCurrentSet = 9700, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.700000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.85 | 9.7 | 0.2
NULL : Feedback1B = 4.85 | 9.7 | 0.2

#set current and turn on output
LdCurrentSet = 9800, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.9 | 9.8 | 0.2
NULL : Feedback1B = 4.9 | 9.8 | 0.2

#set current and turn on output
LdCurrentSet = 9900, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 4.95 | 9.9 | 0.2
NULL : Feedback1B = 4.95 | 9.9 | 0.2

#set current and turn on output
LdCurrentSet = 10000, Command = 81, Output1A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 10.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback1A = 5.0 | 10.0 | 0.2
NULL : Feedback1B = 5.0 | 10.0 | 0.2

#verify fault status
NULL : OutStat1A = 1 | 0 | 0.1
NULL : OutStat1B = 1 | 0 | 0.1
#disconnect outputs from load line, clear current
Output1A = 0 : NULL : WAIT = 0.1
J2_01 = 0, J2_02 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1

#switch outputs to load line
J2_03 = 1, J2_04 = 1 : NULL : WAIT = 0.5

#set current and turn on output
LdCurrentSet = 0, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.0 | 0.0 | 0.2
NULL : Feedback2B = 0.0 | 0.0 | 0.2

#set current and turn on output
LdCurrentSet = 100, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.05 | 0.1 | 0.2
NULL : Feedback2B = 0.05 | 0.1 | 0.2

#set current and turn on output
LdCurrentSet = 200, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.1 | 0.2 | 0.2
NULL : Feedback2B = 0.1 | 0.2 | 0.2

#set current and turn on output
LdCurrentSet = 300, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.15 | 0.3 | 0.2
NULL : Feedback2B = 0.15 | 0.3 | 0.2

#set current and turn on output
LdCurrentSet = 400, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.2 | 0.4 | 0.2
NULL : Feedback2B = 0.2 | 0.4 | 0.2

#set current and turn on output
LdCurrentSet = 500, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.25 | 0.5 | 0.2
NULL : Feedback2B = 0.25 | 0.5 | 0.2

#set current and turn on output
LdCurrentSet = 600, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.3 | 0.6 | 0.2
NULL : Feedback2B = 0.3 | 0.6 | 0.2

#set current and turn on output
LdCurrentSet = 700, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.35 | 0.7 | 0.2
NULL : Feedback2B = 0.35 | 0.7 | 0.2

#set current and turn on output
LdCurrentSet = 800, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.4 | 0.8 | 0.2
NULL : Feedback2B = 0.4 | 0.8 | 0.2

#set current and turn on output
LdCurrentSet = 900, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.45 | 0.9 | 0.2
NULL : Feedback2B = 0.45 | 0.9 | 0.2

#set current and turn on output
LdCurrentSet = 1000, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.5 | 1.0 | 0.2
NULL : Feedback2B = 0.5 | 1.0 | 0.2

#set current and turn on output
LdCurrentSet = 1100, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.55 | 1.1 | 0.2
NULL : Feedback2B = 0.55 | 1.1 | 0.2

#set current and turn on output
LdCurrentSet = 1200, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.6 | 1.2 | 0.2
NULL : Feedback2B = 0.6 | 1.2 | 0.2

#set current and turn on output
LdCurrentSet = 1300, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.65 | 1.3 | 0.2
NULL : Feedback2B = 0.65 | 1.3 | 0.2

#set current and turn on output
LdCurrentSet = 1400, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.7 | 1.4 | 0.2
NULL : Feedback2B = 0.7 | 1.4 | 0.2

#set current and turn on output
LdCurrentSet = 1500, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.75 | 1.5 | 0.2
NULL : Feedback2B = 0.75 | 1.5 | 0.2

#set current and turn on output
LdCurrentSet = 1600, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.8 | 1.6 | 0.2
NULL : Feedback2B = 0.8 | 1.6 | 0.2

#set current and turn on output
LdCurrentSet = 1700, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.85 | 1.7 | 0.2
NULL : Feedback2B = 0.85 | 1.7 | 0.2

#set current and turn on output
LdCurrentSet = 1800, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.9 | 1.8 | 0.2
NULL : Feedback2B = 0.9 | 1.8 | 0.2

#set current and turn on output
LdCurrentSet = 1900, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 0.95 | 1.9 | 0.2
NULL : Feedback2B = 0.95 | 1.9 | 0.2

#set current and turn on output
LdCurrentSet = 2000, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.0 | 2.0 | 0.2
NULL : Feedback2B = 1.0 | 2.0 | 0.2

#set current and turn on output
LdCurrentSet = 2100, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.05 | 2.1 | 0.2
NULL : Feedback2B = 1.05 | 2.1 | 0.2

#set current and turn on output
LdCurrentSet = 2200, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.1 | 2.2 | 0.2
NULL : Feedback2B = 1.1 | 2.2 | 0.2

#set current and turn on output
LdCurrentSet = 2300, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.15 | 2.3 | 0.2
NULL : Feedback2B = 1.15 | 2.3 | 0.2

#set current and turn on output
LdCurrentSet = 2400, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.2 | 2.4 | 0.2
NULL : Feedback2B = 1.2 | 2.4 | 0.2

#set current and turn on output
LdCurrentSet = 2500, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.25 | 2.5 | 0.2
NULL : Feedback2B = 1.25 | 2.5 | 0.2

#set current and turn on output
LdCurrentSet = 2600, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.3 | 2.6 | 0.2
NULL : Feedback2B = 1.3 | 2.6 | 0.2

#set current and turn on output
LdCurrentSet = 2700, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.35 | 2.7 | 0.2
NULL : Feedback2B = 1.35 | 2.7 | 0.2

#set current and turn on output
LdCurrentSet = 2800, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.4 | 2.8 | 0.2
NULL : Feedback2B = 1.4 | 2.8 | 0.2

#set current and turn on output
LdCurrentSet = 2900, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.45 | 2.9 | 0.2
NULL : Feedback2B = 1.45 | 2.9 | 0.2

#set current and turn on output
LdCurrentSet = 3000, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.5 | 3.0 | 0.2
NULL : Feedback2B = 1.5 | 3.0 | 0.2

#set current and turn on output
LdCurrentSet = 3100, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.55 | 3.1 | 0.2
NULL : Feedback2B = 1.55 | 3.1 | 0.2

#set current and turn on output
LdCurrentSet = 3200, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.6 | 3.2 | 0.2
NULL : Feedback2B = 1.6 | 3.2 | 0.2

#set current and turn on output
LdCurrentSet = 3300, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.65 | 3.3 | 0.2
NULL : Feedback2B = 1.65 | 3.3 | 0.2

#set current and turn on output
LdCurrentSet = 3400, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.7 | 3.4 | 0.2
NULL : Feedback2B = 1.7 | 3.4 | 0.2

#set current and turn on output
LdCurrentSet = 3500, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.75 | 3.5 | 0.2
NULL : Feedback2B = 1.75 | 3.5 | 0.2

#set current and turn on output
LdCurrentSet = 3600, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.8 | 3.6 | 0.2
NULL : Feedback2B = 1.8 | 3.6 | 0.2

#set current and turn on output
LdCurrentSet = 3700, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.85 | 3.7 | 0.2
NULL : Feedback2B = 1.85 | 3.7 | 0.2

#set current and turn on output
LdCurrentSet = 3800, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.9 | 3.8 | 0.2
NULL : Feedback2B = 1.9 | 3.8 | 0.2

#set current and turn on output
LdCurrentSet = 3900, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 1.95 | 3.9 | 0.2
NULL : Feedback2B = 1.95 | 3.9 | 0.2

#set current and turn on output
LdCurrentSet = 4000, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.0 | 4.0 | 0.2
NULL : Feedback2B = 2.0 | 4.0 | 0.2

#set current and turn on output
LdCurrentSet = 4100, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.05 | 4.1 | 0.2
NULL : Feedback2B = 2.05 | 4.1 | 0.2

#set current and turn on output
LdCurrentSet = 4200, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.1 | 4.2 | 0.2
NULL : Feedback2B = 2.1 | 4.2 | 0.2

#set current and turn on output
LdCurrentSet = 4300, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.15 | 4.3 | 0.2
NULL : Feedback2B = 2.15 | 4.3 | 0.2

#set current and turn on output
LdCurrentSet = 4400, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.2 | 4.4 | 0.2
NULL : Feedback2B = 2.2 | 4.4 | 0.2

#set current and turn on output
LdCurrentSet = 4500, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.25 | 4.5 | 0.2
NULL : Feedback2B = 2.25 | 4.5 | 0.2

#set current and turn on output
LdCurrentSet = 4600, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.3 | 4.6 | 0.2
NULL : Feedback2B = 2.3 | 4.6 | 0.2

#set current and turn on output
LdCurrentSet = 4700, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.35 | 4.7 | 0.2
NULL : Feedback2B = 2.35 | 4.7 | 0.2

#set current and turn on output
LdCurrentSet = 4800, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.4 | 4.8 | 0.2
NULL : Feedback2B = 2.4 | 4.8 | 0.2

#set current and turn on output
LdCurrentSet = 4900, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.45 | 4.9 | 0.2
NULL : Feedback2B = 2.45 | 4.9 | 0.2

#set current and turn on output
LdCurrentSet = 5000, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.5 | 5.0 | 0.2
NULL : Feedback2B = 2.5 | 5.0 | 0.2

#set current and turn on output
LdCurrentSet = 5100, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.55 | 5.1 | 0.2
NULL : Feedback2B = 2.55 | 5.1 | 0.2

#set current and turn on output
LdCurrentSet = 5200, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.6 | 5.2 | 0.2
NULL : Feedback2B = 2.6 | 5.2 | 0.2

#set current and turn on output
LdCurrentSet = 5300, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.65 | 5.3 | 0.2
NULL : Feedback2B = 2.65 | 5.3 | 0.2

#set current and turn on output
LdCurrentSet = 5400, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.7 | 5.4 | 0.2
NULL : Feedback2B = 2.7 | 5.4 | 0.2

#set current and turn on output
LdCurrentSet = 5500, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.75 | 5.5 | 0.2
NULL : Feedback2B = 2.75 | 5.5 | 0.2

#set current and turn on output
LdCurrentSet = 5600, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.8 | 5.6 | 0.2
NULL : Feedback2B = 2.8 | 5.6 | 0.2

#set current and turn on output
LdCurrentSet = 5700, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.85 | 5.7 | 0.2
NULL : Feedback2B = 2.85 | 5.7 | 0.2

#set current and turn on output
LdCurrentSet = 5800, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.9 | 5.8 | 0.2
NULL : Feedback2B = 2.9 | 5.8 | 0.2

#set current and turn on output
LdCurrentSet = 5900, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 2.95 | 5.9 | 0.2
NULL : Feedback2B = 2.95 | 5.9 | 0.2

#set current and turn on output
LdCurrentSet = 6000, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.0 | 6.0 | 0.2
NULL : Feedback2B = 3.0 | 6.0 | 0.2

#set current and turn on output
LdCurrentSet = 6100, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.05 | 6.1 | 0.2
NULL : Feedback2B = 3.05 | 6.1 | 0.2

#set current and turn on output
LdCurrentSet = 6200, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.1 | 6.2 | 0.2
NULL : Feedback2B = 3.1 | 6.2 | 0.2

#set current and turn on output
LdCurrentSet = 6300, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.15 | 6.3 | 0.2
NULL : Feedback2B = 3.15 | 6.3 | 0.2

#set current and turn on output
LdCurrentSet = 6400, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.2 | 6.4 | 0.2
NULL : Feedback2B = 3.2 | 6.4 | 0.2

#set current and turn on output
LdCurrentSet = 6500, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.25 | 6.5 | 0.2
NULL : Feedback2B = 3.25 | 6.5 | 0.2

#set current and turn on output
LdCurrentSet = 6600, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.3 | 6.6 | 0.2
NULL : Feedback2B = 3.3 | 6.6 | 0.2

#set current and turn on output
LdCurrentSet = 6700, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.35 | 6.7 | 0.2
NULL : Feedback2B = 3.35 | 6.7 | 0.2

#set current and turn on output
LdCurrentSet = 6800, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.4 | 6.8 | 0.2
NULL : Feedback2B = 3.4 | 6.8 | 0.2

#set current and turn on output
LdCurrentSet = 6900, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.45 | 6.9 | 0.2
NULL : Feedback2B = 3.45 | 6.9 | 0.2

#set current and turn on output
LdCurrentSet = 7000, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.5 | 7.0 | 0.2
NULL : Feedback2B = 3.5 | 7.0 | 0.2

#set current and turn on output
LdCurrentSet = 7100, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.55 | 7.1 | 0.2
NULL : Feedback2B = 3.55 | 7.1 | 0.2

#set current and turn on output
LdCurrentSet = 7200, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.6 | 7.2 | 0.2
NULL : Feedback2B = 3.6 | 7.2 | 0.2

#set current and turn on output
LdCurrentSet = 7300, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.65 | 7.3 | 0.2
NULL : Feedback2B = 3.65 | 7.3 | 0.2

#set current and turn on output
LdCurrentSet = 7400, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.7 | 7.4 | 0.2
NULL : Feedback2B = 3.7 | 7.4 | 0.2

#set current and turn on output
LdCurrentSet = 7500, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.75 | 7.5 | 0.2
NULL : Feedback2B = 3.75 | 7.5 | 0.2

#set current and turn on output
LdCurrentSet = 7600, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.8 | 7.6 | 0.2
NULL : Feedback2B = 3.8 | 7.6 | 0.2

#set current and turn on output
LdCurrentSet = 7700, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.85 | 7.7 | 0.2
NULL : Feedback2B = 3.85 | 7.7 | 0.2

#set current and turn on output
LdCurrentSet = 7800, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.9 | 7.8 | 0.2
NULL : Feedback2B = 3.9 | 7.8 | 0.2

#set current and turn on output
LdCurrentSet = 7900, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 3.95 | 7.9 | 0.2
NULL : Feedback2B = 3.95 | 7.9 | 0.2

#set current and turn on output
LdCurrentSet = 8000, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.0 | 8.0 | 0.2
NULL : Feedback2B = 4.0 | 8.0 | 0.2

#set current and turn on output
LdCurrentSet = 8100, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.05 | 8.1 | 0.2
NULL : Feedback2B = 4.05 | 8.1 | 0.2

#set current and turn on output
LdCurrentSet = 8200, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.1 | 8.2 | 0.2
NULL : Feedback2B = 4.1 | 8.2 | 0.2

#set current and turn on output
LdCurrentSet = 8300, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.15 | 8.3 | 0.2
NULL : Feedback2B = 4.15 | 8.3 | 0.2

#set current and turn on output
LdCurrentSet = 8400, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.2 | 8.4 | 0.2
NULL : Feedback2B = 4.2 | 8.4 | 0.2

#set current and turn on output
LdCurrentSet = 8500, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.25 | 8.5 | 0.2
NULL : Feedback2B = 4.25 | 8.5 | 0.2

#set current and turn on output
LdCurrentSet = 8600, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.3 | 8.6 | 0.2
NULL : Feedback2B = 4.3 | 8.6 | 0.2

#set current and turn on output
LdCurrentSet = 8700, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.700000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.35 | 8.7 | 0.2
NULL : Feedback2B = 4.35 | 8.7 | 0.2

#set current and turn on output
LdCurrentSet = 8800, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.4 | 8.8 | 0.2
NULL : Feedback2B = 4.4 | 8.8 | 0.2

#set current and turn on output
LdCurrentSet = 8900, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.45 | 8.9 | 0.2
NULL : Feedback2B = 4.45 | 8.9 | 0.2

#set current and turn on output
LdCurrentSet = 9000, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.5 | 9.0 | 0.2
NULL : Feedback2B = 4.5 | 9.0 | 0.2

#set current and turn on output
LdCurrentSet = 9100, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.55 | 9.1 | 0.2
NULL : Feedback2B = 4.55 | 9.1 | 0.2

#set current and turn on output
LdCurrentSet = 9200, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.200000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.6 | 9.2 | 0.2
NULL : Feedback2B = 4.6 | 9.2 | 0.2

#set current and turn on output
LdCurrentSet = 9300, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.65 | 9.3 | 0.2
NULL : Feedback2B = 4.65 | 9.3 | 0.2

#set current and turn on output
LdCurrentSet = 9400, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.7 | 9.4 | 0.2
NULL : Feedback2B = 4.7 | 9.4 | 0.2

#set current and turn on output
LdCurrentSet = 9500, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.75 | 9.5 | 0.2
NULL : Feedback2B = 4.75 | 9.5 | 0.2

#set current and turn on output
LdCurrentSet = 9600, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.8 | 9.6 | 0.2
NULL : Feedback2B = 4.8 | 9.6 | 0.2

#set current and turn on output
LdCurrentSet = 9700, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.700000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.85 | 9.7 | 0.2
NULL : Feedback2B = 4.85 | 9.7 | 0.2

#set current and turn on output
LdCurrentSet = 9800, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.9 | 9.8 | 0.2
NULL : Feedback2B = 4.9 | 9.8 | 0.2

#set current and turn on output
LdCurrentSet = 9900, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 4.95 | 9.9 | 0.2
NULL : Feedback2B = 4.95 | 9.9 | 0.2

#set current and turn on output
LdCurrentSet = 10000, Command = 81, Output2A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 10.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback2A = 5.0 | 10.0 | 0.2
NULL : Feedback2B = 5.0 | 10.0 | 0.2

#verify fault status
NULL : OutStat2A = 2 | 0 | 0.1
NULL : OutStat2B = 2 | 0 | 0.1
#disconnect outputs from load line, clear current
Output2A = 0 : NULL : WAIT = 0.1
J2_03 = 0, J2_04 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1

#switch outputs to load line
J2_05 = 1, J2_06 = 1 : NULL : WAIT = 0.5

#set current and turn on output
LdCurrentSet = 0, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.0 | 0.0 | 0.2
NULL : Feedback3B = 0.0 | 0.0 | 0.2

#set current and turn on output
LdCurrentSet = 100, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.05 | 0.1 | 0.2
NULL : Feedback3B = 0.05 | 0.1 | 0.2

#set current and turn on output
LdCurrentSet = 200, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.1 | 0.2 | 0.2
NULL : Feedback3B = 0.1 | 0.2 | 0.2

#set current and turn on output
LdCurrentSet = 300, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.15 | 0.3 | 0.2
NULL : Feedback3B = 0.15 | 0.3 | 0.2

#set current and turn on output
LdCurrentSet = 400, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.2 | 0.4 | 0.2
NULL : Feedback3B = 0.2 | 0.4 | 0.2

#set current and turn on output
LdCurrentSet = 500, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.25 | 0.5 | 0.2
NULL : Feedback3B = 0.25 | 0.5 | 0.2

#set current and turn on output
LdCurrentSet = 600, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.3 | 0.6 | 0.2
NULL : Feedback3B = 0.3 | 0.6 | 0.2

#set current and turn on output
LdCurrentSet = 700, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.35 | 0.7 | 0.2
NULL : Feedback3B = 0.35 | 0.7 | 0.2

#set current and turn on output
LdCurrentSet = 800, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.4 | 0.8 | 0.2
NULL : Feedback3B = 0.4 | 0.8 | 0.2

#set current and turn on output
LdCurrentSet = 900, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.45 | 0.9 | 0.2
NULL : Feedback3B = 0.45 | 0.9 | 0.2

#set current and turn on output
LdCurrentSet = 1000, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.5 | 1.0 | 0.2
NULL : Feedback3B = 0.5 | 1.0 | 0.2

#set current and turn on output
LdCurrentSet = 1100, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.55 | 1.1 | 0.2
NULL : Feedback3B = 0.55 | 1.1 | 0.2

#set current and turn on output
LdCurrentSet = 1200, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.6 | 1.2 | 0.2
NULL : Feedback3B = 0.6 | 1.2 | 0.2

#set current and turn on output
LdCurrentSet = 1300, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.65 | 1.3 | 0.2
NULL : Feedback3B = 0.65 | 1.3 | 0.2

#set current and turn on output
LdCurrentSet = 1400, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.7 | 1.4 | 0.2
NULL : Feedback3B = 0.7 | 1.4 | 0.2

#set current and turn on output
LdCurrentSet = 1500, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.75 | 1.5 | 0.2
NULL : Feedback3B = 0.75 | 1.5 | 0.2

#set current and turn on output
LdCurrentSet = 1600, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.8 | 1.6 | 0.2
NULL : Feedback3B = 0.8 | 1.6 | 0.2

#set current and turn on output
LdCurrentSet = 1700, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.85 | 1.7 | 0.2
NULL : Feedback3B = 0.85 | 1.7 | 0.2

#set current and turn on output
LdCurrentSet = 1800, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.9 | 1.8 | 0.2
NULL : Feedback3B = 0.9 | 1.8 | 0.2

#set current and turn on output
LdCurrentSet = 1900, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 0.95 | 1.9 | 0.2
NULL : Feedback3B = 0.95 | 1.9 | 0.2

#set current and turn on output
LdCurrentSet = 2000, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.0 | 2.0 | 0.2
NULL : Feedback3B = 1.0 | 2.0 | 0.2

#set current and turn on output
LdCurrentSet = 2100, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.05 | 2.1 | 0.2
NULL : Feedback3B = 1.05 | 2.1 | 0.2

#set current and turn on output
LdCurrentSet = 2200, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.1 | 2.2 | 0.2
NULL : Feedback3B = 1.1 | 2.2 | 0.2

#set current and turn on output
LdCurrentSet = 2300, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.15 | 2.3 | 0.2
NULL : Feedback3B = 1.15 | 2.3 | 0.2

#set current and turn on output
LdCurrentSet = 2400, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.2 | 2.4 | 0.2
NULL : Feedback3B = 1.2 | 2.4 | 0.2

#set current and turn on output
LdCurrentSet = 2500, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.25 | 2.5 | 0.2
NULL : Feedback3B = 1.25 | 2.5 | 0.2

#set current and turn on output
LdCurrentSet = 2600, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.3 | 2.6 | 0.2
NULL : Feedback3B = 1.3 | 2.6 | 0.2

#set current and turn on output
LdCurrentSet = 2700, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.35 | 2.7 | 0.2
NULL : Feedback3B = 1.35 | 2.7 | 0.2

#set current and turn on output
LdCurrentSet = 2800, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.4 | 2.8 | 0.2
NULL : Feedback3B = 1.4 | 2.8 | 0.2

#set current and turn on output
LdCurrentSet = 2900, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.45 | 2.9 | 0.2
NULL : Feedback3B = 1.45 | 2.9 | 0.2

#set current and turn on output
LdCurrentSet = 3000, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.5 | 3.0 | 0.2
NULL : Feedback3B = 1.5 | 3.0 | 0.2

#set current and turn on output
LdCurrentSet = 3100, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.55 | 3.1 | 0.2
NULL : Feedback3B = 1.55 | 3.1 | 0.2

#set current and turn on output
LdCurrentSet = 3200, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.6 | 3.2 | 0.2
NULL : Feedback3B = 1.6 | 3.2 | 0.2

#set current and turn on output
LdCurrentSet = 3300, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.65 | 3.3 | 0.2
NULL : Feedback3B = 1.65 | 3.3 | 0.2

#set current and turn on output
LdCurrentSet = 3400, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.7 | 3.4 | 0.2
NULL : Feedback3B = 1.7 | 3.4 | 0.2

#set current and turn on output
LdCurrentSet = 3500, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.75 | 3.5 | 0.2
NULL : Feedback3B = 1.75 | 3.5 | 0.2

#set current and turn on output
LdCurrentSet = 3600, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.8 | 3.6 | 0.2
NULL : Feedback3B = 1.8 | 3.6 | 0.2

#set current and turn on output
LdCurrentSet = 3700, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.85 | 3.7 | 0.2
NULL : Feedback3B = 1.85 | 3.7 | 0.2

#set current and turn on output
LdCurrentSet = 3800, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.9 | 3.8 | 0.2
NULL : Feedback3B = 1.9 | 3.8 | 0.2

#set current and turn on output
LdCurrentSet = 3900, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 1.95 | 3.9 | 0.2
NULL : Feedback3B = 1.95 | 3.9 | 0.2

#set current and turn on output
LdCurrentSet = 4000, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.0 | 4.0 | 0.2
NULL : Feedback3B = 2.0 | 4.0 | 0.2

#set current and turn on output
LdCurrentSet = 4100, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.05 | 4.1 | 0.2
NULL : Feedback3B = 2.05 | 4.1 | 0.2

#set current and turn on output
LdCurrentSet = 4200, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.1 | 4.2 | 0.2
NULL : Feedback3B = 2.1 | 4.2 | 0.2

#set current and turn on output
LdCurrentSet = 4300, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.15 | 4.3 | 0.2
NULL : Feedback3B = 2.15 | 4.3 | 0.2

#set current and turn on output
LdCurrentSet = 4400, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.2 | 4.4 | 0.2
NULL : Feedback3B = 2.2 | 4.4 | 0.2

#set current and turn on output
LdCurrentSet = 4500, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.25 | 4.5 | 0.2
NULL : Feedback3B = 2.25 | 4.5 | 0.2

#set current and turn on output
LdCurrentSet = 4600, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.3 | 4.6 | 0.2
NULL : Feedback3B = 2.3 | 4.6 | 0.2

#set current and turn on output
LdCurrentSet = 4700, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.35 | 4.7 | 0.2
NULL : Feedback3B = 2.35 | 4.7 | 0.2

#set current and turn on output
LdCurrentSet = 4800, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.4 | 4.8 | 0.2
NULL : Feedback3B = 2.4 | 4.8 | 0.2

#set current and turn on output
LdCurrentSet = 4900, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.45 | 4.9 | 0.2
NULL : Feedback3B = 2.45 | 4.9 | 0.2

#set current and turn on output
LdCurrentSet = 5000, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.5 | 5.0 | 0.2
NULL : Feedback3B = 2.5 | 5.0 | 0.2

#set current and turn on output
LdCurrentSet = 5100, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.55 | 5.1 | 0.2
NULL : Feedback3B = 2.55 | 5.1 | 0.2

#set current and turn on output
LdCurrentSet = 5200, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.6 | 5.2 | 0.2
NULL : Feedback3B = 2.6 | 5.2 | 0.2

#set current and turn on output
LdCurrentSet = 5300, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.65 | 5.3 | 0.2
NULL : Feedback3B = 2.65 | 5.3 | 0.2

#set current and turn on output
LdCurrentSet = 5400, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.7 | 5.4 | 0.2
NULL : Feedback3B = 2.7 | 5.4 | 0.2

#set current and turn on output
LdCurrentSet = 5500, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.75 | 5.5 | 0.2
NULL : Feedback3B = 2.75 | 5.5 | 0.2

#set current and turn on output
LdCurrentSet = 5600, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.8 | 5.6 | 0.2
NULL : Feedback3B = 2.8 | 5.6 | 0.2

#set current and turn on output
LdCurrentSet = 5700, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.85 | 5.7 | 0.2
NULL : Feedback3B = 2.85 | 5.7 | 0.2

#set current and turn on output
LdCurrentSet = 5800, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.9 | 5.8 | 0.2
NULL : Feedback3B = 2.9 | 5.8 | 0.2

#set current and turn on output
LdCurrentSet = 5900, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 2.95 | 5.9 | 0.2
NULL : Feedback3B = 2.95 | 5.9 | 0.2

#set current and turn on output
LdCurrentSet = 6000, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.0 | 6.0 | 0.2
NULL : Feedback3B = 3.0 | 6.0 | 0.2

#set current and turn on output
LdCurrentSet = 6100, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.05 | 6.1 | 0.2
NULL : Feedback3B = 3.05 | 6.1 | 0.2

#set current and turn on output
LdCurrentSet = 6200, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.1 | 6.2 | 0.2
NULL : Feedback3B = 3.1 | 6.2 | 0.2

#set current and turn on output
LdCurrentSet = 6300, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.15 | 6.3 | 0.2
NULL : Feedback3B = 3.15 | 6.3 | 0.2

#set current and turn on output
LdCurrentSet = 6400, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.2 | 6.4 | 0.2
NULL : Feedback3B = 3.2 | 6.4 | 0.2

#set current and turn on output
LdCurrentSet = 6500, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.25 | 6.5 | 0.2
NULL : Feedback3B = 3.25 | 6.5 | 0.2

#set current and turn on output
LdCurrentSet = 6600, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.3 | 6.6 | 0.2
NULL : Feedback3B = 3.3 | 6.6 | 0.2

#set current and turn on output
LdCurrentSet = 6700, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.35 | 6.7 | 0.2
NULL : Feedback3B = 3.35 | 6.7 | 0.2

#set current and turn on output
LdCurrentSet = 6800, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.4 | 6.8 | 0.2
NULL : Feedback3B = 3.4 | 6.8 | 0.2

#set current and turn on output
LdCurrentSet = 6900, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.45 | 6.9 | 0.2
NULL : Feedback3B = 3.45 | 6.9 | 0.2

#set current and turn on output
LdCurrentSet = 7000, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.5 | 7.0 | 0.2
NULL : Feedback3B = 3.5 | 7.0 | 0.2

#set current and turn on output
LdCurrentSet = 7100, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.55 | 7.1 | 0.2
NULL : Feedback3B = 3.55 | 7.1 | 0.2

#set current and turn on output
LdCurrentSet = 7200, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.6 | 7.2 | 0.2
NULL : Feedback3B = 3.6 | 7.2 | 0.2

#set current and turn on output
LdCurrentSet = 7300, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.65 | 7.3 | 0.2
NULL : Feedback3B = 3.65 | 7.3 | 0.2

#set current and turn on output
LdCurrentSet = 7400, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.7 | 7.4 | 0.2
NULL : Feedback3B = 3.7 | 7.4 | 0.2

#set current and turn on output
LdCurrentSet = 7500, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.75 | 7.5 | 0.2
NULL : Feedback3B = 3.75 | 7.5 | 0.2

#set current and turn on output
LdCurrentSet = 7600, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.8 | 7.6 | 0.2
NULL : Feedback3B = 3.8 | 7.6 | 0.2

#set current and turn on output
LdCurrentSet = 7700, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.85 | 7.7 | 0.2
NULL : Feedback3B = 3.85 | 7.7 | 0.2

#set current and turn on output
LdCurrentSet = 7800, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.9 | 7.8 | 0.2
NULL : Feedback3B = 3.9 | 7.8 | 0.2

#set current and turn on output
LdCurrentSet = 7900, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 3.95 | 7.9 | 0.2
NULL : Feedback3B = 3.95 | 7.9 | 0.2

#set current and turn on output
LdCurrentSet = 8000, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.0 | 8.0 | 0.2
NULL : Feedback3B = 4.0 | 8.0 | 0.2

#set current and turn on output
LdCurrentSet = 8100, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.05 | 8.1 | 0.2
NULL : Feedback3B = 4.05 | 8.1 | 0.2

#set current and turn on output
LdCurrentSet = 8200, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.1 | 8.2 | 0.2
NULL : Feedback3B = 4.1 | 8.2 | 0.2

#set current and turn on output
LdCurrentSet = 8300, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.15 | 8.3 | 0.2
NULL : Feedback3B = 4.15 | 8.3 | 0.2

#set current and turn on output
LdCurrentSet = 8400, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.2 | 8.4 | 0.2
NULL : Feedback3B = 4.2 | 8.4 | 0.2

#set current and turn on output
LdCurrentSet = 8500, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.25 | 8.5 | 0.2
NULL : Feedback3B = 4.25 | 8.5 | 0.2

#set current and turn on output
LdCurrentSet = 8600, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.3 | 8.6 | 0.2
NULL : Feedback3B = 4.3 | 8.6 | 0.2

#set current and turn on output
LdCurrentSet = 8700, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.700000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.35 | 8.7 | 0.2
NULL : Feedback3B = 4.35 | 8.7 | 0.2

#set current and turn on output
LdCurrentSet = 8800, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.4 | 8.8 | 0.2
NULL : Feedback3B = 4.4 | 8.8 | 0.2

#set current and turn on output
LdCurrentSet = 8900, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.45 | 8.9 | 0.2
NULL : Feedback3B = 4.45 | 8.9 | 0.2

#set current and turn on output
LdCurrentSet = 9000, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.5 | 9.0 | 0.2
NULL : Feedback3B = 4.5 | 9.0 | 0.2

#set current and turn on output
LdCurrentSet = 9100, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.55 | 9.1 | 0.2
NULL : Feedback3B = 4.55 | 9.1 | 0.2

#set current and turn on output
LdCurrentSet = 9200, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.200000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.6 | 9.2 | 0.2
NULL : Feedback3B = 4.6 | 9.2 | 0.2

#set current and turn on output
LdCurrentSet = 9300, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.65 | 9.3 | 0.2
NULL : Feedback3B = 4.65 | 9.3 | 0.2

#set current and turn on output
LdCurrentSet = 9400, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.7 | 9.4 | 0.2
NULL : Feedback3B = 4.7 | 9.4 | 0.2

#set current and turn on output
LdCurrentSet = 9500, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.75 | 9.5 | 0.2
NULL : Feedback3B = 4.75 | 9.5 | 0.2

#set current and turn on output
LdCurrentSet = 9600, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.8 | 9.6 | 0.2
NULL : Feedback3B = 4.8 | 9.6 | 0.2

#set current and turn on output
LdCurrentSet = 9700, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.700000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.85 | 9.7 | 0.2
NULL : Feedback3B = 4.85 | 9.7 | 0.2

#set current and turn on output
LdCurrentSet = 9800, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.9 | 9.8 | 0.2
NULL : Feedback3B = 4.9 | 9.8 | 0.2

#set current and turn on output
LdCurrentSet = 9900, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 4.95 | 9.9 | 0.2
NULL : Feedback3B = 4.95 | 9.9 | 0.2

#set current and turn on output
LdCurrentSet = 10000, Command = 81, Output3A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 10.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback3A = 5.0 | 10.0 | 0.2
NULL : Feedback3B = 5.0 | 10.0 | 0.2

#verify fault status
NULL : OutStat3A = 1 | 0 | 0.1
NULL : OutStat3B = 1 | 0 | 0.1
#disconnect outputs from load line, clear current
Output3A = 0 : NULL : WAIT = 0.1
J2_05 = 0, J2_06 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1

#switch outputs to load line
J2_07 = 1, J2_08 = 1 : NULL : WAIT = 0.5

#set current and turn on output
LdCurrentSet = 0, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.0 | 0.0 | 0.2
NULL : Feedback4B = 0.0 | 0.0 | 0.2

#set current and turn on output
LdCurrentSet = 100, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.05 | 0.1 | 0.2
NULL : Feedback4B = 0.05 | 0.1 | 0.2

#set current and turn on output
LdCurrentSet = 200, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.1 | 0.2 | 0.2
NULL : Feedback4B = 0.1 | 0.2 | 0.2

#set current and turn on output
LdCurrentSet = 300, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.15 | 0.3 | 0.2
NULL : Feedback4B = 0.15 | 0.3 | 0.2

#set current and turn on output
LdCurrentSet = 400, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.2 | 0.4 | 0.2
NULL : Feedback4B = 0.2 | 0.4 | 0.2

#set current and turn on output
LdCurrentSet = 500, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.25 | 0.5 | 0.2
NULL : Feedback4B = 0.25 | 0.5 | 0.2

#set current and turn on output
LdCurrentSet = 600, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.3 | 0.6 | 0.2
NULL : Feedback4B = 0.3 | 0.6 | 0.2

#set current and turn on output
LdCurrentSet = 700, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.35 | 0.7 | 0.2
NULL : Feedback4B = 0.35 | 0.7 | 0.2

#set current and turn on output
LdCurrentSet = 800, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.4 | 0.8 | 0.2
NULL : Feedback4B = 0.4 | 0.8 | 0.2

#set current and turn on output
LdCurrentSet = 900, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.45 | 0.9 | 0.2
NULL : Feedback4B = 0.45 | 0.9 | 0.2

#set current and turn on output
LdCurrentSet = 1000, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.5 | 1.0 | 0.2
NULL : Feedback4B = 0.5 | 1.0 | 0.2

#set current and turn on output
LdCurrentSet = 1100, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.55 | 1.1 | 0.2
NULL : Feedback4B = 0.55 | 1.1 | 0.2

#set current and turn on output
LdCurrentSet = 1200, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.6 | 1.2 | 0.2
NULL : Feedback4B = 0.6 | 1.2 | 0.2

#set current and turn on output
LdCurrentSet = 1300, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.65 | 1.3 | 0.2
NULL : Feedback4B = 0.65 | 1.3 | 0.2

#set current and turn on output
LdCurrentSet = 1400, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.7 | 1.4 | 0.2
NULL : Feedback4B = 0.7 | 1.4 | 0.2

#set current and turn on output
LdCurrentSet = 1500, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.75 | 1.5 | 0.2
NULL : Feedback4B = 0.75 | 1.5 | 0.2

#set current and turn on output
LdCurrentSet = 1600, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.8 | 1.6 | 0.2
NULL : Feedback4B = 0.8 | 1.6 | 0.2

#set current and turn on output
LdCurrentSet = 1700, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.85 | 1.7 | 0.2
NULL : Feedback4B = 0.85 | 1.7 | 0.2

#set current and turn on output
LdCurrentSet = 1800, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.9 | 1.8 | 0.2
NULL : Feedback4B = 0.9 | 1.8 | 0.2

#set current and turn on output
LdCurrentSet = 1900, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 0.95 | 1.9 | 0.2
NULL : Feedback4B = 0.95 | 1.9 | 0.2

#set current and turn on output
LdCurrentSet = 2000, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.0 | 2.0 | 0.2
NULL : Feedback4B = 1.0 | 2.0 | 0.2

#set current and turn on output
LdCurrentSet = 2100, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.05 | 2.1 | 0.2
NULL : Feedback4B = 1.05 | 2.1 | 0.2

#set current and turn on output
LdCurrentSet = 2200, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.1 | 2.2 | 0.2
NULL : Feedback4B = 1.1 | 2.2 | 0.2

#set current and turn on output
LdCurrentSet = 2300, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.15 | 2.3 | 0.2
NULL : Feedback4B = 1.15 | 2.3 | 0.2

#set current and turn on output
LdCurrentSet = 2400, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.2 | 2.4 | 0.2
NULL : Feedback4B = 1.2 | 2.4 | 0.2

#set current and turn on output
LdCurrentSet = 2500, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.25 | 2.5 | 0.2
NULL : Feedback4B = 1.25 | 2.5 | 0.2

#set current and turn on output
LdCurrentSet = 2600, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.3 | 2.6 | 0.2
NULL : Feedback4B = 1.3 | 2.6 | 0.2

#set current and turn on output
LdCurrentSet = 2700, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.35 | 2.7 | 0.2
NULL : Feedback4B = 1.35 | 2.7 | 0.2

#set current and turn on output
LdCurrentSet = 2800, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.4 | 2.8 | 0.2
NULL : Feedback4B = 1.4 | 2.8 | 0.2

#set current and turn on output
LdCurrentSet = 2900, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.45 | 2.9 | 0.2
NULL : Feedback4B = 1.45 | 2.9 | 0.2

#set current and turn on output
LdCurrentSet = 3000, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.5 | 3.0 | 0.2
NULL : Feedback4B = 1.5 | 3.0 | 0.2

#set current and turn on output
LdCurrentSet = 3100, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.55 | 3.1 | 0.2
NULL : Feedback4B = 1.55 | 3.1 | 0.2

#set current and turn on output
LdCurrentSet = 3200, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.6 | 3.2 | 0.2
NULL : Feedback4B = 1.6 | 3.2 | 0.2

#set current and turn on output
LdCurrentSet = 3300, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.65 | 3.3 | 0.2
NULL : Feedback4B = 1.65 | 3.3 | 0.2

#set current and turn on output
LdCurrentSet = 3400, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.7 | 3.4 | 0.2
NULL : Feedback4B = 1.7 | 3.4 | 0.2

#set current and turn on output
LdCurrentSet = 3500, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.75 | 3.5 | 0.2
NULL : Feedback4B = 1.75 | 3.5 | 0.2

#set current and turn on output
LdCurrentSet = 3600, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.8 | 3.6 | 0.2
NULL : Feedback4B = 1.8 | 3.6 | 0.2

#set current and turn on output
LdCurrentSet = 3700, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.85 | 3.7 | 0.2
NULL : Feedback4B = 1.85 | 3.7 | 0.2

#set current and turn on output
LdCurrentSet = 3800, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.9 | 3.8 | 0.2
NULL : Feedback4B = 1.9 | 3.8 | 0.2

#set current and turn on output
LdCurrentSet = 3900, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 1.95 | 3.9 | 0.2
NULL : Feedback4B = 1.95 | 3.9 | 0.2

#set current and turn on output
LdCurrentSet = 4000, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.0 | 4.0 | 0.2
NULL : Feedback4B = 2.0 | 4.0 | 0.2

#set current and turn on output
LdCurrentSet = 4100, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.05 | 4.1 | 0.2
NULL : Feedback4B = 2.05 | 4.1 | 0.2

#set current and turn on output
LdCurrentSet = 4200, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.1 | 4.2 | 0.2
NULL : Feedback4B = 2.1 | 4.2 | 0.2

#set current and turn on output
LdCurrentSet = 4300, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.15 | 4.3 | 0.2
NULL : Feedback4B = 2.15 | 4.3 | 0.2

#set current and turn on output
LdCurrentSet = 4400, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.2 | 4.4 | 0.2
NULL : Feedback4B = 2.2 | 4.4 | 0.2

#set current and turn on output
LdCurrentSet = 4500, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.25 | 4.5 | 0.2
NULL : Feedback4B = 2.25 | 4.5 | 0.2

#set current and turn on output
LdCurrentSet = 4600, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.3 | 4.6 | 0.2
NULL : Feedback4B = 2.3 | 4.6 | 0.2

#set current and turn on output
LdCurrentSet = 4700, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.35 | 4.7 | 0.2
NULL : Feedback4B = 2.35 | 4.7 | 0.2

#set current and turn on output
LdCurrentSet = 4800, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.4 | 4.8 | 0.2
NULL : Feedback4B = 2.4 | 4.8 | 0.2

#set current and turn on output
LdCurrentSet = 4900, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.45 | 4.9 | 0.2
NULL : Feedback4B = 2.45 | 4.9 | 0.2

#set current and turn on output
LdCurrentSet = 5000, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.5 | 5.0 | 0.2
NULL : Feedback4B = 2.5 | 5.0 | 0.2

#set current and turn on output
LdCurrentSet = 5100, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.55 | 5.1 | 0.2
NULL : Feedback4B = 2.55 | 5.1 | 0.2

#set current and turn on output
LdCurrentSet = 5200, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.6 | 5.2 | 0.2
NULL : Feedback4B = 2.6 | 5.2 | 0.2

#set current and turn on output
LdCurrentSet = 5300, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.65 | 5.3 | 0.2
NULL : Feedback4B = 2.65 | 5.3 | 0.2

#set current and turn on output
LdCurrentSet = 5400, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.7 | 5.4 | 0.2
NULL : Feedback4B = 2.7 | 5.4 | 0.2

#set current and turn on output
LdCurrentSet = 5500, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.75 | 5.5 | 0.2
NULL : Feedback4B = 2.75 | 5.5 | 0.2

#set current and turn on output
LdCurrentSet = 5600, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.8 | 5.6 | 0.2
NULL : Feedback4B = 2.8 | 5.6 | 0.2

#set current and turn on output
LdCurrentSet = 5700, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.85 | 5.7 | 0.2
NULL : Feedback4B = 2.85 | 5.7 | 0.2

#set current and turn on output
LdCurrentSet = 5800, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.9 | 5.8 | 0.2
NULL : Feedback4B = 2.9 | 5.8 | 0.2

#set current and turn on output
LdCurrentSet = 5900, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 2.95 | 5.9 | 0.2
NULL : Feedback4B = 2.95 | 5.9 | 0.2

#set current and turn on output
LdCurrentSet = 6000, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.0 | 6.0 | 0.2
NULL : Feedback4B = 3.0 | 6.0 | 0.2

#set current and turn on output
LdCurrentSet = 6100, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.05 | 6.1 | 0.2
NULL : Feedback4B = 3.05 | 6.1 | 0.2

#set current and turn on output
LdCurrentSet = 6200, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.1 | 6.2 | 0.2
NULL : Feedback4B = 3.1 | 6.2 | 0.2

#set current and turn on output
LdCurrentSet = 6300, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.15 | 6.3 | 0.2
NULL : Feedback4B = 3.15 | 6.3 | 0.2

#set current and turn on output
LdCurrentSet = 6400, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.2 | 6.4 | 0.2
NULL : Feedback4B = 3.2 | 6.4 | 0.2

#set current and turn on output
LdCurrentSet = 6500, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.25 | 6.5 | 0.2
NULL : Feedback4B = 3.25 | 6.5 | 0.2

#set current and turn on output
LdCurrentSet = 6600, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.3 | 6.6 | 0.2
NULL : Feedback4B = 3.3 | 6.6 | 0.2

#set current and turn on output
LdCurrentSet = 6700, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.35 | 6.7 | 0.2
NULL : Feedback4B = 3.35 | 6.7 | 0.2

#set current and turn on output
LdCurrentSet = 6800, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.4 | 6.8 | 0.2
NULL : Feedback4B = 3.4 | 6.8 | 0.2

#set current and turn on output
LdCurrentSet = 6900, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.45 | 6.9 | 0.2
NULL : Feedback4B = 3.45 | 6.9 | 0.2

#set current and turn on output
LdCurrentSet = 7000, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.5 | 7.0 | 0.2
NULL : Feedback4B = 3.5 | 7.0 | 0.2

#set current and turn on output
LdCurrentSet = 7100, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.55 | 7.1 | 0.2
NULL : Feedback4B = 3.55 | 7.1 | 0.2

#set current and turn on output
LdCurrentSet = 7200, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.6 | 7.2 | 0.2
NULL : Feedback4B = 3.6 | 7.2 | 0.2

#set current and turn on output
LdCurrentSet = 7300, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.65 | 7.3 | 0.2
NULL : Feedback4B = 3.65 | 7.3 | 0.2

#set current and turn on output
LdCurrentSet = 7400, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.7 | 7.4 | 0.2
NULL : Feedback4B = 3.7 | 7.4 | 0.2

#set current and turn on output
LdCurrentSet = 7500, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.75 | 7.5 | 0.2
NULL : Feedback4B = 3.75 | 7.5 | 0.2

#set current and turn on output
LdCurrentSet = 7600, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.8 | 7.6 | 0.2
NULL : Feedback4B = 3.8 | 7.6 | 0.2

#set current and turn on output
LdCurrentSet = 7700, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.85 | 7.7 | 0.2
NULL : Feedback4B = 3.85 | 7.7 | 0.2

#set current and turn on output
LdCurrentSet = 7800, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.9 | 7.8 | 0.2
NULL : Feedback4B = 3.9 | 7.8 | 0.2

#set current and turn on output
LdCurrentSet = 7900, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 3.95 | 7.9 | 0.2
NULL : Feedback4B = 3.95 | 7.9 | 0.2

#set current and turn on output
LdCurrentSet = 8000, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.0 | 8.0 | 0.2
NULL : Feedback4B = 4.0 | 8.0 | 0.2

#set current and turn on output
LdCurrentSet = 8100, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.05 | 8.1 | 0.2
NULL : Feedback4B = 4.05 | 8.1 | 0.2

#set current and turn on output
LdCurrentSet = 8200, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.1 | 8.2 | 0.2
NULL : Feedback4B = 4.1 | 8.2 | 0.2

#set current and turn on output
LdCurrentSet = 8300, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.15 | 8.3 | 0.2
NULL : Feedback4B = 4.15 | 8.3 | 0.2

#set current and turn on output
LdCurrentSet = 8400, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.2 | 8.4 | 0.2
NULL : Feedback4B = 4.2 | 8.4 | 0.2

#set current and turn on output
LdCurrentSet = 8500, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.25 | 8.5 | 0.2
NULL : Feedback4B = 4.25 | 8.5 | 0.2

#set current and turn on output
LdCurrentSet = 8600, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.3 | 8.6 | 0.2
NULL : Feedback4B = 4.3 | 8.6 | 0.2

#set current and turn on output
LdCurrentSet = 8700, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.700000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.35 | 8.7 | 0.2
NULL : Feedback4B = 4.35 | 8.7 | 0.2

#set current and turn on output
LdCurrentSet = 8800, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.4 | 8.8 | 0.2
NULL : Feedback4B = 4.4 | 8.8 | 0.2

#set current and turn on output
LdCurrentSet = 8900, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.45 | 8.9 | 0.2
NULL : Feedback4B = 4.45 | 8.9 | 0.2

#set current and turn on output
LdCurrentSet = 9000, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.5 | 9.0 | 0.2
NULL : Feedback4B = 4.5 | 9.0 | 0.2

#set current and turn on output
LdCurrentSet = 9100, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.55 | 9.1 | 0.2
NULL : Feedback4B = 4.55 | 9.1 | 0.2

#set current and turn on output
LdCurrentSet = 9200, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.200000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.6 | 9.2 | 0.2
NULL : Feedback4B = 4.6 | 9.2 | 0.2

#set current and turn on output
LdCurrentSet = 9300, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.65 | 9.3 | 0.2
NULL : Feedback4B = 4.65 | 9.3 | 0.2

#set current and turn on output
LdCurrentSet = 9400, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.7 | 9.4 | 0.2
NULL : Feedback4B = 4.7 | 9.4 | 0.2

#set current and turn on output
LdCurrentSet = 9500, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.75 | 9.5 | 0.2
NULL : Feedback4B = 4.75 | 9.5 | 0.2

#set current and turn on output
LdCurrentSet = 9600, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.8 | 9.6 | 0.2
NULL : Feedback4B = 4.8 | 9.6 | 0.2

#set current and turn on output
LdCurrentSet = 9700, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.700000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.85 | 9.7 | 0.2
NULL : Feedback4B = 4.85 | 9.7 | 0.2

#set current and turn on output
LdCurrentSet = 9800, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.9 | 9.8 | 0.2
NULL : Feedback4B = 4.9 | 9.8 | 0.2

#set current and turn on output
LdCurrentSet = 9900, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 4.95 | 9.9 | 0.2
NULL : Feedback4B = 4.95 | 9.9 | 0.2

#set current and turn on output
LdCurrentSet = 10000, Command = 81, Output4A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 10.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback4A = 5.0 | 10.0 | 0.2
NULL : Feedback4B = 5.0 | 10.0 | 0.2

#verify fault status
NULL : OutStat4A = 2 | 0 | 0.1
NULL : OutStat4B = 2 | 0 | 0.1
#disconnect outputs from load line, clear current
Output4A = 0 : NULL : WAIT = 0.1
J2_07 = 0, J2_08 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1

#switch outputs to load line
J2_09 = 1, J2_10 = 1 : NULL : WAIT = 0.5

#set current and turn on output
LdCurrentSet = 0, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.0 | 0.0 | 0.2
NULL : Feedback5B = 0.0 | 0.0 | 0.2

#set current and turn on output
LdCurrentSet = 100, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.05 | 0.1 | 0.2
NULL : Feedback5B = 0.05 | 0.1 | 0.2

#set current and turn on output
LdCurrentSet = 200, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.1 | 0.2 | 0.2
NULL : Feedback5B = 0.1 | 0.2 | 0.2

#set current and turn on output
LdCurrentSet = 300, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.15 | 0.3 | 0.2
NULL : Feedback5B = 0.15 | 0.3 | 0.2

#set current and turn on output
LdCurrentSet = 400, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.2 | 0.4 | 0.2
NULL : Feedback5B = 0.2 | 0.4 | 0.2

#set current and turn on output
LdCurrentSet = 500, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.25 | 0.5 | 0.2
NULL : Feedback5B = 0.25 | 0.5 | 0.2

#set current and turn on output
LdCurrentSet = 600, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.3 | 0.6 | 0.2
NULL : Feedback5B = 0.3 | 0.6 | 0.2

#set current and turn on output
LdCurrentSet = 700, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.35 | 0.7 | 0.2
NULL : Feedback5B = 0.35 | 0.7 | 0.2

#set current and turn on output
LdCurrentSet = 800, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.4 | 0.8 | 0.2
NULL : Feedback5B = 0.4 | 0.8 | 0.2

#set current and turn on output
LdCurrentSet = 900, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.45 | 0.9 | 0.2
NULL : Feedback5B = 0.45 | 0.9 | 0.2

#set current and turn on output
LdCurrentSet = 1000, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.5 | 1.0 | 0.2
NULL : Feedback5B = 0.5 | 1.0 | 0.2

#set current and turn on output
LdCurrentSet = 1100, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.55 | 1.1 | 0.2
NULL : Feedback5B = 0.55 | 1.1 | 0.2

#set current and turn on output
LdCurrentSet = 1200, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.6 | 1.2 | 0.2
NULL : Feedback5B = 0.6 | 1.2 | 0.2

#set current and turn on output
LdCurrentSet = 1300, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.65 | 1.3 | 0.2
NULL : Feedback5B = 0.65 | 1.3 | 0.2

#set current and turn on output
LdCurrentSet = 1400, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.7 | 1.4 | 0.2
NULL : Feedback5B = 0.7 | 1.4 | 0.2

#set current and turn on output
LdCurrentSet = 1500, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.75 | 1.5 | 0.2
NULL : Feedback5B = 0.75 | 1.5 | 0.2

#set current and turn on output
LdCurrentSet = 1600, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.8 | 1.6 | 0.2
NULL : Feedback5B = 0.8 | 1.6 | 0.2

#set current and turn on output
LdCurrentSet = 1700, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.85 | 1.7 | 0.2
NULL : Feedback5B = 0.85 | 1.7 | 0.2

#set current and turn on output
LdCurrentSet = 1800, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.9 | 1.8 | 0.2
NULL : Feedback5B = 0.9 | 1.8 | 0.2

#set current and turn on output
LdCurrentSet = 1900, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 0.95 | 1.9 | 0.2
NULL : Feedback5B = 0.95 | 1.9 | 0.2

#set current and turn on output
LdCurrentSet = 2000, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.0 | 2.0 | 0.2
NULL : Feedback5B = 1.0 | 2.0 | 0.2

#set current and turn on output
LdCurrentSet = 2100, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.05 | 2.1 | 0.2
NULL : Feedback5B = 1.05 | 2.1 | 0.2

#set current and turn on output
LdCurrentSet = 2200, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.1 | 2.2 | 0.2
NULL : Feedback5B = 1.1 | 2.2 | 0.2

#set current and turn on output
LdCurrentSet = 2300, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.15 | 2.3 | 0.2
NULL : Feedback5B = 1.15 | 2.3 | 0.2

#set current and turn on output
LdCurrentSet = 2400, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.2 | 2.4 | 0.2
NULL : Feedback5B = 1.2 | 2.4 | 0.2

#set current and turn on output
LdCurrentSet = 2500, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.25 | 2.5 | 0.2
NULL : Feedback5B = 1.25 | 2.5 | 0.2

#set current and turn on output
LdCurrentSet = 2600, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.3 | 2.6 | 0.2
NULL : Feedback5B = 1.3 | 2.6 | 0.2

#set current and turn on output
LdCurrentSet = 2700, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.35 | 2.7 | 0.2
NULL : Feedback5B = 1.35 | 2.7 | 0.2

#set current and turn on output
LdCurrentSet = 2800, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.4 | 2.8 | 0.2
NULL : Feedback5B = 1.4 | 2.8 | 0.2

#set current and turn on output
LdCurrentSet = 2900, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.45 | 2.9 | 0.2
NULL : Feedback5B = 1.45 | 2.9 | 0.2

#set current and turn on output
LdCurrentSet = 3000, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.5 | 3.0 | 0.2
NULL : Feedback5B = 1.5 | 3.0 | 0.2

#set current and turn on output
LdCurrentSet = 3100, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.55 | 3.1 | 0.2
NULL : Feedback5B = 1.55 | 3.1 | 0.2

#set current and turn on output
LdCurrentSet = 3200, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.6 | 3.2 | 0.2
NULL : Feedback5B = 1.6 | 3.2 | 0.2

#set current and turn on output
LdCurrentSet = 3300, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.65 | 3.3 | 0.2
NULL : Feedback5B = 1.65 | 3.3 | 0.2

#set current and turn on output
LdCurrentSet = 3400, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.7 | 3.4 | 0.2
NULL : Feedback5B = 1.7 | 3.4 | 0.2

#set current and turn on output
LdCurrentSet = 3500, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.75 | 3.5 | 0.2
NULL : Feedback5B = 1.75 | 3.5 | 0.2

#set current and turn on output
LdCurrentSet = 3600, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.8 | 3.6 | 0.2
NULL : Feedback5B = 1.8 | 3.6 | 0.2

#set current and turn on output
LdCurrentSet = 3700, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.85 | 3.7 | 0.2
NULL : Feedback5B = 1.85 | 3.7 | 0.2

#set current and turn on output
LdCurrentSet = 3800, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.9 | 3.8 | 0.2
NULL : Feedback5B = 1.9 | 3.8 | 0.2

#set current and turn on output
LdCurrentSet = 3900, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 1.95 | 3.9 | 0.2
NULL : Feedback5B = 1.95 | 3.9 | 0.2

#set current and turn on output
LdCurrentSet = 4000, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.0 | 4.0 | 0.2
NULL : Feedback5B = 2.0 | 4.0 | 0.2

#set current and turn on output
LdCurrentSet = 4100, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.05 | 4.1 | 0.2
NULL : Feedback5B = 2.05 | 4.1 | 0.2

#set current and turn on output
LdCurrentSet = 4200, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.1 | 4.2 | 0.2
NULL : Feedback5B = 2.1 | 4.2 | 0.2

#set current and turn on output
LdCurrentSet = 4300, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.15 | 4.3 | 0.2
NULL : Feedback5B = 2.15 | 4.3 | 0.2

#set current and turn on output
LdCurrentSet = 4400, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.2 | 4.4 | 0.2
NULL : Feedback5B = 2.2 | 4.4 | 0.2

#set current and turn on output
LdCurrentSet = 4500, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.25 | 4.5 | 0.2
NULL : Feedback5B = 2.25 | 4.5 | 0.2

#set current and turn on output
LdCurrentSet = 4600, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.3 | 4.6 | 0.2
NULL : Feedback5B = 2.3 | 4.6 | 0.2

#set current and turn on output
LdCurrentSet = 4700, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.35 | 4.7 | 0.2
NULL : Feedback5B = 2.35 | 4.7 | 0.2

#set current and turn on output
LdCurrentSet = 4800, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.4 | 4.8 | 0.2
NULL : Feedback5B = 2.4 | 4.8 | 0.2

#set current and turn on output
LdCurrentSet = 4900, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.45 | 4.9 | 0.2
NULL : Feedback5B = 2.45 | 4.9 | 0.2

#set current and turn on output
LdCurrentSet = 5000, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.5 | 5.0 | 0.2
NULL : Feedback5B = 2.5 | 5.0 | 0.2

#set current and turn on output
LdCurrentSet = 5100, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.55 | 5.1 | 0.2
NULL : Feedback5B = 2.55 | 5.1 | 0.2

#set current and turn on output
LdCurrentSet = 5200, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.6 | 5.2 | 0.2
NULL : Feedback5B = 2.6 | 5.2 | 0.2

#set current and turn on output
LdCurrentSet = 5300, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.65 | 5.3 | 0.2
NULL : Feedback5B = 2.65 | 5.3 | 0.2

#set current and turn on output
LdCurrentSet = 5400, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.7 | 5.4 | 0.2
NULL : Feedback5B = 2.7 | 5.4 | 0.2

#set current and turn on output
LdCurrentSet = 5500, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.75 | 5.5 | 0.2
NULL : Feedback5B = 2.75 | 5.5 | 0.2

#set current and turn on output
LdCurrentSet = 5600, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.8 | 5.6 | 0.2
NULL : Feedback5B = 2.8 | 5.6 | 0.2

#set current and turn on output
LdCurrentSet = 5700, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.85 | 5.7 | 0.2
NULL : Feedback5B = 2.85 | 5.7 | 0.2

#set current and turn on output
LdCurrentSet = 5800, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.9 | 5.8 | 0.2
NULL : Feedback5B = 2.9 | 5.8 | 0.2

#set current and turn on output
LdCurrentSet = 5900, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 2.95 | 5.9 | 0.2
NULL : Feedback5B = 2.95 | 5.9 | 0.2

#set current and turn on output
LdCurrentSet = 6000, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.0 | 6.0 | 0.2
NULL : Feedback5B = 3.0 | 6.0 | 0.2

#set current and turn on output
LdCurrentSet = 6100, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.05 | 6.1 | 0.2
NULL : Feedback5B = 3.05 | 6.1 | 0.2

#set current and turn on output
LdCurrentSet = 6200, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.1 | 6.2 | 0.2
NULL : Feedback5B = 3.1 | 6.2 | 0.2

#set current and turn on output
LdCurrentSet = 6300, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.15 | 6.3 | 0.2
NULL : Feedback5B = 3.15 | 6.3 | 0.2

#set current and turn on output
LdCurrentSet = 6400, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.2 | 6.4 | 0.2
NULL : Feedback5B = 3.2 | 6.4 | 0.2

#set current and turn on output
LdCurrentSet = 6500, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.25 | 6.5 | 0.2
NULL : Feedback5B = 3.25 | 6.5 | 0.2

#set current and turn on output
LdCurrentSet = 6600, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.3 | 6.6 | 0.2
NULL : Feedback5B = 3.3 | 6.6 | 0.2

#set current and turn on output
LdCurrentSet = 6700, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.35 | 6.7 | 0.2
NULL : Feedback5B = 3.35 | 6.7 | 0.2

#set current and turn on output
LdCurrentSet = 6800, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.4 | 6.8 | 0.2
NULL : Feedback5B = 3.4 | 6.8 | 0.2

#set current and turn on output
LdCurrentSet = 6900, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.45 | 6.9 | 0.2
NULL : Feedback5B = 3.45 | 6.9 | 0.2

#set current and turn on output
LdCurrentSet = 7000, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.5 | 7.0 | 0.2
NULL : Feedback5B = 3.5 | 7.0 | 0.2

#set current and turn on output
LdCurrentSet = 7100, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.55 | 7.1 | 0.2
NULL : Feedback5B = 3.55 | 7.1 | 0.2

#set current and turn on output
LdCurrentSet = 7200, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.6 | 7.2 | 0.2
NULL : Feedback5B = 3.6 | 7.2 | 0.2

#set current and turn on output
LdCurrentSet = 7300, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.65 | 7.3 | 0.2
NULL : Feedback5B = 3.65 | 7.3 | 0.2

#set current and turn on output
LdCurrentSet = 7400, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.7 | 7.4 | 0.2
NULL : Feedback5B = 3.7 | 7.4 | 0.2

#set current and turn on output
LdCurrentSet = 7500, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.75 | 7.5 | 0.2
NULL : Feedback5B = 3.75 | 7.5 | 0.2

#set current and turn on output
LdCurrentSet = 7600, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.8 | 7.6 | 0.2
NULL : Feedback5B = 3.8 | 7.6 | 0.2

#set current and turn on output
LdCurrentSet = 7700, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.85 | 7.7 | 0.2
NULL : Feedback5B = 3.85 | 7.7 | 0.2

#set current and turn on output
LdCurrentSet = 7800, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.9 | 7.8 | 0.2
NULL : Feedback5B = 3.9 | 7.8 | 0.2

#set current and turn on output
LdCurrentSet = 7900, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 3.95 | 7.9 | 0.2
NULL : Feedback5B = 3.95 | 7.9 | 0.2

#set current and turn on output
LdCurrentSet = 8000, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.0 | 8.0 | 0.2
NULL : Feedback5B = 4.0 | 8.0 | 0.2

#set current and turn on output
LdCurrentSet = 8100, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.05 | 8.1 | 0.2
NULL : Feedback5B = 4.05 | 8.1 | 0.2

#set current and turn on output
LdCurrentSet = 8200, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.1 | 8.2 | 0.2
NULL : Feedback5B = 4.1 | 8.2 | 0.2

#set current and turn on output
LdCurrentSet = 8300, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.15 | 8.3 | 0.2
NULL : Feedback5B = 4.15 | 8.3 | 0.2

#set current and turn on output
LdCurrentSet = 8400, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.2 | 8.4 | 0.2
NULL : Feedback5B = 4.2 | 8.4 | 0.2

#set current and turn on output
LdCurrentSet = 8500, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.25 | 8.5 | 0.2
NULL : Feedback5B = 4.25 | 8.5 | 0.2

#set current and turn on output
LdCurrentSet = 8600, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.3 | 8.6 | 0.2
NULL : Feedback5B = 4.3 | 8.6 | 0.2

#set current and turn on output
LdCurrentSet = 8700, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.700000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.35 | 8.7 | 0.2
NULL : Feedback5B = 4.35 | 8.7 | 0.2

#set current and turn on output
LdCurrentSet = 8800, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.4 | 8.8 | 0.2
NULL : Feedback5B = 4.4 | 8.8 | 0.2

#set current and turn on output
LdCurrentSet = 8900, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.45 | 8.9 | 0.2
NULL : Feedback5B = 4.45 | 8.9 | 0.2

#set current and turn on output
LdCurrentSet = 9000, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.5 | 9.0 | 0.2
NULL : Feedback5B = 4.5 | 9.0 | 0.2

#set current and turn on output
LdCurrentSet = 9100, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.55 | 9.1 | 0.2
NULL : Feedback5B = 4.55 | 9.1 | 0.2

#set current and turn on output
LdCurrentSet = 9200, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.200000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.6 | 9.2 | 0.2
NULL : Feedback5B = 4.6 | 9.2 | 0.2

#set current and turn on output
LdCurrentSet = 9300, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.65 | 9.3 | 0.2
NULL : Feedback5B = 4.65 | 9.3 | 0.2

#set current and turn on output
LdCurrentSet = 9400, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.7 | 9.4 | 0.2
NULL : Feedback5B = 4.7 | 9.4 | 0.2

#set current and turn on output
LdCurrentSet = 9500, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.75 | 9.5 | 0.2
NULL : Feedback5B = 4.75 | 9.5 | 0.2

#set current and turn on output
LdCurrentSet = 9600, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.8 | 9.6 | 0.2
NULL : Feedback5B = 4.8 | 9.6 | 0.2

#set current and turn on output
LdCurrentSet = 9700, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.700000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.85 | 9.7 | 0.2
NULL : Feedback5B = 4.85 | 9.7 | 0.2

#set current and turn on output
LdCurrentSet = 9800, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.9 | 9.8 | 0.2
NULL : Feedback5B = 4.9 | 9.8 | 0.2

#set current and turn on output
LdCurrentSet = 9900, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 4.95 | 9.9 | 0.2
NULL : Feedback5B = 4.95 | 9.9 | 0.2

#set current and turn on output
LdCurrentSet = 10000, Command = 81, Output5A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 10.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback5A = 5.0 | 10.0 | 0.2
NULL : Feedback5B = 5.0 | 10.0 | 0.2

#verify fault status
NULL : OutStat5A = 2 | 0 | 0.1
NULL : OutStat5B = 2 | 0 | 0.1
#disconnect outputs from load line, clear current
Output5A = 0 : NULL : WAIT = 0.1
J2_09 = 0, J2_10 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1

#switch outputs to load line
J2_11 = 1, J2_12 = 1 : NULL : WAIT = 0.5

#set current and turn on output
LdCurrentSet = 0, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.0 | 0.0 | 0.2
NULL : Feedback6B = 0.0 | 0.0 | 0.2

#set current and turn on output
LdCurrentSet = 100, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.05 | 0.1 | 0.2
NULL : Feedback6B = 0.05 | 0.1 | 0.2

#set current and turn on output
LdCurrentSet = 200, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.1 | 0.2 | 0.2
NULL : Feedback6B = 0.1 | 0.2 | 0.2

#set current and turn on output
LdCurrentSet = 300, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.15 | 0.3 | 0.2
NULL : Feedback6B = 0.15 | 0.3 | 0.2

#set current and turn on output
LdCurrentSet = 400, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.2 | 0.4 | 0.2
NULL : Feedback6B = 0.2 | 0.4 | 0.2

#set current and turn on output
LdCurrentSet = 500, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.25 | 0.5 | 0.2
NULL : Feedback6B = 0.25 | 0.5 | 0.2

#set current and turn on output
LdCurrentSet = 600, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.3 | 0.6 | 0.2
NULL : Feedback6B = 0.3 | 0.6 | 0.2

#set current and turn on output
LdCurrentSet = 700, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.35 | 0.7 | 0.2
NULL : Feedback6B = 0.35 | 0.7 | 0.2

#set current and turn on output
LdCurrentSet = 800, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.4 | 0.8 | 0.2
NULL : Feedback6B = 0.4 | 0.8 | 0.2

#set current and turn on output
LdCurrentSet = 900, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.45 | 0.9 | 0.2
NULL : Feedback6B = 0.45 | 0.9 | 0.2

#set current and turn on output
LdCurrentSet = 1000, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.5 | 1.0 | 0.2
NULL : Feedback6B = 0.5 | 1.0 | 0.2

#set current and turn on output
LdCurrentSet = 1100, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.55 | 1.1 | 0.2
NULL : Feedback6B = 0.55 | 1.1 | 0.2

#set current and turn on output
LdCurrentSet = 1200, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.6 | 1.2 | 0.2
NULL : Feedback6B = 0.6 | 1.2 | 0.2

#set current and turn on output
LdCurrentSet = 1300, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.65 | 1.3 | 0.2
NULL : Feedback6B = 0.65 | 1.3 | 0.2

#set current and turn on output
LdCurrentSet = 1400, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.7 | 1.4 | 0.2
NULL : Feedback6B = 0.7 | 1.4 | 0.2

#set current and turn on output
LdCurrentSet = 1500, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.75 | 1.5 | 0.2
NULL : Feedback6B = 0.75 | 1.5 | 0.2

#set current and turn on output
LdCurrentSet = 1600, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.8 | 1.6 | 0.2
NULL : Feedback6B = 0.8 | 1.6 | 0.2

#set current and turn on output
LdCurrentSet = 1700, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.85 | 1.7 | 0.2
NULL : Feedback6B = 0.85 | 1.7 | 0.2

#set current and turn on output
LdCurrentSet = 1800, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.9 | 1.8 | 0.2
NULL : Feedback6B = 0.9 | 1.8 | 0.2

#set current and turn on output
LdCurrentSet = 1900, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 0.95 | 1.9 | 0.2
NULL : Feedback6B = 0.95 | 1.9 | 0.2

#set current and turn on output
LdCurrentSet = 2000, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.0 | 2.0 | 0.2
NULL : Feedback6B = 1.0 | 2.0 | 0.2

#set current and turn on output
LdCurrentSet = 2100, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.05 | 2.1 | 0.2
NULL : Feedback6B = 1.05 | 2.1 | 0.2

#set current and turn on output
LdCurrentSet = 2200, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.1 | 2.2 | 0.2
NULL : Feedback6B = 1.1 | 2.2 | 0.2

#set current and turn on output
LdCurrentSet = 2300, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.15 | 2.3 | 0.2
NULL : Feedback6B = 1.15 | 2.3 | 0.2

#set current and turn on output
LdCurrentSet = 2400, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.2 | 2.4 | 0.2
NULL : Feedback6B = 1.2 | 2.4 | 0.2

#set current and turn on output
LdCurrentSet = 2500, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.25 | 2.5 | 0.2
NULL : Feedback6B = 1.25 | 2.5 | 0.2

#set current and turn on output
LdCurrentSet = 2600, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.3 | 2.6 | 0.2
NULL : Feedback6B = 1.3 | 2.6 | 0.2

#set current and turn on output
LdCurrentSet = 2700, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.35 | 2.7 | 0.2
NULL : Feedback6B = 1.35 | 2.7 | 0.2

#set current and turn on output
LdCurrentSet = 2800, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.4 | 2.8 | 0.2
NULL : Feedback6B = 1.4 | 2.8 | 0.2

#set current and turn on output
LdCurrentSet = 2900, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.45 | 2.9 | 0.2
NULL : Feedback6B = 1.45 | 2.9 | 0.2

#set current and turn on output
LdCurrentSet = 3000, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.5 | 3.0 | 0.2
NULL : Feedback6B = 1.5 | 3.0 | 0.2

#set current and turn on output
LdCurrentSet = 3100, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.55 | 3.1 | 0.2
NULL : Feedback6B = 1.55 | 3.1 | 0.2

#set current and turn on output
LdCurrentSet = 3200, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.6 | 3.2 | 0.2
NULL : Feedback6B = 1.6 | 3.2 | 0.2

#set current and turn on output
LdCurrentSet = 3300, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.65 | 3.3 | 0.2
NULL : Feedback6B = 1.65 | 3.3 | 0.2

#set current and turn on output
LdCurrentSet = 3400, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.7 | 3.4 | 0.2
NULL : Feedback6B = 1.7 | 3.4 | 0.2

#set current and turn on output
LdCurrentSet = 3500, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.75 | 3.5 | 0.2
NULL : Feedback6B = 1.75 | 3.5 | 0.2

#set current and turn on output
LdCurrentSet = 3600, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.8 | 3.6 | 0.2
NULL : Feedback6B = 1.8 | 3.6 | 0.2

#set current and turn on output
LdCurrentSet = 3700, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.85 | 3.7 | 0.2
NULL : Feedback6B = 1.85 | 3.7 | 0.2

#set current and turn on output
LdCurrentSet = 3800, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.9 | 3.8 | 0.2
NULL : Feedback6B = 1.9 | 3.8 | 0.2

#set current and turn on output
LdCurrentSet = 3900, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 1.95 | 3.9 | 0.2
NULL : Feedback6B = 1.95 | 3.9 | 0.2

#set current and turn on output
LdCurrentSet = 4000, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.0 | 4.0 | 0.2
NULL : Feedback6B = 2.0 | 4.0 | 0.2

#set current and turn on output
LdCurrentSet = 4100, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.05 | 4.1 | 0.2
NULL : Feedback6B = 2.05 | 4.1 | 0.2

#set current and turn on output
LdCurrentSet = 4200, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.1 | 4.2 | 0.2
NULL : Feedback6B = 2.1 | 4.2 | 0.2

#set current and turn on output
LdCurrentSet = 4300, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.15 | 4.3 | 0.2
NULL : Feedback6B = 2.15 | 4.3 | 0.2

#set current and turn on output
LdCurrentSet = 4400, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.2 | 4.4 | 0.2
NULL : Feedback6B = 2.2 | 4.4 | 0.2

#set current and turn on output
LdCurrentSet = 4500, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.25 | 4.5 | 0.2
NULL : Feedback6B = 2.25 | 4.5 | 0.2

#set current and turn on output
LdCurrentSet = 4600, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.3 | 4.6 | 0.2
NULL : Feedback6B = 2.3 | 4.6 | 0.2

#set current and turn on output
LdCurrentSet = 4700, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.35 | 4.7 | 0.2
NULL : Feedback6B = 2.35 | 4.7 | 0.2

#set current and turn on output
LdCurrentSet = 4800, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.4 | 4.8 | 0.2
NULL : Feedback6B = 2.4 | 4.8 | 0.2

#set current and turn on output
LdCurrentSet = 4900, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.45 | 4.9 | 0.2
NULL : Feedback6B = 2.45 | 4.9 | 0.2

#set current and turn on output
LdCurrentSet = 5000, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.5 | 5.0 | 0.2
NULL : Feedback6B = 2.5 | 5.0 | 0.2

#set current and turn on output
LdCurrentSet = 5100, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.55 | 5.1 | 0.2
NULL : Feedback6B = 2.55 | 5.1 | 0.2

#set current and turn on output
LdCurrentSet = 5200, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.6 | 5.2 | 0.2
NULL : Feedback6B = 2.6 | 5.2 | 0.2

#set current and turn on output
LdCurrentSet = 5300, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.65 | 5.3 | 0.2
NULL : Feedback6B = 2.65 | 5.3 | 0.2

#set current and turn on output
LdCurrentSet = 5400, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.7 | 5.4 | 0.2
NULL : Feedback6B = 2.7 | 5.4 | 0.2

#set current and turn on output
LdCurrentSet = 5500, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.75 | 5.5 | 0.2
NULL : Feedback6B = 2.75 | 5.5 | 0.2

#set current and turn on output
LdCurrentSet = 5600, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.8 | 5.6 | 0.2
NULL : Feedback6B = 2.8 | 5.6 | 0.2

#set current and turn on output
LdCurrentSet = 5700, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.85 | 5.7 | 0.2
NULL : Feedback6B = 2.85 | 5.7 | 0.2

#set current and turn on output
LdCurrentSet = 5800, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.9 | 5.8 | 0.2
NULL : Feedback6B = 2.9 | 5.8 | 0.2

#set current and turn on output
LdCurrentSet = 5900, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 2.95 | 5.9 | 0.2
NULL : Feedback6B = 2.95 | 5.9 | 0.2

#set current and turn on output
LdCurrentSet = 6000, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.0 | 6.0 | 0.2
NULL : Feedback6B = 3.0 | 6.0 | 0.2

#set current and turn on output
LdCurrentSet = 6100, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.05 | 6.1 | 0.2
NULL : Feedback6B = 3.05 | 6.1 | 0.2

#set current and turn on output
LdCurrentSet = 6200, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.1 | 6.2 | 0.2
NULL : Feedback6B = 3.1 | 6.2 | 0.2

#set current and turn on output
LdCurrentSet = 6300, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.15 | 6.3 | 0.2
NULL : Feedback6B = 3.15 | 6.3 | 0.2

#set current and turn on output
LdCurrentSet = 6400, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.2 | 6.4 | 0.2
NULL : Feedback6B = 3.2 | 6.4 | 0.2

#set current and turn on output
LdCurrentSet = 6500, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.25 | 6.5 | 0.2
NULL : Feedback6B = 3.25 | 6.5 | 0.2

#set current and turn on output
LdCurrentSet = 6600, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.3 | 6.6 | 0.2
NULL : Feedback6B = 3.3 | 6.6 | 0.2

#set current and turn on output
LdCurrentSet = 6700, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.35 | 6.7 | 0.2
NULL : Feedback6B = 3.35 | 6.7 | 0.2

#set current and turn on output
LdCurrentSet = 6800, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.4 | 6.8 | 0.2
NULL : Feedback6B = 3.4 | 6.8 | 0.2

#set current and turn on output
LdCurrentSet = 6900, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.45 | 6.9 | 0.2
NULL : Feedback6B = 3.45 | 6.9 | 0.2

#set current and turn on output
LdCurrentSet = 7000, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.5 | 7.0 | 0.2
NULL : Feedback6B = 3.5 | 7.0 | 0.2

#set current and turn on output
LdCurrentSet = 7100, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.55 | 7.1 | 0.2
NULL : Feedback6B = 3.55 | 7.1 | 0.2

#set current and turn on output
LdCurrentSet = 7200, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.6 | 7.2 | 0.2
NULL : Feedback6B = 3.6 | 7.2 | 0.2

#set current and turn on output
LdCurrentSet = 7300, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.65 | 7.3 | 0.2
NULL : Feedback6B = 3.65 | 7.3 | 0.2

#set current and turn on output
LdCurrentSet = 7400, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.7 | 7.4 | 0.2
NULL : Feedback6B = 3.7 | 7.4 | 0.2

#set current and turn on output
LdCurrentSet = 7500, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.75 | 7.5 | 0.2
NULL : Feedback6B = 3.75 | 7.5 | 0.2

#set current and turn on output
LdCurrentSet = 7600, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.8 | 7.6 | 0.2
NULL : Feedback6B = 3.8 | 7.6 | 0.2

#set current and turn on output
LdCurrentSet = 7700, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.85 | 7.7 | 0.2
NULL : Feedback6B = 3.85 | 7.7 | 0.2

#set current and turn on output
LdCurrentSet = 7800, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.9 | 7.8 | 0.2
NULL : Feedback6B = 3.9 | 7.8 | 0.2

#set current and turn on output
LdCurrentSet = 7900, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 3.95 | 7.9 | 0.2
NULL : Feedback6B = 3.95 | 7.9 | 0.2

#set current and turn on output
LdCurrentSet = 8000, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.0 | 8.0 | 0.2
NULL : Feedback6B = 4.0 | 8.0 | 0.2

#set current and turn on output
LdCurrentSet = 8100, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.05 | 8.1 | 0.2
NULL : Feedback6B = 4.05 | 8.1 | 0.2

#set current and turn on output
LdCurrentSet = 8200, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.1 | 8.2 | 0.2
NULL : Feedback6B = 4.1 | 8.2 | 0.2

#set current and turn on output
LdCurrentSet = 8300, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.15 | 8.3 | 0.2
NULL : Feedback6B = 4.15 | 8.3 | 0.2

#set current and turn on output
LdCurrentSet = 8400, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.2 | 8.4 | 0.2
NULL : Feedback6B = 4.2 | 8.4 | 0.2

#set current and turn on output
LdCurrentSet = 8500, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.25 | 8.5 | 0.2
NULL : Feedback6B = 4.25 | 8.5 | 0.2

#set current and turn on output
LdCurrentSet = 8600, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.3 | 8.6 | 0.2
NULL : Feedback6B = 4.3 | 8.6 | 0.2

#set current and turn on output
LdCurrentSet = 8700, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.700000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.35 | 8.7 | 0.2
NULL : Feedback6B = 4.35 | 8.7 | 0.2

#set current and turn on output
LdCurrentSet = 8800, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.4 | 8.8 | 0.2
NULL : Feedback6B = 4.4 | 8.8 | 0.2

#set current and turn on output
LdCurrentSet = 8900, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.45 | 8.9 | 0.2
NULL : Feedback6B = 4.45 | 8.9 | 0.2

#set current and turn on output
LdCurrentSet = 9000, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.5 | 9.0 | 0.2
NULL : Feedback6B = 4.5 | 9.0 | 0.2

#set current and turn on output
LdCurrentSet = 9100, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.55 | 9.1 | 0.2
NULL : Feedback6B = 4.55 | 9.1 | 0.2

#set current and turn on output
LdCurrentSet = 9200, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.200000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.6 | 9.2 | 0.2
NULL : Feedback6B = 4.6 | 9.2 | 0.2

#set current and turn on output
LdCurrentSet = 9300, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.65 | 9.3 | 0.2
NULL : Feedback6B = 4.65 | 9.3 | 0.2

#set current and turn on output
LdCurrentSet = 9400, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.7 | 9.4 | 0.2
NULL : Feedback6B = 4.7 | 9.4 | 0.2

#set current and turn on output
LdCurrentSet = 9500, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.75 | 9.5 | 0.2
NULL : Feedback6B = 4.75 | 9.5 | 0.2

#set current and turn on output
LdCurrentSet = 9600, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.8 | 9.6 | 0.2
NULL : Feedback6B = 4.8 | 9.6 | 0.2

#set current and turn on output
LdCurrentSet = 9700, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.700000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.85 | 9.7 | 0.2
NULL : Feedback6B = 4.85 | 9.7 | 0.2

#set current and turn on output
LdCurrentSet = 9800, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.9 | 9.8 | 0.2
NULL : Feedback6B = 4.9 | 9.8 | 0.2

#set current and turn on output
LdCurrentSet = 9900, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 4.95 | 9.9 | 0.2
NULL : Feedback6B = 4.95 | 9.9 | 0.2

#set current and turn on output
LdCurrentSet = 10000, Command = 81, Output6A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 10.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback6A = 5.0 | 10.0 | 0.2
NULL : Feedback6B = 5.0 | 10.0 | 0.2

#verify fault status
NULL : OutStat6A = 2 | 0 | 0.1
NULL : OutStat6B = 2 | 0 | 0.1
#disconnect outputs from load line, clear current
Output6A = 0 : NULL : WAIT = 0.1
J2_11 = 0, J2_12 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1

#switch outputs to load line
J3_01 = 1, J3_02 = 1 : NULL : WAIT = 0.5

#set current and turn on output
LdCurrentSet = 0, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.0 | 0.0 | 0.2
NULL : Feedback7B = 0.0 | 0.0 | 0.2

#set current and turn on output
LdCurrentSet = 100, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.05 | 0.1 | 0.2
NULL : Feedback7B = 0.05 | 0.1 | 0.2

#set current and turn on output
LdCurrentSet = 200, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.1 | 0.2 | 0.2
NULL : Feedback7B = 0.1 | 0.2 | 0.2

#set current and turn on output
LdCurrentSet = 300, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.15 | 0.3 | 0.2
NULL : Feedback7B = 0.15 | 0.3 | 0.2

#set current and turn on output
LdCurrentSet = 400, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.2 | 0.4 | 0.2
NULL : Feedback7B = 0.2 | 0.4 | 0.2

#set current and turn on output
LdCurrentSet = 500, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.25 | 0.5 | 0.2
NULL : Feedback7B = 0.25 | 0.5 | 0.2

#set current and turn on output
LdCurrentSet = 600, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.3 | 0.6 | 0.2
NULL : Feedback7B = 0.3 | 0.6 | 0.2

#set current and turn on output
LdCurrentSet = 700, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.35 | 0.7 | 0.2
NULL : Feedback7B = 0.35 | 0.7 | 0.2

#set current and turn on output
LdCurrentSet = 800, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.4 | 0.8 | 0.2
NULL : Feedback7B = 0.4 | 0.8 | 0.2

#set current and turn on output
LdCurrentSet = 900, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.45 | 0.9 | 0.2
NULL : Feedback7B = 0.45 | 0.9 | 0.2

#set current and turn on output
LdCurrentSet = 1000, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.5 | 1.0 | 0.2
NULL : Feedback7B = 0.5 | 1.0 | 0.2

#set current and turn on output
LdCurrentSet = 1100, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.55 | 1.1 | 0.2
NULL : Feedback7B = 0.55 | 1.1 | 0.2

#set current and turn on output
LdCurrentSet = 1200, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.6 | 1.2 | 0.2
NULL : Feedback7B = 0.6 | 1.2 | 0.2

#set current and turn on output
LdCurrentSet = 1300, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.65 | 1.3 | 0.2
NULL : Feedback7B = 0.65 | 1.3 | 0.2

#set current and turn on output
LdCurrentSet = 1400, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.7 | 1.4 | 0.2
NULL : Feedback7B = 0.7 | 1.4 | 0.2

#set current and turn on output
LdCurrentSet = 1500, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.75 | 1.5 | 0.2
NULL : Feedback7B = 0.75 | 1.5 | 0.2

#set current and turn on output
LdCurrentSet = 1600, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.8 | 1.6 | 0.2
NULL : Feedback7B = 0.8 | 1.6 | 0.2

#set current and turn on output
LdCurrentSet = 1700, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.85 | 1.7 | 0.2
NULL : Feedback7B = 0.85 | 1.7 | 0.2

#set current and turn on output
LdCurrentSet = 1800, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.9 | 1.8 | 0.2
NULL : Feedback7B = 0.9 | 1.8 | 0.2

#set current and turn on output
LdCurrentSet = 1900, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 0.95 | 1.9 | 0.2
NULL : Feedback7B = 0.95 | 1.9 | 0.2

#set current and turn on output
LdCurrentSet = 2000, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.0 | 2.0 | 0.2
NULL : Feedback7B = 1.0 | 2.0 | 0.2

#set current and turn on output
LdCurrentSet = 2100, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.05 | 2.1 | 0.2
NULL : Feedback7B = 1.05 | 2.1 | 0.2

#set current and turn on output
LdCurrentSet = 2200, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.1 | 2.2 | 0.2
NULL : Feedback7B = 1.1 | 2.2 | 0.2

#set current and turn on output
LdCurrentSet = 2300, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.15 | 2.3 | 0.2
NULL : Feedback7B = 1.15 | 2.3 | 0.2

#set current and turn on output
LdCurrentSet = 2400, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.2 | 2.4 | 0.2
NULL : Feedback7B = 1.2 | 2.4 | 0.2

#set current and turn on output
LdCurrentSet = 2500, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.25 | 2.5 | 0.2
NULL : Feedback7B = 1.25 | 2.5 | 0.2

#set current and turn on output
LdCurrentSet = 2600, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.3 | 2.6 | 0.2
NULL : Feedback7B = 1.3 | 2.6 | 0.2

#set current and turn on output
LdCurrentSet = 2700, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.35 | 2.7 | 0.2
NULL : Feedback7B = 1.35 | 2.7 | 0.2

#set current and turn on output
LdCurrentSet = 2800, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.4 | 2.8 | 0.2
NULL : Feedback7B = 1.4 | 2.8 | 0.2

#set current and turn on output
LdCurrentSet = 2900, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.45 | 2.9 | 0.2
NULL : Feedback7B = 1.45 | 2.9 | 0.2

#set current and turn on output
LdCurrentSet = 3000, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.5 | 3.0 | 0.2
NULL : Feedback7B = 1.5 | 3.0 | 0.2

#set current and turn on output
LdCurrentSet = 3100, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.55 | 3.1 | 0.2
NULL : Feedback7B = 1.55 | 3.1 | 0.2

#set current and turn on output
LdCurrentSet = 3200, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.6 | 3.2 | 0.2
NULL : Feedback7B = 1.6 | 3.2 | 0.2

#set current and turn on output
LdCurrentSet = 3300, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.65 | 3.3 | 0.2
NULL : Feedback7B = 1.65 | 3.3 | 0.2

#set current and turn on output
LdCurrentSet = 3400, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.7 | 3.4 | 0.2
NULL : Feedback7B = 1.7 | 3.4 | 0.2

#set current and turn on output
LdCurrentSet = 3500, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.75 | 3.5 | 0.2
NULL : Feedback7B = 1.75 | 3.5 | 0.2

#set current and turn on output
LdCurrentSet = 3600, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.8 | 3.6 | 0.2
NULL : Feedback7B = 1.8 | 3.6 | 0.2

#set current and turn on output
LdCurrentSet = 3700, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.85 | 3.7 | 0.2
NULL : Feedback7B = 1.85 | 3.7 | 0.2

#set current and turn on output
LdCurrentSet = 3800, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.9 | 3.8 | 0.2
NULL : Feedback7B = 1.9 | 3.8 | 0.2

#set current and turn on output
LdCurrentSet = 3900, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 1.95 | 3.9 | 0.2
NULL : Feedback7B = 1.95 | 3.9 | 0.2

#set current and turn on output
LdCurrentSet = 4000, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.0 | 4.0 | 0.2
NULL : Feedback7B = 2.0 | 4.0 | 0.2

#set current and turn on output
LdCurrentSet = 4100, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.05 | 4.1 | 0.2
NULL : Feedback7B = 2.05 | 4.1 | 0.2

#set current and turn on output
LdCurrentSet = 4200, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.1 | 4.2 | 0.2
NULL : Feedback7B = 2.1 | 4.2 | 0.2

#set current and turn on output
LdCurrentSet = 4300, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.15 | 4.3 | 0.2
NULL : Feedback7B = 2.15 | 4.3 | 0.2

#set current and turn on output
LdCurrentSet = 4400, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.2 | 4.4 | 0.2
NULL : Feedback7B = 2.2 | 4.4 | 0.2

#set current and turn on output
LdCurrentSet = 4500, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.25 | 4.5 | 0.2
NULL : Feedback7B = 2.25 | 4.5 | 0.2

#set current and turn on output
LdCurrentSet = 4600, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.3 | 4.6 | 0.2
NULL : Feedback7B = 2.3 | 4.6 | 0.2

#set current and turn on output
LdCurrentSet = 4700, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.35 | 4.7 | 0.2
NULL : Feedback7B = 2.35 | 4.7 | 0.2

#set current and turn on output
LdCurrentSet = 4800, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.4 | 4.8 | 0.2
NULL : Feedback7B = 2.4 | 4.8 | 0.2

#set current and turn on output
LdCurrentSet = 4900, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.45 | 4.9 | 0.2
NULL : Feedback7B = 2.45 | 4.9 | 0.2

#set current and turn on output
LdCurrentSet = 5000, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.5 | 5.0 | 0.2
NULL : Feedback7B = 2.5 | 5.0 | 0.2

#set current and turn on output
LdCurrentSet = 5100, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.55 | 5.1 | 0.2
NULL : Feedback7B = 2.55 | 5.1 | 0.2

#set current and turn on output
LdCurrentSet = 5200, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.6 | 5.2 | 0.2
NULL : Feedback7B = 2.6 | 5.2 | 0.2

#set current and turn on output
LdCurrentSet = 5300, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.65 | 5.3 | 0.2
NULL : Feedback7B = 2.65 | 5.3 | 0.2

#set current and turn on output
LdCurrentSet = 5400, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.7 | 5.4 | 0.2
NULL : Feedback7B = 2.7 | 5.4 | 0.2

#set current and turn on output
LdCurrentSet = 5500, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.75 | 5.5 | 0.2
NULL : Feedback7B = 2.75 | 5.5 | 0.2

#set current and turn on output
LdCurrentSet = 5600, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.8 | 5.6 | 0.2
NULL : Feedback7B = 2.8 | 5.6 | 0.2

#set current and turn on output
LdCurrentSet = 5700, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.85 | 5.7 | 0.2
NULL : Feedback7B = 2.85 | 5.7 | 0.2

#set current and turn on output
LdCurrentSet = 5800, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.9 | 5.8 | 0.2
NULL : Feedback7B = 2.9 | 5.8 | 0.2

#set current and turn on output
LdCurrentSet = 5900, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 2.95 | 5.9 | 0.2
NULL : Feedback7B = 2.95 | 5.9 | 0.2

#set current and turn on output
LdCurrentSet = 6000, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.0 | 6.0 | 0.2
NULL : Feedback7B = 3.0 | 6.0 | 0.2

#set current and turn on output
LdCurrentSet = 6100, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.05 | 6.1 | 0.2
NULL : Feedback7B = 3.05 | 6.1 | 0.2

#set current and turn on output
LdCurrentSet = 6200, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.1 | 6.2 | 0.2
NULL : Feedback7B = 3.1 | 6.2 | 0.2

#set current and turn on output
LdCurrentSet = 6300, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.15 | 6.3 | 0.2
NULL : Feedback7B = 3.15 | 6.3 | 0.2

#set current and turn on output
LdCurrentSet = 6400, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.2 | 6.4 | 0.2
NULL : Feedback7B = 3.2 | 6.4 | 0.2

#set current and turn on output
LdCurrentSet = 6500, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.25 | 6.5 | 0.2
NULL : Feedback7B = 3.25 | 6.5 | 0.2

#set current and turn on output
LdCurrentSet = 6600, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.3 | 6.6 | 0.2
NULL : Feedback7B = 3.3 | 6.6 | 0.2

#set current and turn on output
LdCurrentSet = 6700, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.35 | 6.7 | 0.2
NULL : Feedback7B = 3.35 | 6.7 | 0.2

#set current and turn on output
LdCurrentSet = 6800, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.4 | 6.8 | 0.2
NULL : Feedback7B = 3.4 | 6.8 | 0.2

#set current and turn on output
LdCurrentSet = 6900, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.45 | 6.9 | 0.2
NULL : Feedback7B = 3.45 | 6.9 | 0.2

#set current and turn on output
LdCurrentSet = 7000, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.5 | 7.0 | 0.2
NULL : Feedback7B = 3.5 | 7.0 | 0.2

#set current and turn on output
LdCurrentSet = 7100, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.55 | 7.1 | 0.2
NULL : Feedback7B = 3.55 | 7.1 | 0.2

#set current and turn on output
LdCurrentSet = 7200, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.6 | 7.2 | 0.2
NULL : Feedback7B = 3.6 | 7.2 | 0.2

#set current and turn on output
LdCurrentSet = 7300, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.65 | 7.3 | 0.2
NULL : Feedback7B = 3.65 | 7.3 | 0.2

#set current and turn on output
LdCurrentSet = 7400, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.7 | 7.4 | 0.2
NULL : Feedback7B = 3.7 | 7.4 | 0.2

#set current and turn on output
LdCurrentSet = 7500, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.75 | 7.5 | 0.2
NULL : Feedback7B = 3.75 | 7.5 | 0.2

#set current and turn on output
LdCurrentSet = 7600, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.8 | 7.6 | 0.2
NULL : Feedback7B = 3.8 | 7.6 | 0.2

#set current and turn on output
LdCurrentSet = 7700, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.85 | 7.7 | 0.2
NULL : Feedback7B = 3.85 | 7.7 | 0.2

#set current and turn on output
LdCurrentSet = 7800, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.9 | 7.8 | 0.2
NULL : Feedback7B = 3.9 | 7.8 | 0.2

#set current and turn on output
LdCurrentSet = 7900, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 3.95 | 7.9 | 0.2
NULL : Feedback7B = 3.95 | 7.9 | 0.2

#set current and turn on output
LdCurrentSet = 8000, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.0 | 8.0 | 0.2
NULL : Feedback7B = 4.0 | 8.0 | 0.2

#set current and turn on output
LdCurrentSet = 8100, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.05 | 8.1 | 0.2
NULL : Feedback7B = 4.05 | 8.1 | 0.2

#set current and turn on output
LdCurrentSet = 8200, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.1 | 8.2 | 0.2
NULL : Feedback7B = 4.1 | 8.2 | 0.2

#set current and turn on output
LdCurrentSet = 8300, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.15 | 8.3 | 0.2
NULL : Feedback7B = 4.15 | 8.3 | 0.2

#set current and turn on output
LdCurrentSet = 8400, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.2 | 8.4 | 0.2
NULL : Feedback7B = 4.2 | 8.4 | 0.2

#set current and turn on output
LdCurrentSet = 8500, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.25 | 8.5 | 0.2
NULL : Feedback7B = 4.25 | 8.5 | 0.2

#set current and turn on output
LdCurrentSet = 8600, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.3 | 8.6 | 0.2
NULL : Feedback7B = 4.3 | 8.6 | 0.2

#set current and turn on output
LdCurrentSet = 8700, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.700000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.35 | 8.7 | 0.2
NULL : Feedback7B = 4.35 | 8.7 | 0.2

#set current and turn on output
LdCurrentSet = 8800, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.4 | 8.8 | 0.2
NULL : Feedback7B = 4.4 | 8.8 | 0.2

#set current and turn on output
LdCurrentSet = 8900, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.45 | 8.9 | 0.2
NULL : Feedback7B = 4.45 | 8.9 | 0.2

#set current and turn on output
LdCurrentSet = 9000, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.5 | 9.0 | 0.2
NULL : Feedback7B = 4.5 | 9.0 | 0.2

#set current and turn on output
LdCurrentSet = 9100, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.55 | 9.1 | 0.2
NULL : Feedback7B = 4.55 | 9.1 | 0.2

#set current and turn on output
LdCurrentSet = 9200, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.200000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.6 | 9.2 | 0.2
NULL : Feedback7B = 4.6 | 9.2 | 0.2

#set current and turn on output
LdCurrentSet = 9300, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.65 | 9.3 | 0.2
NULL : Feedback7B = 4.65 | 9.3 | 0.2

#set current and turn on output
LdCurrentSet = 9400, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.7 | 9.4 | 0.2
NULL : Feedback7B = 4.7 | 9.4 | 0.2

#set current and turn on output
LdCurrentSet = 9500, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.75 | 9.5 | 0.2
NULL : Feedback7B = 4.75 | 9.5 | 0.2

#set current and turn on output
LdCurrentSet = 9600, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.8 | 9.6 | 0.2
NULL : Feedback7B = 4.8 | 9.6 | 0.2

#set current and turn on output
LdCurrentSet = 9700, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.700000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.85 | 9.7 | 0.2
NULL : Feedback7B = 4.85 | 9.7 | 0.2

#set current and turn on output
LdCurrentSet = 9800, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.9 | 9.8 | 0.2
NULL : Feedback7B = 4.9 | 9.8 | 0.2

#set current and turn on output
LdCurrentSet = 9900, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 4.95 | 9.9 | 0.2
NULL : Feedback7B = 4.95 | 9.9 | 0.2

#set current and turn on output
LdCurrentSet = 10000, Command = 81, Output7A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 10.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback7A = 5.0 | 10.0 | 0.2
NULL : Feedback7B = 5.0 | 10.0 | 0.2

#verify fault status
NULL : OutStat7A = 2 | 0 | 0.1
NULL : OutStat7B = 2 | 0 | 0.1
#disconnect outputs from load line, clear current
Output7A = 0 : NULL : WAIT = 0.1
J3_01 = 0, J3_02 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1

#switch outputs to load line
J3_03 = 1, J3_04 = 1 : NULL : WAIT = 0.5

#set current and turn on output
LdCurrentSet = 0, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.0 | 0.0 | 0.2
NULL : Feedback8B = 0.0 | 0.0 | 0.2

#set current and turn on output
LdCurrentSet = 100, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.05 | 0.1 | 0.2
NULL : Feedback8B = 0.05 | 0.1 | 0.2

#set current and turn on output
LdCurrentSet = 200, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.1 | 0.2 | 0.2
NULL : Feedback8B = 0.1 | 0.2 | 0.2

#set current and turn on output
LdCurrentSet = 300, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.15 | 0.3 | 0.2
NULL : Feedback8B = 0.15 | 0.3 | 0.2

#set current and turn on output
LdCurrentSet = 400, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.2 | 0.4 | 0.2
NULL : Feedback8B = 0.2 | 0.4 | 0.2

#set current and turn on output
LdCurrentSet = 500, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.25 | 0.5 | 0.2
NULL : Feedback8B = 0.25 | 0.5 | 0.2

#set current and turn on output
LdCurrentSet = 600, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.3 | 0.6 | 0.2
NULL : Feedback8B = 0.3 | 0.6 | 0.2

#set current and turn on output
LdCurrentSet = 700, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.35 | 0.7 | 0.2
NULL : Feedback8B = 0.35 | 0.7 | 0.2

#set current and turn on output
LdCurrentSet = 800, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.4 | 0.8 | 0.2
NULL : Feedback8B = 0.4 | 0.8 | 0.2

#set current and turn on output
LdCurrentSet = 900, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 0.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.45 | 0.9 | 0.2
NULL : Feedback8B = 0.45 | 0.9 | 0.2

#set current and turn on output
LdCurrentSet = 1000, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.5 | 1.0 | 0.2
NULL : Feedback8B = 0.5 | 1.0 | 0.2

#set current and turn on output
LdCurrentSet = 1100, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.55 | 1.1 | 0.2
NULL : Feedback8B = 0.55 | 1.1 | 0.2

#set current and turn on output
LdCurrentSet = 1200, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.6 | 1.2 | 0.2
NULL : Feedback8B = 0.6 | 1.2 | 0.2

#set current and turn on output
LdCurrentSet = 1300, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.65 | 1.3 | 0.2
NULL : Feedback8B = 0.65 | 1.3 | 0.2

#set current and turn on output
LdCurrentSet = 1400, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.7 | 1.4 | 0.2
NULL : Feedback8B = 0.7 | 1.4 | 0.2

#set current and turn on output
LdCurrentSet = 1500, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.75 | 1.5 | 0.2
NULL : Feedback8B = 0.75 | 1.5 | 0.2

#set current and turn on output
LdCurrentSet = 1600, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.8 | 1.6 | 0.2
NULL : Feedback8B = 0.8 | 1.6 | 0.2

#set current and turn on output
LdCurrentSet = 1700, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.85 | 1.7 | 0.2
NULL : Feedback8B = 0.85 | 1.7 | 0.2

#set current and turn on output
LdCurrentSet = 1800, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.9 | 1.8 | 0.2
NULL : Feedback8B = 0.9 | 1.8 | 0.2

#set current and turn on output
LdCurrentSet = 1900, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 0.95 | 1.9 | 0.2
NULL : Feedback8B = 0.95 | 1.9 | 0.2

#set current and turn on output
LdCurrentSet = 2000, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.0 | 2.0 | 0.2
NULL : Feedback8B = 1.0 | 2.0 | 0.2

#set current and turn on output
LdCurrentSet = 2100, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.05 | 2.1 | 0.2
NULL : Feedback8B = 1.05 | 2.1 | 0.2

#set current and turn on output
LdCurrentSet = 2200, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.1 | 2.2 | 0.2
NULL : Feedback8B = 1.1 | 2.2 | 0.2

#set current and turn on output
LdCurrentSet = 2300, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.15 | 2.3 | 0.2
NULL : Feedback8B = 1.15 | 2.3 | 0.2

#set current and turn on output
LdCurrentSet = 2400, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.2 | 2.4 | 0.2
NULL : Feedback8B = 1.2 | 2.4 | 0.2

#set current and turn on output
LdCurrentSet = 2500, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.25 | 2.5 | 0.2
NULL : Feedback8B = 1.25 | 2.5 | 0.2

#set current and turn on output
LdCurrentSet = 2600, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.3 | 2.6 | 0.2
NULL : Feedback8B = 1.3 | 2.6 | 0.2

#set current and turn on output
LdCurrentSet = 2700, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.35 | 2.7 | 0.2
NULL : Feedback8B = 1.35 | 2.7 | 0.2

#set current and turn on output
LdCurrentSet = 2800, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.4 | 2.8 | 0.2
NULL : Feedback8B = 1.4 | 2.8 | 0.2

#set current and turn on output
LdCurrentSet = 2900, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 2.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.45 | 2.9 | 0.2
NULL : Feedback8B = 1.45 | 2.9 | 0.2

#set current and turn on output
LdCurrentSet = 3000, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.5 | 3.0 | 0.2
NULL : Feedback8B = 1.5 | 3.0 | 0.2

#set current and turn on output
LdCurrentSet = 3100, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.55 | 3.1 | 0.2
NULL : Feedback8B = 1.55 | 3.1 | 0.2

#set current and turn on output
LdCurrentSet = 3200, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.6 | 3.2 | 0.2
NULL : Feedback8B = 1.6 | 3.2 | 0.2

#set current and turn on output
LdCurrentSet = 3300, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.65 | 3.3 | 0.2
NULL : Feedback8B = 1.65 | 3.3 | 0.2

#set current and turn on output
LdCurrentSet = 3400, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.7 | 3.4 | 0.2
NULL : Feedback8B = 1.7 | 3.4 | 0.2

#set current and turn on output
LdCurrentSet = 3500, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.75 | 3.5 | 0.2
NULL : Feedback8B = 1.75 | 3.5 | 0.2

#set current and turn on output
LdCurrentSet = 3600, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.8 | 3.6 | 0.2
NULL : Feedback8B = 1.8 | 3.6 | 0.2

#set current and turn on output
LdCurrentSet = 3700, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.85 | 3.7 | 0.2
NULL : Feedback8B = 1.85 | 3.7 | 0.2

#set current and turn on output
LdCurrentSet = 3800, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.9 | 3.8 | 0.2
NULL : Feedback8B = 1.9 | 3.8 | 0.2

#set current and turn on output
LdCurrentSet = 3900, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 3.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 1.95 | 3.9 | 0.2
NULL : Feedback8B = 1.95 | 3.9 | 0.2

#set current and turn on output
LdCurrentSet = 4000, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.0 | 4.0 | 0.2
NULL : Feedback8B = 2.0 | 4.0 | 0.2

#set current and turn on output
LdCurrentSet = 4100, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.05 | 4.1 | 0.2
NULL : Feedback8B = 2.05 | 4.1 | 0.2

#set current and turn on output
LdCurrentSet = 4200, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.1 | 4.2 | 0.2
NULL : Feedback8B = 2.1 | 4.2 | 0.2

#set current and turn on output
LdCurrentSet = 4300, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.15 | 4.3 | 0.2
NULL : Feedback8B = 2.15 | 4.3 | 0.2

#set current and turn on output
LdCurrentSet = 4400, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.2 | 4.4 | 0.2
NULL : Feedback8B = 2.2 | 4.4 | 0.2

#set current and turn on output
LdCurrentSet = 4500, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.25 | 4.5 | 0.2
NULL : Feedback8B = 2.25 | 4.5 | 0.2

#set current and turn on output
LdCurrentSet = 4600, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.3 | 4.6 | 0.2
NULL : Feedback8B = 2.3 | 4.6 | 0.2

#set current and turn on output
LdCurrentSet = 4700, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.35 | 4.7 | 0.2
NULL : Feedback8B = 2.35 | 4.7 | 0.2

#set current and turn on output
LdCurrentSet = 4800, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.4 | 4.8 | 0.2
NULL : Feedback8B = 2.4 | 4.8 | 0.2

#set current and turn on output
LdCurrentSet = 4900, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 4.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.45 | 4.9 | 0.2
NULL : Feedback8B = 2.45 | 4.9 | 0.2

#set current and turn on output
LdCurrentSet = 5000, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.5 | 5.0 | 0.2
NULL : Feedback8B = 2.5 | 5.0 | 0.2

#set current and turn on output
LdCurrentSet = 5100, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.55 | 5.1 | 0.2
NULL : Feedback8B = 2.55 | 5.1 | 0.2

#set current and turn on output
LdCurrentSet = 5200, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.6 | 5.2 | 0.2
NULL : Feedback8B = 2.6 | 5.2 | 0.2

#set current and turn on output
LdCurrentSet = 5300, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.65 | 5.3 | 0.2
NULL : Feedback8B = 2.65 | 5.3 | 0.2

#set current and turn on output
LdCurrentSet = 5400, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.7 | 5.4 | 0.2
NULL : Feedback8B = 2.7 | 5.4 | 0.2

#set current and turn on output
LdCurrentSet = 5500, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.75 | 5.5 | 0.2
NULL : Feedback8B = 2.75 | 5.5 | 0.2

#set current and turn on output
LdCurrentSet = 5600, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.8 | 5.6 | 0.2
NULL : Feedback8B = 2.8 | 5.6 | 0.2

#set current and turn on output
LdCurrentSet = 5700, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.85 | 5.7 | 0.2
NULL : Feedback8B = 2.85 | 5.7 | 0.2

#set current and turn on output
LdCurrentSet = 5800, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.9 | 5.8 | 0.2
NULL : Feedback8B = 2.9 | 5.8 | 0.2

#set current and turn on output
LdCurrentSet = 5900, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 5.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 2.95 | 5.9 | 0.2
NULL : Feedback8B = 2.95 | 5.9 | 0.2

#set current and turn on output
LdCurrentSet = 6000, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.0 | 6.0 | 0.2
NULL : Feedback8B = 3.0 | 6.0 | 0.2

#set current and turn on output
LdCurrentSet = 6100, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.05 | 6.1 | 0.2
NULL : Feedback8B = 3.05 | 6.1 | 0.2

#set current and turn on output
LdCurrentSet = 6200, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.1 | 6.2 | 0.2
NULL : Feedback8B = 3.1 | 6.2 | 0.2

#set current and turn on output
LdCurrentSet = 6300, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.15 | 6.3 | 0.2
NULL : Feedback8B = 3.15 | 6.3 | 0.2

#set current and turn on output
LdCurrentSet = 6400, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.2 | 6.4 | 0.2
NULL : Feedback8B = 3.2 | 6.4 | 0.2

#set current and turn on output
LdCurrentSet = 6500, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.25 | 6.5 | 0.2
NULL : Feedback8B = 3.25 | 6.5 | 0.2

#set current and turn on output
LdCurrentSet = 6600, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.3 | 6.6 | 0.2
NULL : Feedback8B = 3.3 | 6.6 | 0.2

#set current and turn on output
LdCurrentSet = 6700, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.35 | 6.7 | 0.2
NULL : Feedback8B = 3.35 | 6.7 | 0.2

#set current and turn on output
LdCurrentSet = 6800, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.4 | 6.8 | 0.2
NULL : Feedback8B = 3.4 | 6.8 | 0.2

#set current and turn on output
LdCurrentSet = 6900, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 6.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.45 | 6.9 | 0.2
NULL : Feedback8B = 3.45 | 6.9 | 0.2

#set current and turn on output
LdCurrentSet = 7000, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.5 | 7.0 | 0.2
NULL : Feedback8B = 3.5 | 7.0 | 0.2

#set current and turn on output
LdCurrentSet = 7100, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.1000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.55 | 7.1 | 0.2
NULL : Feedback8B = 3.55 | 7.1 | 0.2

#set current and turn on output
LdCurrentSet = 7200, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.6 | 7.2 | 0.2
NULL : Feedback8B = 3.6 | 7.2 | 0.2

#set current and turn on output
LdCurrentSet = 7300, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.65 | 7.3 | 0.2
NULL : Feedback8B = 3.65 | 7.3 | 0.2

#set current and turn on output
LdCurrentSet = 7400, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.7 | 7.4 | 0.2
NULL : Feedback8B = 3.7 | 7.4 | 0.2

#set current and turn on output
LdCurrentSet = 7500, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.75 | 7.5 | 0.2
NULL : Feedback8B = 3.75 | 7.5 | 0.2

#set current and turn on output
LdCurrentSet = 7600, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.6000000000000005 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.8 | 7.6 | 0.2
NULL : Feedback8B = 3.8 | 7.6 | 0.2

#set current and turn on output
LdCurrentSet = 7700, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.7 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.85 | 7.7 | 0.2
NULL : Feedback8B = 3.85 | 7.7 | 0.2

#set current and turn on output
LdCurrentSet = 7800, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.9 | 7.8 | 0.2
NULL : Feedback8B = 3.9 | 7.8 | 0.2

#set current and turn on output
LdCurrentSet = 7900, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 7.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 3.95 | 7.9 | 0.2
NULL : Feedback8B = 3.95 | 7.9 | 0.2

#set current and turn on output
LdCurrentSet = 8000, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.0 | 8.0 | 0.2
NULL : Feedback8B = 4.0 | 8.0 | 0.2

#set current and turn on output
LdCurrentSet = 8100, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.05 | 8.1 | 0.2
NULL : Feedback8B = 4.05 | 8.1 | 0.2

#set current and turn on output
LdCurrentSet = 8200, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.2 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.1 | 8.2 | 0.2
NULL : Feedback8B = 4.1 | 8.2 | 0.2

#set current and turn on output
LdCurrentSet = 8300, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.15 | 8.3 | 0.2
NULL : Feedback8B = 4.15 | 8.3 | 0.2

#set current and turn on output
LdCurrentSet = 8400, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.2 | 8.4 | 0.2
NULL : Feedback8B = 4.2 | 8.4 | 0.2

#set current and turn on output
LdCurrentSet = 8500, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.25 | 8.5 | 0.2
NULL : Feedback8B = 4.25 | 8.5 | 0.2

#set current and turn on output
LdCurrentSet = 8600, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.3 | 8.6 | 0.2
NULL : Feedback8B = 4.3 | 8.6 | 0.2

#set current and turn on output
LdCurrentSet = 8700, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.700000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.35 | 8.7 | 0.2
NULL : Feedback8B = 4.35 | 8.7 | 0.2

#set current and turn on output
LdCurrentSet = 8800, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.4 | 8.8 | 0.2
NULL : Feedback8B = 4.4 | 8.8 | 0.2

#set current and turn on output
LdCurrentSet = 8900, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 8.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.45 | 8.9 | 0.2
NULL : Feedback8B = 4.45 | 8.9 | 0.2

#set current and turn on output
LdCurrentSet = 9000, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.5 | 9.0 | 0.2
NULL : Feedback8B = 4.5 | 9.0 | 0.2

#set current and turn on output
LdCurrentSet = 9100, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.1 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.55 | 9.1 | 0.2
NULL : Feedback8B = 4.55 | 9.1 | 0.2

#set current and turn on output
LdCurrentSet = 9200, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.200000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.6 | 9.2 | 0.2
NULL : Feedback8B = 4.6 | 9.2 | 0.2

#set current and turn on output
LdCurrentSet = 9300, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.3 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.65 | 9.3 | 0.2
NULL : Feedback8B = 4.65 | 9.3 | 0.2

#set current and turn on output
LdCurrentSet = 9400, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.4 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.7 | 9.4 | 0.2
NULL : Feedback8B = 4.7 | 9.4 | 0.2

#set current and turn on output
LdCurrentSet = 9500, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.5 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.75 | 9.5 | 0.2
NULL : Feedback8B = 4.75 | 9.5 | 0.2

#set current and turn on output
LdCurrentSet = 9600, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.6 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.8 | 9.6 | 0.2
NULL : Feedback8B = 4.8 | 9.6 | 0.2

#set current and turn on output
LdCurrentSet = 9700, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.700000000000001 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.85 | 9.7 | 0.2
NULL : Feedback8B = 4.85 | 9.7 | 0.2

#set current and turn on output
LdCurrentSet = 9800, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.8 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.9 | 9.8 | 0.2
NULL : Feedback8B = 4.9 | 9.8 | 0.2

#set current and turn on output
LdCurrentSet = 9900, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 9.9 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 4.95 | 9.9 | 0.2
NULL : Feedback8B = 4.95 | 9.9 | 0.2

#set current and turn on output
LdCurrentSet = 10000, Command = 81, Output8A = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : MeterCurrent = 10.0 | 0.01 | 0.2
#verify feedback
NULL : Feedback8A = 5.0 | 10.0 | 0.2
NULL : Feedback8B = 5.0 | 10.0 | 0.2

#verify fault status
NULL : OutStat8A = 2 | 0 | 0.1
NULL : OutStat8B = 2 | 0 | 0.1
#disconnect outputs from load line, clear current
Output8A = 0 : NULL : WAIT = 0.1
J3_03 = 0, J3_04 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1

LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
SAVE
END
