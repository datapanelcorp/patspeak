#43009-1
#Version 0.1
#WheelBrakeLiningRemaining count-position combination test (PAT supply fixed 1.00V)
UUT_DBC = 43009-560.dbc
UUT_DATANAME = 43009-1-WBLR-COMBOS-PATSUPPLY

#cycle IGN to clean slate
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#-----setup pat-----
LdRemote = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1

#use PAT bench supply as test source
PwrRemote = 1 : NULL : WAIT = 0.1
PwrSetCurrent = 100 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 1 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.5

J4_03 = 1 : NULL : WAIT = 0.2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2

#record firmware identifiers in test log
Command = 0 : NULL : WAIT = 0.5
NULL : Response = 0 | 0.1 | 0.3
NULL : Software_Version = 0 | 255 | 0.3
NULL : Software_Revision = 0 | 255 | 0.3

#enable all input processing features used by this test
Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, Enable_DPLF2 = 1, Enable_FAULT = 1 : NULL : WAIT = 0.5

#set fixed test voltage
PwrSetVoltage = 10 : NULL : WAIT = 0.3
NULL : MeterVolts = 1.00 | 0.080 | 0.2

#combo 000/255 active=NONE mode=Type1
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 001/255 active=1A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 002/255 active=1B mode=Type1
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 003/255 active=1A,1B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 004/255 active=2A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 005/255 active=1A,2A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 006/255 active=1B,2A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 007/255 active=1A,1B,2A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 008/255 active=2B mode=Type1
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 009/255 active=1A,2B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 010/255 active=1B,2B mode=Type1
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 011/255 active=1A,1B,2B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 012/255 active=2A,2B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 013/255 active=1A,2A,2B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 014/255 active=1B,2A,2B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 015/255 active=1A,1B,2A,2B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 016/255 active=3A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 017/255 active=1A,3A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 018/255 active=1B,3A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 019/255 active=1A,1B,3A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 020/255 active=2A,3A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 021/255 active=1A,2A,3A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 022/255 active=1B,2A,3A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 023/255 active=1A,1B,2A,3A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 024/255 active=2B,3A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 025/255 active=1A,2B,3A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 026/255 active=1B,2B,3A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 027/255 active=1A,1B,2B,3A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 028/255 active=2A,2B,3A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 029/255 active=1A,2A,2B,3A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 030/255 active=1B,2A,2B,3A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 031/255 active=1A,1B,2A,2B,3A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 032/255 active=3B mode=Type1
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 033/255 active=1A,3B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 034/255 active=1B,3B mode=Type1
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 035/255 active=1A,1B,3B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 036/255 active=2A,3B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 037/255 active=1A,2A,3B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 038/255 active=1B,2A,3B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 039/255 active=1A,1B,2A,3B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 040/255 active=2B,3B mode=Type1
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 041/255 active=1A,2B,3B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 042/255 active=1B,2B,3B mode=Type1
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 043/255 active=1A,1B,2B,3B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 044/255 active=2A,2B,3B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 045/255 active=1A,2A,2B,3B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 046/255 active=1B,2A,2B,3B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 047/255 active=1A,1B,2A,2B,3B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 048/255 active=3A,3B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 049/255 active=1A,3A,3B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 050/255 active=1B,3A,3B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 051/255 active=1A,1B,3A,3B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 052/255 active=2A,3A,3B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 053/255 active=1A,2A,3A,3B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 054/255 active=1B,2A,3A,3B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 055/255 active=1A,1B,2A,3A,3B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 056/255 active=2B,3A,3B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 057/255 active=1A,2B,3A,3B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 058/255 active=1B,2B,3A,3B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 059/255 active=1A,1B,2B,3A,3B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 060/255 active=2A,2B,3A,3B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 061/255 active=1A,2A,2B,3A,3B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 062/255 active=1B,2A,2B,3A,3B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 063/255 active=1A,1B,2A,2B,3A,3B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 064/255 active=4A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 065/255 active=1A,4A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 066/255 active=1B,4A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 067/255 active=1A,1B,4A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 068/255 active=2A,4A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 069/255 active=1A,2A,4A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 070/255 active=1B,2A,4A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 071/255 active=1A,1B,2A,4A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 072/255 active=2B,4A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 073/255 active=1A,2B,4A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 074/255 active=1B,2B,4A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 075/255 active=1A,1B,2B,4A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 076/255 active=2A,2B,4A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 077/255 active=1A,2A,2B,4A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 078/255 active=1B,2A,2B,4A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 079/255 active=1A,1B,2A,2B,4A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 080/255 active=3A,4A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 081/255 active=1A,3A,4A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 082/255 active=1B,3A,4A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 083/255 active=1A,1B,3A,4A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 084/255 active=2A,3A,4A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 085/255 active=1A,2A,3A,4A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 086/255 active=1B,2A,3A,4A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 087/255 active=1A,1B,2A,3A,4A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 088/255 active=2B,3A,4A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 089/255 active=1A,2B,3A,4A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 090/255 active=1B,2B,3A,4A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 091/255 active=1A,1B,2B,3A,4A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 092/255 active=2A,2B,3A,4A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 093/255 active=1A,2A,2B,3A,4A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 094/255 active=1B,2A,2B,3A,4A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 095/255 active=1A,1B,2A,2B,3A,4A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 096/255 active=3B,4A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 097/255 active=1A,3B,4A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 098/255 active=1B,3B,4A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 099/255 active=1A,1B,3B,4A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 100/255 active=2A,3B,4A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 101/255 active=1A,2A,3B,4A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 102/255 active=1B,2A,3B,4A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 103/255 active=1A,1B,2A,3B,4A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 104/255 active=2B,3B,4A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 105/255 active=1A,2B,3B,4A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 106/255 active=1B,2B,3B,4A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 107/255 active=1A,1B,2B,3B,4A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 108/255 active=2A,2B,3B,4A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 109/255 active=1A,2A,2B,3B,4A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 110/255 active=1B,2A,2B,3B,4A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 111/255 active=1A,1B,2A,2B,3B,4A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 112/255 active=3A,3B,4A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 113/255 active=1A,3A,3B,4A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 114/255 active=1B,3A,3B,4A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 115/255 active=1A,1B,3A,3B,4A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 116/255 active=2A,3A,3B,4A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 117/255 active=1A,2A,3A,3B,4A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 118/255 active=1B,2A,3A,3B,4A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 119/255 active=1A,1B,2A,3A,3B,4A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 120/255 active=2B,3A,3B,4A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 121/255 active=1A,2B,3A,3B,4A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 122/255 active=1B,2B,3A,3B,4A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 123/255 active=1A,1B,2B,3A,3B,4A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 124/255 active=2A,2B,3A,3B,4A mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 125/255 active=1A,2A,2B,3A,3B,4A mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 126/255 active=1B,2A,2B,3A,3B,4A mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 127/255 active=1A,1B,2A,2B,3A,3B,4A mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 0 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 0 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 128/255 active=4B mode=Type1
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 129/255 active=1A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 130/255 active=1B,4B mode=Type1
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 131/255 active=1A,1B,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 132/255 active=2A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 133/255 active=1A,2A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 134/255 active=1B,2A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 135/255 active=1A,1B,2A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 136/255 active=2B,4B mode=Type1
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 137/255 active=1A,2B,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 138/255 active=1B,2B,4B mode=Type1
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 139/255 active=1A,1B,2B,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 140/255 active=2A,2B,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 141/255 active=1A,2A,2B,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 142/255 active=1B,2A,2B,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 143/255 active=1A,1B,2A,2B,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 144/255 active=3A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 145/255 active=1A,3A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 146/255 active=1B,3A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 147/255 active=1A,1B,3A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 148/255 active=2A,3A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 149/255 active=1A,2A,3A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 150/255 active=1B,2A,3A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 151/255 active=1A,1B,2A,3A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 152/255 active=2B,3A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 153/255 active=1A,2B,3A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 154/255 active=1B,2B,3A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 155/255 active=1A,1B,2B,3A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 156/255 active=2A,2B,3A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 157/255 active=1A,2A,2B,3A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 158/255 active=1B,2A,2B,3A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 159/255 active=1A,1B,2A,2B,3A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 160/255 active=3B,4B mode=Type1
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 161/255 active=1A,3B,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 162/255 active=1B,3B,4B mode=Type1
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 163/255 active=1A,1B,3B,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 164/255 active=2A,3B,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 165/255 active=1A,2A,3B,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 166/255 active=1B,2A,3B,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 167/255 active=1A,1B,2A,3B,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 168/255 active=2B,3B,4B mode=Type1
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 169/255 active=1A,2B,3B,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 170/255 active=1B,2B,3B,4B mode=Type1
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 102.0 | 2.0 | 0.1

