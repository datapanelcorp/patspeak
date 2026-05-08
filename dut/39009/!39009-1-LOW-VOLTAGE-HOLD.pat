#39009-1
#Version 0.1
#Safety wrapper: one cable-swap window for low-voltage-hold python test
UUT_DBC = 39009-561.dbc
UUT_DATANAME = 39009-1-LOW-VOLTAGE-HOLD-START
SUPPRESS_PAT_SUPPORT = True

PAUSE-CRITICAL SAFETY CHECK. Turn PAT main supply output OFF. Disconnect PAT main VBAT cable from module. Connect Rigol CH1 to module VBAT. Confirm only one supply is connected. Press Enter to continue.

#Behavior test only: power-up hold, low-fault, low-voltage hold, CAN-stop, and recovery
PAT 39009_low_voltage_hold.py --no-cycle-k1 --post-enable-quiet-sec 5.0 --cleanup-rigol off --powerup-hold-voltage 8.5 --release-voltage 12.0 --fault-code 2 --low-fault-voltage 10.5 --low-fault-threshold-voltage 11.0 --low-fault-min-sec 8.0 --hold-voltage 7.8

PAUSE-CRITICAL SAFETY CHECK. Verify Rigol CH1 output is OFF. Disconnect Rigol CH1 from module VBAT. Reconnect PAT main supply to module VBAT. Press Enter to continue.

END
