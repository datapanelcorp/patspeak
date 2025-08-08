#37000-1
#Verion 0.0
#input test
UUT_EDS = 37000-561.eds
UUT_DATANAME = 37000-1-CANOPEN-INPUT-RATIO-14_5


#-----setup pat-----
#setup meter
LdRemote = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1


#-----setup main supply-----
#setup meter
J0_10_MAIN_SUPPLY = 1 : NULL : WAIT = 1
PAUSE-VERIFY MAIN SUPPLY IS SET TO 14.5
NULL : MeterVolts = 14.5 | 0.2 | 0.1
J0_10_MAIN_SUPPLY = 0 : NULL : WAIT = 1

#setup PS1
PwrRemote = 1 : NULL : WAIT = 0.1
PwrSetCurrent = 20 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 1 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1

J4_03 = 1 : NULL : WAIT = 0.2
#-----setup 34044-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 144 : NULL : WAIT = 0.1
sdo[0x2001][6] = 144 : NULL : WAIT = 0.1
sdo[0x2001][7] = 144 : NULL : WAIT = 0.1
sdo[0x2001][8] = 144 : NULL : WAIT = 0.1
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Input_5B from 1 to 14.5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 68 | 100 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 103 | 100 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 137 | 100 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 172 | 100 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 206 | 100 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 241 | 100 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 275 | 100 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 310 | 100 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 344 | 100 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 379 | 100 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 413 | 100 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 448 | 100 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 482 | 100 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 517 | 100 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 551 | 100 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 586 | 100 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 620 | 100 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 655 | 100 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 689 | 100 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 724 | 100 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 758 | 100 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 793 | 100 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 827 | 100 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 862 | 100 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 896 | 100 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 931 | 100 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 965 | 100 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][2] = 1000 | 100 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.1

#-----setup 34044-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 144 : NULL : WAIT = 0.1
sdo[0x2001][6] = 144 : NULL : WAIT = 0.1
sdo[0x2001][7] = 144 : NULL : WAIT = 0.1
sdo[0x2001][8] = 144 : NULL : WAIT = 0.1
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J2_12 = 1 : NULL : WAIT = 0.1


#Sweep of Input_6B from 1 to 14.5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 68 | 100 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 103 | 100 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 137 | 100 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 172 | 100 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 206 | 100 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 241 | 100 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 275 | 100 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 310 | 100 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 344 | 100 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 379 | 100 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 413 | 100 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 448 | 100 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 482 | 100 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 517 | 100 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 551 | 100 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 586 | 100 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 620 | 100 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 655 | 100 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 689 | 100 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 724 | 100 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 758 | 100 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 793 | 100 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 827 | 100 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 862 | 100 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 896 | 100 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 931 | 100 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 965 | 100 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][4] = 1000 | 100 | 0.1

#Finished with port
#switch out input
J2_12 = 0 : NULL : WAIT = 0.1

#-----setup 34044-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 144 : NULL : WAIT = 0.1
sdo[0x2001][6] = 144 : NULL : WAIT = 0.1
sdo[0x2001][7] = 144 : NULL : WAIT = 0.1
sdo[0x2001][8] = 144 : NULL : WAIT = 0.1
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J3_02 = 1 : NULL : WAIT = 0.1


#Sweep of Input_7B from 1 to 14.5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 68 | 100 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 103 | 100 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 137 | 100 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 172 | 100 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 206 | 100 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 241 | 100 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 275 | 100 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 310 | 100 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 344 | 100 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 379 | 100 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 413 | 100 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 448 | 100 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 482 | 100 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 517 | 100 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 551 | 100 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 586 | 100 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 620 | 100 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 655 | 100 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 689 | 100 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 724 | 100 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 758 | 100 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 793 | 100 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 827 | 100 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 862 | 100 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 896 | 100 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 931 | 100 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 965 | 100 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][6] = 1000 | 100 | 0.1

#Finished with port
#switch out input
J3_02 = 0 : NULL : WAIT = 0.1

#-----setup 34044-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 144 : NULL : WAIT = 0.1
sdo[0x2001][6] = 144 : NULL : WAIT = 0.1
sdo[0x2001][7] = 144 : NULL : WAIT = 0.1
sdo[0x2001][8] = 144 : NULL : WAIT = 0.1
#set power supply and wait
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#switch input to load line
J3_04 = 1 : NULL : WAIT = 0.1


#Sweep of Input_8B from 1 to 14.5 in 0.5 increments

#set power supply
PwrSetVoltage = 10 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 68 | 100 | 0.1
#set power supply
PwrSetVoltage = 15 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 1.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 103 | 100 | 0.1
#set power supply
PwrSetVoltage = 20 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 137 | 100 | 0.1
#set power supply
PwrSetVoltage = 25 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 2.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 172 | 100 | 0.1
#set power supply
PwrSetVoltage = 30 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 206 | 100 | 0.1
#set power supply
PwrSetVoltage = 35 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 3.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 241 | 100 | 0.1
#set power supply
PwrSetVoltage = 40 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 275 | 100 | 0.1
#set power supply
PwrSetVoltage = 45 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 4.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 310 | 100 | 0.1
#set power supply
PwrSetVoltage = 50 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 344 | 100 | 0.1
#set power supply
PwrSetVoltage = 55 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 5.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 379 | 100 | 0.1
#set power supply
PwrSetVoltage = 60 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 413 | 100 | 0.1
#set power supply
PwrSetVoltage = 65 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 6.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 448 | 100 | 0.1
#set power supply
PwrSetVoltage = 70 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 482 | 100 | 0.1
#set power supply
PwrSetVoltage = 75 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 7.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 517 | 100 | 0.1
#set power supply
PwrSetVoltage = 80 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 551 | 100 | 0.1
#set power supply
PwrSetVoltage = 85 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 8.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 586 | 100 | 0.1
#set power supply
PwrSetVoltage = 90 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 620 | 100 | 0.1
#set power supply
PwrSetVoltage = 95 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 9.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 655 | 100 | 0.1
#set power supply
PwrSetVoltage = 100 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 689 | 100 | 0.1
#set power supply
PwrSetVoltage = 105 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 10.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 724 | 100 | 0.1
#set power supply
PwrSetVoltage = 110 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 758 | 100 | 0.1
#set power supply
PwrSetVoltage = 115 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 11.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 793 | 100 | 0.1
#set power supply
PwrSetVoltage = 120 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 827 | 100 | 0.1
#set power supply
PwrSetVoltage = 125 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 12.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 862 | 100 | 0.1
#set power supply
PwrSetVoltage = 130 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 896 | 100 | 0.1
#set power supply
PwrSetVoltage = 135 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 13.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 931 | 100 | 0.1
#set power supply
PwrSetVoltage = 140 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.0 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 965 | 100 | 0.1
#set power supply
PwrSetVoltage = 145 : NULL : WAIT = 0.1
#test power supply
NULL : MeterVolts = 14.5 | 0.155 | 0.1
#test feedback
NULL : sdo[0x6401][8] = 1000 | 100 | 0.1

#Finished with port
#switch out input
J3_04 = 0 : NULL : WAIT = 0.1

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
