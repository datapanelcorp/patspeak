#43009-2
#Version 0.1
#wrapper for default-mode operation verification (43009-2 variant)
UUT_DBC = 43009-560.dbc
UUT_DATANAME = 43009-2-DEFAULT-MODE-OPERATION

PAUSE Firmware update required. Confirm DUT is flashed with 43009-2 firmware (IS_43009_2), powered, and ready. Press Enter to continue.

RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 0
PAT 43009_default_mode_operation.py --firmware-variant 43009-2 --no-cycle-k1 --raw-can --raw-can-max 300
END
