#34044-1
#Verion 0.0
#input test
UUT_EDS = 37000-561.eds
UUT_DATANAME = TEST-INPUT-ADC


#-----setup pat-----
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
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1

J4_03 = 1 : NULL : WAIT = 0.2
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][5] = 96 : NULL : WAIT = 0.1
sdo[0x2001][6] = 96 : NULL : WAIT = 0.1
sdo[0x2001][7] = 96 : NULL : WAIT = 0.1
sdo[0x2001][8] = 96 : NULL : WAIT = 0.1
#verify fault clear
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
#set power supply and wait
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31 | 0.155 | 0.1
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1

#Sweep of Input_5B from 31 to 32 in 0.5 increments

#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 31000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 31500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 32000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 32500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 33000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 33500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 34000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 34500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 35000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 35500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 36000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 0 | 0.1 | 0.1
NULL : sdo[0x1001] = 1 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 0 | 0.1 | 0.1
NULL : sdo[0x1001] = 1 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 1 | 0.1 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.1

PAUSE- CYCLE POWER TO CLEAR FAULT
#switch out load line, set current
J2_10 = 0 : NULL : WAIT = 0.1
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
#tear down PS1
PwrSetCurrent = 0 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 0 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1
PwrRemote = 0 : NULL : WAIT = 0.1
J4_03 = 0 : NULL : WAIT = 0.2
SAVE
END
