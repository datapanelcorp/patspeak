#34044-1
#Verion 0.0
#input test
UUT_DBC = 34044-561.dbc
UUT_DATANAME = 34044-1-INPUT-ENCODER

#-----setup 34044-----
Command = 93, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL
#setup meter
LdRemote = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1

#setup PS1
PwrRemote = 1 : NULL : WAIT = 0.1
PwrSetCurrent = 20 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 1 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1

#-----setup 34044-----
#configure Port Modes
Command = 83, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL : WAIT = 0.2
Command = 83, MODE5A = 10, MODE5B = 0, MODE6A = 10, MODE6B = 0, MODE7A = 10, MODE7B = 0 : NULL : WAIT = 0.2
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL : WAIT = 0.2
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL : WAIT = 0.2

Command = 84, MODE8A = 10, MODE8B = 0 : NULL : WAIT = 0.2
Command = 0, MODE8A = 0, MODE8B = 0 : NULL

Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL

Command = 87, Counter_7A_Reset = 1, Counter_8A_Reset = 1, Counter_7A_ON_OFF = 1, Counter_8A_ON_OFF = 1, LowBYTE_Counter_7A_Setpoint = 0, LowBYTE_Counter_8A_Setpoint = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, Counter_7A_Reset = 0, Counter_8A_Reset = 0, Counter_7A_ON_OFF = 0, Counter_8A_ON_OFF = 0, LowBYTE_Counter_7A_Setpoint = 0, LowBYTE_Counter_8A_Setpoint = 0 : NULL
Command = 0, Counter_7A_Enable_OUT3A = 0, Counter_8A_Enable_OUT4A = 0, Counter_7A_Enable_Overflow = 0, Counter_8A_Enable_Overflow = 0 : NULL

#switch in test supply
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2

PwrSetVoltage = 140 : NULL
#testing encoder foward
J3_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 1 | 0 | 0.1
J3_03 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 2 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 3 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 4 | 0 | 0.1

J3_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 5 | 0 | 0.1
J3_03 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 6 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 7 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 8 | 0 | 0.1

J3_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 9 | 0 | 0.1
J3_03 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 10 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 11 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 12 | 0 | 0.1

J3_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 13 | 0 | 0.1
J3_03 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 14 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 15 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 16 | 0 | 0.1

J3_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 17 | 0 | 0.1
J3_03 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 18 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 19 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 20 | 0 | 0.1

J3_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 21 | 0 | 0.1
J3_03 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 22 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 23 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 24 | 0 | 0.1

#testing encoder reverse
J3_03 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 23 | 0 | 0.1
J3_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 22 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 21 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 20 | 0 | 0.1

J3_03 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 19 | 0 | 0.1
J3_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 18 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 17 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 16 | 0 | 0.1

J3_03 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 15 | 0 | 0.1
J3_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 14 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 13 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 12 | 0 | 0.1

J3_03 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 11 | 0 | 0.1
J3_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 10 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 9 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 8 | 0 | 0.1

J3_03 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 7 | 0 | 0.1
J3_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 6 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 5 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 4 | 0 | 0.1

J3_03 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 3 | 0 | 0.1
J3_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 2 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 1 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 0 | 0 | 0.1

#testing encoder reverse rollover
J3_03 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967295 | 0 | 0.1
J3_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967294 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967293 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967292 | 0 | 0.1

J3_03 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967291 | 0 | 0.1
J3_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967290 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967289 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967288 | 0 | 0.1

J3_03 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967287 | 0 | 0.1
J3_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967286 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967285 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967284 | 0 | 0.1

J3_03 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967283 | 0 | 0.1
J3_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967282 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967281 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967280 | 0 | 0.1

J3_03 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967279 | 0 | 0.1
J3_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967278 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967277 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967276 | 0 | 0.1

J3_03 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967275 | 0 | 0.1
J3_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967274 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967273 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue = 4294967272 | 0 | 0.1

#switch out input
J3_01 = 0 : NULL : WAIT = 0.2
J3_03 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#disable counter
Command = 87, Counter_7A_ON_OFF = 1 : NULL : WAIT = 0.2
Command = 0, Counter_7A_ON_OFF = 0 : NULL
#verify count
NULL : EncoderValue = 4294967272 | 0 | 0.1
#send counter reset
Command = 87, Counter_7A_Reset = 1 : NULL : WAIT = 0.2
Command = 0, Counter_7A_Reset = 0 : NULL
#verify count reset
NULL : EncoderValue = 0 | 0 | 0.1

#switch out load line
J3_01 = 0, J3_03 = 0 : NULL : WAIT = 0.1
#switch out power supply
LdRemote = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
SAVE
END
