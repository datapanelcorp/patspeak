#39009-1
#Version 0.1
#PAT wrapper: TX timing sweep via python harness
UUT_DBC = 39009-561.dbc
UUT_DATANAME = 39009-1-CAN-TX-RATE-SWEEP-START
SUPPRESS_PAT_SUPPORT = True

PAUSE-Verify DUT is powered and connected to CAN. Verify Kvaser adapter is connected to DUT CAN bus on channel 0 at 250000 bps. Press Enter to continue.

#Run TX timing sweep directly (script emits PATSPEAK_RESULT)
PAT 39009-1-CAN-TX-RATE-SWEEP.py --interface kvaser --channel 0 --bitrate 250000

END
