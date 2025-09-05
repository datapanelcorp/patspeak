#37000-1
#Verion 0.0
#input test
UUT_EDS = 37000-561.eds
UUT_DATANAME = 37000-1-CANOPEN-INPUT-ADC


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
#cycle IGN to clear any faults
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 0.2
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][5] = 64 : NULL : WAIT = 0.1
sdo[0x2001][6] = 64 : NULL : WAIT = 0.1
sdo[0x2001][7] = 64 : NULL : WAIT = 0.1
sdo[0x2001][8] = 64 : NULL : WAIT = 0.1
#verify fault clear
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1

#Sweep of Input_5B from 1 to 5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 1000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 1500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 2000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 2500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 3000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 3500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 4000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 4500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 5000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 5500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 0 | 0.1 | 0.1
NULL : sdo[0x1001] = 1 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 1 | 0.1 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.1

#cycle IGN to clear any faults
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 0.2
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][5] = 64 : NULL : WAIT = 0.1
sdo[0x2001][6] = 64 : NULL : WAIT = 0.1
sdo[0x2001][7] = 64 : NULL : WAIT = 0.1
sdo[0x2001][8] = 64 : NULL : WAIT = 0.1
#verify fault clear
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_12 = 1 : NULL : WAIT = 0.1

#Sweep of Input_6B from 1 to 5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 1000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 1500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 2000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 2500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 3000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 3500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 4000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 4500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 5000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 5500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 0 | 0.1 | 0.1
NULL : sdo[0x1001] = 1 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 1 | 0.1 | 0.1

#Finished with port
#switch out input
J2_12 = 0 : NULL : WAIT = 0.1

#cycle IGN to clear any faults
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 0.2
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][5] = 64 : NULL : WAIT = 0.1
sdo[0x2001][6] = 64 : NULL : WAIT = 0.1
sdo[0x2001][7] = 64 : NULL : WAIT = 0.1
sdo[0x2001][8] = 64 : NULL : WAIT = 0.1
#verify fault clear
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J3_02 = 1 : NULL : WAIT = 0.1

#Sweep of Input_7B from 1 to 5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 1000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 1500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 2000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 2500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 3000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 3500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 4000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 4500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 5000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 5500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 0 | 0.1 | 0.1
NULL : sdo[0x1001] = 1 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 1 | 0.1 | 0.1

#Finished with port
#switch out input
J3_02 = 0 : NULL : WAIT = 0.1

#cycle IGN to clear any faults
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 0.2
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][5] = 64 : NULL : WAIT = 0.1
sdo[0x2001][6] = 64 : NULL : WAIT = 0.1
sdo[0x2001][7] = 64 : NULL : WAIT = 0.1
sdo[0x2001][8] = 64 : NULL : WAIT = 0.1
#verify fault clear
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J3_04 = 1 : NULL : WAIT = 0.1

#Sweep of Input_8B from 1 to 5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 1000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 1500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 2000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 2500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 3000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 3500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 4000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 4500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 5000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 5500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 0 | 0.1 | 0.1
NULL : sdo[0x1001] = 1 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 1 | 0.1 | 0.1

#Finished with port
#switch out input
J3_04 = 0 : NULL : WAIT = 0.1


#Finished with mode
#cycle IGN to clear any faults
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 0.2
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][5] = 80 : NULL : WAIT = 0.1
sdo[0x2001][6] = 80 : NULL : WAIT = 0.1
sdo[0x2001][7] = 80 : NULL : WAIT = 0.1
sdo[0x2001][8] = 80 : NULL : WAIT = 0.1
#verify fault clear
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1

#Sweep of Input_5B from 1 to 10 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 1000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 1500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 2000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 2500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 3000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 3500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 4000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 4500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 5000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 5500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 6000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 6500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 7000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 7500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 8000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 8500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 9000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 9500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 10000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 10500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 11000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 0 | 0.1 | 0.1
NULL : sdo[0x1001] = 1 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 1 | 0.1 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.1

