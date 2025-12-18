UUT_DBC = 39009-561.dbc
UUT_DATANAME = RESET
LdRemote = 1 : NULL : WAIT = 0.2
LdEnable = 0 : NULL : WAIT = 0.2
LdShort = 0 : NULL : WAIT = 0.2
#Restore all Default Parameters
sdo[0x1011][1] = 1684107116 : NULL
#cycle IGN to clean slate
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 1
END
