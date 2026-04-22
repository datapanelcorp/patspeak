import os


script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
script_dir = os.path.dirname(os.path.abspath(__file__))
datafile = os.path.join(script_dir, TestName + ".pat")


EXPECTED_V = 5.00
V_TOL = "0.200"
NOLOAD_SETTLE_S = 0.2
LOAD_SETTLE_S = 0.25
CHAR_SWEEP_SETTLE_S = 0.20
FAULT_SETTLE_S = 0.50

# LdCurrentSet uses mA units (200 = 0.200 A)
IN_SPEC_LOADS_MA = [100, 150, 180, 200]
CHAR_SWEEP_LOADS_MA = [250, 300, 400, 500, 650, 800, 1000]
CHAR_V_TOL = "5.000"  # Wide tolerance so sweep logs measured droop without failing.
CHAR_STATUS_TOL = "1.0"  # Allows 0/1/2 so we can capture first trip point in logs.
SHORT_TEST_LOAD_MA = 200

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
outstr += "#Version 0.2\n"
outstr += "#sensor power overcurrent validation using PAT e-load\n"
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

outstr += "#enable telemetry groups used by this test\n"
outstr += "Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, Enable_FAULT = 1 : NULL : WAIT = 0.5\n"
outstr += "\n"

outstr += "#all sensor-rail routes off before test\n"
outstr += "J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.2\n"
outstr += "\n"

for rail_name, connector, feedback, status in SENSOR_RAILS:
    outstr += "#-----" + rail_name + "-----\n"
    outstr += "J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1\n"
    outstr += connector + " = 1 : NULL : WAIT = 0.2\n"
    outstr += "LdShort = 0 : NULL : WAIT = 0.1\n"
    outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
    outstr += "LdEnable = 0 : NULL : WAIT = " + f"{NOLOAD_SETTLE_S:.2f}" + "\n"
    outstr += "NULL : MeterVolts = " + f"{EXPECTED_V:.2f}" + " | " + V_TOL + " | 0.1\n"
    outstr += "NULL : " + feedback + " = " + f"{EXPECTED_V:.2f}" + " | " + V_TOL + " | 0.1\n"
    outstr += "NULL : " + status + " = 1 | 0.1 | 0.1\n"
    outstr += "\n"

    outstr += "#in-spec load steps: rail should stay on\n"
    for current_ma in IN_SPEC_LOADS_MA:
        outstr += "LdCurrentSet = " + str(current_ma) + " : NULL : WAIT = 0.1\n"
        outstr += "LdEnable = 1 : NULL : WAIT = " + f"{LOAD_SETTLE_S:.2f}" + "\n"
        outstr += "NULL : " + status + " = 1 | 0.1 | 0.1\n"
    outstr += "\n"

    outstr += "#high-current characterization sweep (captures droop and first fault point)\n"
    for current_ma in CHAR_SWEEP_LOADS_MA:
        outstr += "LdCurrentSet = " + str(current_ma) + " : NULL : WAIT = 0.1\n"
        outstr += "LdEnable = 1 : NULL : WAIT = " + f"{CHAR_SWEEP_SETTLE_S:.2f}" + "\n"
        outstr += "NULL : MeterVolts = " + f"{EXPECTED_V:.2f}" + " | " + CHAR_V_TOL + " | 0.1\n"
        outstr += "NULL : " + feedback + " = " + f"{EXPECTED_V:.2f}" + " | " + CHAR_V_TOL + " | 0.1\n"
        outstr += "NULL : " + status + " = 1 | " + CHAR_STATUS_TOL + " | 0.1\n"
    outstr += "\n"

    outstr += "#force hard short to validate definite fault path\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
    outstr += "LdCurrentSet = " + str(SHORT_TEST_LOAD_MA) + " : NULL : WAIT = 0.1\n"
    outstr += "LdShort = 1 : NULL : WAIT = 0.1\n"
    outstr += "LdEnable = 1 : NULL : WAIT = " + f"{FAULT_SETTLE_S:.2f}" + "\n"
    outstr += "NULL : " + status + " = 2 | 0.1 | 0.1\n"
    outstr += "NULL : MeterVolts = 0.00 | 0.300 | 0.1\n"
    outstr += "\n"

    outstr += "#fault latch check with load removed\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.2\n"
    outstr += "LdShort = 0 : NULL : WAIT = 0.1\n"
    outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
    outstr += "NULL : " + status + " = 2 | 0.1 | 0.1\n"
    outstr += "\n"

    outstr += "#clear sensor-power faults between rails\n"
    outstr += (
        "Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, "
        "Enable_FAULT = 1, Reset_Sensor_Power_Faults = 1 : NULL : WAIT = 0.2\n"
    )
    outstr += (
        "Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, "
        "Enable_FAULT = 1, Reset_Sensor_Power_Faults = 0 : NULL : WAIT = 0.3\n"
    )
    outstr += "NULL : " + status + " = 1 | 0.1 | 0.1\n"
    outstr += "NULL : MeterVolts = " + f"{EXPECTED_V:.2f}" + " | " + V_TOL + " | 0.1\n"
    outstr += "\n"

    outstr += connector + " = 0 : NULL : WAIT = 0.1\n"
    outstr += "\n"

outstr += "#-----final latch stage-----\n"
outstr += "#after reset/recovery checks above, fault each rail again and leave faults latched\n"
for rail_name, connector, feedback, status in SENSOR_RAILS:
    outstr += "#final latch " + rail_name + "\n"
    outstr += "J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.1\n"
    outstr += connector + " = 1 : NULL : WAIT = 0.2\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
    outstr += "LdCurrentSet = " + str(SHORT_TEST_LOAD_MA) + " : NULL : WAIT = 0.1\n"
    outstr += "LdShort = 1 : NULL : WAIT = 0.1\n"
    outstr += "LdEnable = 1 : NULL : WAIT = " + f"{FAULT_SETTLE_S:.2f}" + "\n"
    outstr += "NULL : " + status + " = 2 | 0.1 | 0.1\n"
    outstr += "NULL : MeterVolts = 0.00 | 0.300 | 0.1\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
    outstr += "LdShort = 0 : NULL : WAIT = 0.1\n"
    outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
    outstr += "NULL : " + status + " = 2 | 0.1 | 0.1\n"
    outstr += connector + " = 0 : NULL : WAIT = 0.1\n"
    outstr += "\n"

outstr += "#final expectation: all sensor power channels remain fault latched\n"
outstr += "NULL : SpwrStat1 = 2 | 0.1 | 0.1\n"
outstr += "NULL : SpwrStat2 = 2 | 0.1 | 0.1\n"
outstr += "NULL : SpwrStat3 = 2 | 0.1 | 0.1\n"
outstr += "NULL : SpwrStat4 = 2 | 0.1 | 0.1\n"
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
