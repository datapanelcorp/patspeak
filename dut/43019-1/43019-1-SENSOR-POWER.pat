#43019-1
#Verion 0.0
UUT_DBC = 43019-560.dbc
UUT_DATANAME = 43019-1-SENSOR-POWER

#-----setup 43019-----
#configure as Output Digital ON/OFF
Command = 82, MODE2 = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1, MODE5A = 1, MODE5B = 1 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#hold output streams enabled without continuously reset/saving
Command = 82, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2

#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1
NULL : SpwrStat1 = 0 | 0.1 | 0.1
NULL : SpwrStat2 = 0 | 0.1 | 0.1
NULL : SpwrStat3 = 0 | 0.1 | 0.1
NULL : SpwrStat4 = 0 | 0.1 | 0.1
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.1
#turn on sensor power
Command = 81, SPWR1_On = 1 : NULL : WAIT = 0.1
Command = 92, SPWR1_5V = 1 : NULL : WAIT = 0.1
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
Command = 92, SPWR1_5V = 0 : NULL : WAIT = 0.1
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
J2_02 = 0 : NULL : WAIT = 0.5
Command = 81, SPWR1_On = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.1
#turn on sensor power
Command = 81, SPWR2_On = 1 : NULL : WAIT = 0.1
Command = 92, SPWR2_5V = 1 : NULL : WAIT = 0.1
#check for 5VDC
NULL : MeterVolts = 5 | 0.2 | 0.1
#short output (#1)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat2 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR2_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR2_On = 1 : NULL
NULL : SpwrStat2 = 1 | 0.1 | 0.1
#enable VBAT
Command = 92, SPWR2_5V = 0 : NULL : WAIT = 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#2)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat2 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR2_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR2_On = 1 : NULL
NULL : SpwrStat2 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#3)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat2 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR2_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR2_On = 1 : NULL
NULL : SpwrStat2 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#4)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat2 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR2_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR2_On = 1 : NULL
NULL : SpwrStat2 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#5)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat2 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR2_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR2_On = 1 : NULL
#check for VBAT
NULL : MeterVolts = 0 | 0.2 | 0.1
NULL : SpwrStat2 = 2 | 0.1 | 0.1
Command = 81, SPWR2_On = 0 : NULL

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
Command = 81, SPWR2_On = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.1
#turn on sensor power
Command = 81, SPWR3_On = 1 : NULL : WAIT = 0.1
Command = 92, SPWR3_5V = 1 : NULL : WAIT = 0.1
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
Command = 92, SPWR3_5V = 0 : NULL : WAIT = 0.1
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
J2_06 = 0 : NULL : WAIT = 0.5
Command = 81, SPWR3_On = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.1
#turn on sensor power
Command = 81, SPWR4_On = 1 : NULL : WAIT = 0.1
Command = 92, SPWR4_5V = 1 : NULL : WAIT = 0.1
#check for 5VDC
NULL : MeterVolts = 5 | 0.2 | 0.1
#short output (#1)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat4 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR4_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR4_On = 1 : NULL
NULL : SpwrStat4 = 1 | 0.1 | 0.1
#enable VBAT
Command = 92, SPWR4_5V = 0 : NULL : WAIT = 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#2)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat4 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR4_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR4_On = 1 : NULL
NULL : SpwrStat4 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#3)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat4 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR4_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR4_On = 1 : NULL
NULL : SpwrStat4 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#4)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat4 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR4_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR4_On = 1 : NULL
NULL : SpwrStat4 = 1 | 0.1 | 0.1
#check for VBAT
NULL : MeterVolts = 14 | 0.2 | 0.1
#short output (#5)
LdEnable = 1 : NULL : WAIT = 0.1
#verify fault
NULL : SpwrStat4 = 2 | 0.1 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
#verify volotage
NULL : MeterVolts = 0 | 0.2 | 0.1
#clear fault
Command = 81, SPWR4_On = 0 : NULL : WAIT = 0.5
Command = 81, SPWR4_On = 1 : NULL
#check for VBAT
NULL : MeterVolts = 0 | 0.2 | 0.1
NULL : SpwrStat4 = 2 | 0.1 | 0.1
Command = 81, SPWR4_On = 0 : NULL

#switch out load line, clear current
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
Command = 81, SPWR4_On = 0 : NULL : WAIT = 0.5
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
SAVE
END
