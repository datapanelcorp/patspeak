#37000-3
#Verion 0.0
#digital normal test using the E-LOAD
UUT_EDS = 37000-563.eds
UUT_DATANAME = 37000-3-CANOPEN-OUTPUT-BANK-TEST

PRE_OPERATIONAL
#-----setup PAT-----
#setup load
LdRemote = 1 : NULL
LdEnable = 0 : NULL
LdCurrentSet = 0 : NULL
J0_08_METER_LOAD = 1 : NULL
OPERATIONAL
#-----setup 34044-----
sdo[0x2000][1] = 1, sdo[0x2000][2] = 0 : NULL
#disable global modes
sdo[0x2000][3] = 0 : NULL
sdo[0x2000][4] = 0 : NULL
#-----set 1A/3A overcurrent-----
#switch in load line, set current
sdo[0x2001][1] = 17 : NULL
#switch in load line, set current
J2_01 = 1 : NULL
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5500: NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5


#turn ON Output1A
sdo[0x6200][1] = 1 : NULL
#enable load
LdEnable = 1 : NULL : WAIT = 2
#disable load
LdEnable = 0 : NULL
#turn OFF Output1A
sdo[0x6200][1] = 0 : NULL
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_01 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2001][1] = 17 : NULL
#switch in load line, set current
J2_02 = 1 : NULL
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5500: NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5


#turn ON Output1B
sdo[0x6200][1] = 2 : NULL
#enable load
LdEnable = 1 : NULL : WAIT = 2
#disable load
LdEnable = 0 : NULL
#turn OFF Output1B
sdo[0x6200][1] = 0 : NULL
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_02 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2001][2] = 17 : NULL
#switch in load line, set current
J2_03 = 1 : NULL
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5500: NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5


#turn ON Output2A
sdo[0x6200][1] = 4 : NULL
#enable load
LdEnable = 1 : NULL : WAIT = 2
#disable load
LdEnable = 0 : NULL
#turn OFF Output2A
sdo[0x6200][1] = 0 : NULL
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_03 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2001][2] = 17 : NULL
#switch in load line, set current
J2_04 = 1 : NULL
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5500: NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5


#turn ON Output2B
sdo[0x6200][1] = 8 : NULL
#enable load
LdEnable = 1 : NULL : WAIT = 2
#disable load
LdEnable = 0 : NULL
#turn OFF Output2B
sdo[0x6200][1] = 0 : NULL
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_04 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2001][3] = 17 : NULL
#switch in load line, set current
J2_05 = 1 : NULL
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5500: NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5


#turn ON Output3A
sdo[0x6200][1] = 16 : NULL
#enable load
LdEnable = 1 : NULL : WAIT = 2
#disable load
LdEnable = 0 : NULL
#turn OFF Output3A
sdo[0x6200][1] = 0 : NULL
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_05 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2001][3] = 17 : NULL
#switch in load line, set current
J2_06 = 1 : NULL
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5500: NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5


#turn ON Output3B
sdo[0x6200][1] = 32 : NULL
#enable load
LdEnable = 1 : NULL : WAIT = 2
#disable load
LdEnable = 0 : NULL
#turn OFF Output3B
sdo[0x6200][1] = 0 : NULL
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_06 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2001][4] = 17 : NULL
#switch in load line, set current
J2_07 = 1 : NULL
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5500: NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5


#turn ON Output4A
sdo[0x6200][1] = 64 : NULL
#enable load
LdEnable = 1 : NULL : WAIT = 2
#disable load
LdEnable = 0 : NULL
#turn OFF Output4A
sdo[0x6200][1] = 0 : NULL
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_07 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2001][4] = 17 : NULL
#switch in load line, set current
J2_08 = 1 : NULL
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5500: NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5


