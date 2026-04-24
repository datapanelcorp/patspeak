#43009-1
#Version 0.1
#wrapper for low-voltage-hold verification (Rigol CH1 + Kvaser CAN)
UUT_DBC = 43009-560.dbc
UUT_DATANAME = 43009-1-LOW-VOLTAGE-HOLD

PAT 43009_low_voltage_hold_operation.py --rigol-connection ip --rigol-ip 192.168.45.178 --rigol-transport visa --rigol-channel 1 --nominal-voltage 13.0 --powerup-hold-voltage 8.5 --release-voltage 12.0 --low-fault-voltage 9.5 --low-fault-threshold-voltage 10.0 --low-fault-min-sec 8.0 --hold-voltage 7.8 --no-restore-on-exit
END
