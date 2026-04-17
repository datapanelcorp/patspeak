#43009-1
#Version 0.2
#sensor power overcurrent validation using PAT e-load
UUT_DBC = 43009-560.dbc
UUT_DATANAME = 43009-1-SENSOR-POWER-OVERCURRENT

#cycle IGN to clean slate
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#-----setup PAT-----
LdRemote = 1 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1

#keep PAT bench supply path off
PwrRemote = 1 : NULL : WAIT = 0.1
PwrSetCurrent = 0 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 0 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1

#enable telemetry groups used by this test
Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, Enable_FAULT = 1 : NULL : WAIT = 0.5

#all sensor-rail routes off before test
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.2

#-----SPWR1-----
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1
J2_02 = 1 : NULL : WAIT = 0.2
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 0.200 | 0.1
NULL : Spwr1 = 5.00 | 0.200 | 0.1
NULL : SpwrStat1 = 1 | 0.1 | 0.1

#in-spec load steps: rail should stay on
LdCurrentSet = 100 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.25
NULL : SpwrStat1 = 1 | 0.1 | 0.1
LdCurrentSet = 150 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.25
NULL : SpwrStat1 = 1 | 0.1 | 0.1
LdCurrentSet = 180 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.25
NULL : SpwrStat1 = 1 | 0.1 | 0.1
LdCurrentSet = 200 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.25
NULL : SpwrStat1 = 1 | 0.1 | 0.1

#high-current characterization sweep (captures droop and first fault point)
LdCurrentSet = 250 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr1 = 5.00 | 5.000 | 0.1
NULL : SpwrStat1 = 1 | 1.0 | 0.1
LdCurrentSet = 300 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr1 = 5.00 | 5.000 | 0.1
NULL : SpwrStat1 = 1 | 1.0 | 0.1
LdCurrentSet = 400 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr1 = 5.00 | 5.000 | 0.1
NULL : SpwrStat1 = 1 | 1.0 | 0.1
LdCurrentSet = 500 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr1 = 5.00 | 5.000 | 0.1
NULL : SpwrStat1 = 1 | 1.0 | 0.1
LdCurrentSet = 650 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr1 = 5.00 | 5.000 | 0.1
NULL : SpwrStat1 = 1 | 1.0 | 0.1
LdCurrentSet = 800 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr1 = 5.00 | 5.000 | 0.1
NULL : SpwrStat1 = 1 | 1.0 | 0.1
LdCurrentSet = 1000 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr1 = 5.00 | 5.000 | 0.1
NULL : SpwrStat1 = 1 | 1.0 | 0.1

#force hard short to validate definite fault path
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 200 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.50
NULL : SpwrStat1 = 2 | 0.1 | 0.1
NULL : MeterVolts = 0.00 | 0.300 | 0.1

#fault latch check with load removed
LdEnable = 0 : NULL : WAIT = 0.2
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : SpwrStat1 = 2 | 0.1 | 0.1

#clear sensor-power faults between rails
Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, Enable_FAULT = 1, Reset_Sensor_Power_Faults = 1 : NULL : WAIT = 0.2
Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, Enable_FAULT = 1, Reset_Sensor_Power_Faults = 0 : NULL : WAIT = 0.3
NULL : SpwrStat1 = 1 | 0.1 | 0.1
NULL : MeterVolts = 5.00 | 0.200 | 0.1

J2_02 = 0 : NULL : WAIT = 0.1

#-----SPWR2-----
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1
J2_04 = 1 : NULL : WAIT = 0.2
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 0.200 | 0.1
NULL : Spwr2 = 5.00 | 0.200 | 0.1
NULL : SpwrStat2 = 1 | 0.1 | 0.1

#in-spec load steps: rail should stay on
LdCurrentSet = 100 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.25
NULL : SpwrStat2 = 1 | 0.1 | 0.1
LdCurrentSet = 150 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.25
NULL : SpwrStat2 = 1 | 0.1 | 0.1
LdCurrentSet = 180 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.25
NULL : SpwrStat2 = 1 | 0.1 | 0.1
LdCurrentSet = 200 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.25
NULL : SpwrStat2 = 1 | 0.1 | 0.1

