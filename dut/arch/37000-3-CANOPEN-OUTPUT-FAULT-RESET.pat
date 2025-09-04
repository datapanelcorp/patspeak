#37000-3
#Verion 0.0
#digital normal test using the E-LOAD
UUT_EDS = 37000-563.eds
UUT_DATANAME = 37000-3-CANOPEN-OUTPUT-FAULT-RESET

PRE_OPERATIONAL
#-----setup PAT-----
#setup load
LdRemote = 1 : NULL
LdEnable = 0 : NULL
LdCurrentSet = 0 : NULL
J0_08_METER_LOAD = 1 : NULL
OPERATIONAL
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
#disable global modes
sdo[0x2000][3] = 0 : NULL
sdo[0x2000][4] = 0 : NULL
#-----set 1A/3A overcurrent-----
sdo[0x2004][1] = 45 : NULL
sdo[0x2004][2] = 45 : NULL
#switch in load line, set current
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][1] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_02 = 1 : NULL
#switch in load line, set current
J2_02 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault clear
NULL : sdo[0x5001][3] = 0 | 0 | 0.01
#turn ON Port_1B
sdo[0x6200][1] = 2 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #1
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_1B
sdo[0x6200][1] = 0 : NULL

#verify fault #1 clear
NULL : sdo[0x5001][3] = 0 | 0 | 0.01
#turn ON Port_1B
sdo[0x6200][1] = 2 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_1B
sdo[0x6200][1] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][3] = 0 | 0 | 0.01
#turn ON Port_1B
sdo[0x6200][1] = 2 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_1B
sdo[0x6200][1] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][3] = 0 | 0 | 0.01
#turn ON Port_1B
sdo[0x6200][1] = 2 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_1B
sdo[0x6200][1] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][3] = 0 | 0 | 0.01
#turn ON Port_1B
sdo[0x6200][1] = 2 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_1B
sdo[0x6200][1] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_02 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][2] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_03 = 1 : NULL
#switch in load line, set current
J2_03 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault clear
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#turn ON Port_2A
sdo[0x6200][1] = 4 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #1
NULL : sdo[0x5001][3] = 40 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_2A
sdo[0x6200][1] = 0 : NULL

#verify fault #1 clear
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#turn ON Port_2A
sdo[0x6200][1] = 4 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][3] = 40 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_2A
sdo[0x6200][1] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#turn ON Port_2A
sdo[0x6200][1] = 4 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][3] = 40 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_2A
sdo[0x6200][1] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#turn ON Port_2A
sdo[0x6200][1] = 4 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][3] = 40 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_2A
sdo[0x6200][1] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][3] = 8 | 0 | 0.01
#turn ON Port_2A
sdo[0x6200][1] = 4 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][3] = 40 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_2A
sdo[0x6200][1] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][3] = 40 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_03 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][2] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_04 = 1 : NULL
#switch in load line, set current
J2_04 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault clear
NULL : sdo[0x5001][3] = 40 | 0 | 0.01
#turn ON Port_2B
sdo[0x6200][1] = 8 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #1
NULL : sdo[0x5001][3] = 168 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_2B
sdo[0x6200][1] = 0 : NULL

#verify fault #1 clear
NULL : sdo[0x5001][3] = 40 | 0 | 0.01
#turn ON Port_2B
sdo[0x6200][1] = 8 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][3] = 168 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_2B
sdo[0x6200][1] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][3] = 40 | 0 | 0.01
#turn ON Port_2B
sdo[0x6200][1] = 8 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][3] = 168 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_2B
sdo[0x6200][1] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][3] = 40 | 0 | 0.01
#turn ON Port_2B
sdo[0x6200][1] = 8 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][3] = 168 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_2B
sdo[0x6200][1] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][3] = 40 | 0 | 0.01
#turn ON Port_2B
sdo[0x6200][1] = 8 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][3] = 168 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_2B
sdo[0x6200][1] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][3] = 168 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_04 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][3] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_06 = 1 : NULL
#switch in load line, set current
J2_06 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault clear
NULL : sdo[0x5001][4] = 0 | 0 | 0.01
#turn ON Port_3B
sdo[0x6200][1] = 32 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #1
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_3B
sdo[0x6200][1] = 0 : NULL

