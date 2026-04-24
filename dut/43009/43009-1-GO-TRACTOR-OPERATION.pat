#43009-1
#Version 0.1
#wrapper for GO/tractor mode operation verification
UUT_DBC = 43009-560.dbc
UUT_DATANAME = 43009-1-GO-TRACTOR-OPERATION

RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 0
PAT 43009_GO_Tractor_operation.py --cycles 1 --no-cycle-k1 --no-verify-timing
END