#high-current characterization sweep (captures droop and first fault point)
LdCurrentSet = 250 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr2 = 5.00 | 5.000 | 0.1
NULL : SpwrStat2 = 1 | 1.0 | 0.1
LdCurrentSet = 300 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr2 = 5.00 | 5.000 | 0.1
NULL : SpwrStat2 = 1 | 1.0 | 0.1
LdCurrentSet = 400 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr2 = 5.00 | 5.000 | 0.1
NULL : SpwrStat2 = 1 | 1.0 | 0.1
LdCurrentSet = 500 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr2 = 5.00 | 5.000 | 0.1
NULL : SpwrStat2 = 1 | 1.0 | 0.1
LdCurrentSet = 650 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr2 = 5.00 | 5.000 | 0.1
NULL : SpwrStat2 = 1 | 1.0 | 0.1
LdCurrentSet = 800 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr2 = 5.00 | 5.000 | 0.1
NULL : SpwrStat2 = 1 | 1.0 | 0.1
LdCurrentSet = 1000 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr2 = 5.00 | 5.000 | 0.1
NULL : SpwrStat2 = 1 | 1.0 | 0.1

#force hard short to validate definite fault path
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 200 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.50
NULL : SpwrStat2 = 2 | 0.1 | 0.1
NULL : MeterVolts = 0.00 | 0.300 | 0.1

#fault latch check with load removed
LdEnable = 0 : NULL : WAIT = 0.2
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : SpwrStat2 = 2 | 0.1 | 0.1

#clear sensor-power faults between rails
Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, Enable_FAULT = 1, Reset_Sensor_Power_Faults = 1 : NULL : WAIT = 0.2
Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, Enable_FAULT = 1, Reset_Sensor_Power_Faults = 0 : NULL : WAIT = 0.3
NULL : SpwrStat2 = 1 | 0.1 | 0.1
NULL : MeterVolts = 5.00 | 0.200 | 0.1

J2_04 = 0 : NULL : WAIT = 0.1

#-----SPWR3-----
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1
J2_06 = 1 : NULL : WAIT = 0.2
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 0.200 | 0.1
NULL : Spwr3 = 5.00 | 0.200 | 0.1
NULL : SpwrStat3 = 1 | 0.1 | 0.1

#in-spec load steps: rail should stay on
LdCurrentSet = 100 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.25
NULL : SpwrStat3 = 1 | 0.1 | 0.1
LdCurrentSet = 150 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.25
NULL : SpwrStat3 = 1 | 0.1 | 0.1
LdCurrentSet = 180 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.25
NULL : SpwrStat3 = 1 | 0.1 | 0.1
LdCurrentSet = 200 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.25
NULL : SpwrStat3 = 1 | 0.1 | 0.1

#high-current characterization sweep (captures droop and first fault point)
LdCurrentSet = 250 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr3 = 5.00 | 5.000 | 0.1
NULL : SpwrStat3 = 1 | 1.0 | 0.1
LdCurrentSet = 300 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr3 = 5.00 | 5.000 | 0.1
NULL : SpwrStat3 = 1 | 1.0 | 0.1
LdCurrentSet = 400 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr3 = 5.00 | 5.000 | 0.1
NULL : SpwrStat3 = 1 | 1.0 | 0.1
LdCurrentSet = 500 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr3 = 5.00 | 5.000 | 0.1
NULL : SpwrStat3 = 1 | 1.0 | 0.1
LdCurrentSet = 650 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr3 = 5.00 | 5.000 | 0.1
NULL : SpwrStat3 = 1 | 1.0 | 0.1
LdCurrentSet = 800 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr3 = 5.00 | 5.000 | 0.1
NULL : SpwrStat3 = 1 | 1.0 | 0.1
LdCurrentSet = 1000 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr3 = 5.00 | 5.000 | 0.1
NULL : SpwrStat3 = 1 | 1.0 | 0.1

#force hard short to validate definite fault path
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 200 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.50
NULL : SpwrStat3 = 2 | 0.1 | 0.1
NULL : MeterVolts = 0.00 | 0.300 | 0.1

#fault latch check with load removed
LdEnable = 0 : NULL : WAIT = 0.2
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : SpwrStat3 = 2 | 0.1 | 0.1

#clear sensor-power faults between rails
Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, Enable_FAULT = 1, Reset_Sensor_Power_Faults = 1 : NULL : WAIT = 0.2
Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, Enable_FAULT = 1, Reset_Sensor_Power_Faults = 0 : NULL : WAIT = 0.3
NULL : SpwrStat3 = 1 | 0.1 | 0.1
NULL : MeterVolts = 5.00 | 0.200 | 0.1

J2_06 = 0 : NULL : WAIT = 0.1

#-----SPWR4-----
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1
J2_08 = 1 : NULL : WAIT = 0.2
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 0.200 | 0.1
NULL : Spwr4 = 5.00 | 0.200 | 0.1
NULL : SpwrStat4 = 1 | 0.1 | 0.1

