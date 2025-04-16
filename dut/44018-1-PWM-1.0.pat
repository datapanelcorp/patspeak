#44018-1
#Verion 1.0
UUT_DBC = 44018-560.dbc
UUT_DATANAME = 44018-1-PWM-1.0
#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
#switch in load line, set current
J0_08_METER_LOAD = 1 : NULL : WAIT = 1

#### OUT1 START
# switch in dut
J2_01 = 1 : NULL : WAIT = 0.5
# Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm1DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm1DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm1DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm1DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm1DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm1DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm1DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm1DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm1DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm1DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm1DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm1DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm1DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm1DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm1DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm1DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm1DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm1DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm1DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm1DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm1DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm1DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm1DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm1DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm1DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm1DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm1DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut1Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
J2_01 = 0, Pwm1DutyCmd = 0 : NULL : WAIT = 0.5
#### OUT1 END

#### OUT2 START
# switch in dut
J2_02 = 1 : NULL : WAIT = 0.5
# Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm2DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm2DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm2DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm2DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm2DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm2DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm2DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm2DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm2DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm2DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm2DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm2DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm2DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm2DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm2DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm2DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm2DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm2DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm2DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm2DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm2DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm2DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm2DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm2DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm2DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm2DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm2DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut2Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
J2_02 = 0, Pwm2DutyCmd = 0 : NULL : WAIT = 0.5
#### OUT2 END

#### OUT3 START
# switch in dut
J2_03 = 1 : NULL : WAIT = 0.5
# Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm3DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm3DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm3DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm3DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm3DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm3DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm3DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm3DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm3DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm3DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm3DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm3DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm3DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm3DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm3DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm3DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm3DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm3DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm3DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm3DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm3DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm3DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm3DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm3DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm3DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm3DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm3DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut3Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
J2_03 = 0, Pwm3DutyCmd = 0 : NULL : WAIT = 0.5
#### OUT3 END

#### OUT4 START
# switch in dut
J2_04 = 1 : NULL : WAIT = 0.5
# Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm4DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm4DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm4DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm4DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm4DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm4DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm4DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm4DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm4DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm4DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm4DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm4DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm4DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm4DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm4DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm4DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm4DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm4DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm4DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm4DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm4DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm4DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm4DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm4DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm4DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm4DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm4DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut4Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
J2_04 = 0, Pwm4DutyCmd = 0 : NULL : WAIT = 0.5
#### OUT4 END

#### OUT5 START
# switch in dut
J2_05 = 1 : NULL : WAIT = 0.5
# Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm5DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm5DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm5DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm5DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm5DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm5DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm5DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm5DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm5DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm5DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm5DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm5DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm5DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm5DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm5DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm5DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm5DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm5DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm5DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm5DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm5DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm5DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm5DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm5DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm5DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm5DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm5DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut5Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
J2_05 = 0, Pwm5DutyCmd = 0 : NULL : WAIT = 0.5
#### OUT5 END

#### OUT6 START
# switch in dut
J2_06 = 1 : NULL : WAIT = 0.5
# Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm6DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm6DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm6DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm6DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm6DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm6DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm6DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm6DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm6DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm6DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm6DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm6DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm6DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm6DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm6DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm6DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm6DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm6DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm6DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm6DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm6DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm6DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm6DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm6DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm6DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm6DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm6DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut6Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
J2_06 = 0, Pwm6DutyCmd = 0 : NULL : WAIT = 0.5
#### OUT6 END

#### OUT7 START
# switch in dut
J2_07 = 1 : NULL : WAIT = 0.5
# Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm7DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm7DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm7DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm7DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm7DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm7DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm7DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm7DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm7DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm7DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm7DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm7DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm7DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm7DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm7DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm7DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm7DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm7DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm7DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm7DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm7DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm7DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm7DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm7DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm7DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm7DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm7DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut7Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
J2_07 = 0, Pwm7DutyCmd = 0 : NULL : WAIT = 0.5
#### OUT7 END

