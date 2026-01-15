UUT_DBC = 39009-561.dbc
UUT_DATANAME = RESET
LdRemote = 1 : NULL : WAIT = 0.2
LdEnable = 0 : NULL : WAIT = 0.2
LdShort = 0 : NULL : WAIT = 0.2
#cycle IGN to clean slate
RLY_K1 = 0 : NULL : WAIT = 0.5
RLY_K1 = 1 : NULL : WAIT = 1
RLY_K1 = 0 : NULL : WAIT = 0.5
END
