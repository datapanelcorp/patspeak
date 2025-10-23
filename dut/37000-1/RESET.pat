UUT_EDS = 37000-563.eds
UUT_DATANAME = RESET
LdRemote = 1 : NULL
LdEnable = 0 : NULL
LdShort = 0 : NULL : WAIT = 1
#Restore all Default Parameters
sdo[0x1011][1] = 1684107116 : NULL
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
END
