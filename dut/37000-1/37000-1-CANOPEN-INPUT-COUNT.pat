#37000-1
#Verion 0.0
#input test
UUT_EDS = 37000-561.eds
UUT_DATANAME = 37000-1-CANOPEN-INPUT-COUNT

#-----setup 37000-----
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

OPERATIONAL
#****** NO OVERFLOW, SET POINT = 5, MAX COUNT = 5, OUTPUT INTERLOCK
#7A/3A
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1

#configure Port Modes
sdo[0x2001][1] = 51 : NULL : WAIT = 0.1
sdo[0x2001][2] = 51 : NULL : WAIT = 0.1
sdo[0x2001][3] = 51 : NULL : WAIT = 0.1
sdo[0x2001][4] = 51 : NULL : WAIT = 0.1
sdo[0x2001][5] = 8 : NULL : WAIT = 0.1
sdo[0x2001][6] = 8 : NULL : WAIT = 0.1
sdo[0x2001][7] = 8 : NULL : WAIT = 0.1
sdo[0x2001][8] = 8 : NULL : WAIT = 0.1

#config InterlockMode
#config counter
sdo[0x2003][1] = 69 : NULL : WAIT = 0.1

#config SetPointValue
sdo[0x3001][1] = 5 : NULL : WAIT = 0.1

#verify setpoint
NULL : sdo[0x6401][10] = 5 | 0 | 0.1
#switch in and on interlock output
J2_05 = 1 : NULL : WAIT = 0.2
sdo[0x6411][5] = 1000 : NULL : WAIT = 0.2
#verify voltage
NULL : MeterVolts = 14 | 1 | 0.1
#switch out interlock output
J2_05 = 0 : NULL : WAIT = 0.2
#switch in test supply
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#switch in input
J3_01 = 1 : NULL : WAIT = 0.2

#testing count events
PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 5
NULL : sdo[0x6401][9] = 1 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 5
NULL : sdo[0x6401][9] = 2 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 5
NULL : sdo[0x6401][9] = 3 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 5
NULL : sdo[0x6401][9] = 4 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 5
NULL : sdo[0x6401][9] = 5 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1
#verify output status at setpoint
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
J3_01 = 0 : NULL : WAIT = 0.2
J2_05 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 0 | 1 | 0.1
J2_05 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
J3_01 = 1 : NULL : WAIT = 0.2

PwrSetVoltage = 140 : NULL
#verify count WITHOUT RolloverMode 1 - 5
NULL : sdo[0x6401][9] = 5 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

#switch out input
J3_01 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#turn off output and switch out is off
sdo[0x6411][5] = 0 : NULL : WAIT = 0.2
#verify count WITHOUT RolloverMode 2 - 5
NULL : sdo[0x6401][9] = 5 | 0 | 0.1
#send counter reset
sdo[0x2003][1] = 4 : NULL : WAIT = 0.1
#verify count reset
NULL : sdo[0x6401][9] = 0 | 0 | 0.1

sdo[0x3001][1] = 0 : NULL : WAIT = 0.1
#8A/3A
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1

#configure Port Modes
sdo[0x2001][1] = 51 : NULL : WAIT = 0.1
sdo[0x2001][2] = 51 : NULL : WAIT = 0.1
sdo[0x2001][3] = 51 : NULL : WAIT = 0.1
sdo[0x2001][4] = 51 : NULL : WAIT = 0.1
sdo[0x2001][5] = 8 : NULL : WAIT = 0.1
sdo[0x2001][6] = 8 : NULL : WAIT = 0.1
sdo[0x2001][7] = 8 : NULL : WAIT = 0.1
sdo[0x2001][8] = 8 : NULL : WAIT = 0.1

#config InterlockMode
#config counter
sdo[0x2003][2] = 69 : NULL : WAIT = 0.1

#config SetPointValue
sdo[0x3001][2] = 5 : NULL : WAIT = 0.1

#verify setpoint
NULL : sdo[0x6401][12] = 5 | 0 | 0.1
#switch in and on interlock output
J2_07 = 1 : NULL : WAIT = 0.2
sdo[0x6411][7] = 1000 : NULL : WAIT = 0.2
#verify voltage
NULL : MeterVolts = 14 | 1 | 0.1
#switch out interlock output
J2_07 = 0 : NULL : WAIT = 0.2
#switch in test supply
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#switch in input
J3_03 = 1 : NULL : WAIT = 0.2

