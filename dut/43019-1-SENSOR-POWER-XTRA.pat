#43019-1
#Verion 0.0
UUT_DBC = 43019-560.dbc
UUT_DATANAME = 43019-1-SENSOR-POWER-XTRA

#-----setup 43019-----
#configure as Output Digital ON/OFF
Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1, MODE5A = 1, MODE5B = 1 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 0, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL

#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1
NULL : SpwrStat1 = 0 | 0.1 | 0.1
NULL : SpwrStat2 = 0 | 0.1 | 0.1
NULL : SpwrStat3 = 0 | 0.1 | 0.1
NULL : SpwrStat4 = 0 | 0.1 | 0.1
#1 configure for Battery
Command = 92, SPWR1_5V = 0 : NULL : WAIT = 0.5
#save
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL : WAIT = 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#switch output to load line
J2_02 = 1 : NULL : WAIT = 0.1
#turn on output
Command = 81, SPWR1_On = 1 : NULL : WAIT = 0.1
#verify for Battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat1 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR1_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#verify output status
NULL : SpwrStat1 = 0 | 0.1 | 0.1
#configure for 5VDC
Command = 92, SPWR1_5V = 1 : NULL : WAIT = 0.5
#turn on output
Command = 81, SPWR1_On = 1 : NULL : WAIT = 0.1
#verify 5VDC
NULL : MeterVolts = 5 | 0.5 | 0.1
#verify output status
NULL : SpwrStat1 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR1_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat1 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#turn on output
Command = 81, SPWR1_On = 1 : NULL : WAIT = 0.1
#verify battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat1 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR1_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#verify output status
NULL : SpwrStat1 = 0 | 0.1 | 0.1
#2 configure for 5VDC
Command = 92, SPWR1_5V = 1 : NULL : WAIT = 0.5
#save
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL : WAIT = 0.1
#turn on output
Command = 81, SPWR1_On = 1 : NULL : WAIT = 0.1
#verify 5VDC
NULL : MeterVolts = 5 | 0.5 | 0.1
#verify output status
NULL : SpwrStat1 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR1_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat1 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#turn on output
Command = 81, SPWR1_On = 1 : NULL : WAIT = 0.1
#verify 5VDC
NULL : MeterVolts = 5 | 0.5 | 0.1
#verify output status
NULL : SpwrStat1 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR1_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat1 = 0 | 0.1 | 0.1
#3 enable e-load short
LdEnable = 1 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 1
#turn on output
Command = 81, SPWR1_On = 1 : NULL : WAIT = 0.1
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#verify output status
NULL : SpwrStat1 = 2 | 0.1 | 0.1
#turn off output
Command = 81, SPWR1_On = 0 : NULL : WAIT = 0.1
#disable e-load short
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#4 turn on output
Command = 81, SPWR1_On = 1 : NULL : WAIT = 0.1
#verify 5VDC
NULL : MeterVolts = 5 | 0.5 | 0.1
#verify output status
NULL : SpwrStat1 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR1_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat1 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#5 configure for battery
Command = 92, SPWR1_5V = 0 : NULL : WAIT = 0.5
#save
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL : WAIT = 0.1
#turn on output
Command = 81, SPWR1_On = 1 : NULL : WAIT = 0.1
#verify battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat1 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR1_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat1 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#turn on output
Command = 81, SPWR1_On = 1 : NULL : WAIT = 0.1
#verify battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat1 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR1_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat1 = 0 | 0.1 | 0.1
#6 enable e-load short
LdEnable = 1 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 1
#turn on output
Command = 81, SPWR1_On = 1 : NULL : WAIT = 0.1
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#verify output status
NULL : SpwrStat1 = 2 | 0.1 | 0.1
#turn off output
Command = 81, SPWR1_On = 0 : NULL : WAIT = 0.1
#disable e-load short
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#7 turn on output
Command = 81, SPWR1_On = 1 : NULL : WAIT = 0.1
#verify battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat1 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR1_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat1 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#1 configure for Battery
Command = 92, SPWR2_5V = 0 : NULL : WAIT = 0.5
#save
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL : WAIT = 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#switch output to load line
J2_04 = 1 : NULL : WAIT = 0.1
#turn on output
Command = 81, SPWR2_On = 1 : NULL : WAIT = 0.1
#verify for Battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat2 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR2_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#verify output status
NULL : SpwrStat2 = 0 | 0.1 | 0.1
#configure for 5VDC
Command = 92, SPWR2_5V = 1 : NULL : WAIT = 0.5
#turn on output
Command = 81, SPWR2_On = 1 : NULL : WAIT = 0.1
#verify 5VDC
NULL : MeterVolts = 5 | 0.5 | 0.1
#verify output status
NULL : SpwrStat2 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR2_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat2 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#turn on output
Command = 81, SPWR2_On = 1 : NULL : WAIT = 0.1
#verify battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat2 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR2_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#verify output status
NULL : SpwrStat2 = 0 | 0.1 | 0.1
#2 configure for 5VDC
Command = 92, SPWR2_5V = 1 : NULL : WAIT = 0.5
#save
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL : WAIT = 0.1
#turn on output
Command = 81, SPWR2_On = 1 : NULL : WAIT = 0.1
#verify 5VDC
NULL : MeterVolts = 5 | 0.5 | 0.1
#verify output status
NULL : SpwrStat2 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR2_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat2 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#turn on output
Command = 81, SPWR2_On = 1 : NULL : WAIT = 0.1
#verify 5VDC
NULL : MeterVolts = 5 | 0.5 | 0.1
#verify output status
NULL : SpwrStat2 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR2_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat2 = 0 | 0.1 | 0.1
#3 enable e-load short
LdEnable = 1 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 1
#turn on output
Command = 81, SPWR2_On = 1 : NULL : WAIT = 0.1
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#verify output status
NULL : SpwrStat2 = 2 | 0.1 | 0.1
#turn off output
Command = 81, SPWR2_On = 0 : NULL : WAIT = 0.1
#disable e-load short
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#4 turn on output
Command = 81, SPWR2_On = 1 : NULL : WAIT = 0.1
#verify 5VDC
NULL : MeterVolts = 5 | 0.5 | 0.1
#verify output status
NULL : SpwrStat2 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR2_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat2 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#5 configure for battery
Command = 92, SPWR2_5V = 0 : NULL : WAIT = 0.5
#save
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL : WAIT = 0.1
#turn on output
Command = 81, SPWR2_On = 1 : NULL : WAIT = 0.1
#verify battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat2 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR2_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat2 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#turn on output
Command = 81, SPWR2_On = 1 : NULL : WAIT = 0.1
#verify battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat2 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR2_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat2 = 0 | 0.1 | 0.1
#6 enable e-load short
LdEnable = 1 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 1
#turn on output
Command = 81, SPWR2_On = 1 : NULL : WAIT = 0.1
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#verify output status
NULL : SpwrStat2 = 2 | 0.1 | 0.1
#turn off output
Command = 81, SPWR2_On = 0 : NULL : WAIT = 0.1
#disable e-load short
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#7 turn on output
Command = 81, SPWR2_On = 1 : NULL : WAIT = 0.1
#verify battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat2 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR2_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat2 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#1 configure for Battery
Command = 92, SPWR3_5V = 0 : NULL : WAIT = 0.5
#save
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL : WAIT = 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#switch output to load line
J2_06 = 1 : NULL : WAIT = 0.1
#turn on output
Command = 81, SPWR3_On = 1 : NULL : WAIT = 0.1
#verify for Battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat3 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR3_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#verify output status
NULL : SpwrStat3 = 0 | 0.1 | 0.1
#configure for 5VDC
Command = 92, SPWR3_5V = 1 : NULL : WAIT = 0.5
#turn on output
Command = 81, SPWR3_On = 1 : NULL : WAIT = 0.1
#verify 5VDC
NULL : MeterVolts = 5 | 0.5 | 0.1
#verify output status
NULL : SpwrStat3 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR3_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat3 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#turn on output
Command = 81, SPWR3_On = 1 : NULL : WAIT = 0.1
#verify battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat3 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR3_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#verify output status
NULL : SpwrStat3 = 0 | 0.1 | 0.1
#2 configure for 5VDC
Command = 92, SPWR3_5V = 1 : NULL : WAIT = 0.5
#save
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL : WAIT = 0.1
#turn on output
Command = 81, SPWR3_On = 1 : NULL : WAIT = 0.1
#verify 5VDC
NULL : MeterVolts = 5 | 0.5 | 0.1
#verify output status
NULL : SpwrStat3 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR3_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat3 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#turn on output
Command = 81, SPWR3_On = 1 : NULL : WAIT = 0.1
#verify 5VDC
NULL : MeterVolts = 5 | 0.5 | 0.1
#verify output status
NULL : SpwrStat3 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR3_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat3 = 0 | 0.1 | 0.1
#3 enable e-load short
LdEnable = 1 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 1
#turn on output
Command = 81, SPWR3_On = 1 : NULL : WAIT = 0.1
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#verify output status
NULL : SpwrStat3 = 2 | 0.1 | 0.1
#turn off output
Command = 81, SPWR3_On = 0 : NULL : WAIT = 0.1
#disable e-load short
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#4 turn on output
Command = 81, SPWR3_On = 1 : NULL : WAIT = 0.1
#verify 5VDC
NULL : MeterVolts = 5 | 0.5 | 0.1
#verify output status
NULL : SpwrStat3 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR3_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat3 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#5 configure for battery
Command = 92, SPWR3_5V = 0 : NULL : WAIT = 0.5
#save
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL : WAIT = 0.1
#turn on output
Command = 81, SPWR3_On = 1 : NULL : WAIT = 0.1
#verify battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat3 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR3_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat3 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#turn on output
Command = 81, SPWR3_On = 1 : NULL : WAIT = 0.1
#verify battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat3 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR3_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat3 = 0 | 0.1 | 0.1
#6 enable e-load short
LdEnable = 1 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 1
#turn on output
Command = 81, SPWR3_On = 1 : NULL : WAIT = 0.1
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#verify output status
NULL : SpwrStat3 = 2 | 0.1 | 0.1
#turn off output
Command = 81, SPWR3_On = 0 : NULL : WAIT = 0.1
#disable e-load short
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#7 turn on output
Command = 81, SPWR3_On = 1 : NULL : WAIT = 0.1
#verify battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat3 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR3_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat3 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#1 configure for Battery
Command = 92, SPWR4_5V = 0 : NULL : WAIT = 0.5
#save
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL : WAIT = 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#switch output to load line
J2_08 = 1 : NULL : WAIT = 0.1
#turn on output
Command = 81, SPWR4_On = 1 : NULL : WAIT = 0.1
#verify for Battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat4 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR4_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#verify output status
NULL : SpwrStat4 = 0 | 0.1 | 0.1
#configure for 5VDC
Command = 92, SPWR4_5V = 1 : NULL : WAIT = 0.5
#turn on output
Command = 81, SPWR4_On = 1 : NULL : WAIT = 0.1
#verify 5VDC
NULL : MeterVolts = 5 | 0.5 | 0.1
#verify output status
NULL : SpwrStat4 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR4_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat4 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#turn on output
Command = 81, SPWR4_On = 1 : NULL : WAIT = 0.1
#verify battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat4 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR4_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#verify output status
NULL : SpwrStat4 = 0 | 0.1 | 0.1
#2 configure for 5VDC
Command = 92, SPWR4_5V = 1 : NULL : WAIT = 0.5
#save
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL : WAIT = 0.1
#turn on output
Command = 81, SPWR4_On = 1 : NULL : WAIT = 0.1
#verify 5VDC
NULL : MeterVolts = 5 | 0.5 | 0.1
#verify output status
NULL : SpwrStat4 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR4_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat4 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#turn on output
Command = 81, SPWR4_On = 1 : NULL : WAIT = 0.1
#verify 5VDC
NULL : MeterVolts = 5 | 0.5 | 0.1
#verify output status
NULL : SpwrStat4 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR4_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat4 = 0 | 0.1 | 0.1
#3 enable e-load short
LdEnable = 1 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 1
#turn on output
Command = 81, SPWR4_On = 1 : NULL : WAIT = 0.1
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#verify output status
NULL : SpwrStat4 = 2 | 0.1 | 0.1
#turn off output
Command = 81, SPWR4_On = 0 : NULL : WAIT = 0.1
#disable e-load short
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#4 turn on output
Command = 81, SPWR4_On = 1 : NULL : WAIT = 0.1
#verify 5VDC
NULL : MeterVolts = 5 | 0.5 | 0.1
#verify output status
NULL : SpwrStat4 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR4_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat4 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#5 configure for battery
Command = 92, SPWR4_5V = 0 : NULL : WAIT = 0.5
#save
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL : WAIT = 0.1
#turn on output
Command = 81, SPWR4_On = 1 : NULL : WAIT = 0.1
#verify battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat4 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR4_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat4 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#turn on output
Command = 81, SPWR4_On = 1 : NULL : WAIT = 0.1
#verify battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat4 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR4_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat4 = 0 | 0.1 | 0.1
#6 enable e-load short
LdEnable = 1 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 1
#turn on output
Command = 81, SPWR4_On = 1 : NULL : WAIT = 0.1
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#verify output status
NULL : SpwrStat4 = 2 | 0.1 | 0.1
#turn off output
Command = 81, SPWR4_On = 0 : NULL : WAIT = 0.1
#disable e-load short
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#7 turn on output
Command = 81, SPWR4_On = 1 : NULL : WAIT = 0.1
#verify battery
NULL : MeterVolts = 14 | 0.5 | 0.1
#verify output status
NULL : SpwrStat4 = 1 | 0.1 | 0.1
#turn off output
Command = 81, SPWR4_On = 0 : NULL
#verify zero
NULL : MeterVolts = 0 | 0.5 | 0.1
#check output status
NULL : SpwrStat4 = 0 | 0.1 | 0.1
#cycle power
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
SAVE
END
