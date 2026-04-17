import os


script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
script_dir = os.path.dirname(os.path.abspath(__file__))
datafile = os.path.join(script_dir, TestName + ".pat")


PORTS = [
    ("Port_1A", "J1_01", "Input_1A"),
    ("Port_1B", "J1_02", "Input_1B"),
    ("Port_2A", "J1_03", "Input_2A"),
    ("Port_2B", "J1_04", "Input_2B"),
    ("Port_3A", "J1_05", "Input_3A"),
    ("Port_3B", "J1_06", "Input_3B"),
    ("Port_4A", "J1_07", "Input_4A"),
    ("Port_4B", "J1_08", "Input_4B"),
]

V_LOW = 0.0
V_NOM = 1.0
V_FAULT = 5.7
V_TOL = "0.050"
STATUS_TOL = "0.1"
SUPPLY_SETTLE = 0.20
FAULT_CLEAR_WAIT = 0.40


def ps_set_cmd(volts: float, wait_s: float = SUPPLY_SETTLE) -> str:
    # PAT bench supply uses 0.1V units.
    decivolts = int(round(volts * 10.0))
    return f"PwrSetVoltage = {decivolts} : NULL : WAIT = {wait_s:.2f}\n"


outstr = ""
outstr += "#43009-1\n"
outstr += "#Version 0.1\n"
outstr += "#quick input fault auto-reset validation (PAT supply)\n"
outstr += "UUT_DBC = 43009-560.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#-----setup PAT-----\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#setup PS1 (same path as 43009-1-INPUT-ALL)\n"
outstr += "PwrRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "PwrSetCurrent = 100 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 10 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#enable telemetry required for status checks\n"
outstr += "Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, Enable_FAULT = 1 : NULL : WAIT = 0.5\n"
outstr += "\n"

outstr += "#prepare relay path\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2\n"
outstr += "\n"

for feedback, output_connector, status in PORTS:
    outstr += "#-----" + feedback + " fault auto-reset-----\n"
    outstr += output_connector + " = 1 : NULL : WAIT = 0.1\n"
    outstr += "\n"

    outstr += "#0V baseline (supply path off) -> status 0\n"
    outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20\n"
    outstr += "NULL : MeterVolts = " + f"{V_LOW:.1f}" + " | " + V_TOL + " | 0.2\n"
    outstr += "NULL : " + feedback + " = " + f"{V_LOW:.1f}" + " | " + V_TOL + " | 0.2\n"
    outstr += "NULL : " + status + " = 0 | " + STATUS_TOL + " | 0.2\n"
    outstr += "\n"

    outstr += "#1.0V normal -> status 1\n"
    outstr += ps_set_cmd(V_NOM, wait_s=0.10)
    outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.20\n"
    outstr += "NULL : MeterVolts = " + f"{V_NOM:.1f}" + " | " + V_TOL + " | 0.2\n"
    outstr += "NULL : " + feedback + " = " + f"{V_NOM:.1f}" + " | " + V_TOL + " | 0.2\n"
    outstr += "NULL : " + status + " = 1 | " + STATUS_TOL + " | 0.2\n"
    outstr += "\n"

    outstr += "#5.7V fault inject -> status 2\n"
    outstr += ps_set_cmd(V_FAULT, wait_s=0.20)
    outstr += "NULL : MeterVolts = " + f"{V_FAULT:.1f}" + " | " + V_TOL + " | 0.2\n"
    outstr += "NULL : " + status + " = 2 | " + STATUS_TOL + " | 0.3\n"
    outstr += "\n"

    outstr += "#return to 1.0V -> status must auto-reset to 1\n"
    outstr += ps_set_cmd(V_NOM, wait_s=FAULT_CLEAR_WAIT)
    outstr += "NULL : MeterVolts = " + f"{V_NOM:.1f}" + " | " + V_TOL + " | 0.3\n"
    outstr += "NULL : " + feedback + " = " + f"{V_NOM:.1f}" + " | " + V_TOL + " | 0.3\n"
    outstr += "NULL : " + status + " = 1 | " + STATUS_TOL + " | 0.3\n"
    outstr += "\n"

    outstr += "#back to 0V (path off) before switching input\n"
    outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20\n"
    outstr += "NULL : MeterVolts = " + f"{V_LOW:.1f}" + " | " + V_TOL + " | 0.2\n"
    outstr += "NULL : " + feedback + " = " + f"{V_LOW:.1f}" + " | " + V_TOL + " | 0.2\n"
    outstr += "NULL : " + status + " = 0 | " + STATUS_TOL + " | 0.2\n"
    outstr += "\n"

    outstr += output_connector + " = 0 : NULL : WAIT = 0.1\n"
    outstr += "\n"

outstr += "#-----teardown-----\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20\n"
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrSetCurrent = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "SAVE\n"
outstr += "END\n"

with open(datafile, "w", encoding="utf-8") as f:
    f.write(outstr)

print(outstr)
print(TestName + ".pat")
