import os


script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
script_dir = os.path.dirname(os.path.abspath(__file__))
datafile = os.path.join(script_dir, TestName + ".pat")


# Fixed controller SA used by firmware.
CTRL1_CMD0_CAN_ID = "0x18EFD9D1"
CTRL1_CMD0_BYTES_RAW = "0 0 0 0 0 0 0 0"

# Firmware uses MAX_SENSOR_POWER = 5000 (mV), which is 5.0V in DBC units.
MAX_SENSOR_POWER_V = 5.00

# Test mode:
# - SWEEP_MODE = True  -> 1.0V..5.0V in 0.1V steps
# - SWEEP_MODE = False -> single-point 2.5V check
SWEEP_MODE = True
SINGLE_POINT_V = 2.50
SWEEP_START_V = 1.00
SWEEP_STOP_V = 5.00
SWEEP_STEP_V = 0.10
SUPPLY_MIN_V = 1.00

# Expected AD4 sensor-power rail telemetry.
SPWR_NOMINAL_V = 5.00
SPWR_TOL_V = 0.200

# Input/meter/ratio tolerances.
METER_TOL_V = 0.050
RATIO_FLOOR_TOL_V = 0.080
RATIO_POSTCHECK_TOL_V = 0.050  # 1% of 5.00 full-scale
POSTCHECK_METER_WINDOW_V = 0.050
POSTCHECK_METER_ROW_CONSISTENCY_V = 0.100
POSTCHECK_PORT_SETTLE_DELTA_V = 0.020
POSTCHECK_MIN_STABLE_ROWS = 2

CMD_WAIT_S = 0.50
SUPPLY_SETTLE_S = 0.30

PORTS = [
    ("Port_1A", "J1_01", "Input_1A", "Spwr1", "SpwrStat1"),
    ("Port_1B", "J1_02", "Input_1B", "Spwr1", "SpwrStat1"),
    ("Port_2A", "J1_03", "Input_2A", "Spwr2", "SpwrStat2"),
    ("Port_2B", "J1_04", "Input_2B", "Spwr2", "SpwrStat2"),
    ("Port_3A", "J1_05", "Input_3A", "Spwr3", "SpwrStat3"),
    ("Port_3B", "J1_06", "Input_3B", "Spwr3", "SpwrStat3"),
    ("Port_4A", "J1_07", "Input_4A", "Spwr4", "SpwrStat4"),
    ("Port_4B", "J1_08", "Input_4B", "Spwr4", "SpwrStat4"),
]


def send_can_cmd(can_id: str, payload: str) -> str:
    return "SEND_CAN CH0 " + can_id + " " + payload + "\n"


def cfg_cmd(ratio_enabled: int, reset_sensor_faults: int = 0) -> str:
    return (
        "Command = 1, "
        + "Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, "
        + "Enable_DPLF2 = 1, Enable_FAULT = 1, "
        + "Ratiometric_AD2_AD3 = "
        + str(ratio_enabled)
        + ", Reset_Sensor_Power_Faults = "
        + str(reset_sensor_faults)
        + " : NULL : WAIT = "
        + f"{CMD_WAIT_S:.2f}"
        + "\n"
    )


def build_voltage_points() -> list[float]:
    if not SWEEP_MODE:
        return [round(SINGLE_POINT_V, 2)]

    points: list[float] = []
    idx = 0
    max_steps = int(round((SWEEP_STOP_V - SWEEP_START_V) / SWEEP_STEP_V)) + 1
    while idx < max_steps:
        points.append(round(SWEEP_START_V + (idx * SWEEP_STEP_V), 2))
        idx += 1
    return points


def ratio_expected_volts(input_volts: float) -> float:
    return round((input_volts / SPWR_NOMINAL_V) * MAX_SENSOR_POWER_V, 2)


def ratio_tolerance_volts(input_volts: float) -> float:
    # Convert the meter and AD4 tolerance windows into a conservative
    # ratiometric expectation window based on firmware formula:
    # (Input / Spwr) * MAX_SENSOR_POWER.
    min_input = max(0.0, input_volts - METER_TOL_V)
    max_input = input_volts + METER_TOL_V
    min_spwr = max(0.1, SPWR_NOMINAL_V - SPWR_TOL_V)
    max_spwr = SPWR_NOMINAL_V + SPWR_TOL_V

    min_ratio = (min_input / max_spwr) * MAX_SENSOR_POWER_V
    max_ratio = (max_input / min_spwr) * MAX_SENSOR_POWER_V
    expected = ratio_expected_volts(input_volts)

    tol = max(abs(expected - min_ratio), abs(max_ratio - expected), RATIO_FLOOR_TOL_V)
    return round(tol, 3)


