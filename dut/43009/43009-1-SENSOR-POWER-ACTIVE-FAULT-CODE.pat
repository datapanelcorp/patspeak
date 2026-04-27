#43009-1
#Version 0.2
#focused sensor-power Active_Fault_Code validation (command-0 only)
UUT_DBC = 43009-560.dbc
UUT_DATANAME = 43009-1-SENSOR-POWER-ACTIVE-FAULT-CODE

#cycle IGN to clean slate
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#force command 0 and verify comms
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.5
NULL : Response = 0 | 0.1 | 0.3
NULL : Software_Version = 0 | 255 | 0.3
NULL : Software_Revision = 0 | 255 | 0.3

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

#all sensor-rail routes off before test
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.2

#-----SPWR1 Active_Fault_Code-----
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1
J2_02 = 1 : NULL : WAIT = 0.2
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : MeterVolts = 5.00 | 0.300 | 0.2

#force hard short to trigger output fault family
LdCurrentSet = 200 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.50
NULL : MeterVolts = 0.00 | 0.300 | 0.1
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
NULL : Active_Fault_Code = 51.5 | 0.6 | 0.3

#remove short/load before clearing fault
LdEnable = 0 : NULL : WAIT = 0.2
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1

#clear by power-cycling K1 (keeps this test command-0 only)
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.5
NULL : Response = 0 | 0.1 | 0.3
NULL : Active_Fault_Code = 0 | 0.1 | 0.3
NULL : MeterVolts = 5.00 | 0.300 | 0.2

J2_02 = 0 : NULL : WAIT = 0.1

#-----SPWR2 Active_Fault_Code-----
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1
J2_04 = 1 : NULL : WAIT = 0.2
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : MeterVolts = 5.00 | 0.300 | 0.2

#force hard short to trigger output fault family
LdCurrentSet = 200 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.50
NULL : MeterVolts = 0.00 | 0.300 | 0.1
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
NULL : Active_Fault_Code = 51.5 | 0.6 | 0.3

#remove short/load before clearing fault
LdEnable = 0 : NULL : WAIT = 0.2
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1

#clear by power-cycling K1 (keeps this test command-0 only)
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.5
NULL : Response = 0 | 0.1 | 0.3
NULL : Active_Fault_Code = 0 | 0.1 | 0.3
NULL : MeterVolts = 5.00 | 0.300 | 0.2

J2_04 = 0 : NULL : WAIT = 0.1

#-----SPWR3 Active_Fault_Code-----
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1
J2_06 = 1 : NULL : WAIT = 0.2
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : MeterVolts = 5.00 | 0.300 | 0.2

#force hard short to trigger output fault family
LdCurrentSet = 200 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.50
NULL : MeterVolts = 0.00 | 0.300 | 0.1
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
NULL : Active_Fault_Code = 51.5 | 0.6 | 0.3

#remove short/load before clearing fault
LdEnable = 0 : NULL : WAIT = 0.2
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1

#clear by power-cycling K1 (keeps this test command-0 only)
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.5
NULL : Response = 0 | 0.1 | 0.3
NULL : Active_Fault_Code = 0 | 0.1 | 0.3
NULL : MeterVolts = 5.00 | 0.300 | 0.2

J2_06 = 0 : NULL : WAIT = 0.1

#-----SPWR4 Active_Fault_Code-----
J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1
J2_08 = 1 : NULL : WAIT = 0.2
LdEnable = 0 : NULL : WAIT = 0.1
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
NULL : MeterVolts = 5.00 | 0.300 | 0.2

#force hard short to trigger output fault family
LdCurrentSet = 200 : NULL : WAIT = 0.1
LdShort = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.50
NULL : MeterVolts = 0.00 | 0.300 | 0.1
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
NULL : Active_Fault_Code = 51.5 | 0.6 | 0.3

#remove short/load before clearing fault
LdEnable = 0 : NULL : WAIT = 0.2
LdShort = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1

#clear by power-cycling K1 (keeps this test command-0 only)
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.5
NULL : Response = 0 | 0.1 | 0.3
NULL : Active_Fault_Code = 0 | 0.1 | 0.3
NULL : MeterVolts = 5.00 | 0.300 | 0.2

J2_08 = 0 : NULL : WAIT = 0.1

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
