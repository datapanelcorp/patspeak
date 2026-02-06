#43019-1
#Verion 0.0
#input test
UUT_DBC = 43019-560.dbc
UUT_DATANAME = 43019-1-INPUT-ENCODER

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
Command = 82, MODE1 = 0, MODE2 = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 10, MODE3B = 10, MODE4A = 10, MODE4B = 10, MODE5A = 0, MODE5B = 0 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL

Command = 87, Counter_3A_Reset = 1, Counter_3A_ON_OFF = 1 : NULL : WAIT = 0.2
Command = 87, Counter_3A_Reset = 0, Counter_3A_ON_OFF = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, Counter_3A_Reset = 0, Counter_3A_ON_OFF = 0 : NULL

Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch in test supply
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2

PwrSetVoltage = 140 : NULL
#avoid first activation glitch by activating prior to test
J1_06 = 1 : NULL : WAIT = 0.2
J1_05 = 1 : NULL : WAIT = 0.2
J1_06 = 0 : NULL : WAIT = 0.2
J1_05 = 0 : NULL : WAIT = 0.2
Command = 87, Counter_3A_Reset = 1, Counter_3A_ON_OFF = 1 : NULL : WAIT = 0.2
Command = 87, Counter_3A_Reset = 0, Counter_3A_ON_OFF = 1 : NULL : WAIT = 0.2
#testing encoder foward
J1_06 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 1 | 0 | 0.1
J1_05 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 2 | 0 | 0.1
J1_06 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 3 | 0 | 0.1
J1_05 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 4 | 0 | 0.1

J1_06 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 5 | 0 | 0.1
J1_05 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 6 | 0 | 0.1
J1_06 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 7 | 0 | 0.1
J1_05 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 8 | 0 | 0.1

#testing encoder reverse
J1_05 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 7 | 0 | 0.1
J1_06 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 6 | 0 | 0.1
J1_05 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 5 | 0 | 0.1
J1_06 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 4 | 0 | 0.1

J1_05 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 3 | 0 | 0.1
J1_06 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 2 | 0 | 0.1
J1_05 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 1 | 0 | 0.1
J1_06 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 0 | 0 | 0.1

#testing encoder reverse rollover
J1_05 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 4294967295 | 0 | 0.1
J1_06 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 4294967294 | 0 | 0.1
J1_05 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 4294967293 | 0 | 0.1
J1_06 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 4294967292 | 0 | 0.1

J1_05 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 4294967291 | 0 | 0.1
J1_06 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 4294967290 | 0 | 0.1
J1_05 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 4294967289 | 0 | 0.1
J1_06 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue3 = 4294967288 | 0 | 0.1

#switch out input
J1_06 = 0 : NULL : WAIT = 0.2
J1_05 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#disable counter
Command = 87, Counter_3A_ON_OFF = 1 : NULL : WAIT = 0.2
Command = 0, Counter_3A_ON_OFF = 0 : NULL
#verify count
NULL : EncoderValue3 = 4294967288 | 0 | 0.1
#send counter reset
Command = 87, Counter_3A_Reset = 1 : NULL : WAIT = 0.2
Command = 0, Counter_3A_Reset = 0 : NULL
#verify count reset
NULL : EncoderValue3 = 0 | 0 | 0.1

#switch out load line
J1_06 = 0, J1_05 = 0 : NULL : WAIT = 0.1
#switch out power supply
LdRemote = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
#cycle IGN to clean slate
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
Command = 82, MODE1 = 0, MODE2 = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 10, MODE3B = 10, MODE4A = 10, MODE4B = 10, MODE5A = 0, MODE5B = 0 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL

Command = 87, Counter_4A_Reset = 1, Counter_4A_ON_OFF = 1 : NULL : WAIT = 0.2
Command = 87, Counter_4A_Reset = 0, Counter_4A_ON_OFF = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, Counter_4A_Reset = 0, Counter_4A_ON_OFF = 0 : NULL

Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch in test supply
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2

PwrSetVoltage = 140 : NULL
#avoid first activation glitch by activating prior to test
J1_08 = 1 : NULL : WAIT = 0.2
J1_07 = 1 : NULL : WAIT = 0.2
J1_08 = 0 : NULL : WAIT = 0.2
J1_07 = 0 : NULL : WAIT = 0.2
Command = 87, Counter_4A_Reset = 1, Counter_4A_ON_OFF = 1 : NULL : WAIT = 0.2
Command = 87, Counter_4A_Reset = 0, Counter_4A_ON_OFF = 1 : NULL : WAIT = 0.2
#testing encoder foward
J1_08 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 1 | 0 | 0.1
J1_07 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 2 | 0 | 0.1
J1_08 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 3 | 0 | 0.1
J1_07 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 4 | 0 | 0.1

J1_08 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 5 | 0 | 0.1
J1_07 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 6 | 0 | 0.1
J1_08 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 7 | 0 | 0.1
J1_07 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 8 | 0 | 0.1

#testing encoder reverse
J1_07 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 7 | 0 | 0.1
J1_08 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 6 | 0 | 0.1
J1_07 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 5 | 0 | 0.1
J1_08 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 4 | 0 | 0.1

J1_07 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 3 | 0 | 0.1
J1_08 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 2 | 0 | 0.1
J1_07 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 1 | 0 | 0.1
J1_08 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 0 | 0 | 0.1

#testing encoder reverse rollover
J1_07 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 4294967295 | 0 | 0.1
J1_08 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 4294967294 | 0 | 0.1
J1_07 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 4294967293 | 0 | 0.1
J1_08 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 4294967292 | 0 | 0.1

J1_07 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 4294967291 | 0 | 0.1
J1_08 = 1 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 4294967290 | 0 | 0.1
J1_07 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 4294967289 | 0 | 0.1
J1_08 = 0 : NULL : WAIT = 0.2
NULL : EncoderValue4 = 4294967288 | 0 | 0.1

#switch out input
J1_08 = 0 : NULL : WAIT = 0.2
J1_07 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#disable counter
Command = 87, Counter_4A_ON_OFF = 1 : NULL : WAIT = 0.2
Command = 0, Counter_4A_ON_OFF = 0 : NULL
#verify count
NULL : EncoderValue4 = 4294967288 | 0 | 0.1
#send counter reset
Command = 87, Counter_4A_Reset = 1 : NULL : WAIT = 0.2
Command = 0, Counter_4A_Reset = 0 : NULL
#verify count reset
NULL : EncoderValue4 = 0 | 0 | 0.1

#switch out load line
J1_08 = 0, J1_07 = 0 : NULL : WAIT = 0.1
#switch out power supply
LdRemote = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
#cycle IGN to clean slate
SAVE
END
