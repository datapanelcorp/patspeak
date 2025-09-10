UUT_EDS = 37000-564.eds
UUT_DATANAME = E-LOAD

#setup load
LdRemote = 1 : NULL
LdEnable = 0 : NULL
LdCurrentSet = 0 : NULL : WAIT = 1
J0_08_METER_LOAD = 1 : NULL
LdCurrentSet = 1 : NULL : WAIT = 1
END
