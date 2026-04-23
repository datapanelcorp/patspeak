import os


script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
script_dir = os.path.dirname(os.path.abspath(__file__))
datafile = os.path.join(script_dir, TestName + ".pat")


RIGOL_SCRIPT = "dp800/rigol_dp800_set_ch.py"
RIGOL_CONNECTION = "ip"  # "ip" or "usb"
RIGOL_IP = "192.168.45.178"
#RIGOL_IP = "192.168.45.197"
RIGOL_RESOURCE = "USB0::0x1AB1::0x0E11::DP8C180100022::INSTR"
RIGOL_TRANSPORT = "visa"  # "auto", "socket", or "visa" (IP mode only)
RIGOL_SOCKET_PORTS = "5025,5555"
RIGOL_CHANNEL = 2
RIGOL_CURRENT_A = 1.0
RIGOL_SETTLE_S = 0.015
RIGOL_RETRIES = 8
RIGOL_RETRY_DELAY_S = 0.50
RIGOL_RELAY = "J4_01"

# J1939 Request PGN (0xEA00), destination global (0xFF), controller SA=0xD1.
PWS_REQUEST_CAN_ID = "0x18EAFFD1"
# Request PGN FEAC in J1939 byte order: Data[0..2] = AC FE 00.
PWS_REQUEST_BYTES = "172 254 0 0 0 0 0 0"
# Firmware rejects controller SA 0x00. Use fixed controller SA 0xD1.
CTRL1_CMD0_CAN_ID = "0x18EFD9D1"
CTRL1_CMD0_BYTES_RAW = "0 0 0 0 0 0 0 0"
# Verify counts in fixture mode with no sensors at powerup (TYPE1 mapping).
PWS_VERIFY_COUNTS = True
# "type2" (Count1..8 = 1A..4B), "type1" (Count1..4 = 1B,2B,3B,4B)
PWS_SENSOR_LAYOUT = "type1"
PWS_COUNT_TOL = "2.0"

START_V = 0.0
STOP_V = 5.6
STEP_V = 0.01
INPUT_ON_THRESHOLD_V = 0.8  # At/below this, expect input status 0
INPUT_STATUS_TRANSITION_V = 0.03  # Skip strict input-state checks between 0.80V and 0.83V
FAULT_LIMIT_V = 5.6
FAULT_TRANSITION_MARGIN_V = 0.10  # Skip strict non-fault checks from 5.50V up to 5.59V
TOL = "0.050"

PORTS = [
    ("Port_1A", "J1_01", "Input_1A", "Count1"),
    ("Port_1B", "J1_02", "Input_1B", "Count2"),
    ("Port_2A", "J1_03", "Input_2A", "Count3"),
    ("Port_2B", "J1_04", "Input_2B", "Count4"),
    ("Port_3A", "J1_05", "Input_3A", "Count5"),
    ("Port_3B", "J1_06", "Input_3B", "Count6"),
    ("Port_4A", "J1_07", "Input_4A", "Count7"),
    ("Port_4B", "J1_08", "Input_4B", "Count8"),
]
PORTS_TO_TEST = PORTS


def rigol_set_cmd(volts: float, output: str = "on", settle_s: float = RIGOL_SETTLE_S) -> str:
    conn_mode = RIGOL_CONNECTION.strip().lower()
    if conn_mode == "ip":
        transport_mode = RIGOL_TRANSPORT.strip().lower()
        if transport_mode not in {"auto", "socket", "visa"}:
            raise ValueError(f"Unsupported RIGOL_TRANSPORT: {RIGOL_TRANSPORT!r} (use 'auto', 'socket', or 'visa').")
        if transport_mode == "visa":
            # Use a single explicit LAN VISA resource to avoid dual-candidate probe noise each step.
            target = " --resource " + f"TCPIP0::{RIGOL_IP}::INSTR"
        else:
            target = " --ip " + RIGOL_IP
            target += " --transport " + transport_mode
            target += " --socket-ports " + RIGOL_SOCKET_PORTS
    elif conn_mode == "usb":
        target = " --resource " + RIGOL_RESOURCE
    else:
        raise ValueError(f"Unsupported RIGOL_CONNECTION: {RIGOL_CONNECTION!r} (use 'ip' or 'usb').")

    return (
        "PAT "
        + RIGOL_SCRIPT
        + target
        + " --channel "
        + str(RIGOL_CHANNEL)
        + " --voltage "
        + f"{volts:.2f}"
        + " --current "
        + f"{RIGOL_CURRENT_A:.3f}"
        + " --output "
        + output
        + " --settle "
        + f"{settle_s:.3f}"
        + " --retries "
        + str(RIGOL_RETRIES)
        + " --retry-delay "
        + f"{RIGOL_RETRY_DELAY_S:.3f}\n"
    )


