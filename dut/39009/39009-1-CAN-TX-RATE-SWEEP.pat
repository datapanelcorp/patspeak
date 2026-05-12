#39009-1
#Version 0.1
#PAT wrapper: TX timing sweep via python harness
UUT_DBC = 39009-NO-CTRL-TX.dbc
UUT_DATANAME = 39009-1-CAN-TX-RATE-SWEEP-START
SUPPRESS_PAT_SUPPORT = True

#Run TX timing sweep directly (script emits PATSPEAK_RESULT)
PAT 39009-1-CAN-TX-RATE-SWEEP.py --interface kvaser --channel 0 --bitrate 250000

END