#turn ON Output4B
sdo[0x6200][1] = 128 : NULL
#enable load
LdEnable = 1 : NULL : WAIT = 2
#disable load
LdEnable = 0 : NULL
#turn OFF Output4B
sdo[0x6200][1] = 0 : NULL
#switch out load line, clear current
sdo[0x6200][1] = 0 : NULL
J2_08 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2001][5] = 17 : NULL
#switch in load line, set current
J2_09 = 1 : NULL
#switch in load line, set current
J2_09 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5500: NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5


#turn ON Output5A
sdo[0x6200][2] = 1 : NULL
#enable load
LdEnable = 1 : NULL : WAIT = 2
#disable load
LdEnable = 0 : NULL
#turn OFF Output5A
sdo[0x6200][2] = 0 : NULL
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J2_09 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2001][5] = 17 : NULL
#switch in load line, set current
J2_10 = 1 : NULL
#switch in load line, set current
J2_10 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5500: NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5


#turn ON Output5B
sdo[0x6200][2] = 2 : NULL
#enable load
LdEnable = 1 : NULL : WAIT = 2
#disable load
LdEnable = 0 : NULL
#turn OFF Output5B
sdo[0x6200][2] = 0 : NULL
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J2_10 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2001][6] = 17 : NULL
#switch in load line, set current
J2_11 = 1 : NULL
#switch in load line, set current
J2_11 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5500: NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5


#turn ON Output6A
sdo[0x6200][2] = 4 : NULL
#enable load
LdEnable = 1 : NULL : WAIT = 2
#disable load
LdEnable = 0 : NULL
#turn OFF Output6A
sdo[0x6200][2] = 0 : NULL
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J2_11 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2001][6] = 17 : NULL
#switch in load line, set current
J2_12 = 1 : NULL
#switch in load line, set current
J2_12 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5500: NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5


#turn ON Output6B
sdo[0x6200][2] = 8 : NULL
#enable load
LdEnable = 1 : NULL : WAIT = 2
#disable load
LdEnable = 0 : NULL
#turn OFF Output6B
sdo[0x6200][2] = 0 : NULL
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J2_12 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2001][7] = 17 : NULL
#switch in load line, set current
J3_01 = 1 : NULL
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5500: NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5


#turn ON Output7A
sdo[0x6200][2] = 16 : NULL
#enable load
LdEnable = 1 : NULL : WAIT = 2
#disable load
LdEnable = 0 : NULL
#turn OFF Output7A
sdo[0x6200][2] = 0 : NULL
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J3_01 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2001][7] = 17 : NULL
#switch in load line, set current
J3_02 = 1 : NULL
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5500: NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5


#turn ON Output7B
sdo[0x6200][2] = 32 : NULL
#enable load
LdEnable = 1 : NULL : WAIT = 2
#disable load
LdEnable = 0 : NULL
#turn OFF Output7B
sdo[0x6200][2] = 0 : NULL
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J3_02 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2001][8] = 17 : NULL
#switch in load line, set current
J3_03 = 1 : NULL
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5500: NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5


#turn ON Output8A
sdo[0x6200][2] = 64 : NULL
#enable load
LdEnable = 1 : NULL : WAIT = 2
#disable load
LdEnable = 0 : NULL
#turn OFF Output8A
sdo[0x6200][2] = 0 : NULL
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J3_03 = 0 : NULL
LdCurrentSet = 0 : NULL
sdo[0x2001][8] = 17 : NULL
#switch in load line, set current
J3_04 = 1 : NULL
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5
LdCurrentSet = 5500: NULL : WAIT = 0.5
LdEnable = 0 : NULL : WAIT = 0.5


#turn ON Output8B
sdo[0x6200][2] = 128 : NULL
#enable load
LdEnable = 1 : NULL : WAIT = 2
#disable load
LdEnable = 0 : NULL
#turn OFF Output8B
sdo[0x6200][2] = 0 : NULL
#switch out load line, clear current
sdo[0x6200][2] = 0 : NULL
J3_04 = 0 : NULL
LdCurrentSet = 0 : NULL
LdRemote = 0 : NULL
LdEnable = 0 : NULL
J0_08_METER_LOAD = 0 : NULL
PRE_OPERATIONAL
SAVE
END
