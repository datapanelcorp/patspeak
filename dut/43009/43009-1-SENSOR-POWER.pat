#43009-1
#Version 0.1
#sensor power rail validation (always-active 5V rails)
UUT_DBC = 43009-560.dbc
UUT_DATANAME = 43009-1-SENSOR-POWER

#cycle IGN to clean slate
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#-----setup PAT-----
#setup meter path
LdRemote = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1

#keep PAT bench supply path off for this measurement test
PwrRemote = 1 : NULL : WAIT = 0.1
PwrSetCurrent = 0 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 0 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1

#enable DUT telemetry groups used by this test (match rigol input test)
Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1 : NULL : WAIT = 0.5

#all sensor-rail connector routes off before test
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.2

#-----SPWR1-----
#route this rail to meter input
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1
J2_02 = 1 : NULL : WAIT = 0.2

#verify connector voltage and internal telemetry
NULL : MeterVolts = 5.00 | 0.200 | 0.1
NULL : Spwr1 = 5.00 | 0.200 | 0.1
NULL : SpwrStat1 = 1 | 0.1 | 0.1

#unroute connector before next rail
J2_02 = 0 : NULL : WAIT = 0.1

#-----SPWR2-----
#route this rail to meter input
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1
J2_04 = 1 : NULL : WAIT = 0.2

#verify connector voltage and internal telemetry
NULL : MeterVolts = 5.00 | 0.200 | 0.1
NULL : Spwr2 = 5.00 | 0.200 | 0.1
NULL : SpwrStat2 = 1 | 0.1 | 0.1

#unroute connector before next rail
J2_04 = 0 : NULL : WAIT = 0.1

#-----SPWR3-----
#route this rail to meter input
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1
J2_06 = 1 : NULL : WAIT = 0.2

#verify connector voltage and internal telemetry
NULL : MeterVolts = 5.00 | 0.200 | 0.1
NULL : Spwr3 = 5.00 | 0.200 | 0.1
NULL : SpwrStat3 = 1 | 0.1 | 0.1

#unroute connector before next rail
J2_06 = 0 : NULL : WAIT = 0.1

#-----SPWR4-----
#route this rail to meter input
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1
J2_08 = 1 : NULL : WAIT = 0.2

#verify connector voltage and internal telemetry
NULL : MeterVolts = 5.00 | 0.200 | 0.1
NULL : Spwr4 = 5.00 | 0.200 | 0.1
NULL : SpwrStat4 = 1 | 0.1 | 0.1

#unroute connector before next rail
J2_08 = 0 : NULL : WAIT = 0.1

#all sensor-rail connector routes off
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1

#-----teardown-----
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
PwrSetCurrent = 0 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 0 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.1
PwrRemote = 0 : NULL : WAIT = 0.1
SAVE
END
