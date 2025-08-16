#37000-1
#Verion 0.0
#input test
UUT_EDS = 37000-561.eds
UUT_DATANAME = 37000-1-CANOPEN-INPUT-420MA

#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
#switch in 420ma gen
J4_01 = 1 : NULL : WAIT = 0.2
#promp user
PAUSE- SET GEN TO 5.0ma
#-----setup 37000-1-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 48 : NULL : WAIT = 0.1
sdo[0x2001][6] = 48 : NULL : WAIT = 0.1
sdo[0x2001][7] = 48 : NULL : WAIT = 0.1
sdo[0x2001][8] = 48 : NULL : WAIT = 0.1
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Input_5B from 5000 to 20000 in 5000 increments

#test ammmeter
#test feedback
NULL : sdo[0x6401][2] = 5000 | 155 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.2

#-----setup 37000-1-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 48 : NULL : WAIT = 0.1
sdo[0x2001][6] = 48 : NULL : WAIT = 0.1
sdo[0x2001][7] = 48 : NULL : WAIT = 0.1
sdo[0x2001][8] = 48 : NULL : WAIT = 0.1
#switch input to load line
J2_12 = 1 : NULL : WAIT = 0.1


#Sweep of Input_6B from 5000 to 20000 in 5000 increments

#test ammmeter
#test feedback
NULL : sdo[0x6401][4] = 5000 | 155 | 0.1

#Finished with port
#switch out input
J2_12 = 0 : NULL : WAIT = 0.2

#-----setup 37000-1-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 48 : NULL : WAIT = 0.1
sdo[0x2001][6] = 48 : NULL : WAIT = 0.1
sdo[0x2001][7] = 48 : NULL : WAIT = 0.1
sdo[0x2001][8] = 48 : NULL : WAIT = 0.1
#switch input to load line
J3_02 = 1 : NULL : WAIT = 0.1


#Sweep of Input_7B from 5000 to 20000 in 5000 increments

#test ammmeter
#test feedback
NULL : sdo[0x6401][6] = 5000 | 155 | 0.1

#Finished with port
#switch out input
J3_02 = 0 : NULL : WAIT = 0.2

#-----setup 37000-1-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 48 : NULL : WAIT = 0.1
sdo[0x2001][6] = 48 : NULL : WAIT = 0.1
sdo[0x2001][7] = 48 : NULL : WAIT = 0.1
sdo[0x2001][8] = 48 : NULL : WAIT = 0.1
#switch input to load line
J3_04 = 1 : NULL : WAIT = 0.1


#Sweep of Input_8B from 5000 to 20000 in 5000 increments

#test ammmeter
#test feedback
NULL : sdo[0x6401][8] = 5000 | 155 | 0.1

#Finished with port
#switch out input
J3_04 = 0 : NULL : WAIT = 0.2

#promp user
PAUSE- SET GEN TO 10.0ma
#-----setup 37000-1-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 48 : NULL : WAIT = 0.1
sdo[0x2001][6] = 48 : NULL : WAIT = 0.1
sdo[0x2001][7] = 48 : NULL : WAIT = 0.1
sdo[0x2001][8] = 48 : NULL : WAIT = 0.1
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Input_5B from 5000 to 20000 in 5000 increments

#test ammmeter
#test feedback
NULL : sdo[0x6401][2] = 10000 | 155 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.2

#-----setup 37000-1-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 48 : NULL : WAIT = 0.1
sdo[0x2001][6] = 48 : NULL : WAIT = 0.1
sdo[0x2001][7] = 48 : NULL : WAIT = 0.1
sdo[0x2001][8] = 48 : NULL : WAIT = 0.1
#switch input to load line
J2_12 = 1 : NULL : WAIT = 0.1


#Sweep of Input_6B from 5000 to 20000 in 5000 increments

#test ammmeter
#test feedback
NULL : sdo[0x6401][4] = 10000 | 155 | 0.1

#Finished with port
#switch out input
J2_12 = 0 : NULL : WAIT = 0.2

#-----setup 37000-1-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 48 : NULL : WAIT = 0.1
sdo[0x2001][6] = 48 : NULL : WAIT = 0.1
sdo[0x2001][7] = 48 : NULL : WAIT = 0.1
sdo[0x2001][8] = 48 : NULL : WAIT = 0.1
#switch input to load line
J3_02 = 1 : NULL : WAIT = 0.1


#Sweep of Input_7B from 5000 to 20000 in 5000 increments

#test ammmeter
#test feedback
NULL : sdo[0x6401][6] = 10000 | 155 | 0.1

#Finished with port
#switch out input
J3_02 = 0 : NULL : WAIT = 0.2

#-----setup 37000-1-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 48 : NULL : WAIT = 0.1
sdo[0x2001][6] = 48 : NULL : WAIT = 0.1
sdo[0x2001][7] = 48 : NULL : WAIT = 0.1
sdo[0x2001][8] = 48 : NULL : WAIT = 0.1
#switch input to load line
J3_04 = 1 : NULL : WAIT = 0.1


#Sweep of Input_8B from 5000 to 20000 in 5000 increments

#test ammmeter
#test feedback
NULL : sdo[0x6401][8] = 10000 | 155 | 0.1

#Finished with port
#switch out input
J3_04 = 0 : NULL : WAIT = 0.2

#promp user
PAUSE- SET GEN TO 15.0ma
#-----setup 37000-1-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 48 : NULL : WAIT = 0.1
sdo[0x2001][6] = 48 : NULL : WAIT = 0.1
sdo[0x2001][7] = 48 : NULL : WAIT = 0.1
sdo[0x2001][8] = 48 : NULL : WAIT = 0.1
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Input_5B from 5000 to 20000 in 5000 increments

