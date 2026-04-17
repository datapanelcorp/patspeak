#43009-1
#Version 0.1
#quick input fault auto-reset validation (PAT supply)
UUT_DBC = 43009-560.dbc
UUT_DATANAME = 43009-1-INPUT-FAULT-AUTORESET

#cycle IGN to clean slate
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#-----setup PAT-----
LdRemote = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1

#setup PS1 (same path as 43009-1-INPUT-ALL)
PwrRemote = 1 : NULL : WAIT = 0.1
PwrSetCurrent = 100 : NULL : WAIT = 0.1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
PwrEnable = 1 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1

#enable telemetry required for status checks
Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, Enable_FAULT = 1 : NULL : WAIT = 0.5

#prepare relay path
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2

#-----Port_1A fault auto-reset-----
J1_01 = 1 : NULL : WAIT = 0.1

#0V baseline (supply path off) -> status 0
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2
NULL : Port_1A = 0.0 | 0.050 | 0.2
NULL : Input_1A = 0 | 0.1 | 0.2

#1.0V normal -> status 1
PwrSetVoltage = 10 : NULL : WAIT = 0.10
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 1.0 | 0.050 | 0.2
NULL : Port_1A = 1.0 | 0.050 | 0.2
NULL : Input_1A = 1 | 0.1 | 0.2

#5.7V fault inject -> status 2
PwrSetVoltage = 57 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.7 | 0.050 | 0.2
NULL : Input_1A = 2 | 0.1 | 0.3

#return to 1.0V -> status must auto-reset to 1
PwrSetVoltage = 10 : NULL : WAIT = 0.40
NULL : MeterVolts = 1.0 | 0.050 | 0.3
NULL : Port_1A = 1.0 | 0.050 | 0.3
NULL : Input_1A = 1 | 0.1 | 0.3

#back to 0V (path off) before switching input
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2
NULL : Port_1A = 0.0 | 0.050 | 0.2
NULL : Input_1A = 0 | 0.1 | 0.2

J1_01 = 0 : NULL : WAIT = 0.1

#-----Port_1B fault auto-reset-----
J1_02 = 1 : NULL : WAIT = 0.1

#0V baseline (supply path off) -> status 0
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2
NULL : Port_1B = 0.0 | 0.050 | 0.2
NULL : Input_1B = 0 | 0.1 | 0.2

#1.0V normal -> status 1
PwrSetVoltage = 10 : NULL : WAIT = 0.10
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 1.0 | 0.050 | 0.2
NULL : Port_1B = 1.0 | 0.050 | 0.2
NULL : Input_1B = 1 | 0.1 | 0.2

#5.7V fault inject -> status 2
PwrSetVoltage = 57 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.7 | 0.050 | 0.2
NULL : Input_1B = 2 | 0.1 | 0.3

#return to 1.0V -> status must auto-reset to 1
PwrSetVoltage = 10 : NULL : WAIT = 0.40
NULL : MeterVolts = 1.0 | 0.050 | 0.3
NULL : Port_1B = 1.0 | 0.050 | 0.3
NULL : Input_1B = 1 | 0.1 | 0.3

#back to 0V (path off) before switching input
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2
NULL : Port_1B = 0.0 | 0.050 | 0.2
NULL : Input_1B = 0 | 0.1 | 0.2

J1_02 = 0 : NULL : WAIT = 0.1

#-----Port_2A fault auto-reset-----
J1_03 = 1 : NULL : WAIT = 0.1

#0V baseline (supply path off) -> status 0
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2
NULL : Port_2A = 0.0 | 0.050 | 0.2
NULL : Input_2A = 0 | 0.1 | 0.2

#1.0V normal -> status 1
PwrSetVoltage = 10 : NULL : WAIT = 0.10
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 1.0 | 0.050 | 0.2
NULL : Port_2A = 1.0 | 0.050 | 0.2
NULL : Input_2A = 1 | 0.1 | 0.2

#5.7V fault inject -> status 2
PwrSetVoltage = 57 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.7 | 0.050 | 0.2
NULL : Input_2A = 2 | 0.1 | 0.3

#return to 1.0V -> status must auto-reset to 1
PwrSetVoltage = 10 : NULL : WAIT = 0.40
NULL : MeterVolts = 1.0 | 0.050 | 0.3
NULL : Port_2A = 1.0 | 0.050 | 0.3
NULL : Input_2A = 1 | 0.1 | 0.3

#back to 0V (path off) before switching input
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2
NULL : Port_2A = 0.0 | 0.050 | 0.2
NULL : Input_2A = 0 | 0.1 | 0.2

J1_03 = 0 : NULL : WAIT = 0.1

#-----Port_2B fault auto-reset-----
J1_04 = 1 : NULL : WAIT = 0.1

#0V baseline (supply path off) -> status 0
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2
NULL : Port_2B = 0.0 | 0.050 | 0.2
NULL : Input_2B = 0 | 0.1 | 0.2

#1.0V normal -> status 1
PwrSetVoltage = 10 : NULL : WAIT = 0.10
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 1.0 | 0.050 | 0.2
NULL : Port_2B = 1.0 | 0.050 | 0.2
NULL : Input_2B = 1 | 0.1 | 0.2

#5.7V fault inject -> status 2
PwrSetVoltage = 57 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.7 | 0.050 | 0.2
NULL : Input_2B = 2 | 0.1 | 0.3

#return to 1.0V -> status must auto-reset to 1
PwrSetVoltage = 10 : NULL : WAIT = 0.40
NULL : MeterVolts = 1.0 | 0.050 | 0.3
NULL : Port_2B = 1.0 | 0.050 | 0.3
NULL : Input_2B = 1 | 0.1 | 0.3

