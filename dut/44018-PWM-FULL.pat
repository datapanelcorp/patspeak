#44018-1
#Verion 1.2
UUT_DBC = 44018-PAT.dbc
UUT_DATANAME = 44018-1-PWM-1.2
#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J0_08_METER_LOAD = 1 : NULL : WAIT = 1

#**** OUT1 START
# --> Switch in dut
J2_01 = 1 : NULL : WAIT = 0.5
# --> Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm1DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm1DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm1DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm1DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm1DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm1DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm1DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm1DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm1DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm1DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm1DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm1DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm1DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm1DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm1DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm1DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm1DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm1DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm1DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm1DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm1DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm1DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm1DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm1DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm1DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm1DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm1DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut1Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
J2_01 = 0, Pwm1DutyCmd = 0 : NULL : WAIT = 0.5
#**** OUT1 END

#**** OUT2 START
# --> Switch in dut
J2_02 = 1 : NULL : WAIT = 0.5
# --> Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm2DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm2DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm2DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm2DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm2DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm2DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm2DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm2DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm2DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm2DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm2DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm2DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm2DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm2DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm2DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm2DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm2DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm2DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm2DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm2DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm2DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm2DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm2DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm2DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm2DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm2DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm2DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut2Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
J2_02 = 0, Pwm2DutyCmd = 0 : NULL : WAIT = 0.5
#**** OUT2 END

#**** OUT3 START
# --> Switch in dut
J2_03 = 1 : NULL : WAIT = 0.5
# --> Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm3DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm3DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm3DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm3DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm3DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm3DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm3DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm3DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm3DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm3DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm3DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm3DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm3DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm3DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm3DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm3DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm3DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm3DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm3DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm3DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm3DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm3DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm3DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm3DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm3DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm3DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm3DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut3Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
J2_03 = 0, Pwm3DutyCmd = 0 : NULL : WAIT = 0.5
#**** OUT3 END

#**** OUT4 START
# --> Switch in dut
J2_04 = 1 : NULL : WAIT = 0.5
# --> Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm4DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm4DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm4DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm4DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm4DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm4DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm4DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm4DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm4DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm4DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm4DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm4DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm4DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm4DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm4DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm4DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm4DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm4DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm4DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm4DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm4DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm4DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm4DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm4DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm4DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm4DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm4DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut4Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
J2_04 = 0, Pwm4DutyCmd = 0 : NULL : WAIT = 0.5
#**** OUT4 END

#**** OUT5 START
# --> Switch in dut
J2_05 = 1 : NULL : WAIT = 0.5
# --> Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm5DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm5DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm5DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm5DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm5DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm5DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm5DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm5DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm5DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm5DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm5DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm5DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm5DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm5DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm5DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm5DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm5DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm5DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm5DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm5DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm5DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm5DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm5DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm5DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm5DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm5DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm5DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut5Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
J2_05 = 0, Pwm5DutyCmd = 0 : NULL : WAIT = 0.5
#**** OUT5 END

#**** OUT6 START
# --> Switch in dut
J2_06 = 1 : NULL : WAIT = 0.5
# --> Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm6DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm6DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm6DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm6DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm6DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm6DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm6DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm6DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm6DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm6DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm6DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm6DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm6DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm6DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm6DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm6DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm6DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm6DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm6DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm6DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm6DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm6DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm6DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm6DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm6DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm6DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm6DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut6Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
J2_06 = 0, Pwm6DutyCmd = 0 : NULL : WAIT = 0.5
#**** OUT6 END

#**** OUT7 START
# --> Switch in dut
J2_07 = 1 : NULL : WAIT = 0.5
# --> Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm7DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm7DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm7DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm7DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm7DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm7DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm7DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm7DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm7DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm7DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm7DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm7DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm7DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm7DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm7DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm7DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm7DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm7DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm7DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm7DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm7DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm7DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm7DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm7DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm7DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm7DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm7DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut7Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
J2_07 = 0, Pwm7DutyCmd = 0 : NULL : WAIT = 0.5
#**** OUT7 END

#**** OUT8 START
# --> Switch in dut
J2_08 = 1 : NULL : WAIT = 0.5
# --> Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm8DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm8DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm8DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm8DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm8DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm8DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm8DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm8DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm8DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm8DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm8DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm8DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm8DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm8DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm8DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm8DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm8DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm8DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm8DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm8DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm8DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm8DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm8DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm8DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm8DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm8DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm8DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut8Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
J2_08 = 0, Pwm8DutyCmd = 0 : NULL : WAIT = 0.5
#**** OUT8 END

