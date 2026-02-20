#39009-1
#Verion 0.0
#digital normal test using the E-LOAD
UUT_DBC = 39009-561.dbc
UUT_DATANAME = 39009-1-SENSOR-POWER

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
J1_08 = 1 : NULL : WAIT = 0.1
#turn on sensor power
Command = 81, SPWR1_On = 1 : NULL : WAIT = 0.1
#check for 5VDC
NULL : MeterVolts = 5 | 0.2 | 0.1
#short output (#1)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat1 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR1_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR1_On = 1 : NULL
NULL : SpwrStat1 = 1 | 0.1 | 0.1
#enable VBAT
Command = 81, SPWR1_BattEn = 1 : NULL : WAIT = 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#2)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat1 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR1_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR1_On = 1 : NULL
NULL : SpwrStat1 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#3)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat1 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR1_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR1_On = 1 : NULL
NULL : SpwrStat1 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#4)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat1 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR1_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR1_On = 1 : NULL
NULL : SpwrStat1 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#5)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat1 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR1_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR1_On = 1 : NULL
#check for VBAT
NULL : MeterVolts = 0 | 0.2 | 0.1
NULL : SpwrStat1 = 2 | 0.1 | 0.1
Command = 81, SPWR1_On = 0 : NULL

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.5
J1_08 = 0 : NULL : WAIT = 0.5
Command = 81, SPWR1_On = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J1_09 = 1 : NULL : WAIT = 0.1
#turn on sensor power
Command = 81, SPWR3_On = 1 : NULL : WAIT = 0.1
#check for 5VDC
NULL : MeterVolts = 5 | 0.2 | 0.1
#short output (#1)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat3 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR3_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR3_On = 1 : NULL
NULL : SpwrStat3 = 1 | 0.1 | 0.1
#enable VBAT
Command = 81, SPWR3_BattEn = 1 : NULL : WAIT = 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#2)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat3 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR3_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR3_On = 1 : NULL
NULL : SpwrStat3 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#3)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat3 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR3_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR3_On = 1 : NULL
NULL : SpwrStat3 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#4)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat3 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR3_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR3_On = 1 : NULL
NULL : SpwrStat3 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#5)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat3 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR3_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR3_On = 1 : NULL
#check for VBAT
NULL : MeterVolts = 0 | 0.2 | 0.1
NULL : SpwrStat3 = 2 | 0.1 | 0.1
Command = 81, SPWR3_On = 0 : NULL

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.5
J1_09 = 0 : NULL : WAIT = 0.5
Command = 81, SPWR3_On = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J1_10 = 1 : NULL : WAIT = 0.1
#turn on sensor power
Command = 81, SPWR5_On = 1 : NULL : WAIT = 0.1
#check for 5VDC
NULL : MeterVolts = 5 | 0.2 | 0.1
#short output (#1)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat5 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR5_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR5_On = 1 : NULL
NULL : SpwrStat5 = 1 | 0.1 | 0.1
#enable VBAT
Command = 81, SPWR5_BattEn = 1 : NULL : WAIT = 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#2)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat5 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR5_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR5_On = 1 : NULL
NULL : SpwrStat5 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#3)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat5 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR5_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR5_On = 1 : NULL
NULL : SpwrStat5 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#4)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat5 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR5_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR5_On = 1 : NULL
NULL : SpwrStat5 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#5)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat5 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR5_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR5_On = 1 : NULL
#check for VBAT
NULL : MeterVolts = 0 | 0.2 | 0.1
NULL : SpwrStat5 = 2 | 0.1 | 0.1
Command = 81, SPWR5_On = 0 : NULL

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.5
J1_10 = 0 : NULL : WAIT = 0.5
Command = 81, SPWR5_On = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J1_11 = 1 : NULL : WAIT = 0.1
#turn on sensor power
Command = 81, SPWR7_On = 1 : NULL : WAIT = 0.1
#check for 5VDC
NULL : MeterVolts = 5 | 0.2 | 0.1
#short output (#1)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat7 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR7_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR7_On = 1 : NULL
NULL : SpwrStat7 = 1 | 0.1 | 0.1
#enable VBAT
Command = 81, SPWR7_BattEn = 1 : NULL : WAIT = 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#2)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat7 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR7_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR7_On = 1 : NULL
NULL : SpwrStat7 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#3)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat7 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR7_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR7_On = 1 : NULL
NULL : SpwrStat7 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#4)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat7 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR7_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR7_On = 1 : NULL
NULL : SpwrStat7 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#5)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat7 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR7_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR7_On = 1 : NULL
#check for VBAT
NULL : MeterVolts = 0 | 0.2 | 0.1
NULL : SpwrStat7 = 2 | 0.1 | 0.1
Command = 81, SPWR7_On = 0 : NULL

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.5
J1_11 = 0 : NULL : WAIT = 0.5
Command = 81, SPWR7_On = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J1_12 = 1 : NULL : WAIT = 0.1
#turn on sensor power
Command = 81, SPWR9_On = 1 : NULL : WAIT = 0.1
#check for 5VDC
NULL : MeterVolts = 5 | 0.2 | 0.1
#short output (#1)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat9 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR9_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR9_On = 1 : NULL
NULL : SpwrStat9 = 1 | 0.1 | 0.1
#enable VBAT
Command = 81, SPWR9_BattEn = 1 : NULL : WAIT = 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#2)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat9 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR9_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR9_On = 1 : NULL
NULL : SpwrStat9 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#3)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat9 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR9_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR9_On = 1 : NULL
NULL : SpwrStat9 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#4)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat9 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR9_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR9_On = 1 : NULL
NULL : SpwrStat9 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#5)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat9 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR9_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR9_On = 1 : NULL
#check for VBAT
NULL : MeterVolts = 0 | 0.2 | 0.1
NULL : SpwrStat9 = 2 | 0.1 | 0.1
Command = 81, SPWR9_On = 0 : NULL

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.5
J1_12 = 0 : NULL : WAIT = 0.5
Command = 81, SPWR9_On = 0 : NULL : WAIT = 0.5
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
SAVE
END
