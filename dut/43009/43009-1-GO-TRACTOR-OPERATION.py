import os


script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
script_dir = os.path.dirname(os.path.abspath(__file__))
datafile = os.path.join(script_dir, TestName + ".pat")


SCRIPT_TO_RUN = "43009_GO_Tractor_operation.py"
SCRIPT_ARGS = "--firmware-variant 43009-1 --cycles 1 --no-cycle-k1 --no-verify-timing --verify-com-proto-fault"


outstr = ""
outstr += "#43009-1\n"
outstr += "#Version 0.1\n"
outstr += "#wrapper for GO/tractor mode operation verification\n"
outstr += "UUT_DBC = 43009-560.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

# Use PAT-native relay command path for K1 (bench-proven physical click).
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 0\n"

outstr += "PAT " + SCRIPT_TO_RUN
if SCRIPT_ARGS.strip():
    outstr += " " + SCRIPT_ARGS.strip()
outstr += "\n"
outstr += "END\n"

with open(datafile, "w", encoding="utf-8", newline="\n") as f:
    f.write(outstr)

print(outstr)
print(TestName + ".pat")
