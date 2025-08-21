#35062
#Verion 0.0
UUT_DBC = 35062-561.dbc
UUT_DATANAME = 35062-DIGITAL-OUTPUT

#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1
TEST_MODE = 1 : NULL : WAIT = 1
#switch in load line, set current
J1_01 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 0.0 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 0.1 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 0.2 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 0.3 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 0.4 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 0.5 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 0.6 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 0.7 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 0.8 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 0.9 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 1.0 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 1.1 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 1.2 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 1.3 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 1.4 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 1.5 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 1.6 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 1.7 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 1.8 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 1.9 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 2.0 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 2.1 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 2.2 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 2.3 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 2.4 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 2.5 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 2.6 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 2.7 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 2.8 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 2.9 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 3.0 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 3.1 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 3.2 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 3.3 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 3.4 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 3.5 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 3.6 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 3.7 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 3.8 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 3.9 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 4.0 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 4.1 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 4.2 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 4.3 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 4.4 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 4.5 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4600, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 4.6 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4700, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 4.7 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4800, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 4.8 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4900, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 4.9 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5000, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 5.0 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5100, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 5.1 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.1000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5200, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 5.2 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5300, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 5.3 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5400, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 5.4 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5500, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 5.5 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5600, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 5.6 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5700, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 5.7 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5800, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 5.8 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5900, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 5.9 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6000, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 6.0 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6100, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 6.1 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.1000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6200, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 6.2 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6300, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 6.3 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6400, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 6.4 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6500, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 6.5 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6600, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 6.6 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6700, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 6.7 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6800, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 6.8 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6900, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 6.9 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7000, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 7.0 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7100, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 7.1 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.1000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7200, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 7.2 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7300, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 7.3 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7400, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 7.4 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7500, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 7.5 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7600, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 7.6 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7700, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 7.7 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7800, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 7.8 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7900, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 7.9 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8000, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 8.0 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8100, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 8.1 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8200, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 8.2 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8300, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 8.3 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8400, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 8.4 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8500, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 8.5 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8600, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 8.6 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8700, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 8.7 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.700000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8800, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 8.8 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8900, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 8.9 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9000, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 9.0 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9100, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 9.1 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9200, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 9.2 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.200000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9300, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 9.3 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9400, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 9.4 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9500, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 9.5 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9600, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 9.6 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9700, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 9.7 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.700000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9800, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 9.8 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9900, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 9.9 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 10000, Command = 81, OUTPUT01 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET1 = 10.0 | 1.0 | 0.1
NULL : Out_Stat1 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 10.0 | 0.01 | 0.1

#switch out load line, clear current
OUTPUT01 = 0 : NULL : WAIT = 0.1
J1_01 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J1_02 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 0.0 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 0.1 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 0.2 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 0.3 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 0.4 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 0.5 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 0.6 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 0.7 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 0.8 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 0.9 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 1.0 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 1.1 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 1.2 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 1.3 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 1.4 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 1.5 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 1.6 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 1.7 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 1.8 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 1.9 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 2.0 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 2.1 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 2.2 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 2.3 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 2.4 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 2.5 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 2.6 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 2.7 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 2.8 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 2.9 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 3.0 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 3.1 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 3.2 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 3.3 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 3.4 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 3.5 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 3.6 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 3.7 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 3.8 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 3.9 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 4.0 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 4.1 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 4.2 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 4.3 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 4.4 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 4.5 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4600, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 4.6 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4700, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 4.7 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4800, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 4.8 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4900, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 4.9 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5000, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 5.0 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5100, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 5.1 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.1000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5200, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 5.2 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5300, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 5.3 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5400, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 5.4 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5500, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 5.5 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5600, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 5.6 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5700, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 5.7 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5800, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 5.8 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5900, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 5.9 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6000, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 6.0 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6100, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 6.1 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.1000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6200, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 6.2 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6300, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 6.3 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6400, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 6.4 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6500, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 6.5 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6600, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 6.6 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6700, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 6.7 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6800, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 6.8 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6900, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 6.9 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7000, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 7.0 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7100, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 7.1 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.1000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7200, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 7.2 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7300, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 7.3 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7400, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 7.4 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7500, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 7.5 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7600, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 7.6 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7700, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 7.7 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7800, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 7.8 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7900, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 7.9 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8000, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 8.0 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8100, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 8.1 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8200, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 8.2 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8300, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 8.3 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8400, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 8.4 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8500, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 8.5 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8600, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 8.6 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8700, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 8.7 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.700000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8800, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 8.8 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8900, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 8.9 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9000, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 9.0 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9100, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 9.1 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9200, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 9.2 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.200000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9300, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 9.3 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9400, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 9.4 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9500, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 9.5 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9600, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 9.6 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9700, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 9.7 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.700000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9800, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 9.8 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9900, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 9.9 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 10000, Command = 81, OUTPUT02 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET2 = 10.0 | 1.0 | 0.1
NULL : Out_Stat2 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 10.0 | 0.01 | 0.1