#verify fault #1 clear
NULL : sdo[0x5001][4] = 0 | 0 | 0.01
#turn ON Port_3B
sdo[0x6200][1] = 32 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_3B
sdo[0x6200][1] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][4] = 0 | 0 | 0.01
#turn ON Port_3B
sdo[0x6200][1] = 32 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_3B
sdo[0x6200][1] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][4] = 0 | 0 | 0.01
#turn ON Port_3B
sdo[0x6200][1] = 32 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_3B
sdo[0x6200][1] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][4] = 0 | 0 | 0.01
#turn ON Port_3B
sdo[0x6200][1] = 32 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_3B
sdo[0x6200][1] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_06 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][4] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_07 = 1 : NULL
#switch in load line, set current
J2_07 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault clear
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#turn ON Port_4A
sdo[0x6200][1] = 64 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #1
NULL : sdo[0x5001][4] = 40 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_4A
sdo[0x6200][1] = 0 : NULL

#verify fault #1 clear
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#turn ON Port_4A
sdo[0x6200][1] = 64 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][4] = 40 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_4A
sdo[0x6200][1] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#turn ON Port_4A
sdo[0x6200][1] = 64 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][4] = 40 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_4A
sdo[0x6200][1] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#turn ON Port_4A
sdo[0x6200][1] = 64 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][4] = 40 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_4A
sdo[0x6200][1] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][4] = 8 | 0 | 0.01
#turn ON Port_4A
sdo[0x6200][1] = 64 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][4] = 40 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_4A
sdo[0x6200][1] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][4] = 40 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_07 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][4] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_08 = 1 : NULL
#switch in load line, set current
J2_08 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault clear
NULL : sdo[0x5001][4] = 40 | 0 | 0.01
#turn ON Port_4B
sdo[0x6200][1] = 128 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #1
NULL : sdo[0x5001][4] = 168 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_4B
sdo[0x6200][1] = 0 : NULL

#verify fault #1 clear
NULL : sdo[0x5001][4] = 40 | 0 | 0.01
#turn ON Port_4B
sdo[0x6200][1] = 128 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][4] = 168 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_4B
sdo[0x6200][1] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][4] = 40 | 0 | 0.01
#turn ON Port_4B
sdo[0x6200][1] = 128 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][4] = 168 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_4B
sdo[0x6200][1] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][4] = 40 | 0 | 0.01
#turn ON Port_4B
sdo[0x6200][1] = 128 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][4] = 168 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_4B
sdo[0x6200][1] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][4] = 40 | 0 | 0.01
#turn ON Port_4B
sdo[0x6200][1] = 128 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][4] = 168 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_4B
sdo[0x6200][1] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][4] = 168 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_08 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][5] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_09 = 1 : NULL
#switch in load line, set current
J2_09 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault clear
NULL : sdo[0x5001][5] = 0 | 0 | 0.01
#turn ON Port_5A
sdo[0x6200][2] = 1 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #1
NULL : sdo[0x5001][5] = 2 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_5A
sdo[0x6200][2] = 0 : NULL

#verify fault #1 clear
NULL : sdo[0x5001][5] = 0 | 0 | 0.01
#turn ON Port_5A
sdo[0x6200][2] = 1 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][5] = 2 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_5A
sdo[0x6200][2] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][5] = 0 | 0 | 0.01
#turn ON Port_5A
sdo[0x6200][2] = 1 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][5] = 2 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_5A
sdo[0x6200][2] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][5] = 0 | 0 | 0.01
#turn ON Port_5A
sdo[0x6200][2] = 1 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][5] = 2 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_5A
sdo[0x6200][2] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][5] = 0 | 0 | 0.01
#turn ON Port_5A
sdo[0x6200][2] = 1 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][5] = 2 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_5A
sdo[0x6200][2] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][5] = 2 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J2_09 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][5] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_10 = 1 : NULL
#switch in load line, set current
J2_10 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault clear
NULL : sdo[0x5001][5] = 2 | 0 | 0.01
#turn ON Port_5B
sdo[0x6200][2] = 2 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #1
NULL : sdo[0x5001][5] = 10 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_5B
sdo[0x6200][2] = 0 : NULL

