import os


script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
script_dir = os.path.dirname(os.path.abspath(__file__))
datafile = os.path.join(script_dir, TestName + ".pat")


EXPECTED_V = 5.00
V_TOL = "0.200"

SENSOR_RAILS = [
    ("SPWR1", "J2_02", "Spwr1", "SpwrStat1"),
    ("SPWR2", "J2_04", "Spwr2", "SpwrStat2"),
    ("SPWR3", "J2_06", "Spwr3", "SpwrStat3"),
    ("SPWR4", "J2_08", "Spwr4", "SpwrStat4"),
]

# Firmware rejects controller SA 0x00. Use fixed controller SA 0xD1.
CTRL1_CMD0_CAN_ID = "0x18EFD9D1"
CTRL1_CMD0_BYTES_RAW = "0 0 0 0 0 0 0 0"


def send_can_cmd(can_id: str, payload: str) -> str:
    return "SEND_CAN CH0 " + can_id + " " + payload + "\n"


outstr = ""
outstr += "#43009-1\n"
outstr += "#Version 0.1\n"
outstr += "#sensor power rail validation (always-active 5V rails)\n"
outstr += "UUT_DBC = 43009-560.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#force CTRL1 command 0 request frame so STAT has a transmit trigger\n"
outstr += "#probe command-byte encoding with controller SA=0xD1\n"
outstr += send_can_cmd(CTRL1_CMD0_CAN_ID, CTRL1_CMD0_BYTES_RAW)
outstr += "Command = 0 : NULL : WAIT = 0.5\n"
outstr += "NULL : Response = 0 | 0.1 | 0.3\n"
outstr += "NULL : Software_Version = 0 | 255 | 0.3\n"
outstr += "NULL : Software_Revision = 0 | 255 | 0.3\n"
outstr += "\n"

outstr += "#-----setup PAT-----\n"
outstr += "#setup meter path\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdShort = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#keep PAT bench supply path off for this measurement test\n"
outstr += "PwrRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "PwrSetCurrent = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#enable DUT telemetry groups used by this test (match rigol input test)\n"
outstr += "Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1 : NULL : WAIT = 0.5\n"
outstr += "\n"

outstr += "#all sensor-rail connector routes off before test\n"
outstr += "J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.2\n"
outstr += "\n"

for rail_name, connector, feedback, status in SENSOR_RAILS:
    outstr += "#-----" + rail_name + "-----\n"
    outstr += "#route this rail to meter input\n"
    outstr += "J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1\n"
    outstr += connector + " = 1 : NULL : WAIT = 0.2\n"
    outstr += "\n"

    outstr += "#verify connector voltage and internal telemetry\n"
    outstr += "NULL : MeterVolts = " + f"{EXPECTED_V:.2f}" + " | " + V_TOL + " | 0.1\n"
    outstr += "NULL : " + feedback + " = " + f"{EXPECTED_V:.2f}" + " | " + V_TOL + " | 0.1\n"
    outstr += "NULL : " + status + " = 1 | 0.1 | 0.1\n"
    outstr += "\n"

    outstr += "#unroute connector before next rail\n"
    outstr += connector + " = 0 : NULL : WAIT = 0.1\n"
    outstr += "\n"

outstr += "#all sensor-rail connector routes off\n"
outstr += "J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1\n"
outstr += "\n"

outstr += "#-----teardown-----\n"
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdShort = 0 : NULL : WAIT = 0.1\n"
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