#testing count events
PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 5
NULL : sdo[0x6401][11] = 1 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 5
NULL : sdo[0x6401][11] = 2 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 5
NULL : sdo[0x6401][11] = 3 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 5
NULL : sdo[0x6401][11] = 4 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 5
NULL : sdo[0x6401][11] = 5 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1
#verify output status at setpoint
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
J3_03 = 0 : NULL : WAIT = 0.2
J2_07 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 0 | 1 | 0.1
J2_07 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
J3_03 = 1 : NULL : WAIT = 0.2

PwrSetVoltage = 140 : NULL
#verify count WITHOUT RolloverMode 1 - 5
NULL : sdo[0x6401][11] = 5 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

#switch out input
J3_03 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#turn off output and switch out is off
sdo[0x6411][7] = 0 : NULL : WAIT = 0.2
#verify count WITHOUT RolloverMode 2 - 5
NULL : sdo[0x6401][11] = 5 | 0 | 0.1
#send counter reset
sdo[0x2003][2] = 4 : NULL : WAIT = 0.1
#verify count reset
NULL : sdo[0x6401][11] = 0 | 0 | 0.1

sdo[0x3001][2] = 0 : NULL : WAIT = 0.1
#switch out load line
J3_03 = 0 : NULL : WAIT = 0.1
#****** OVERFLOW, SET POINT = 3, MAX COUNT = 5, NO OUTPUT INTERLOCK
#7A/3A
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1

#configure Port Modes
sdo[0x2001][1] = 51 : NULL : WAIT = 0.1
sdo[0x2001][2] = 51 : NULL : WAIT = 0.1
sdo[0x2001][3] = 51 : NULL : WAIT = 0.1
sdo[0x2001][4] = 51 : NULL : WAIT = 0.1
sdo[0x2001][5] = 8 : NULL : WAIT = 0.1
sdo[0x2001][6] = 8 : NULL : WAIT = 0.1
sdo[0x2001][7] = 8 : NULL : WAIT = 0.1
sdo[0x2001][8] = 8 : NULL : WAIT = 0.1

#config RolloverMode
#config counter
sdo[0x2003][1] = 21 : NULL : WAIT = 0.1

#config SetPointValue
sdo[0x3001][1] = 3 : NULL : WAIT = 0.1

#verify setpoint
NULL : sdo[0x6401][10] = 3 | 0 | 0.1
#switch in and on interlock output
J2_05 = 1 : NULL : WAIT = 0.2
sdo[0x6411][5] = 1000 : NULL : WAIT = 0.2
#verify voltage
NULL : MeterVolts = 14 | 1 | 0.1
#switch out interlock output
J2_05 = 0 : NULL : WAIT = 0.2
#switch in test supply
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#switch in input
J3_01 = 1 : NULL : WAIT = 0.2

#testing count events
PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 3
NULL : sdo[0x6401][9] = 1 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 3
NULL : sdo[0x6401][9] = 2 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 3
NULL : sdo[0x6401][9] = 3 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1
#verify output status at setpoint
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
J3_01 = 0 : NULL : WAIT = 0.2
J2_05 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 14 | 1 | 0.1
J2_05 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
J3_01 = 1 : NULL : WAIT = 0.2

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 3
NULL : sdo[0x6401][9] = 4 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 3
NULL : sdo[0x6401][9] = 5 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 3
NULL : sdo[0x6401][9] = 6 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

#switch out input
J3_01 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#turn off output and switch out is off
sdo[0x6411][5] = 0 : NULL : WAIT = 0.2
#verify count WITH RolloverMode 2 - 3
NULL : sdo[0x6401][9] = 6 | 0 | 0.1
#send counter reset
sdo[0x2003][1] = 4 : NULL : WAIT = 0.1
#verify count reset
NULL : sdo[0x6401][9] = 0 | 0 | 0.1

sdo[0x3001][1] = 0 : NULL : WAIT = 0.1
#8A/3A
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1

#configure Port Modes
sdo[0x2001][1] = 51 : NULL : WAIT = 0.1
sdo[0x2001][2] = 51 : NULL : WAIT = 0.1
sdo[0x2001][3] = 51 : NULL : WAIT = 0.1
sdo[0x2001][4] = 51 : NULL : WAIT = 0.1
sdo[0x2001][5] = 8 : NULL : WAIT = 0.1
sdo[0x2001][6] = 8 : NULL : WAIT = 0.1
sdo[0x2001][7] = 8 : NULL : WAIT = 0.1
sdo[0x2001][8] = 8 : NULL : WAIT = 0.1

