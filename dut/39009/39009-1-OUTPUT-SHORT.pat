#39009-1
#Verion 0.0
#digital normal test using the E-LOAD
UUT_DBC = 39009-561.dbc
UUT_DATANAME = 39009-1-OUTPUT-SHORT

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1, MODE5A = 1, MODE5B = 1, MODE6A = 1, MODE6B = 1, MODE7A = 1, MODE7B = 1 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 1, MODE9B = 1, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1, Enable_Fault_Reset = 0 : NULL : WAIT = 0.5
Command = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0, Enable_Fault_Reset = 0 : NULL

#-----setup PAT-----
#setup load
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 1
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
LdEnable = 0 : NULL : WAIT = 0.1
J3_01 = 1 : NULL : WAIT = 0.1
Command = 81, Output2A = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 14.5 | 0.2 | 0.1
LdEnable = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 0 | 0.1 | 0.1
NULL : OutStat2A = 2 | 0.1 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
Output2A = 0 : NULL : WAIT = 0.1
J3_01 = 0 : NULL : WAIT = 0.1
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J3_02 = 1 : NULL : WAIT = 0.1
Command = 81, Output2B = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 14.5 | 0.2 | 0.1
LdEnable = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 0 | 0.1 | 0.1
NULL : OutStat2B = 2 | 0.1 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
Output2B = 0 : NULL : WAIT = 0.1
J3_02 = 0 : NULL : WAIT = 0.1
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J3_03 = 1 : NULL : WAIT = 0.1
Command = 81, Output4A = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 14.5 | 0.2 | 0.1
LdEnable = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 0 | 0.1 | 0.1
NULL : OutStat4A = 2 | 0.1 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
Output4A = 0 : NULL : WAIT = 0.1
J3_03 = 0 : NULL : WAIT = 0.1
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J3_04 = 1 : NULL : WAIT = 0.1
Command = 81, Output4B = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 14.5 | 0.2 | 0.1
LdEnable = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 0 | 0.1 | 0.1
NULL : OutStat4B = 2 | 0.1 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
Output4B = 0 : NULL : WAIT = 0.1
J3_04 = 0 : NULL : WAIT = 0.1
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J3_05 = 1 : NULL : WAIT = 0.1
Command = 81, Output6A = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 14.5 | 0.2 | 0.1
LdEnable = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 0 | 0.1 | 0.1
NULL : OutStat6A = 2 | 0.1 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
Output6A = 0 : NULL : WAIT = 0.1
J3_05 = 0 : NULL : WAIT = 0.1
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J3_06 = 1 : NULL : WAIT = 0.1
Command = 81, Output6B = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 14.5 | 0.2 | 0.1
LdEnable = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 0 | 0.1 | 0.1
NULL : OutStat6B = 2 | 0.1 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
Output6B = 0 : NULL : WAIT = 0.1
J3_06 = 0 : NULL : WAIT = 0.1
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J3_07 = 1 : NULL : WAIT = 0.1
Command = 81, Output8A = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 14.5 | 0.2 | 0.1
LdEnable = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 0 | 0.1 | 0.1
NULL : OutStat8A = 2 | 0.1 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
Output8A = 0 : NULL : WAIT = 0.1
J3_07 = 0 : NULL : WAIT = 0.1
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J3_08 = 1 : NULL : WAIT = 0.1
Command = 81, Output8B = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 14.5 | 0.2 | 0.1
LdEnable = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 0 | 0.1 | 0.1
NULL : OutStat8B = 2 | 0.1 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
Output8B = 0 : NULL : WAIT = 0.1
J3_08 = 0 : NULL : WAIT = 0.1
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J3_09 = 1 : NULL : WAIT = 0.1
Command = 81, Output10A = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 14.5 | 0.2 | 0.1
LdEnable = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 0 | 0.1 | 0.1
NULL : OutStat10A = 2 | 0.1 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
Output10A = 0 : NULL : WAIT = 0.1
J3_09 = 0 : NULL : WAIT = 0.1
#switch in load line, set current
LdEnable = 0 : NULL : WAIT = 0.1
J3_10 = 1 : NULL : WAIT = 0.1
Command = 81, Output10B = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 14.5 | 0.2 | 0.1
LdEnable = 1 : NULL : WAIT = 0.1
NULL : MeterVolts = 0 | 0.1 | 0.1
NULL : OutStat10B = 2 | 0.1 | 0.1

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
Output10B = 0 : NULL : WAIT = 0.1
J3_10 = 0 : NULL : WAIT = 0.1
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
LdShort = 0 : NULL : WAIT = 1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
SAVE
END