def build_sweep_voltages(start_v: float, stop_v: float, step_v: float) -> list[float]:
    if step_v <= 0:
        raise ValueError("STEP_V must be > 0")
    if stop_v < start_v:
        raise ValueError("STOP_V must be >= START_V")
    steps = int(round((stop_v - start_v) / step_v))
    return [round(start_v + (idx * step_v), 2) for idx in range(steps + 1)]


def pws_request_cmd() -> str:
    return "SEND_CAN CH0 " + PWS_REQUEST_CAN_ID + " " + PWS_REQUEST_BYTES + "\n"


def send_can_cmd(can_id: str, payload: str) -> str:
    return "SEND_CAN CH0 " + can_id + " " + payload + "\n"


def pws_count_signal_for_port(feedback: str, default_count_signal: str) -> str | None:
    layout = PWS_SENSOR_LAYOUT.strip().lower()
    if layout == "type2":
        return default_count_signal

    if layout == "type1":
        type1_map = {
            "Port_1B": "Count1",
            "Port_2B": "Count2",
            "Port_3B": "Count3",
            "Port_4B": "Count4",
        }
        return type1_map.get(feedback)

    raise ValueError(f"Unsupported PWS_SENSOR_LAYOUT: {PWS_SENSOR_LAYOUT!r} (use 'type1' or 'type2').")


def expected_wheel_brake_lining_pct(volts: float) -> float:
    """
    Estimate expected WheelBrakeLiningRemaining percentage from input voltage.

    Firmware model (pads.c):
    - <=0.8 V considered disconnected/error; count may be unavailable/invalid.
    - 1.0 V -> 100%
    - 3.5 V -> 0%
    - Linear in between.
    """
    if volts <= INPUT_ON_THRESHOLD_V:
        raise ValueError("WheelBrakeLiningRemaining is not valid at/below input threshold.")
    if volts <= 1.0:
        return 100.0
    if volts >= 3.5:
        return 0.0
    return round(100.0 - ((volts - 1.0) * 40.0), 1)


def should_verify_pws_count(volts: float) -> bool:
    """Count values are valid outside threshold/fault transition bands."""
    fault_transition_start_v = FAULT_LIMIT_V - FAULT_TRANSITION_MARGIN_V
    min_valid_v = INPUT_ON_THRESHOLD_V + INPUT_STATUS_TRANSITION_V
    return min_valid_v <= volts < fault_transition_start_v


outstr = ""
outstr += "#43009-1\n"
outstr += "#Version 0.1\n"
outstr += "#input test (Rigol DP800 precision sweep)\n"
outstr += "UUT_DBC = 43009-560.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#-----setup pat-----\n"
outstr += "#setup meter\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#ensure PAT bench supply path is off (Rigol DP800 drives input sweep)\n"
outstr += "PwrRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "PwrSetCurrent = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#force Rigol to known-safe state before routing\n"
outstr += rigol_set_cmd(0.0, output="off", settle_s=0.050)
outstr += "\n"

outstr += "#keep PAT test-supply relay off; Rigol is routed via J4_01\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2\n"
outstr += "\n"

outstr += "#switch in o-scope and keep Rigol route open only during each port sweep\n"
outstr += "J4_03 = 1 : NULL : WAIT = 0.2\n"
outstr += RIGOL_RELAY + " = 0 : NULL : WAIT = 0.1\n"
outstr += "\n"

outstr += "#force CTRL1 command 0 request frame so STAT has a transmit trigger\n"
outstr += "#probe command-byte encoding with controller SA=0xD1\n"
outstr += send_can_cmd(CTRL1_CMD0_CAN_ID, CTRL1_CMD0_BYTES_RAW)
outstr += "Command = 0 : NULL : WAIT = 0.5\n"
outstr += "NULL : Response = 0 | 0.1 | 0.3\n"
outstr += "NULL : Software_Version = 0 | 255 | 0.3\n"
outstr += "NULL : Software_Revision = 0 | 255 | 0.3\n"
outstr += "\n"