#config RolloverMode
#config counter
sdo[0x2003][2] = 21 : NULL : WAIT = 0.1

#config SetPointValue
sdo[0x3001][2] = 3 : NULL : WAIT = 0.1

#verify setpoint
NULL : sdo[0x6401][12] = 3 | 0 | 0.1
#switch in and on interlock output
J2_07 = 1 : NULL : WAIT = 0.2
sdo[0x6411][7] = 1000 : NULL : WAIT = 0.2
#verify voltage
NULL : MeterVolts = 14 | 1 | 0.1
#switch out interlock output
J2_07 = 0 : NULL : WAIT = 0.2
#switch in test supply
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#switch in input
J3_03 = 1 : NULL : WAIT = 0.2

#testing count events
PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 3
NULL : sdo[0x6401][11] = 1 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 3
NULL : sdo[0x6401][11] = 2 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 3
NULL : sdo[0x6401][11] = 3 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1
#verify output status at setpoint
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
J3_03 = 0 : NULL : WAIT = 0.2
J2_07 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 14 | 1 | 0.1
J2_07 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
J3_03 = 1 : NULL : WAIT = 0.2

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 3
NULL : sdo[0x6401][11] = 4 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 3
NULL : sdo[0x6401][11] = 5 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 3
NULL : sdo[0x6401][11] = 6 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

#switch out input
J3_03 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#turn off output and switch out is off
sdo[0x6411][7] = 0 : NULL : WAIT = 0.2
#verify count WITH RolloverMode 2 - 3
NULL : sdo[0x6401][11] = 6 | 0 | 0.1
#send counter reset
sdo[0x2003][2] = 4 : NULL : WAIT = 0.1
#verify count reset
NULL : sdo[0x6401][11] = 0 | 0 | 0.1

sdo[0x3001][2] = 0 : NULL : WAIT = 0.1
#switch out load line
J3_03 = 0 : NULL : WAIT = 0.1
#****** OVERFLOW, SET POINT = 3, MAX COUNT = 5, OUTPUT INTERLOCK
#7A/3A
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1

#configure Port Modes
sdo[0x2001][1] = 51 : NULL : WAIT = 0.1
sdo[0x2001][2] = 51 : NULL : WAIT = 0.1
sdo[0x2001][3] = 51 : NULL : WAIT = 0.1
sdo[0x2001][4] = 51 : NULL : WAIT = 0.1
sdo[0x2001][5] = 8 : NULL : WAIT = 0.1
sdo[0x2001][6] = 8 : NULL : WAIT = 0.1
sdo[0x2001][7] = 8 : NULL : WAIT = 0.1
sdo[0x2001][8] = 8 : NULL : WAIT = 0.1

#config RolloverMode
#config InterlockMode
#config counter
sdo[0x2003][1] = 85 : NULL : WAIT = 0.1

#config SetPointValue
sdo[0x3001][1] = 2 : NULL : WAIT = 0.1

#verify setpoint
NULL : sdo[0x6401][10] = 2 | 0 | 0.1
#switch in and on interlock output
J2_05 = 1 : NULL : WAIT = 0.2
sdo[0x6411][5] = 1000 : NULL : WAIT = 0.2
#verify voltage
NULL : MeterVolts = 14 | 1 | 0.1
#switch out interlock output
J2_05 = 0 : NULL : WAIT = 0.2
#switch in test supply
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#switch in input
J3_01 = 1 : NULL : WAIT = 0.2

#testing count events
PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 2
NULL : sdo[0x6401][9] = 1 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 2
NULL : sdo[0x6401][9] = 2 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1
#verify output status at setpoint
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
J3_01 = 0 : NULL : WAIT = 0.2
J2_05 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 0 | 1 | 0.1
J2_05 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
J3_01 = 1 : NULL : WAIT = 0.2

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 2
NULL : sdo[0x6401][9] = 3 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 2
NULL : sdo[0x6401][9] = 4 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 2
NULL : sdo[0x6401][9] = 5 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 2
NULL : sdo[0x6401][9] = 6 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

