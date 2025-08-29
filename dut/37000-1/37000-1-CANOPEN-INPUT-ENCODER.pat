#37000-1
#Verion 0.0
#input test
UUT_EDS = 37000-561.eds
UUT_DATANAME = 37000-1-CANOPEN-INPUT-ENCODER

#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
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

#-----setup 34044-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 0 : NULL : WAIT = 0.1
sdo[0x2001][6] = 0 : NULL : WAIT = 0.1
sdo[0x2001][7] = 170 : NULL : WAIT = 0.1
sdo[0x2001][8] = 170 : NULL : WAIT = 0.1

sdo[0x2003][1] = 5 : NULL : WAIT = 0.1
sdo[0x2003][2] = 5 : NULL : WAIT = 0.1
sdo[0x3001][1] = 0 : NULL : WAIT = 0.1
sdo[0x3001][2] = 0 : NULL : WAIT = 0.1

J4_03 = 1 : NULL : WAIT = 0.1
#switch in test supply
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2

PwrSetVoltage = 145 : NULL
#testing encoder foward
PwrEnable = 1 : NULL : WAIT = 0.2
J3_01 = 1 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = 0 | 0 | 0.1
J3_03 = 1 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = 1 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = 2 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = 3 | 0 | 0.1
PwrEnable = 0 : NULL : WAIT = 0.2

PwrEnable = 1 : NULL : WAIT = 0.2
J3_01 = 1 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = 4 | 0 | 0.1
J3_03 = 1 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = 5 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = 6 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = 7 | 0 | 0.1
PwrEnable = 0 : NULL : WAIT = 0.2

#testing encoder reverse
PwrEnable = 1 : NULL : WAIT = 0.2
J3_03 = 1 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = 6 | 0 | 0.1
J3_01 = 1 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = 5 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = 4 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = 3 | 0 | 0.1
PwrEnable = 0 : NULL : WAIT = 0.2

PwrEnable = 1 : NULL : WAIT = 0.2
J3_03 = 1 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = 2 | 0 | 0.1
J3_01 = 1 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = 1 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = 0 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = -1 | 0 | 0.1
PwrEnable = 0 : NULL : WAIT = 0.2

#testing encoder reverse rollover
PwrEnable = 1 : NULL : WAIT = 0.2
J3_03 = 1 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = -2 | 0 | 0.1
J3_01 = 1 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = -3 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = -4 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = -5 | 0 | 0.1
PwrEnable = 0 : NULL : WAIT = 0.2

PwrEnable = 1 : NULL : WAIT = 0.2
J3_03 = 1 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = -6 | 0 | 0.1
J3_01 = 1 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = -7 | 0 | 0.1
J3_03 = 0 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = -8 | 0 | 0.1
J3_01 = 0 : NULL : WAIT = 0.2
NULL : sdo[0x6401][9] = -9 | 0 | 0.1
PwrEnable = 0 : NULL : WAIT = 0.2

#switch out input
J3_01 = 0 : NULL : WAIT = 0.2
J3_03 = 0 : NULL : WAIT = 0.2
J4_03 = 0 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#disable counter
sdo[0x2003][1] = 1 : NULL : WAIT = 0.1
#verify count
NULL : sdo[0x6401][9] = -9 | 0 | 0.1
#send counter reset
sdo[0x2003][1] = 4 : NULL : WAIT = 0.1
#verify count reset
NULL : sdo[0x6401][9] = 0 | 0 | 0.1

#switch out load line
J3_01 = 0, J3_03 = 0 : NULL : WAIT = 0.1
#switch out power supply
LdRemote = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
SAVE
END