#**** OUT9 START
# --> Switch in dut
J2_09 = 1 : NULL : WAIT = 0.5
# --> Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm9DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm9DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm9DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm9DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm9DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm9DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm9DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm9DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm9DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm9DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm9DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm9DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm9DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm9DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm9DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm9DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm9DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm9DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm9DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm9DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm9DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm9DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm9DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm9DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm9DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm9DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm9DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut9Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
J2_09 = 0, Pwm9DutyCmd = 0 : NULL : WAIT = 0.5
#**** OUT9 END

#**** OUT10 START
# --> Switch in dut
J2_10 = 1 : NULL : WAIT = 0.5
# --> Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm10DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm10DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm10DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm10DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm10DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm10DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm10DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm10DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm10DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm10DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm10DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm10DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm10DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm10DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm10DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm10DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm10DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm10DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm10DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm10DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm10DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm10DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm10DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm10DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm10DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm10DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm10DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut10Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
J2_10 = 0, Pwm10DutyCmd = 0 : NULL : WAIT = 0.5
#**** OUT10 END

#**** OUT11 START
# --> Switch in dut
J2_11 = 1 : NULL : WAIT = 0.5
# --> Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm11DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm11DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm11DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm11DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm11DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm11DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm11DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm11DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm11DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm11DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm11DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm11DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm11DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm11DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm11DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm11DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm11DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm11DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm11DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm11DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm11DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm11DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm11DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm11DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm11DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm11DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm11DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut11Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
J2_11 = 0, Pwm11DutyCmd = 0 : NULL : WAIT = 0.5
#**** OUT11 END

#**** OUT12 START
# --> Switch in dut
J2_12 = 1 : NULL : WAIT = 0.5
# --> Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm12DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm12DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm12DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm12DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm12DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm12DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm12DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm12DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm12DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm12DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm12DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm12DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm12DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm12DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm12DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm12DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm12DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm12DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
# --> Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.1
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
# --> Duty: 1% Load: 1000ma
LdCurrentSet = 1000, Pwm12DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 0.0 | 0.01 | 0.5
NULL : MeterCurrent = 0.0 | 0.01 | 0.5
# --> Duty: 1% Load: 5000ma
LdCurrentSet = 5000, Pwm12DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 0.1 | 0.04 | 0.5
NULL : MeterCurrent = 0.1 | 0.04 | 0.5
# --> Duty: 1% Load: 13000ma
LdCurrentSet = 13000, Pwm12DutyCmd = 1 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 0.1 | 0.10 | 0.5
NULL : MeterCurrent = 0.1 | 0.10 | 0.5
# --> Duty: 50% Load: 1000ma
LdCurrentSet = 1000, Pwm12DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 0.5 | 0.40 | 0.5
NULL : MeterCurrent = 0.5 | 0.40 | 0.5
# --> Duty: 50% Load: 5000ma
LdCurrentSet = 5000, Pwm12DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 2.5 | 2.00 | 0.5
NULL : MeterCurrent = 2.5 | 2.00 | 0.5
# --> Duty: 50% Load: 13000ma
LdCurrentSet = 13000, Pwm12DutyCmd = 50 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 6.5 | 5.20 | 0.5
NULL : MeterCurrent = 6.5 | 5.20 | 0.5
# --> Duty: 99% Load: 1000ma
LdCurrentSet = 1000, Pwm12DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 1.0 | 0.79 | 0.5
NULL : MeterCurrent = 1.0 | 0.79 | 0.5
# --> Duty: 99% Load: 5000ma
LdCurrentSet = 5000, Pwm12DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 5.0 | 3.96 | 0.5
NULL : MeterCurrent = 5.0 | 3.96 | 0.5
# --> Duty: 99% Load: 13000ma
LdCurrentSet = 13000, Pwm12DutyCmd = 99 : NULL : WAIT = 0.5
NULL : PwmOut12Current = 12.9 | 10.30 | 0.5
NULL : MeterCurrent = 12.9 | 10.30 | 0.5
J2_12 = 0, Pwm12DutyCmd = 0 : NULL : WAIT = 0.5
#**** OUT12 END

#switch out load line, clear current
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
SAVE
END
