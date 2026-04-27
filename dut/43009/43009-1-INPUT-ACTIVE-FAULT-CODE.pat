#43009-1
#Version 0.1
#focused Active_Fault_Code validation for input overvoltage
UUT_DBC = 43009-560.dbc
UUT_DATANAME = 43009-1-INPUT-ACTIVE-FAULT-CODE

#cycle IGN to clean slate
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#force command 0 and verify comms are alive
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.5
NULL : Response = 0 | 0.1 | 0.3
NULL : Software_Version = 0 | 255 | 0.3
NULL : Software_Revision = 0 | 255 | 0.3

#-----setup PAT-----
LdRemote = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1

#setup PS1 input path
PwrRemote = 1 : NULL : WAIT = 0.1
PwrSetCurrent = 100 : NULL : WAIT = 0.1
PwrSetVoltage = 10 : NULL : WAIT = 0.1
PwrEnable = 1 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1

#all input routes off before test
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2

#-----Port_1A Active_Fault_Code-----
J1_01 = 1 : NULL : WAIT = 0.1

#normal 1.0V should not report active fault
PwrSetVoltage = 10 : NULL : WAIT = 0.10
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 1.0 | 0.050 | 0.2
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 0 | 0.1 | 0.3

#fault at 5.7V must report Active_Fault_Code=53
PwrSetVoltage = 57 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.7 | 0.050 | 0.2
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 53 | 0.1 | 0.3

#return to 1.0V and verify fault clears
PwrSetVoltage = 10 : NULL : WAIT = 0.40
NULL : MeterVolts = 1.0 | 0.050 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 0 | 0.1 | 0.3

#back to 0V (path off) before switching input
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2

J1_01 = 0 : NULL : WAIT = 0.1

#-----Port_1B Active_Fault_Code-----
J1_02 = 1 : NULL : WAIT = 0.1

#normal 1.0V should not report active fault
PwrSetVoltage = 10 : NULL : WAIT = 0.10
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 1.0 | 0.050 | 0.2
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 0 | 0.1 | 0.3

#fault at 5.7V must report Active_Fault_Code=53
PwrSetVoltage = 57 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.7 | 0.050 | 0.2
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 53 | 0.1 | 0.3

#return to 1.0V and verify fault clears
PwrSetVoltage = 10 : NULL : WAIT = 0.40
NULL : MeterVolts = 1.0 | 0.050 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 0 | 0.1 | 0.3

#back to 0V (path off) before switching input
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2

J1_02 = 0 : NULL : WAIT = 0.1

#-----Port_2A Active_Fault_Code-----
J1_03 = 1 : NULL : WAIT = 0.1

#normal 1.0V should not report active fault
PwrSetVoltage = 10 : NULL : WAIT = 0.10
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 1.0 | 0.050 | 0.2
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 0 | 0.1 | 0.3

#fault at 5.7V must report Active_Fault_Code=53
PwrSetVoltage = 57 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.7 | 0.050 | 0.2
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 53 | 0.1 | 0.3

#return to 1.0V and verify fault clears
PwrSetVoltage = 10 : NULL : WAIT = 0.40
NULL : MeterVolts = 1.0 | 0.050 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 0 | 0.1 | 0.3

#back to 0V (path off) before switching input
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2

J1_03 = 0 : NULL : WAIT = 0.1

#-----Port_2B Active_Fault_Code-----
J1_04 = 1 : NULL : WAIT = 0.1

#normal 1.0V should not report active fault
PwrSetVoltage = 10 : NULL : WAIT = 0.10
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 1.0 | 0.050 | 0.2
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 0 | 0.1 | 0.3

#fault at 5.7V must report Active_Fault_Code=53
PwrSetVoltage = 57 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.7 | 0.050 | 0.2
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 53 | 0.1 | 0.3

#return to 1.0V and verify fault clears
PwrSetVoltage = 10 : NULL : WAIT = 0.40
NULL : MeterVolts = 1.0 | 0.050 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 0 | 0.1 | 0.3

#back to 0V (path off) before switching input
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2

J1_04 = 0 : NULL : WAIT = 0.1

#-----Port_3A Active_Fault_Code-----
J1_05 = 1 : NULL : WAIT = 0.1

#normal 1.0V should not report active fault
PwrSetVoltage = 10 : NULL : WAIT = 0.10
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 1.0 | 0.050 | 0.2
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 0 | 0.1 | 0.3

#fault at 5.7V must report Active_Fault_Code=53
PwrSetVoltage = 57 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.7 | 0.050 | 0.2
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 53 | 0.1 | 0.3

#return to 1.0V and verify fault clears
PwrSetVoltage = 10 : NULL : WAIT = 0.40
NULL : MeterVolts = 1.0 | 0.050 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 0 | 0.1 | 0.3

#back to 0V (path off) before switching input
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2

J1_05 = 0 : NULL : WAIT = 0.1

#-----Port_3B Active_Fault_Code-----
J1_06 = 1 : NULL : WAIT = 0.1

#normal 1.0V should not report active fault
PwrSetVoltage = 10 : NULL : WAIT = 0.10
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 1.0 | 0.050 | 0.2
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 0 | 0.1 | 0.3

#fault at 5.7V must report Active_Fault_Code=53
PwrSetVoltage = 57 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.7 | 0.050 | 0.2
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 53 | 0.1 | 0.3

#return to 1.0V and verify fault clears
PwrSetVoltage = 10 : NULL : WAIT = 0.40
NULL : MeterVolts = 1.0 | 0.050 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 0 | 0.1 | 0.3

#back to 0V (path off) before switching input
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2

J1_06 = 0 : NULL : WAIT = 0.1

#-----Port_4A Active_Fault_Code-----
J1_07 = 1 : NULL : WAIT = 0.1

#normal 1.0V should not report active fault
PwrSetVoltage = 10 : NULL : WAIT = 0.10
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 1.0 | 0.050 | 0.2
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 0 | 0.1 | 0.3

#fault at 5.7V must report Active_Fault_Code=53
PwrSetVoltage = 57 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.7 | 0.050 | 0.2
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 53 | 0.1 | 0.3

#return to 1.0V and verify fault clears
PwrSetVoltage = 10 : NULL : WAIT = 0.40
NULL : MeterVolts = 1.0 | 0.050 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 0 | 0.1 | 0.3

#back to 0V (path off) before switching input
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2

J1_07 = 0 : NULL : WAIT = 0.1

#-----Port_4B Active_Fault_Code-----
J1_08 = 1 : NULL : WAIT = 0.1

#normal 1.0V should not report active fault
PwrSetVoltage = 10 : NULL : WAIT = 0.10
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.20
NULL : MeterVolts = 1.0 | 0.050 | 0.2
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 0 | 0.1 | 0.3

#fault at 5.7V must report Active_Fault_Code=53
PwrSetVoltage = 57 : NULL : WAIT = 0.20
NULL : MeterVolts = 5.7 | 0.050 | 0.2
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 53 | 0.1 | 0.3

#return to 1.0V and verify fault clears
PwrSetVoltage = 10 : NULL : WAIT = 0.40
NULL : MeterVolts = 1.0 | 0.050 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.2
SEND_CAN CH0 0x18EAFFD1 172 254 0 0 0 0 0 0
NULL : Active_Fault_Code = 0 | 0.1 | 0.3

#back to 0V (path off) before switching input
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
NULL : MeterVolts = 0.0 | 0.050 | 0.2

J1_08 = 0 : NULL : WAIT = 0.1

#-----teardown-----
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
PwrSetCurrent = 0 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 0 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.1
PwrRemote = 0 : NULL : WAIT = 0.1
SAVE
END