#### OUT8 START
# switch in dut
J2_08 = 1 : NULL : WAIT = 0.5
# Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm8DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm8DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm8DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm8DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm8DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm8DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm8DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm8DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm8DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm8DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm8DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm8DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm8DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm8DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm8DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm8DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm8DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm8DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm8DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm8DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm8DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm8DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm8DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm8DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm8DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm8DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm8DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut8Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
J2_08 = 0, Pwm8DutyCmd = 0 : NULL : WAIT = 0.5
#### OUT8 END

#### OUT9 START
# switch in dut
J2_09 = 1 : NULL : WAIT = 0.5
# Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm9DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm9DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm9DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm9DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm9DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm9DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm9DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm9DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm9DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm9DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm9DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm9DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm9DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm9DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm9DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm9DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm9DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm9DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm9DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm9DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm9DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm9DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm9DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm9DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm9DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm9DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm9DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut9Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
J2_09 = 0, Pwm9DutyCmd = 0 : NULL : WAIT = 0.5
#### OUT9 END

#### OUT10 START
# switch in dut
J2_10 = 1 : NULL : WAIT = 0.5
# Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm10DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm10DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm10DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm10DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm10DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm10DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm10DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm10DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm10DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm10DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm10DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm10DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm10DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm10DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm10DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm10DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm10DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm10DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm10DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm10DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm10DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm10DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm10DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm10DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm10DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm10DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm10DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut10Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
J2_10 = 0, Pwm10DutyCmd = 0 : NULL : WAIT = 0.5
#### OUT10 END

#### OUT11 START
# switch in dut
J2_11 = 1 : NULL : WAIT = 0.5
# Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm11DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm11DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm11DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm11DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm11DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm11DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm11DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm11DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm11DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm11DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm11DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm11DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm11DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm11DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm11DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm11DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm11DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm11DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm11DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm11DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm11DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm11DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm11DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm11DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm11DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm11DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm11DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut11Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
J2_11 = 0, Pwm11DutyCmd = 0 : NULL : WAIT = 0.5
#### OUT11 END

#### OUT12 START
# switch in dut
J2_12 = 1 : NULL : WAIT = 0.5
# Frequency 50 hz
Command = 220, ParamId = 457, Port1PwmFreq = 50 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm12DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm12DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm12DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm12DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm12DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm12DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm12DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm12DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm12DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 250 hz
Command = 220, ParamId = 457, Port1PwmFreq = 250 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm12DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm12DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm12DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm12DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm12DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm12DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm12DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm12DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm12DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
# Frequency 125 hz
Command = 220, ParamId = 457, Port1PwmFreq = 125 : NULL : WAIT = 0.01
Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL
## Duty: 1% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm12DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 1% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm12DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 1% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm12DutyCmd = 1 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 50% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm12DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 50% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm12DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 50% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm12DutyCmd = 50 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
## Duty: 99% Load: 1000ma
#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm12DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 1.0 | 3.5 | 0.5
NULL : MeterCurrent = 1.0 | 3.5 | 0.5
## Duty: 99% Load: 5000ma
#set current and turn on output and verify feedback
LdCurrentSet = 5000, Pwm12DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 5.0 | 3.5 | 0.5
NULL : MeterCurrent = 5.0 | 3.5 | 0.5
## Duty: 99% Load: 13000ma
#set current and turn on output and verify feedback
LdCurrentSet = 13000, Pwm12DutyCmd = 99 : NULL : WAIT = 0.5
#verify reading from load
NULL : PwmOut12Current = 13.0 | 3.5 | 0.5
NULL : MeterCurrent = 13.0 | 3.5 | 0.5
J2_12 = 0, Pwm12DutyCmd = 0 : NULL : WAIT = 0.5
#### OUT12 END

#switch out load line, clear current
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
SAVE
END