#switch out input
J3_01 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#turn off output and switch out is off
sdo[0x6411][5] = 0 : NULL : WAIT = 0.2
#verify count WITH RolloverMode 2 - 2
NULL : sdo[0x6401][9] = 6 | 0 | 0.1
#send counter reset
sdo[0x2003][1] = 4 : NULL : WAIT = 0.1
#verify count reset
NULL : sdo[0x6401][9] = 0 | 0 | 0.1

sdo[0x3001][1] = 0 : NULL : WAIT = 0.1
#8A/3A
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1

#configure Port Modes
sdo[0x2001][1] = 51 : NULL : WAIT = 0.1
sdo[0x2001][2] = 51 : NULL : WAIT = 0.1
sdo[0x2001][3] = 51 : NULL : WAIT = 0.1
sdo[0x2001][4] = 51 : NULL : WAIT = 0.1
sdo[0x2001][5] = 8 : NULL : WAIT = 0.1
sdo[0x2001][6] = 8 : NULL : WAIT = 0.1
sdo[0x2001][7] = 8 : NULL : WAIT = 0.1
sdo[0x2001][8] = 8 : NULL : WAIT = 0.1

#config RolloverMode
#config InterlockMode
#config counter
sdo[0x2003][2] = 85 : NULL : WAIT = 0.1

#config SetPointValue
sdo[0x3001][2] = 2 : NULL : WAIT = 0.1

#verify setpoint
NULL : sdo[0x6401][12] = 2 | 0 | 0.1
#switch in and on interlock output
J2_07 = 1 : NULL : WAIT = 0.2
sdo[0x6411][7] = 1000 : NULL : WAIT = 0.2
#verify voltage
NULL : MeterVolts = 14 | 1 | 0.1
#switch out interlock output
J2_07 = 0 : NULL : WAIT = 0.2
#switch in test supply
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#switch in input
J3_03 = 1 : NULL : WAIT = 0.2

#testing count events
PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 2
NULL : sdo[0x6401][11] = 1 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 2
NULL : sdo[0x6401][11] = 2 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1
#verify output status at setpoint
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
J3_03 = 0 : NULL : WAIT = 0.2
J2_07 = 1 : NULL : WAIT = 0.2
NULL : MeterVolts = 0 | 1 | 0.1
J2_07 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
J3_03 = 1 : NULL : WAIT = 0.2

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 2
NULL : sdo[0x6401][11] = 3 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 2
NULL : sdo[0x6401][11] = 4 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 2
NULL : sdo[0x6401][11] = 5 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count WITH RolloverMode 1 - 2
NULL : sdo[0x6401][11] = 6 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

#switch out input
J3_03 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#turn off output and switch out is off
sdo[0x6411][7] = 0 : NULL : WAIT = 0.2
#verify count WITH RolloverMode 2 - 2
NULL : sdo[0x6401][11] = 6 | 0 | 0.1
#send counter reset
sdo[0x2003][2] = 4 : NULL : WAIT = 0.1
#verify count reset
NULL : sdo[0x6401][11] = 0 | 0 | 0.1

sdo[0x3001][2] = 0 : NULL : WAIT = 0.1
#switch out load line
J3_03 = 0 : NULL : WAIT = 0.1
#****** OVERFLOW, SET POINT = 0, MAX COUNT = 5, NO OUTPUT INTERLOCK
#7A/3A
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1

#configure Port Modes
sdo[0x2001][1] = 51 : NULL : WAIT = 0.1
sdo[0x2001][2] = 51 : NULL : WAIT = 0.1
sdo[0x2001][3] = 51 : NULL : WAIT = 0.1
sdo[0x2001][4] = 51 : NULL : WAIT = 0.1
sdo[0x2001][5] = 8 : NULL : WAIT = 0.1
sdo[0x2001][6] = 8 : NULL : WAIT = 0.1
sdo[0x2001][7] = 8 : NULL : WAIT = 0.1
sdo[0x2001][8] = 8 : NULL : WAIT = 0.1

#config RolloverMode
#config counter
sdo[0x2003][1] = 21 : NULL : WAIT = 0.1

#config SetPointValue
sdo[0x3001][1] = 0 : NULL : WAIT = 0.1