#back to 0V (path off) before switching input
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2
NULL : Port_2B = 0.0 | 0.050 | 0.2
NULL : Input_2B = 0 | 0.1 | 0.2

J1_04 = 0 : NULL : WAIT = 0.1

#-----Port_3A fault auto-reset-----
J1_05 = 1 : NULL : WAIT = 0.1

#0V baseline (supply path off) -> status 0
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2
NULL : Port_3A = 0.0 | 0.050 | 0.2
NULL : Input_3A = 0 | 0.1 | 0.2

#1.0V normal -> status 1
PwrSetVoltage = 10 : NULL : WAIT = 0.10
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 1.0 | 0.050 | 0.2
NULL : Port_3A = 1.0 | 0.050 | 0.2
NULL : Input_3A = 1 | 0.1 | 0.2

#5.7V fault inject -> status 2
PwrSetVoltage = 57 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.7 | 0.050 | 0.2
NULL : Input_3A = 2 | 0.1 | 0.3

#return to 1.0V -> status must auto-reset to 1
PwrSetVoltage = 10 : NULL : WAIT = 0.40
NULL : MeterVolts = 1.0 | 0.050 | 0.3
NULL : Port_3A = 1.0 | 0.050 | 0.3
NULL : Input_3A = 1 | 0.1 | 0.3

#back to 0V (path off) before switching input
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2
NULL : Port_3A = 0.0 | 0.050 | 0.2
NULL : Input_3A = 0 | 0.1 | 0.2

J1_05 = 0 : NULL : WAIT = 0.1

#-----Port_3B fault auto-reset-----
J1_06 = 1 : NULL : WAIT = 0.1

#0V baseline (supply path off) -> status 0
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2
NULL : Port_3B = 0.0 | 0.050 | 0.2
NULL : Input_3B = 0 | 0.1 | 0.2

#1.0V normal -> status 1
PwrSetVoltage = 10 : NULL : WAIT = 0.10
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 1.0 | 0.050 | 0.2
NULL : Port_3B = 1.0 | 0.050 | 0.2
NULL : Input_3B = 1 | 0.1 | 0.2

#5.7V fault inject -> status 2
PwrSetVoltage = 57 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.7 | 0.050 | 0.2
NULL : Input_3B = 2 | 0.1 | 0.3

#return to 1.0V -> status must auto-reset to 1
PwrSetVoltage = 10 : NULL : WAIT = 0.40
NULL : MeterVolts = 1.0 | 0.050 | 0.3
NULL : Port_3B = 1.0 | 0.050 | 0.3
NULL : Input_3B = 1 | 0.1 | 0.3

#back to 0V (path off) before switching input
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2
NULL : Port_3B = 0.0 | 0.050 | 0.2
NULL : Input_3B = 0 | 0.1 | 0.2

J1_06 = 0 : NULL : WAIT = 0.1

#-----Port_4A fault auto-reset-----
J1_07 = 1 : NULL : WAIT = 0.1

#0V baseline (supply path off) -> status 0
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2
NULL : Port_4A = 0.0 | 0.050 | 0.2
NULL : Input_4A = 0 | 0.1 | 0.2

#1.0V normal -> status 1
PwrSetVoltage = 10 : NULL : WAIT = 0.10
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 1.0 | 0.050 | 0.2
NULL : Port_4A = 1.0 | 0.050 | 0.2
NULL : Input_4A = 1 | 0.1 | 0.2

#5.7V fault inject -> status 2
PwrSetVoltage = 57 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.7 | 0.050 | 0.2
NULL : Input_4A = 2 | 0.1 | 0.3

#return to 1.0V -> status must auto-reset to 1
PwrSetVoltage = 10 : NULL : WAIT = 0.40
NULL : MeterVolts = 1.0 | 0.050 | 0.3
NULL : Port_4A = 1.0 | 0.050 | 0.3
NULL : Input_4A = 1 | 0.1 | 0.3

#back to 0V (path off) before switching input
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2
NULL : Port_4A = 0.0 | 0.050 | 0.2
NULL : Input_4A = 0 | 0.1 | 0.2

J1_07 = 0 : NULL : WAIT = 0.1

#-----Port_4B fault auto-reset-----
J1_08 = 1 : NULL : WAIT = 0.1

#0V baseline (supply path off) -> status 0
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2
NULL : Port_4B = 0.0 | 0.050 | 0.2
NULL : Input_4B = 0 | 0.1 | 0.2

#1.0V normal -> status 1
PwrSetVoltage = 10 : NULL : WAIT = 0.10
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 1.0 | 0.050 | 0.2
NULL : Port_4B = 1.0 | 0.050 | 0.2
NULL : Input_4B = 1 | 0.1 | 0.2

#5.7V fault inject -> status 2
PwrSetVoltage = 57 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.7 | 0.050 | 0.2
NULL : Input_4B = 2 | 0.1 | 0.3

#return to 1.0V -> status must auto-reset to 1
PwrSetVoltage = 10 : NULL : WAIT = 0.40
NULL : MeterVolts = 1.0 | 0.050 | 0.3
NULL : Port_4B = 1.0 | 0.050 | 0.3
NULL : Input_4B = 1 | 0.1 | 0.3

#back to 0V (path off) before switching input
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2
NULL : Port_4B = 0.0 | 0.050 | 0.2
NULL : Input_4B = 0 | 0.1 | 0.2

J1_08 = 0 : NULL : WAIT = 0.1

#-----teardown-----
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
PwrSetCurrent = 0 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 0 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.1
PwrRemote = 0 : NULL : WAIT = 0.1
SAVE
END