#cycle IGN to clear any faults
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 0.2
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][5] = 80 : NULL : WAIT = 0.1
sdo[0x2001][6] = 80 : NULL : WAIT = 0.1
sdo[0x2001][7] = 80 : NULL : WAIT = 0.1
sdo[0x2001][8] = 80 : NULL : WAIT = 0.1
#verify fault clear
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_12 = 1 : NULL : WAIT = 0.1

#Sweep of Input_6B from 1 to 10 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 1000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 1500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 2000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 2500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 3000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 3500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 4000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 4500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 5000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 5500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 6000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 6500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 7000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 7500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 8000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 8500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 9000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 9500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 10000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 10500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 11000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 0 | 0.1 | 0.1
NULL : sdo[0x1001] = 1 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 1 | 0.1 | 0.1

#Finished with port
#switch out input
J2_12 = 0 : NULL : WAIT = 0.1

#cycle IGN to clear any faults
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 0.2
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][5] = 80 : NULL : WAIT = 0.1
sdo[0x2001][6] = 80 : NULL : WAIT = 0.1
sdo[0x2001][7] = 80 : NULL : WAIT = 0.1
sdo[0x2001][8] = 80 : NULL : WAIT = 0.1
#verify fault clear
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J3_02 = 1 : NULL : WAIT = 0.1

#Sweep of Input_7B from 1 to 10 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 1000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 1500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 2000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 2500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 3000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 3500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 4000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 4500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 5000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 5500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 6000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 6500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 7000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 7500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 8000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 8500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 9000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 9500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 10000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 10500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 11000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 0 | 0.1 | 0.1
NULL : sdo[0x1001] = 1 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 1 | 0.1 | 0.1

#Finished with port
#switch out input
J3_02 = 0 : NULL : WAIT = 0.1

#cycle IGN to clear any faults
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 0.2
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][5] = 80 : NULL : WAIT = 0.1
sdo[0x2001][6] = 80 : NULL : WAIT = 0.1
sdo[0x2001][7] = 80 : NULL : WAIT = 0.1
sdo[0x2001][8] = 80 : NULL : WAIT = 0.1
#verify fault clear
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J3_04 = 1 : NULL : WAIT = 0.1

#Sweep of Input_8B from 1 to 10 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 1000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 1500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 2000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 2500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 3000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 3500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 4000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 4500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 5000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 5500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 6000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 6500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 7000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 7500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 8000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 8500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 9000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 9500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 10000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 10500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 11000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 0 | 0.1 | 0.1
NULL : sdo[0x1001] = 1 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 1 | 0.1 | 0.1

#Finished with port
#switch out input
J3_04 = 0 : NULL : WAIT = 0.1


#Finished with mode
#cycle IGN to clear any faults
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 0.2
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
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1

#Sweep of Input_5B from 1 to 32 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 1000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 1500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 2000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 2500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 3000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 3500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 4000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 4500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 5000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 5500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 6000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 6500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 7000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 7500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 8000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 8500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 9000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 9500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 10000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 10500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 11000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 11500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 12000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 12500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 13000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 13500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 14000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 14500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 15000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 15500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 16000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 16500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 17000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 17500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 18000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 18500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 19000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 19500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 20000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 20500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 21000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 21500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 22000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 22500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 23000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 23500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 24000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 24500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 25000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 25500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 26000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 26500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 27000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 27500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 28000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 28500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 29000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 29500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 30000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 30500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
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

#cycle IGN to clear any faults
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 0.2
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
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_12 = 1 : NULL : WAIT = 0.1