#verify setpoint
NULL : sdo[0x6401][10] = 0 | 0 | 0.1
#switch in and on interlock output
J2_05 = 1 : NULL : WAIT = 0.2
sdo[0x6411][5] = 1000 : NULL : WAIT = 0.2
#verify voltage
NULL : MeterVolts = 14 | 1 | 0.1
#switch out interlock output
J2_05 = 0 : NULL : WAIT = 0.2
#switch in test supply
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#switch in input
J3_01 = 1 : NULL : WAIT = 0.2

#testing count events
PwrSetVoltage = 140 : NULL
#verify count - 0
NULL : sdo[0x6401][9] = 1 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count - 0
NULL : sdo[0x6401][9] = 2 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count - 0
NULL : sdo[0x6401][9] = 3 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count - 0
NULL : sdo[0x6401][9] = 4 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count - 0
NULL : sdo[0x6401][9] = 5 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count - 0
NULL : sdo[0x6401][9] = 6 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

#switch out input
J3_01 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#turn off output and switch out is off
sdo[0x6411][5] = 0 : NULL : WAIT = 0.2
#verify count WITH RolloverMode 2 - 0
NULL : sdo[0x6401][9] = 6 | 0 | 0.1
#send counter reset
sdo[0x2003][1] = 4 : NULL : WAIT = 0.1
#verify count reset
NULL : sdo[0x6401][9] = 0 | 0 | 0.1

sdo[0x3001][1] = 0 : NULL : WAIT = 0.1
#8A/3A
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1

#configure Port Modes
sdo[0x2001][1] = 51 : NULL : WAIT = 0.1
sdo[0x2001][2] = 51 : NULL : WAIT = 0.1
sdo[0x2001][3] = 51 : NULL : WAIT = 0.1
sdo[0x2001][4] = 51 : NULL : WAIT = 0.1
sdo[0x2001][5] = 8 : NULL : WAIT = 0.1
sdo[0x2001][6] = 8 : NULL : WAIT = 0.1
sdo[0x2001][7] = 8 : NULL : WAIT = 0.1
sdo[0x2001][8] = 8 : NULL : WAIT = 0.1

#config RolloverMode
#config counter
sdo[0x2003][2] = 21 : NULL : WAIT = 0.1

#config SetPointValue
sdo[0x3001][2] = 0 : NULL : WAIT = 0.1

#verify setpoint
NULL : sdo[0x6401][12] = 0 | 0 | 0.1
#switch in and on interlock output
J2_07 = 1 : NULL : WAIT = 0.2
sdo[0x6411][7] = 1000 : NULL : WAIT = 0.2
#verify voltage
NULL : MeterVolts = 14 | 1 | 0.1
#switch out interlock output
J2_07 = 0 : NULL : WAIT = 0.2
#switch in test supply
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#switch in input
J3_03 = 1 : NULL : WAIT = 0.2

#testing count events
PwrSetVoltage = 140 : NULL
#verify count - 0
NULL : sdo[0x6401][11] = 1 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count - 0
NULL : sdo[0x6401][11] = 2 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count - 0
NULL : sdo[0x6401][11] = 3 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count - 0
NULL : sdo[0x6401][11] = 4 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count - 0
NULL : sdo[0x6401][11] = 5 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

PwrSetVoltage = 140 : NULL
#verify count - 0
NULL : sdo[0x6401][11] = 6 | 0 | 0.1
PwrSetVoltage = 0 : NULL
NULL : sdo[0x6000][1] = 0 | 0 | 0.1

#switch out input
J3_03 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#turn off output and switch out is off
sdo[0x6411][7] = 0 : NULL : WAIT = 0.2
#verify count WITH RolloverMode 2 - 0
NULL : sdo[0x6401][11] = 6 | 0 | 0.1
#send counter reset
sdo[0x2003][2] = 4 : NULL : WAIT = 0.1
#verify count reset
NULL : sdo[0x6401][11] = 0 | 0 | 0.1

sdo[0x3001][2] = 0 : NULL : WAIT = 0.1
#switch out load line
J3_03 = 0 : NULL : WAIT = 0.1
#****** MAX COUNT
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1

#configure Port Modes
sdo[0x2001][1] = 51 : NULL : WAIT = 0.1
sdo[0x2001][2] = 51 : NULL : WAIT = 0.1
sdo[0x2001][3] = 51 : NULL : WAIT = 0.1
sdo[0x2001][4] = 51 : NULL : WAIT = 0.1
sdo[0x2001][5] = 8 : NULL : WAIT = 0.1
sdo[0x2001][6] = 8 : NULL : WAIT = 0.1
sdo[0x2001][7] = 8 : NULL : WAIT = 0.1
sdo[0x2001][8] = 8 : NULL : WAIT = 0.1


