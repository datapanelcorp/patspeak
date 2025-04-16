#44018-1
#Verion 1.0.0+15
UUT_DBC = 44018-560.dbc
UUT_DATANAME = 44018-1-PWM

#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1

#switch in load line, set current
J0_08_METER_LOAD = 1 : NULL : WAIT = 1

#### OUT1 START
## Load 1A @ 50%
# switch in dut
J2_01 = 1 : NULL : WAIT = 0.5

#set current and turn on output and verify feedback
LdCurrentSet = 1000, Pwm1DutyCmd = 500 : NULL : WAIT = 0.1
#verify reading from load
NULL : PwmOut1Current = 1.0 | 1.0 | 0.1
NULL : MeterCurrent = 1.0 | 0.01 | 0.1

#set current and turn on output and verify feedback
LdCurrentSet = 2000, Pwm1DutyCmd = 500 : NULL : WAIT = 0.1
#verify reading from load
NULL : PwmOut1Current = 2.0 | 1.0 | 0.1
NULL : MeterCurrent = 2.0 | 0.01 | 0.1

J2_01 = 0 : NULL : WAIT = 0.1
#### OUT1 END

#switch out load line, clear current
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
SAVE
END