#test ammmeter
#test feedback
NULL : sdo[0x6401][2] = 15000 | 155 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.2

#-----setup 37000-1-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 48 : NULL : WAIT = 0.1
sdo[0x2001][6] = 48 : NULL : WAIT = 0.1
sdo[0x2001][7] = 48 : NULL : WAIT = 0.1
sdo[0x2001][8] = 48 : NULL : WAIT = 0.1
#switch input to load line
J2_12 = 1 : NULL : WAIT = 0.1


#Sweep of Input_6B from 5000 to 20000 in 5000 increments

#test ammmeter
#test feedback
NULL : sdo[0x6401][4] = 15000 | 155 | 0.1

#Finished with port
#switch out input
J2_12 = 0 : NULL : WAIT = 0.2

#-----setup 37000-1-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 48 : NULL : WAIT = 0.1
sdo[0x2001][6] = 48 : NULL : WAIT = 0.1
sdo[0x2001][7] = 48 : NULL : WAIT = 0.1
sdo[0x2001][8] = 48 : NULL : WAIT = 0.1
#switch input to load line
J3_02 = 1 : NULL : WAIT = 0.1


#Sweep of Input_7B from 5000 to 20000 in 5000 increments

#test ammmeter
#test feedback
NULL : sdo[0x6401][6] = 15000 | 155 | 0.1

#Finished with port
#switch out input
J3_02 = 0 : NULL : WAIT = 0.2

#-----setup 37000-1-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 48 : NULL : WAIT = 0.1
sdo[0x2001][6] = 48 : NULL : WAIT = 0.1
sdo[0x2001][7] = 48 : NULL : WAIT = 0.1
sdo[0x2001][8] = 48 : NULL : WAIT = 0.1
#switch input to load line
J3_04 = 1 : NULL : WAIT = 0.1


#Sweep of Input_8B from 5000 to 20000 in 5000 increments

#test ammmeter
#test feedback
NULL : sdo[0x6401][8] = 15000 | 155 | 0.1

#Finished with port
#switch out input
J3_04 = 0 : NULL : WAIT = 0.2

#promp user
PAUSE- SET GEN TO 20.0ma
#-----setup 37000-1-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 48 : NULL : WAIT = 0.1
sdo[0x2001][6] = 48 : NULL : WAIT = 0.1
sdo[0x2001][7] = 48 : NULL : WAIT = 0.1
sdo[0x2001][8] = 48 : NULL : WAIT = 0.1
#switch input to load line
J2_10 = 1 : NULL : WAIT = 0.1


#Sweep of Input_5B from 5000 to 20000 in 5000 increments

#test ammmeter
#test feedback
NULL : sdo[0x6401][2] = 20000 | 155 | 0.1

#Finished with port
#switch out input
J2_10 = 0 : NULL : WAIT = 0.2

#-----setup 37000-1-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 48 : NULL : WAIT = 0.1
sdo[0x2001][6] = 48 : NULL : WAIT = 0.1
sdo[0x2001][7] = 48 : NULL : WAIT = 0.1
sdo[0x2001][8] = 48 : NULL : WAIT = 0.1
#switch input to load line
J2_12 = 1 : NULL : WAIT = 0.1


#Sweep of Input_6B from 5000 to 20000 in 5000 increments

#test ammmeter
#test feedback
NULL : sdo[0x6401][4] = 20000 | 155 | 0.1

#Finished with port
#switch out input
J2_12 = 0 : NULL : WAIT = 0.2

#-----setup 37000-1-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 48 : NULL : WAIT = 0.1
sdo[0x2001][6] = 48 : NULL : WAIT = 0.1
sdo[0x2001][7] = 48 : NULL : WAIT = 0.1
sdo[0x2001][8] = 48 : NULL : WAIT = 0.1
#switch input to load line
J3_02 = 1 : NULL : WAIT = 0.1


#Sweep of Input_7B from 5000 to 20000 in 5000 increments

#test ammmeter
#test feedback
NULL : sdo[0x6401][6] = 20000 | 155 | 0.1

#Finished with port
#switch out input
J3_02 = 0 : NULL : WAIT = 0.2

#-----setup 37000-1-----
#disable global modes
sdo[0x2000][3] = 0 : NULL : WAIT = 0.1
sdo[0x2000][4] = 0 : NULL : WAIT = 0.1
#configure Port Modes
sdo[0x2001][1] = 0 : NULL : WAIT = 0.1
sdo[0x2001][2] = 0 : NULL : WAIT = 0.1
sdo[0x2001][3] = 0 : NULL : WAIT = 0.1
sdo[0x2001][4] = 0 : NULL : WAIT = 0.1
sdo[0x2001][5] = 48 : NULL : WAIT = 0.1
sdo[0x2001][6] = 48 : NULL : WAIT = 0.1
sdo[0x2001][7] = 48 : NULL : WAIT = 0.1
sdo[0x2001][8] = 48 : NULL : WAIT = 0.1
#switch input to load line
J3_04 = 1 : NULL : WAIT = 0.1


#Sweep of Input_8B from 5000 to 20000 in 5000 increments

#test ammmeter
#test feedback
NULL : sdo[0x6401][8] = 20000 | 155 | 0.1

#Finished with port
#switch out input
J3_04 = 0 : NULL : WAIT = 0.2


#Finished with mode
#switch out load line
J3_04 = 0 : NULL : WAIT = 0.1
#switch out 420ma gen
J4_01 = 0 : NULL : WAIT = 0.2
SAVE
END
