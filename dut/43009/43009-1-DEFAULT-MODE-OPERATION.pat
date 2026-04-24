#43009-1
#Version 0.1
#wrapper for default-mode operation verification
UUT_DBC = 43009-560.dbc
UUT_DATANAME = 43009-1-DEFAULT-MODE-OPERATION

RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 0
PAT 43009_default_mode_operation.py --no-cycle-k1 --raw-can --raw-can-max 300
END
