#39009-1
#Verion 0.0
#input test
UUT_DBC = 39009-561.dbc
UUT_DATANAME = 39009-1-INPUT-ENCODER_0

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

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 10, MODE1B = 10, MODE2A = 1, MODE2B = 1, MODE3A = 10, MODE3B = 10, MODE4A = 1, MODE4B = 1, MODE5A = 0, MODE5B = 0, MODE6A = 1, MODE6B = 1, MODE7A = 0, MODE7B = 0 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 0, MODE9B = 0, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL

Command = 87, Counter_1A_Reset = 1, Counter_3A_Reset = 1, Counter_1A_ON_OFF = 1, Counter_3A_ON_OFF = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, Counter_1A_Reset = 0, Counter_3A_Reset = 0, Counter_1A_ON_OFF = 0, Counter_3A_ON_OFF = 0 : NULL

Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch in test supply
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2

PwrSetVoltage = 140 : NULL
#testing encoder foward
J2_02 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 1 | 0 | 0.1
J2_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 2 | 0 | 0.1
J2_02 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 3 | 0 | 0.1
J2_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 4 | 0 | 0.1

J2_02 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 5 | 0 | 0.1
J2_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 6 | 0 | 0.1
J2_02 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 7 | 0 | 0.1
J2_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 8 | 0 | 0.1

#testing encoder reverse
J2_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 7 | 0 | 0.1
J2_02 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 6 | 0 | 0.1
J2_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 5 | 0 | 0.1
J2_02 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 4 | 0 | 0.1

J2_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 3 | 0 | 0.1
J2_02 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 2 | 0 | 0.1
J2_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 1 | 0 | 0.1
J2_02 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 0 | 0 | 0.1

#testing encoder reverse rollover
J2_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 4294967295 | 0 | 0.1
J2_02 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 4294967294 | 0 | 0.1
J2_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 4294967293 | 0 | 0.1
J2_02 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 4294967292 | 0 | 0.1

J2_01 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 4294967291 | 0 | 0.1
J2_02 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 4294967290 | 0 | 0.1
J2_01 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 4294967289 | 0 | 0.1
J2_02 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue1 = 4294967288 | 0 | 0.1

#switch out input
J2_02 = 0 : NULL : WAIT = 0.2
J2_01 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#disable counter
Command = 87, Counter_1A_ON_OFF = 1 : NULL : WAIT = 0.2
Command = 0, Counter_1A_ON_OFF = 0 : NULL
#verify count
NULL : EncoderValue1 = 4294967288 | 0 | 0.1
#send counter reset
Command = 87, Counter_1A_Reset = 1 : NULL : WAIT = 0.2
Command = 0, Counter_1A_Reset = 0 : NULL
#verify count reset
NULL : EncoderValue1 = 0 | 0 | 0.1

#switch out load line
J2_02 = 0, J2_01 = 0 : NULL : WAIT = 0.1
#switch out power supply
LdRemote = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
#cycle IGN to clean slate
SAVE
END
