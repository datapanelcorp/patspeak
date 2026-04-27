import os


script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
script_dir = os.path.dirname(os.path.abspath(__file__))
datafile = os.path.join(script_dir, TestName + ".pat")


EXPECTED_V = 5.00
V_TOL = "0.300"
SHORT_TEST_LOAD_MA = 200
FAULT_SETTLE_S = 0.50

ACTIVE_FAULT_NONE = 0
ACTIVE_FAULT_OUTPUT_FAMILY_CENTER = "51.5"
ACTIVE_FAULT_OUTPUT_FAMILY_TOL = "0.6"  # Accepts 51 (overcurrent) or 52 (short-circuit).

SENSOR_RAILS = [
    ("SPWR1", "J2_02"),
    ("SPWR2", "J2_04"),
    ("SPWR3", "J2_06"),
    ("SPWR4", "J2_08"),
]

# Firmware rejects controller SA 0x00. Use fixed controller SA 0xD1.
CTRL1_CMD0_CAN_ID = "0x18EFD9D1"
CTRL1_CMD0_BYTES_RAW = "0 0 0 0 0 0 0 0"


def send_can_cmd(can_id: str, payload: str) -> str:
    return "SEND_CAN CH0 " + can_id + " " + payload + "\n"


outstr = ""
outstr += "#43009-1\n"
outstr += "#Version 0.2\n"
outstr += "#focused sensor-power Active_Fault_Code validation (command-0 only)\n"
outstr += "UUT_DBC = 43009-560.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#force command 0 and verify comms\n"
outstr += send_can_cmd(CTRL1_CMD0_CAN_ID, CTRL1_CMD0_BYTES_RAW)
outstr += "Command = 0 : NULL : WAIT = 0.5\n"
outstr += "NULL : Response = 0 | 0.1 | 0.3\n"
outstr += "NULL : Software_Version = 0 | 255 | 0.3\n"
outstr += "NULL : Software_Revision = 0 | 255 | 0.3\n"
outstr += "\n"

outstr += "#-----setup PAT-----\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "LdShort = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#keep PAT bench supply path off\n"
outstr += "PwrRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "PwrSetCurrent = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#all sensor-rail routes off before test\n"
outstr += "J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.2\n"
outstr += "\n"

for rail_name, connector in SENSOR_RAILS:
    outstr += "#-----" + rail_name + " Active_Fault_Code-----\n"
    outstr += "J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1\n"
    outstr += connector + " = 1 : NULL : WAIT = 0.2\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
    outstr += "LdShort = 0 : NULL : WAIT = 0.1\n"
    outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
    outstr += "NULL : MeterVolts = " + f"{EXPECTED_V:.2f}" + " | " + V_TOL + " | 0.2\n"
    outstr += "\n"

    outstr += "#force hard short to trigger output fault family\n"
    outstr += "LdCurrentSet = " + str(SHORT_TEST_LOAD_MA) + " : NULL : WAIT = 0.1\n"
    outstr += "LdShort = 1 : NULL : WAIT = 0.1\n"
    outstr += "LdEnable = 1 : NULL : WAIT = " + f"{FAULT_SETTLE_S:.2f}" + "\n"
    outstr += "NULL : MeterVolts = 0.00 | 0.300 | 0.1\n"
    outstr += send_can_cmd(CTRL1_CMD0_CAN_ID, CTRL1_CMD0_BYTES_RAW)
    outstr += "Command = 0 : NULL : WAIT = 0.2\n"
    outstr += "NULL : Active_Fault_Code = " + ACTIVE_FAULT_OUTPUT_FAMILY_CENTER + " | " + ACTIVE_FAULT_OUTPUT_FAMILY_TOL + " | 0.3\n"
    outstr += "\n"

    outstr += "#remove short/load before clearing fault\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.2\n"
    outstr += "LdShort = 0 : NULL : WAIT = 0.1\n"
    outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
    outstr += "\n"

    outstr += "#clear by power-cycling K1 (keeps this test command-0 only)\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += send_can_cmd(CTRL1_CMD0_CAN_ID, CTRL1_CMD0_BYTES_RAW)
    outstr += "Command = 0 : NULL : WAIT = 0.5\n"
    outstr += "NULL : Response = 0 | 0.1 | 0.3\n"
    outstr += "NULL : Active_Fault_Code = " + str(ACTIVE_FAULT_NONE) + " | 0.1 | 0.3\n"
    outstr += "NULL : MeterVolts = " + f"{EXPECTED_V:.2f}" + " | " + V_TOL + " | 0.2\n"
    outstr += "\n"

    outstr += connector + " = 0 : NULL : WAIT = 0.1\n"
    outstr += "\n"

outstr += "#all sensor-rail connector routes off\n"
outstr += "J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1\n"
outstr += "\n"

outstr += "#-----teardown-----\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "LdShort = 0 : NULL : WAIT = 0.1\n"
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
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