#Sweep of Input_6B from 1 to 32 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 1000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 1500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 2000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 2500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 3000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 3500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 4000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 4500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 5000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 5500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 6000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 6500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 7000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 7500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 8000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 8500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 9000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 9500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 10000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 10500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 11000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 11500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 12000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 12500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 13000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 13500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 14000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 14500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 15000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 15500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 16000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 16500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 17000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 17500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 18000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 18500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 19000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 19500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 20000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 20500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 21000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 21500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 22000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 22500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 23000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 23500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 24000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 24500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 25000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 25500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 26000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 26500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 27000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 27500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 28000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 28500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 29000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 29500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 30000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 30500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 31000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 31500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 32000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 32500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 33000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 33500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 34000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 34500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 35000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 35500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 36000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 0 | 0.1 | 0.1
NULL : sdo[0x1001] = 1 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 0 | 0.1 | 0.1
NULL : sdo[0x1001] = 1 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 1 | 0.1 | 0.1

#Finished with port
#switch out input
J2_12 = 0 : NULL : WAIT = 0.1

#cycle IGN to clear any faults
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 0.2
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
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J3_02 = 1 : NULL : WAIT = 0.1

#Sweep of Input_7B from 1 to 32 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 1000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 1500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 2000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 2500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 3000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 3500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 4000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 4500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 5000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 5500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 6000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 6500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 7000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 7500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 8000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 8500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 9000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 9500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 10000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 10500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 11000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 11500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 12000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 12500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 13000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 13500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 14000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 14500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 15000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 15500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 16000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 16500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 17000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 17500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 18000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 18500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 19000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 19500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 20000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 20500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 21000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 21500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 22000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 22500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 23000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 23500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 24000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 24500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 25000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 25500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 26000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 26500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 27000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 27500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 28000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 28500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 29000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 29500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 30000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 30500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 31000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 31500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 32000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 32500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 33000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 33500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 34000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 34500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 35000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 35500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 36000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 0 | 0.1 | 0.1
NULL : sdo[0x1001] = 1 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 0 | 0.1 | 0.1
NULL : sdo[0x1001] = 1 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 1 | 0.1 | 0.1

#Finished with port
#switch out input
J3_02 = 0 : NULL : WAIT = 0.1

#cycle IGN to clear any faults
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 0.2
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
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J3_04 = 1 : NULL : WAIT = 0.1

#Sweep of Input_8B from 1 to 32 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 1000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 1500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 2000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 2500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 3000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 3500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 4000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 4500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 5000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 5500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 6000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 6500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 7000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 7500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 8000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 8500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 9000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 9500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 10000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 10500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 11000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 11500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 12000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 12500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 13000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 13500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 14000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 14500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 150 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 15000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 155 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 15.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 15500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 160 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 16000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 165 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 16.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 16500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 170 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 17000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 175 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 17.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 17500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 180 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 18000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 185 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 18.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 18500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 190 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 19000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 195 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 19.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 19500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 200 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 20000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 205 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 20.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 20500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 210 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 21000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 215 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 21.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 21500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 220 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 22000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 225 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 22.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 22500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 230 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 23000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 235 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 23.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 23500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 240 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 24000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 245 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 24.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 24500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 250 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 25000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 255 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 25.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 25500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 260 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 26000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 265 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 26.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 26500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 270 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 27000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 275 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 27.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 27500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 280 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 28000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 285 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 28.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 28500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 290 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 29000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 295 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 29.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 29500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 300 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 30000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 305 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 30.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 30500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 310 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 31000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 315 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 31.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 31500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 320 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 32000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 325 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 32.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 32500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 330 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 33000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 335 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 33.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 33500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 340 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 34000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 345 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 34.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 34500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 350 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 35000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 355 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 35.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 35500 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 360 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 36000 | 155 | 0.1
NULL : sdo[0x1001] = 0 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 0 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 365 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 0 | 0.1 | 0.1
NULL : sdo[0x1001] = 1 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 1 | 0.1 | 0.1
#set power supply
PwrSetVoltage = 366 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 36.6 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 0 | 0.1 | 0.1
NULL : sdo[0x1001] = 1 | 0.1 | 0.1
NULL : sdo[0x1003][0] = 1 | 0.1 | 0.1

#Finished with port
#switch out input
J3_04 = 0 : NULL : WAIT = 0.1


#Finished with mode
#switch out load line, set current
J3_04 = 0 : NULL : WAIT = 0.1
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