voltage_points = build_voltage_points()
SUPPLY_MIN_COUNTS = int(round(SUPPLY_MIN_V * 10.0))

outstr = ""
outstr += "#43009-1\n"
outstr += "#Version 0.3\n"
if SWEEP_MODE:
    outstr += "#ratiometric AD2/AD3 validation: all inputs, 1.0V..5.0V in 0.1V steps\n"
else:
    outstr += "#ratiometric AD2/AD3 validation: all inputs at 2.5V single-point\n"
outstr += "#AD4 Spwr telemetry is used as denominator reference window; no sensor-power switching\n"
outstr += "UUT_DBC = 43009-560.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#force CTRL1 command 0 request frame so STAT has a transmit trigger\n"
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

outstr += "#use PAT bench supply as input source\n"
outstr += "PwrRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "PwrSetCurrent = 100 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = " + str(SUPPLY_MIN_COUNTS) + " : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.5\n"
outstr += "\n"

outstr += "#all input routes open before test\n"
outstr += "J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2\n"
outstr += "#force all sensor-power connector routes open (never switched in this test)\n"
outstr += "J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.2\n"
outstr += "\n"

outstr += "#restore telemetry enables and latch ratio mode ON\n"
outstr += cfg_cmd(ratio_enabled=1, reset_sensor_faults=0)
outstr += "#clear any pre-existing sensor-power latch from prior interrupted runs\n"
outstr += cfg_cmd(ratio_enabled=1, reset_sensor_faults=1)
outstr += cfg_cmd(ratio_enabled=1, reset_sensor_faults=0)
outstr += "\n"

for feedback, output_connector, status, spwr_feedback, spwr_status in PORTS:
    outstr += "#-----" + feedback + " ratio checks-----\n"
    outstr += output_connector + " = 1 : NULL : WAIT = 0.2\n"

    for volts in voltage_points:
        set_counts = int(round(volts * 10.0))
        expected_ratio = ratio_expected_volts(volts)
        ratio_tol = ratio_tolerance_volts(volts)

        outstr += "PwrSetVoltage = " + str(set_counts) + " : NULL : WAIT = " + f"{SUPPLY_SETTLE_S:.2f}" + "\n"
        outstr += "NULL : MeterVolts = " + f"{volts:.2f}" + " | " + f"{METER_TOL_V:.3f}" + " | 0.2\n"
        outstr += "NULL : " + spwr_feedback + " = " + f"{SPWR_NOMINAL_V:.2f}" + " | " + f"{SPWR_TOL_V:.3f}" + " | 0.2\n"
        outstr += "NULL : " + spwr_status + " = 1 | 0.1 | 0.1\n"
        outstr += "NULL : " + feedback + " = " + f"{expected_ratio:.2f}" + " | " + f"{ratio_tol:.3f}" + " | 0.2\n"
        outstr += "NULL : " + status + " = 1 | 0.1 | 0.1\n"

    outstr += "#remove input route before moving to next channel (no 0V assertion)\n"
    outstr += output_connector + " = 0 : NULL : WAIT = 0.1\n"
    outstr += "PwrSetVoltage = " + str(SUPPLY_MIN_COUNTS) + " : NULL : WAIT = 0.1\n"
    outstr += "\n"

outstr += "#-----teardown-----\n"
outstr += "PwrSetVoltage = " + str(SUPPLY_MIN_COUNTS) + " : NULL : WAIT = 0.2\n"
outstr += "J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2\n"
outstr += "J2_02 = 0, J2_04 = 0, J2_06 = 0, J2_08 = 0 : NULL : WAIT = 0.2\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.5\n"
outstr += "PwrEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrSetCurrent = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = " + str(SUPPLY_MIN_COUNTS) + " : NULL : WAIT = 0.1\n"
outstr += "PwrRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdShort = 0 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1\n"
outstr += "\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "SAVE\n"
outstr += (
    "PAT validate_ratiometric_csv.py"
    + " --tolerance "
    + f"{RATIO_POSTCHECK_TOL_V:.3f}"
    + " --full-scale "
    + f"{MAX_SENSOR_POWER_V:.3f}"
    + " --min-meter 1.0 --min-port 0.5"
    + " --meter-window "
    + f"{POSTCHECK_METER_WINDOW_V:.3f}"
    + " --meter-row-consistency "
    + f"{POSTCHECK_METER_ROW_CONSISTENCY_V:.3f}"
    + " --port-settle-delta "
    + f"{POSTCHECK_PORT_SETTLE_DELTA_V:.3f}"
    + " --min-stable-rows "
    + str(POSTCHECK_MIN_STABLE_ROWS)
    + "\n"
)
outstr += "END\n"

with open(datafile, "w", encoding="utf-8", newline="\n") as f:
    f.write(outstr)

print(outstr)
print(TestName + ".pat")
