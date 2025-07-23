#34044-1
#Verion 0.0
#digital normal test using the E-LOAD
UUT_EDS = 37000-561.eds
UUT_DATANAME = 34044-1-CANOPEN-OUTPUT-NORMAL

#-----setup PAT-----
#setup load
LdRemote = 1 : NULL : WAIT = 0.1
LdEnable = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1
#-----setup 34044-----
sdo[0x2001][1] = 0x11 : NULL : WAIT = 0.2
#turn ON output
sdo[0x6200][1] = 1 : NULL : WAIT = 0.2
#read current
NULL : sdo[0x5003][1] = 1000 | 0 | 0.1
#turn OFF output
sdo[0x6200][1] = 0 : NULL : WAIT = 0.1
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 1
SAVE
END