#switch out load line, clear current
OUTPUT02 = 0 : NULL : WAIT = 0.1
J1_02 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J1_03 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 0.0 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 0.1 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 0.2 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 0.3 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 0.4 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 0.5 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 0.6 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 0.7 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 0.8 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 0.9 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 1.0 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 1.1 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 1.2 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 1.3 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 1.4 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 1.5 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 1.6 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 1.7 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 1.8 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 1.9 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 2.0 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 2.1 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 2.2 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 2.3 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 2.4 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 2.5 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 2.6 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 2.7 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 2.8 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 2.9 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 3.0 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 3.1 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 3.2 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 3.3 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 3.4 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 3.5 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 3.6 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 3.7 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 3.8 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 3.9 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 4.0 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 4.1 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 4.2 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 4.3 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 4.4 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 4.5 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4600, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 4.6 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4700, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 4.7 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4800, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 4.8 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4900, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 4.9 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5000, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 5.0 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5100, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 5.1 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.1000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5200, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 5.2 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5300, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 5.3 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5400, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 5.4 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5500, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 5.5 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5600, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 5.6 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5700, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 5.7 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5800, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 5.8 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5900, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 5.9 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6000, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 6.0 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6100, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 6.1 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.1000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6200, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 6.2 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6300, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 6.3 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6400, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 6.4 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6500, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 6.5 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6600, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 6.6 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6700, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 6.7 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6800, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 6.8 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6900, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 6.9 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7000, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 7.0 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7100, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 7.1 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.1000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7200, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 7.2 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7300, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 7.3 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7400, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 7.4 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7500, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 7.5 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7600, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 7.6 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7700, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 7.7 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7800, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 7.8 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7900, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 7.9 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8000, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 8.0 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8100, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 8.1 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8200, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 8.2 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8300, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 8.3 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8400, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 8.4 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8500, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 8.5 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8600, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 8.6 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8700, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 8.7 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.700000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8800, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 8.8 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8900, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 8.9 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9000, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 9.0 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9100, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 9.1 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9200, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 9.2 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.200000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9300, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 9.3 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9400, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 9.4 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9500, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 9.5 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9600, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 9.6 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9700, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 9.7 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.700000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9800, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 9.8 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9900, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 9.9 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 10000, Command = 81, OUTPUT03 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET3 = 10.0 | 1.0 | 0.1
NULL : Out_Stat3 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 10.0 | 0.01 | 0.1

#switch out load line, clear current
OUTPUT03 = 0 : NULL : WAIT = 0.1
J1_03 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J1_04 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 0, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 0.0 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 100, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 0.1 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 200, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 0.2 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 300, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 0.3 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 400, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 0.4 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 500, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 0.5 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 600, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 0.6 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 700, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 0.7 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.7000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 800, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 0.8 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 900, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 0.9 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 0.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 1.0 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1100, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 1.1 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1200, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 1.2 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1300, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 1.3 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1400, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 1.4 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.4000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1500, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 1.5 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1600, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 1.6 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1700, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 1.7 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1800, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 1.8 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 1900, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 1.9 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 1.9000000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 2.0 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2100, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 2.1 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2200, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 2.2 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2300, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 2.3 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2400, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 2.4 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2500, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 2.5 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2600, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 2.6 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2700, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 2.7 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2800, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 2.8 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2900, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 2.9 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 2.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3000, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 3.0 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3100, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 3.1 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3200, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 3.2 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3300, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 3.3 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.3000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3400, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 3.4 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3500, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 3.5 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3600, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 3.6 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3700, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 3.7 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3800, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 3.8 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.8000000000000003 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 3900, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 3.9 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 3.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4000, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 4.0 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4100, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 4.1 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4200, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 4.2 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4300, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 4.3 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4400, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 4.4 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4500, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 4.5 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4600, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 4.6 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4700, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 4.7 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4800, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 4.8 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 4900, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 4.9 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 4.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5000, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 5.0 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5100, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 5.1 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.1000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5200, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 5.2 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5300, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 5.3 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5400, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 5.4 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5500, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 5.5 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5600, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 5.6 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5700, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 5.7 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5800, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 5.8 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 5900, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 5.9 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 5.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6000, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 6.0 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6100, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 6.1 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.1000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6200, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 6.2 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6300, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 6.3 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6400, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 6.4 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6500, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 6.5 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6600, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 6.6 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6700, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 6.7 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6800, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 6.8 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 6900, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 6.9 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 6.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7000, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 7.0 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7100, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 7.1 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.1000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7200, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 7.2 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7300, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 7.3 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7400, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 7.4 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7500, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 7.5 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7600, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 7.6 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.6000000000000005 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7700, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 7.7 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.7 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7800, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 7.8 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 7900, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 7.9 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 7.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8000, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 8.0 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8100, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 8.1 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8200, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 8.2 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.2 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8300, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 8.3 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8400, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 8.4 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8500, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 8.5 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8600, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 8.6 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8700, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 8.7 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.700000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8800, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 8.8 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 8900, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 8.9 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 8.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9000, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 9.0 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9100, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 9.1 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.1 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9200, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 9.2 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.200000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9300, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 9.3 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.3 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9400, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 9.4 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.4 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9500, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 9.5 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.5 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9600, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 9.6 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.6 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9700, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 9.7 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.700000000000001 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9800, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 9.8 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.8 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 9900, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 9.9 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 9.9 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 10000, Command = 81, OUTPUT04 = 1 : NULL : WAIT = 0.1
#verify reading from load
NULL : AMPS_FET4 = 10.0 | 1.0 | 0.1
NULL : Out_Stat4 = 1 | 0.01 | 0.1
NULL : MeterCurrent = 10.0 | 0.01 | 0.1

#switch out load line, clear current
OUTPUT04 = 0 : NULL : WAIT = 0.1
J1_04 = 0 : NULL : WAIT = 0.5
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
SAVE
END