#verify fault #1 clear
NULL : sdo[0x5001][5] = 2 | 0 | 0.01
#turn ON Port_5B
sdo[0x6200][2] = 2 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][5] = 10 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_5B
sdo[0x6200][2] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][5] = 2 | 0 | 0.01
#turn ON Port_5B
sdo[0x6200][2] = 2 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][5] = 10 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_5B
sdo[0x6200][2] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][5] = 2 | 0 | 0.01
#turn ON Port_5B
sdo[0x6200][2] = 2 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][5] = 10 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_5B
sdo[0x6200][2] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][5] = 2 | 0 | 0.01
#turn ON Port_5B
sdo[0x6200][2] = 2 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][5] = 10 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_5B
sdo[0x6200][2] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][5] = 10 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J2_10 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][6] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_11 = 1 : NULL
#switch in load line, set current
J2_11 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault clear
NULL : sdo[0x5001][5] = 10 | 0 | 0.01
#turn ON Port_6A
sdo[0x6200][2] = 4 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #1
NULL : sdo[0x5001][5] = 42 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_6A
sdo[0x6200][2] = 0 : NULL

#verify fault #1 clear
NULL : sdo[0x5001][5] = 10 | 0 | 0.01
#turn ON Port_6A
sdo[0x6200][2] = 4 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][5] = 42 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_6A
sdo[0x6200][2] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][5] = 10 | 0 | 0.01
#turn ON Port_6A
sdo[0x6200][2] = 4 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][5] = 42 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_6A
sdo[0x6200][2] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][5] = 10 | 0 | 0.01
#turn ON Port_6A
sdo[0x6200][2] = 4 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][5] = 42 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_6A
sdo[0x6200][2] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][5] = 10 | 0 | 0.01
#turn ON Port_6A
sdo[0x6200][2] = 4 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][5] = 42 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_6A
sdo[0x6200][2] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][5] = 42 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J2_11 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][6] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J2_12 = 1 : NULL
#switch in load line, set current
J2_12 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault clear
NULL : sdo[0x5001][5] = 42 | 0 | 0.01
#turn ON Port_6B
sdo[0x6200][2] = 8 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #1
NULL : sdo[0x5001][5] = 170 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_6B
sdo[0x6200][2] = 0 : NULL

#verify fault #1 clear
NULL : sdo[0x5001][5] = 42 | 0 | 0.01
#turn ON Port_6B
sdo[0x6200][2] = 8 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][5] = 170 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_6B
sdo[0x6200][2] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][5] = 42 | 0 | 0.01
#turn ON Port_6B
sdo[0x6200][2] = 8 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][5] = 170 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_6B
sdo[0x6200][2] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][5] = 42 | 0 | 0.01
#turn ON Port_6B
sdo[0x6200][2] = 8 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][5] = 170 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_6B
sdo[0x6200][2] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][5] = 42 | 0 | 0.01
#turn ON Port_6B
sdo[0x6200][2] = 8 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][5] = 170 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_6B
sdo[0x6200][2] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][5] = 170 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J2_12 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][7] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J3_01 = 1 : NULL
#switch in load line, set current
J3_01 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault clear
NULL : sdo[0x5001][6] = 0 | 0 | 0.01
#turn ON Port_7A
sdo[0x6200][2] = 16 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #1
NULL : sdo[0x5001][6] = 2 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_7A
sdo[0x6200][2] = 0 : NULL

#verify fault #1 clear
NULL : sdo[0x5001][6] = 0 | 0 | 0.01
#turn ON Port_7A
sdo[0x6200][2] = 16 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][6] = 2 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_7A
sdo[0x6200][2] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][6] = 0 | 0 | 0.01
#turn ON Port_7A
sdo[0x6200][2] = 16 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][6] = 2 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_7A
sdo[0x6200][2] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][6] = 0 | 0 | 0.01
#turn ON Port_7A
sdo[0x6200][2] = 16 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][6] = 2 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_7A
sdo[0x6200][2] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][6] = 0 | 0 | 0.01
#turn ON Port_7A
sdo[0x6200][2] = 16 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][6] = 2 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_7A
sdo[0x6200][2] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][6] = 2 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J3_01 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][7] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J3_02 = 1 : NULL
#switch in load line, set current
J3_02 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault clear
NULL : sdo[0x5001][6] = 2 | 0 | 0.01
#turn ON Port_7B
sdo[0x6200][2] = 32 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #1
NULL : sdo[0x5001][6] = 10 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_7B
sdo[0x6200][2] = 0 : NULL

