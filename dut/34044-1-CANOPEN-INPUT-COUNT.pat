#34044-1
#Verion 0.0
#input test
UUT_EDS = 37000-561.eds
UUT_DATANAME = 34044-1-CANOPEN-INPUT-COUNT

#-----setup 34044-----
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
#****** OVERFLOW, SET POINT = 3, MAX COUNT = 5, NO OUTPUT INTERLOCK
#****** OVERFLOW, SET POINT = 3, MAX COUNT = 5, OUTPUT INTERLOCK
#****** OVERFLOW, SET POINT = 0, MAX COUNT = 5, NO OUTPUT INTERLOCK
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
NULL : sdo[0x6401][10] = 65535 | 0 | 0.1
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
NULL : sdo[0x6401][9] = 65535 | 0 | 0.1
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
NULL : sdo[0x6401][12] = 65535 | 0 | 0.1
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
NULL : sdo[0x6401][11] = 65535 | 0 | 0.1
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