for feedback, output_connector, status, default_count_signal in PORTS_TO_TEST:
    pws_count_signal = pws_count_signal_for_port(feedback, default_count_signal)
    input_transition_upper_v = INPUT_ON_THRESHOLD_V + INPUT_STATUS_TRANSITION_V
    fault_transition_start_v = FAULT_LIMIT_V - FAULT_TRANSITION_MARGIN_V
    # Firmware now auto-clears overvoltage faults once voltage returns to safe range.
    post_sweep_status = "0"

    outstr += "#-----setup 43009-----\n"
    outstr += "Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, Enable_DPLF2 = 1, Enable_FAULT = 1 : NULL : WAIT = 0.5\n"
    outstr += "\n"

    outstr += "#switch input to load line and route Rigol DP800 source\n"
    outstr += output_connector + " = 1 : NULL : WAIT = 0.1\n"
    outstr += RIGOL_RELAY + " = 1 : NULL : WAIT = 0.1\n"
    outstr += "\n"

    outstr += "#verify source is 0.00V before starting this input sweep\n"
    outstr += rigol_set_cmd(0.0, output="on", settle_s=0.050)
    outstr += "NULL : MeterVolts = 0.00 | " + TOL + " | 0.1\n"
    outstr += "NULL : " + feedback + " = 0.00 | " + TOL + " | 0.1\n"
    outstr += "NULL : " + status + " = 0 | 0.1 | 0.1\n"
    if PWS_VERIFY_COUNTS:
        outstr += "#request WheelBrakeLiningRemaining PGN (FEAC) using SEND_CAN CH0\n"
        outstr += pws_request_cmd()
    outstr += "\n"

    outstr += (
        "#Sweep of "
        + feedback
        + " from "
        + f"{START_V:.2f}"
        + " to "
        + f"{STOP_V:.2f}"
        + " in "
        + f"{STEP_V:.2f}"
        + " increments using Rigol DP800\n"
    )

    for volts in build_sweep_voltages(START_V, STOP_V, STEP_V):
        outstr += rigol_set_cmd(volts, output="on", settle_s=RIGOL_SETTLE_S)
        if PWS_VERIFY_COUNTS:
            outstr += pws_request_cmd()

        if PWS_VERIFY_COUNTS and pws_count_signal and should_verify_pws_count(volts):
            expected_pct = expected_wheel_brake_lining_pct(volts)
            outstr += "NULL : " + pws_count_signal + " = " + f"{expected_pct:.1f}" + " | " + PWS_COUNT_TOL + " | 0.1\n"

        outstr += "NULL : MeterVolts = " + f"{volts:.2f}" + " | " + TOL + " | 0.1\n"
        if volts >= FAULT_LIMIT_V:
            outstr += "NULL : " + feedback + " = 0 | 0.1 | 0.1\n"
            outstr += "NULL : " + status + " = 2 | 0.1 | 0.1\n"
        elif volts >= fault_transition_start_v:
            outstr += "#fault transition band; skip strict " + feedback + "/" + status + " assertions\n"
        elif volts <= INPUT_ON_THRESHOLD_V:
            outstr += "NULL : " + feedback + " = " + f"{volts:.2f}" + " | " + TOL + " | 0.1\n"
            outstr += "NULL : " + status + " = 0 | 0.1 | 0.1\n"
        elif volts < input_transition_upper_v:
            outstr += "NULL : " + feedback + " = " + f"{volts:.2f}" + " | " + TOL + " | 0.1\n"
            outstr += "#input threshold transition band; skip strict " + status + " assertion\n"
        else:
            outstr += "NULL : " + feedback + " = " + f"{volts:.2f}" + " | " + TOL + " | 0.1\n"
            outstr += "NULL : " + status + " = 1 | 0.1 | 0.1\n"

    outstr += "\n"
    outstr += "#return source to 0.00V and verify before switching to next input\n"
    outstr += rigol_set_cmd(0.0, output="on", settle_s=0.050)
    if PWS_VERIFY_COUNTS:
        outstr += pws_request_cmd()
    outstr += "NULL : MeterVolts = 0.00 | " + TOL + " | 0.2\n"
    outstr += "NULL : " + feedback + " = 0.00 | " + TOL + " | 0.2\n"
    outstr += "NULL : " + status + " = " + post_sweep_status + " | 0.1 | 0.4\n"
    outstr += "\n"
    outstr += "#Finished with port\n"
    outstr += RIGOL_RELAY + " = 0 : NULL : WAIT = 0.1\n"
    outstr += output_connector + " = 0 : NULL : WAIT = 0.1\n"
    outstr += "\n"

outstr += "#Finished with sweep\n"
outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#set Rigol output to 0V and turn channel off\n"
outstr += rigol_set_cmd(0.0, output="off", settle_s=0.050)
outstr += RIGOL_RELAY + " = 0 : NULL : WAIT = 0.1\n"

outstr += "#switch out load line, set current\n"
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1\n"

outstr += "#tear down PS1 (kept off for this test)\n"
outstr += "PwrSetCurrent = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1\n"
outstr += "PwrRemote = 0 : NULL : WAIT = 0.1\n"

outstr += "J4_03 = 0 : NULL : WAIT = 0.2\n"
outstr += "SAVE\n"
outstr += "END\n"

f = open(datafile, "w")
f.write(outstr)
f.close()
print(outstr)

print(TestName + ".pat")
