UUT_EDS = 37000-564.eds
UUT_DATANAME = E-LOAD

#setup load
LdRemote = 1 : NULL
LdCurrentSet = 0 : NULL : WAIT = 1
LdResistSet = 0 : NULL : WAIT = 1
LdMode = 0 : NULL : WAIT = 5
LdEnable = 0 : NULL
J0_08_METER_LOAD = 1 : NULL
LdCurrentSet = 1500 : NULL : WAIT = 1
LdShort = 1 : NULL : WAIT = 1
LdShort = 0 : NULL : WAIT = 1
LdMode = 1 : NULL : WAIT = 5
LdResistSet = 0 : NULL : WAIT = 1
END