#config counter
sdo[0x2003][1] = 69 : NULL : WAIT = 0.1

#config SetPointValue - 65535
sdo[0x3001][1] = 65535 : NULL : WAIT = 0.1
#verify setpoint - 65535
NULL : sdo[0x6401][10] = -1 | 0 | 0.1
#switch in and on interlock output
J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2
J2_05 = 1 : NULL : WAIT = 0.2
sdo[0x6411][5] = 1000 : NULL : WAIT = 0.2
#verify voltage
NULL : MeterVolts = 14 | 1 | 0.1
#switch out interlock output
J2_05 = 0 : NULL : WAIT = 0.2
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.2
#switch in test supply
#switch in input
J3_01 = 1 : NULL : WAIT = 0.2


#-----setup pat-----
#setup freq
J0_11_FREQ_GEN = 1 : NULL : WAIT = 1

#testing max count
#wait for signal gen to max count
NULL : NULL : WAIT = 20
NULL : sdo[0x5001][4] = 0 | 0 | 0.4

#switch out input
J3_01 = 0 : NULL : WAIT = 0.2
J0_11_FREQ_GEN = 0 : NULL : WAIT = 1
#turn off output and switch out is off
sdo[0x6411][5] = 0 : NULL : WAIT = 0.2
#disable counter
sdo[0x2003][1] = 1 : NULL : WAIT = 0.2
#verify count
NULL : sdo[0x6401][9] = -1 | 0 | 0.1
#send counter reset
sdo[0x2003][1] = 4 : NULL : WAIT = 0.2
#verify count reset
NULL : sdo[0x6401][9] = 0 | 0 | 0.1

sdo[0x3001][1] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1

#configure Port Modes
sdo[0x2001][1] = 51 : NULL : WAIT = 0.1
sdo[0x2001][2] = 51 : NULL : WAIT = 0.1
sdo[0x2001][3] = 51 : NULL : WAIT = 0.1
sdo[0x2001][4] = 51 : NULL : WAIT = 0.1
sdo[0x2001][5] = 8 : NULL : WAIT = 0.1
sdo[0x2001][6] = 8 : NULL : WAIT = 0.1
sdo[0x2001][7] = 8 : NULL : WAIT = 0.1
sdo[0x2001][8] = 8 : NULL : WAIT = 0.1


#config counter
sdo[0x2003][2] = 69 : NULL : WAIT = 0.1

#config SetPointValue - 65535
sdo[0x3001][2] = 65535 : NULL : WAIT = 0.1
#verify setpoint - 65535
NULL : sdo[0x6401][12] = -1 | 0 | 0.1
#switch in and on interlock output
J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2
J2_07 = 1 : NULL : WAIT = 0.2
sdo[0x6411][7] = 1000 : NULL : WAIT = 0.2
#verify voltage
NULL : MeterVolts = 14 | 1 | 0.1
#switch out interlock output
J2_07 = 0 : NULL : WAIT = 0.2
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.2
#switch in test supply
#switch in input
J3_03 = 1 : NULL : WAIT = 0.2


#-----setup pat-----
#setup freq
J0_11_FREQ_GEN = 1 : NULL : WAIT = 1

#testing max count
#wait for signal gen to max count
NULL : NULL : WAIT = 20
NULL : sdo[0x5001][4] = 0 | 0 | 0.4

#switch out input
J3_03 = 0 : NULL : WAIT = 0.2
J0_11_FREQ_GEN = 0 : NULL : WAIT = 1
#turn off output and switch out is off
sdo[0x6411][7] = 0 : NULL : WAIT = 0.2
#disable counter
sdo[0x2003][2] = 1 : NULL : WAIT = 0.2
#verify count
NULL : sdo[0x6401][11] = -1 | 0 | 0.1
#send counter reset
sdo[0x2003][2] = 4 : NULL : WAIT = 0.2
#verify count reset
NULL : sdo[0x6401][11] = 0 | 0 | 0.1

sdo[0x3001][2] = 0 : NULL : WAIT = 0.1
#switch out load line
J3_03 = 0 : NULL : WAIT = 0.1
#switch out power supply
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
PRE_OPERATIONAL
SAVE
END
