#43009-2
#Version 0.1
#wrapper for GO/tractor mode operation verification (43009-2 variant)
UUT_DBC = 43009-560.dbc
UUT_DATANAME = 43009-2-GO-TRACTOR-OPERATION

PAUSE Firmware update required. Confirm DUT is flashed with 43009-2 firmware (IS_43009_2), powered, and ready. Press Enter to continue.

RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 0
PAT 43009_GO_Tractor_operation.py --firmware-variant 43009-2 --cycles 1 --no-cycle-k1 --no-verify-timing --verify-com-proto-fault
END