#in-spec load steps: rail should stay on
LdCurrentSet = 100 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.25
NULL : SpwrStat4 = 1 | 0.1 | 0.1
LdCurrentSet = 150 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.25
NULL : SpwrStat4 = 1 | 0.1 | 0.1
LdCurrentSet = 180 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.25
NULL : SpwrStat4 = 1 | 0.1 | 0.1
LdCurrentSet = 200 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.25
NULL : SpwrStat4 = 1 | 0.1 | 0.1

#high-current characterization sweep (captures droop and first fault point)
LdCurrentSet = 250 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr4 = 5.00 | 5.000 | 0.1
NULL : SpwrStat4 = 1 | 1.0 | 0.1
LdCurrentSet = 300 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr4 = 5.00 | 5.000 | 0.1
NULL : SpwrStat4 = 1 | 1.0 | 0.1
LdCurrentSet = 400 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr4 = 5.00 | 5.000 | 0.1
NULL : SpwrStat4 = 1 | 1.0 | 0.1
LdCurrentSet = 500 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr4 = 5.00 | 5.000 | 0.1
NULL : SpwrStat4 = 1 | 1.0 | 0.1
LdCurrentSet = 650 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr4 = 5.00 | 5.000 | 0.1
NULL : SpwrStat4 = 1 | 1.0 | 0.1
LdCurrentSet = 800 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr4 = 5.00 | 5.000 | 0.1
NULL : SpwrStat4 = 1 | 1.0 | 0.1
LdCurrentSet = 1000 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.00 | 5.000 | 0.1
NULL : Spwr4 = 5.00 | 5.000 | 0.1
NULL : SpwrStat4 = 1 | 1.0 | 0.1

#force hard short to validate definite fault path
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 200 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.50
NULL : SpwrStat4 = 2 | 0.1 | 0.1
NULL : MeterVolts = 0.00 | 0.300 | 0.1

#fault latch check with load removed
LdEnable = 0 : NULL : WAIT = 0.2
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : SpwrStat4 = 2 | 0.1 | 0.1

#clear sensor-power faults between rails
Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, Enable_FAULT = 1, Reset_Sensor_Power_Faults = 1 : NULL : WAIT = 0.2
Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, Enable_FAULT = 1, Reset_Sensor_Power_Faults = 0 : NULL : WAIT = 0.3
NULL : SpwrStat4 = 1 | 0.1 | 0.1
NULL : MeterVolts = 5.00 | 0.200 | 0.1

J2_08 = 0 : NULL : WAIT = 0.1

#-----final latch stage-----
#after reset/recovery checks above, fault each rail again and leave faults latched
#final latch SPWR1
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1
J2_02 = 1 : NULL : WAIT = 0.2
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 200 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.50
NULL : SpwrStat1 = 2 | 0.1 | 0.1
NULL : MeterVolts = 0.00 | 0.300 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : SpwrStat1 = 2 | 0.1 | 0.1
J2_02 = 0 : NULL : WAIT = 0.1

#final latch SPWR2
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1
J2_04 = 1 : NULL : WAIT = 0.2
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 200 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.50
NULL : SpwrStat2 = 2 | 0.1 | 0.1
NULL : MeterVolts = 0.00 | 0.300 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : SpwrStat2 = 2 | 0.1 | 0.1
J2_04 = 0 : NULL : WAIT = 0.1

#final latch SPWR3
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1
J2_06 = 1 : NULL : WAIT = 0.2
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 200 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.50
NULL : SpwrStat3 = 2 | 0.1 | 0.1
NULL : MeterVolts = 0.00 | 0.300 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : SpwrStat3 = 2 | 0.1 | 0.1
J2_06 = 0 : NULL : WAIT = 0.1

#final latch SPWR4
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1
J2_08 = 1 : NULL : WAIT = 0.2
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 200 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.50
NULL : SpwrStat4 = 2 | 0.1 | 0.1
NULL : MeterVolts = 0.00 | 0.300 | 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : SpwrStat4 = 2 | 0.1 | 0.1
J2_08 = 0 : NULL : WAIT = 0.1

#final expectation: all sensor power channels remain fault latched
NULL : SpwrStat1 = 2 | 0.1 | 0.1
NULL : SpwrStat2 = 2 | 0.1 | 0.1
NULL : SpwrStat3 = 2 | 0.1 | 0.1
NULL : SpwrStat4 = 2 | 0.1 | 0.1

#all sensor-rail connector routes off
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1

#-----teardown-----
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 0.1
LdRemote = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
PwrSetCurrent = 0 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 0 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.1
PwrRemote = 0 : NULL : WAIT = 0.1
SAVE
END
