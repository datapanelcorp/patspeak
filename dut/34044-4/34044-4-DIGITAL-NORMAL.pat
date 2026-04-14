#34044-4
#Verion 0.0
UUT_DBC = 34044-564.dbc
UUT_DATANAME = 34044-4-DIGITAL-NORMAL

#-----setup 34044-----
#configure as Output Digital ON/OFF
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1, MODE5A = 1, MODE5B = 1, MODE6A = 1, MODE6B = 1, MODE7A = 1, MODE7B = 1 : NULL : WAIT = 0.5
Command = 84, MODE8A = 1, MODE8B = 1 : NULL : WAIT = 0.5
Command = 82, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 93, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0, PORT5_MODE = 0, PORT6_MODE = 0, PORT7_MODE = 0, PORT8_MODE = 0 : NULL : WAIT = 0.5
Command = 82, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 82, SaveSettings = 1 : NULL : WAIT = 0.5
#clean DBC signals
Command = 0 : NULL : WAIT = 0.5
MODE1 = 0, MODE2 = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0, MODE8A = 0, MODE8B = 0 : NULL : WAIT = 0.5

#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.0 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.1 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.2 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.3 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.4 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.5 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.6 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.7 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.8 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.9 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.0 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.1 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.2 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.3 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.4 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.5 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.6 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.7 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.8 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.9 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.0 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.1 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.2 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.3 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.4 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.5 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.6 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.7 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.8 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.9 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.0 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.1 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.2 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.3 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.4 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.5 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.6 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.7 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.8 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.9 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 4.0 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 4.1 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 4.2 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 4.3 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 4.4 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 4.5 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 4.6 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4700, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 4.7 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 4.8 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4900, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 4.9 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 5.0 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5100, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 5.1 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.1000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 5.2 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5300, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 5.3 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 5.4 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5500, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 5.5 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 5.6 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5700, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 5.7 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 5.8 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5900, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 5.9 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 6.0 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6100, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 6.1 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.1000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 6.2 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6300, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 6.3 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 6.4 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6500, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 6.5 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 6.6 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6700, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 6.7 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 6.8 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6900, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 6.9 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 7.0 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7100, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 7.1 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.1000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 7.2 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7300, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 7.3 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 7.4 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7500, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 7.5 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 7.6 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7700, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 7.7 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 7.8 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7900, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 7.9 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 8.0 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8100, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 8.1 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 8.2 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8300, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 8.3 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 8.4 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8500, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 8.5 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 8.6 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8700, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 8.7 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.700000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 8.8 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8900, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 8.9 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 9.0 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9100, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 9.1 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 9.2 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.200000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9300, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 9.3 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9400, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 9.4 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9500, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 9.5 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9600, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 9.6 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9700, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 9.7 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.700000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9800, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 9.8 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9900, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 9.9 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 10000, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 10.0 | 0.25 | 0.1
NULL : OutStat1A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 10.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 10100, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port1AmpData = 0 | 0.25 | 0.1
NULL : OutStat1A = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 10200, Command = 81, Output1A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port1AmpData = 0 | 0.25 | 0.1
NULL : OutStat1A = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output1A = 0 : NULL : WAIT = 0.1
J2_01 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.0 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.1 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.2 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.3 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.4 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.5 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.6 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.7 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.8 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 0.9 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.0 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.1 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.2 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.3 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.4 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.5 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.6 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.7 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.8 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 1.9 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.0 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.1 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.2 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.3 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.4 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.5 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.6 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.7 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.8 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 2.9 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.0 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.1 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.2 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.3 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.4 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.5 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.6 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.7 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.8 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 3.9 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 4.0 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 4.1 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 4.2 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port1AmpData = 4.3 | 0.15 | 0.1
NULL : OutStat1B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port1AmpData = 0 | 0.25 | 0.1
NULL : OutStat1B = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, Output1B = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port1AmpData = 0 | 0.25 | 0.1
NULL : OutStat1B = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output1B = 0 : NULL : WAIT = 0.1
J2_02 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.0 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.1 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.2 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.3 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.4 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.5 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.6 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.7 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.8 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.9 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.0 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.1 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.2 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.3 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.4 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.5 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.6 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.7 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.8 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.9 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.0 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.1 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.2 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.3 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.4 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.5 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.6 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.7 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.8 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.9 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.0 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.1 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.2 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.3 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.4 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.5 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.6 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.7 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.8 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.9 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 4.0 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 4.1 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 4.2 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 4.3 | 0.15 | 0.1
NULL : OutStat2A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port2AmpData = 0 | 0.25 | 0.1
NULL : OutStat2A = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, Output2A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port2AmpData = 0 | 0.25 | 0.1
NULL : OutStat2A = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output2A = 0 : NULL : WAIT = 0.1
J2_03 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.0 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.1 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.2 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.3 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.4 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.5 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.6 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.7 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.8 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 0.9 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.0 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.1 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.2 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.3 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.4 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.5 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.6 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.7 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.8 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 1.9 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.0 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.1 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.2 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.3 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.4 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.5 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.6 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.7 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.8 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 2.9 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.0 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.1 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.2 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.3 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.4 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.5 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.6 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.7 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.8 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 3.9 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 4.0 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 4.1 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 4.2 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port2AmpData = 4.3 | 0.15 | 0.1
NULL : OutStat2B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port2AmpData = 0 | 0.25 | 0.1
NULL : OutStat2B = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, Output2B = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port2AmpData = 0 | 0.25 | 0.1
NULL : OutStat2B = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output2B = 0 : NULL : WAIT = 0.1
J2_04 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.0 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.1 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.2 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.3 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.4 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.5 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.6 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.7 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.8 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.9 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.0 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.1 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.2 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.3 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.4 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.5 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.6 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.7 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.8 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.9 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.0 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.1 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.2 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.3 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.4 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.5 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.6 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.7 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.8 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.9 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.0 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.1 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.2 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.3 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.4 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.5 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.6 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.7 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.8 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.9 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 4.0 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 4.1 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 4.2 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 4.3 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 4.4 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 4.5 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 4.6 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4700, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 4.7 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 4.8 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4900, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 4.9 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 5.0 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5100, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 5.1 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.1000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 5.2 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5300, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 5.3 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 5.4 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5500, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 5.5 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 5.6 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5700, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 5.7 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 5.8 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5900, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 5.9 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 6.0 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6100, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 6.1 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.1000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 6.2 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6300, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 6.3 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 6.4 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6500, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 6.5 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 6.6 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6700, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 6.7 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 6.8 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6900, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 6.9 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 7.0 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7100, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 7.1 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.1000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 7.2 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7300, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 7.3 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 7.4 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7500, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 7.5 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 7.6 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7700, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 7.7 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 7.8 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7900, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 7.9 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 8.0 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8100, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 8.1 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 8.2 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8300, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 8.3 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 8.4 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8500, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 8.5 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 8.6 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8700, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 8.7 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.700000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 8.8 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8900, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 8.9 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 9.0 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9100, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 9.1 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 9.2 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.200000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9300, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 9.3 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9400, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 9.4 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9500, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 9.5 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9600, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 9.6 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9700, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 9.7 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.700000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9800, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 9.8 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9900, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 9.9 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 10000, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 10.0 | 0.25 | 0.1
NULL : OutStat3A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 10.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 10100, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port3AmpData = 0 | 0.25 | 0.1
NULL : OutStat3A = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 10200, Command = 81, Output3A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port3AmpData = 0 | 0.25 | 0.1
NULL : OutStat3A = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output3A = 0 : NULL : WAIT = 0.1
J2_05 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.0 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.1 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.2 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.3 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.4 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.5 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.6 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.7 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.8 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 0.9 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.0 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.1 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.2 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.3 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.4 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.5 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.6 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.7 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.8 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 1.9 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.0 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.1 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.2 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.3 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.4 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.5 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.6 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.7 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.8 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 2.9 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.0 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.1 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.2 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.3 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.4 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.5 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.6 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.7 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.8 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 3.9 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 4.0 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 4.1 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 4.2 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port3AmpData = 4.3 | 0.15 | 0.1
NULL : OutStat3B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port3AmpData = 0 | 0.25 | 0.1
NULL : OutStat3B = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, Output3B = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port3AmpData = 0 | 0.25 | 0.1
NULL : OutStat3B = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output3B = 0 : NULL : WAIT = 0.1
J2_06 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.0 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.1 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.2 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.3 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.4 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.5 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.6 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.7 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.8 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.9 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.0 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.1 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.2 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.3 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.4 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.5 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.6 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.7 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.8 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.9 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.0 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.1 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.2 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.3 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.4 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.5 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.6 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.7 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.8 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.9 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.0 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.1 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.2 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.3 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.4 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.5 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.6 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.7 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.8 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.9 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 4.0 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 4.1 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 4.2 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 4.3 | 0.15 | 0.1
NULL : OutStat4A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port4AmpData = 0 | 0.25 | 0.1
NULL : OutStat4A = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, Output4A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port4AmpData = 0 | 0.25 | 0.1
NULL : OutStat4A = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output4A = 0 : NULL : WAIT = 0.1
J2_07 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.0 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.1 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.2 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.3 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.4 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.5 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.6 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.7 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.8 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 0.9 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.0 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.1 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.2 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.3 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.4 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.5 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.6 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.7 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.8 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 1.9 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.0 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.1 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.2 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.3 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.4 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.5 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.6 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.7 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.8 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 2.9 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.0 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.1 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.2 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.3 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.4 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.5 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.6 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.7 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.8 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 3.9 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 4.0 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 4.1 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 4.2 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port4AmpData = 4.3 | 0.15 | 0.1
NULL : OutStat4B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port4AmpData = 0 | 0.25 | 0.1
NULL : OutStat4B = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, Output4B = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port4AmpData = 0 | 0.25 | 0.1
NULL : OutStat4B = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output4B = 0 : NULL : WAIT = 0.1
J2_08 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_09 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.0 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.1 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.2 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.3 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.4 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.5 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.6 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.7 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.8 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.9 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.0 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.1 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.2 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.3 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.4 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.5 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.6 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.7 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.8 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.9 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.0 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.1 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.2 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.3 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.4 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.5 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.6 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.7 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.8 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.9 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.0 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.1 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.2 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.3 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.4 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.5 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.6 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.7 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.8 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.9 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 4.0 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 4.1 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 4.2 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 4.3 | 0.15 | 0.1
NULL : OutStat5A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port5AmpData = 0 | 0.25 | 0.1
NULL : OutStat5A = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, Output5A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port5AmpData = 0 | 0.25 | 0.1
NULL : OutStat5A = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output5A = 0 : NULL : WAIT = 0.1
J2_09 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_10 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.0 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.1 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.2 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.3 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.4 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.5 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.6 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.7 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.8 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 0.9 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.0 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.1 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.2 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.3 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.4 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.5 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.6 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.7 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.8 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 1.9 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.0 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.1 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.2 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.3 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.4 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.5 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.6 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.7 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.8 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 2.9 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.0 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.1 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.2 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.3 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.4 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.5 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.6 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.7 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.8 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 3.9 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 4.0 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 4.1 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 4.2 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port5AmpData = 4.3 | 0.15 | 0.1
NULL : OutStat5B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port5AmpData = 0 | 0.25 | 0.1
NULL : OutStat5B = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, Output5B = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port5AmpData = 0 | 0.25 | 0.1
NULL : OutStat5B = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output5B = 0 : NULL : WAIT = 0.1
J2_10 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_11 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.0 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.1 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.2 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.3 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.4 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.5 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.6 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.7 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.8 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.9 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.0 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.1 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.2 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.3 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.4 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.5 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.6 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.7 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.8 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.9 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.0 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.1 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.2 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.3 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.4 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.5 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.6 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.7 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.8 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.9 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.0 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.1 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.2 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.3 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.4 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.5 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.6 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.7 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.8 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.9 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 4.0 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 4.1 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 4.2 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 4.3 | 0.15 | 0.1
NULL : OutStat6A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port6AmpData = 0 | 0.25 | 0.1
NULL : OutStat6A = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, Output6A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port6AmpData = 0 | 0.25 | 0.1
NULL : OutStat6A = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output6A = 0 : NULL : WAIT = 0.1
J2_11 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J2_12 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.0 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.1 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.2 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.3 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.4 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.5 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.6 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.7 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.8 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 0.9 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.0 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.1 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.2 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.3 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.4 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.5 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.6 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.7 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.8 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 1.9 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.0 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.1 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.2 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.3 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.4 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.5 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.6 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.7 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.8 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 2.9 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.0 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.1 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.2 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.3 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.4 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.5 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.6 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.7 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.8 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 3.9 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 4.0 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 4.1 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 4.2 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port6AmpData = 4.3 | 0.15 | 0.1
NULL : OutStat6B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port6AmpData = 0 | 0.25 | 0.1
NULL : OutStat6B = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, Output6B = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port6AmpData = 0 | 0.25 | 0.1
NULL : OutStat6B = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output6B = 0 : NULL : WAIT = 0.1
J2_12 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.0 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.1 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.2 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.3 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.4 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.5 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.6 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.7 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.8 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.9 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.0 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.1 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.2 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.3 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.4 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.5 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.6 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.7 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.8 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.9 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.0 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.1 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.2 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.3 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.4 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.5 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.6 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.7 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.8 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.9 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.0 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.1 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.2 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.3 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.4 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.5 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.6 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.7 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.8 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.9 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 4.0 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 4.1 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 4.2 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 4.3 | 0.15 | 0.1
NULL : OutStat7A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port7AmpData = 0 | 0.25 | 0.1
NULL : OutStat7A = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, Output7A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port7AmpData = 0 | 0.25 | 0.1
NULL : OutStat7A = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output7A = 0 : NULL : WAIT = 0.1
J3_01 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.0 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.1 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.2 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.3 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.4 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.5 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.6 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.7 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.8 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 0.9 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.0 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.1 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.2 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.3 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.4 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.5 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.6 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.7 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.8 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 1.9 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.0 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.1 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.2 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.3 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.4 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.5 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.6 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.7 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.8 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 2.9 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.0 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.1 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.2 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.3 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.4 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.5 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.6 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.7 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.8 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 3.9 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 4.0 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 4.1 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 4.2 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port7AmpData = 4.3 | 0.15 | 0.1
NULL : OutStat7B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port7AmpData = 0 | 0.25 | 0.1
NULL : OutStat7B = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, Output7B = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port7AmpData = 0 | 0.25 | 0.1
NULL : OutStat7B = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output7B = 0 : NULL : WAIT = 0.1
J3_02 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.0 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.1 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.2 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.3 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.4 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.5 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.6 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.7 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.8 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.9 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.0 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.1 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.2 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.3 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.4 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.5 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.6 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.7 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.8 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.9 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.0 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.1 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.2 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.3 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.4 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.5 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.6 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.7 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.8 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.9 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.0 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.1 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.2 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.3 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.4 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.5 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.6 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.7 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.8 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.9 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 4.0 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 4.1 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 4.2 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 4.3 | 0.15 | 0.1
NULL : OutStat8A = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port8AmpData = 0 | 0.25 | 0.1
NULL : OutStat8A = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, Output8A = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port8AmpData = 0 | 0.25 | 0.1
NULL : OutStat8A = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output8A = 0 : NULL : WAIT = 0.1
J3_03 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.0 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.1 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.2 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.3 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.4 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.5 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.6 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.7 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.8 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 0.9 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.0 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.1 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.2 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.3 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.4 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.5 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.6 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.7 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.8 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 1.9 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.0 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.1 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.2 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.3 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.4 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.5 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.6 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.7 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.8 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 2.9 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.0 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.1 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.2 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.3 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.4 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.5 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.6 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.7 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.8 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 3.9 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 4.0 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 4.1 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 4.2 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : Port8AmpData = 4.3 | 0.15 | 0.1
NULL : OutStat8B = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port8AmpData = 0 | 0.25 | 0.1
NULL : OutStat8B = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, Output8B = 1 : NULL : WAIT = 0.1
#verify fault
NULL : Port8AmpData = 0 | 0.25 | 0.1
NULL : OutStat8B = 2 | 0.01 | 0.1
NULL : MeterCurrent = 0  | 0.01 | 0.1

#switch out load line, clear current
Output8B = 0 : NULL : WAIT = 0.1
J3_04 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
SAVE
END