#combo 171/255 active=1A,1B,2B,3B,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 172/255 active=2A,2B,3B,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 173/255 active=1A,2A,2B,3B,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 174/255 active=1B,2A,2B,3B,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 175/255 active=1A,1B,2A,2B,3B,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 176/255 active=3A,3B,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 177/255 active=1A,3A,3B,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 178/255 active=1B,3A,3B,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 179/255 active=1A,1B,3A,3B,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 180/255 active=2A,3A,3B,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 181/255 active=1A,2A,3A,3B,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 182/255 active=1B,2A,3A,3B,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 183/255 active=1A,1B,2A,3A,3B,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 184/255 active=2B,3A,3B,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 185/255 active=1A,2B,3A,3B,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 186/255 active=1B,2B,3A,3B,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 187/255 active=1A,1B,2B,3A,3B,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 188/255 active=2A,2B,3A,3B,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 189/255 active=1A,2A,2B,3A,3B,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 190/255 active=1B,2A,2B,3A,3B,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 191/255 active=1A,1B,2A,2B,3A,3B,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 0, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 0 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 102.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 192/255 active=4A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 193/255 active=1A,4A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 194/255 active=1B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 195/255 active=1A,1B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 196/255 active=2A,4A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 197/255 active=1A,2A,4A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 198/255 active=1B,2A,4A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 199/255 active=1A,1B,2A,4A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 200/255 active=2B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 201/255 active=1A,2B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 202/255 active=1B,2B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 203/255 active=1A,1B,2B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 204/255 active=2A,2B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 205/255 active=1A,2A,2B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 206/255 active=1B,2A,2B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 207/255 active=1A,1B,2A,2B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 208/255 active=3A,4A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 209/255 active=1A,3A,4A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 210/255 active=1B,3A,4A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 211/255 active=1A,1B,3A,4A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 212/255 active=2A,3A,4A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 213/255 active=1A,2A,3A,4A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 214/255 active=1B,2A,3A,4A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 215/255 active=1A,1B,2A,3A,4A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 216/255 active=2B,3A,4A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 217/255 active=1A,2B,3A,4A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 218/255 active=1B,2B,3A,4A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 219/255 active=1A,1B,2B,3A,4A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 220/255 active=2A,2B,3A,4A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 221/255 active=1A,2A,2B,3A,4A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 222/255 active=1B,2A,2B,3A,4A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 223/255 active=1A,1B,2A,2B,3A,4A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 0, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 0 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 102.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 224/255 active=3B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 225/255 active=1A,3B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 226/255 active=1B,3B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 227/255 active=1A,1B,3B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 228/255 active=2A,3B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 229/255 active=1A,2A,3B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 230/255 active=1B,2A,3B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 231/255 active=1A,1B,2A,3B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 232/255 active=2B,3B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 233/255 active=1A,2B,3B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 234/255 active=1B,2B,3B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 235/255 active=1A,1B,2B,3B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 236/255 active=2A,2B,3B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 237/255 active=1A,2A,2B,3B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 238/255 active=1B,2A,2B,3B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 239/255 active=1A,1B,2A,2B,3B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 0, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 0 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 102.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 240/255 active=3A,3B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 241/255 active=1A,3A,3B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 242/255 active=1B,3A,3B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 243/255 active=1A,1B,3A,3B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 244/255 active=2A,3A,3B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 245/255 active=1A,2A,3A,3B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 246/255 active=1B,2A,3A,3B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 247/255 active=1A,1B,2A,3A,3B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 0, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 0 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 102.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 248/255 active=2B,3A,3B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 249/255 active=1A,2B,3A,3B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 250/255 active=1B,2B,3A,3B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 251/255 active=1A,1B,2B,3A,3B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 0, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 0 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 102.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 252/255 active=2A,2B,3A,3B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 253/255 active=1A,2A,2B,3A,3B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 0, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 0 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 102.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 254/255 active=1B,2A,2B,3A,3B,4A,4B mode=Type2
J1_01 = 0, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 0 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 102.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#combo 255/255 active=1A,1B,2A,2B,3A,3B,4A,4B mode=Type2
J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1, J1_05 = 1, J1_06 = 1, J1_07 = 1, J1_08 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 1.00 | 0.080 | 0.1
NULL : Input_1A = 1 | 0.1 | 0.1
NULL : Input_1B = 1 | 0.1 | 0.1
NULL : Input_2A = 1 | 0.1 | 0.1
NULL : Input_2B = 1 | 0.1 | 0.1
NULL : Input_3A = 1 | 0.1 | 0.1
NULL : Input_3B = 1 | 0.1 | 0.1
NULL : Input_4A = 1 | 0.1 | 0.1
NULL : Input_4B = 1 | 0.1 | 0.1
NULL : Port_1A = 1.00 | 0.150 | 0.1
NULL : Port_1B = 1.00 | 0.150 | 0.1
NULL : Port_2A = 1.00 | 0.150 | 0.1
NULL : Port_2B = 1.00 | 0.150 | 0.1
NULL : Port_3A = 1.00 | 0.150 | 0.1
NULL : Port_3B = 1.00 | 0.150 | 0.1
NULL : Port_4A = 1.00 | 0.150 | 0.1
NULL : Port_4B = 1.00 | 0.150 | 0.1
#request WheelBrakeLiningRemaining PGN (FEAC)
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
SEND_CAN CH0 0x0CEAFFFF 0 254 172 0 0 0 0 0
NULL : Count1 = 100.0 | 2.0 | 0.1
NULL : Count2 = 100.0 | 2.0 | 0.1
NULL : Count3 = 100.0 | 2.0 | 0.1
NULL : Count4 = 100.0 | 2.0 | 0.1
NULL : Count5 = 100.0 | 2.0 | 0.1
NULL : Count6 = 100.0 | 2.0 | 0.1
NULL : Count7 = 100.0 | 2.0 | 0.1
NULL : Count8 = 100.0 | 2.0 | 0.1

#restore safe state
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
PwrSetVoltage = 0 : NULL : WAIT = 0.2

#cycle IGN to clean slate
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#tear down bench setup
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
PwrSetCurrent = 0 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 0 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1
PwrRemote = 0 : NULL : WAIT = 0.1
J4_03 = 0 : NULL : WAIT = 0.2
SAVE
END