#verify fault #1 clear
NULL : sdo[0x5001][6] = 2 | 0 | 0.01
#turn ON Port_7B
sdo[0x6200][2] = 32 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][6] = 10 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_7B
sdo[0x6200][2] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][6] = 2 | 0 | 0.01
#turn ON Port_7B
sdo[0x6200][2] = 32 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][6] = 10 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_7B
sdo[0x6200][2] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][6] = 2 | 0 | 0.01
#turn ON Port_7B
sdo[0x6200][2] = 32 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][6] = 10 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_7B
sdo[0x6200][2] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][6] = 2 | 0 | 0.01
#turn ON Port_7B
sdo[0x6200][2] = 32 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][6] = 10 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_7B
sdo[0x6200][2] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][6] = 10 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J3_02 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][8] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J3_03 = 1 : NULL
#switch in load line, set current
J3_03 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault clear
NULL : sdo[0x5001][6] = 10 | 0 | 0.01
#turn ON Port_8A
sdo[0x6200][2] = 64 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #1
NULL : sdo[0x5001][6] = 42 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_8A
sdo[0x6200][2] = 0 : NULL

#verify fault #1 clear
NULL : sdo[0x5001][6] = 10 | 0 | 0.01
#turn ON Port_8A
sdo[0x6200][2] = 64 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][6] = 42 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_8A
sdo[0x6200][2] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][6] = 10 | 0 | 0.01
#turn ON Port_8A
sdo[0x6200][2] = 64 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][6] = 42 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_8A
sdo[0x6200][2] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][6] = 10 | 0 | 0.01
#turn ON Port_8A
sdo[0x6200][2] = 64 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][6] = 42 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_8A
sdo[0x6200][2] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][6] = 10 | 0 | 0.01
#turn ON Port_8A
sdo[0x6200][2] = 64 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][6] = 42 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_8A
sdo[0x6200][2] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][6] = 42 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J3_03 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
sdo[0x2001][8] = 17 : NULL
sdo[0x2000][1] = 1 : NULL
#switch in load line, set current
J3_04 = 1 : NULL
#switch in load line, set current
J3_04 = 1 : NULL
LdCurrentSet = 5000: NULL
LdEnable = 0 : NULL


#verify fault clear
NULL : sdo[0x5001][6] = 42 | 0 | 0.01
#turn ON Port_8B
sdo[0x6200][2] = 128 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #1
NULL : sdo[0x5001][6] = 170 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_8B
sdo[0x6200][2] = 0 : NULL

#verify fault #1 clear
NULL : sdo[0x5001][6] = 42 | 0 | 0.01
#turn ON Port_8B
sdo[0x6200][2] = 128 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #2
NULL : sdo[0x5001][6] = 170 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_8B
sdo[0x6200][2] = 0 : NULL

#verify fault #2 clear
NULL : sdo[0x5001][6] = 42 | 0 | 0.01
#turn ON Port_8B
sdo[0x6200][2] = 128 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #3
NULL : sdo[0x5001][6] = 170 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_8B
sdo[0x6200][2] = 0 : NULL

#verify fault #3 clear
NULL : sdo[0x5001][6] = 42 | 0 | 0.01
#turn ON Port_8B
sdo[0x6200][2] = 128 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #4
NULL : sdo[0x5001][6] = 170 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_8B
sdo[0x6200][2] = 0 : NULL

#verify fault #4 clear
NULL : sdo[0x5001][6] = 42 | 0 | 0.01
#turn ON Port_8B
sdo[0x6200][2] = 128 : NULL
#enable load
LdEnable = 1 : NULL
#verify fault #5
NULL : sdo[0x5001][6] = 170 | 0 | 0.01
#disable load
LdEnable = 0 : NULL
#turn OFF Port_8B
sdo[0x6200][2] = 0 : NULL

#verify fault #5 sticks
NULL : sdo[0x5001][6] = 170 | 0 | 0.01
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J3_04 = 0 : NULL
LdCurrentSet = 0 : NULL
NULL : sdo[0x5001][3] = 168 | 0 | 0.001
NULL : sdo[0x5001][4] = 168 | 0 | 0.001
NULL : sdo[0x5001][5] = 170 | 0 | 0.001
NULL : sdo[0x5001][6] = 170 | 0 | 0.001
LdRemote = 0 : NULL
LdEnable = 0 : NULL
J0_08_METER_LOAD = 0 : NULL
PRE_OPERATIONAL
SAVE
END
