import os


script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
script_dir = os.path.dirname(os.path.abspath(__file__))
datafile = os.path.join(script_dir, TestName + ".pat")


SCRIPT_TO_RUN = "43009_low_voltage_hold_operation.py"
SCRIPT_ARGS = (
    "--rigol-connection ip "
    "--rigol-ip 192.168.45.178 "
    "--rigol-transport visa "
    "--rigol-channel 1 "
    "--nominal-voltage 13.0 "
    "--powerup-hold-voltage 8.5 "
    "--release-voltage 12.0 "
    "--low-fault-voltage 9.5 "
    "--low-fault-threshold-voltage 10.0 "
    "--low-fault-min-sec 8.0 "
    "--hold-voltage 7.8 "
    "--no-restore-on-exit"
)


outstr = ""
outstr += "#43009-1\n"
outstr += "#Version 0.1\n"
outstr += "#wrapper for low-voltage-hold verification (Rigol CH1 + Kvaser CAN)\n"
outstr += "UUT_DBC = 43009-560.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "PAT " + SCRIPT_TO_RUN
if SCRIPT_ARGS.strip():
    outstr += " " + SCRIPT_ARGS.strip()
outstr += "\n"
outstr += "END\n"

with open(datafile, "w", encoding="utf-8", newline="\n") as f:
    f.write(outstr)

print(outstr)
print(TestName + ".pat")
