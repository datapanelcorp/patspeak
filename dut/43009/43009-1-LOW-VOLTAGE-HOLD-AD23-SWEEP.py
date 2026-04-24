import os


script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
script_dir = os.path.dirname(os.path.abspath(__file__))
datafile = os.path.join(script_dir, TestName + ".pat")


RIGOL_SCRIPT = "dp800/rigol_dp800_set_ch.py"
RIGOL_CONNECTION = "ip"  # "ip" or "usb"
RIGOL_IP = "192.168.45.178"
RIGOL_RESOURCE = "USB0::0x1AB1::0x0E11::DP8C180100022::INSTR"
RIGOL_TRANSPORT = "visa"  # "auto", "socket", or "visa" (IP mode only)
RIGOL_SOCKET_PORTS = "5025,5555"
RIGOL_RETRIES = 8
RIGOL_RETRY_DELAY_S = 0.50

BATTERY_CH = 1
BATTERY_CURRENT_A = 2.0
NOMINAL_BATTERY_V = 13.0
HOLD_BATTERY_V = 7.8
HOLD_POLL_COUNT = 5
HOLD_POLL_WAIT_S = 1.9  # 9.5s below 8.0V while repeatedly polling Command=0.

INPUT_CH = 2
INPUT_CURRENT_A = 1.0
INPUT_V = 2.50

METER_TOL = "0.050"
PORT_TOL = "0.150"
ZERO_TOL = "0.150"

CTRL1_CMD0_CAN_ID = "0x18EFD9D1"
CTRL1_CMD0_BYTES_RAW = "0 0 0 0 0 0 0 0"

PORTS = [
    ("Port_1A", "Input_1A", "J1_01", "AD2"),
    ("Port_1B", "Input_1B", "J1_02", "AD2"),
    ("Port_2A", "Input_2A", "J1_03", "AD2"),
    ("Port_2B", "Input_2B", "J1_04", "AD2"),
    ("Port_3A", "Input_3A", "J1_05", "AD3"),
    ("Port_3B", "Input_3B", "J1_06", "AD3"),
    ("Port_4A", "Input_4A", "J1_07", "AD3"),
    ("Port_4B", "Input_4B", "J1_08", "AD3"),
]


def rigol_set_cmd(channel: int, volts: float, current_a: float, output: str, settle_s: float) -> str:
    conn_mode = RIGOL_CONNECTION.strip().lower()
    if conn_mode == "ip":
        transport_mode = RIGOL_TRANSPORT.strip().lower()
        if transport_mode not in {"auto", "socket", "visa"}:
            raise ValueError(f"Unsupported RIGOL_TRANSPORT: {RIGOL_TRANSPORT!r} (use 'auto', 'socket', or 'visa').")
        if transport_mode == "visa":
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
        + str(channel)
        + " --voltage "
        + f"{volts:.2f}"
        + " --current "
        + f"{current_a:.3f}"
        + " --output "
        + output
        + " --settle "
        + f"{settle_s:.3f}"
        + " --retries "
        + str(RIGOL_RETRIES)
        + " --retry-delay "
        + f"{RIGOL_RETRY_DELAY_S:.3f}"
        + "\n"
    )


def send_can_cmd(can_id: str, payload: str) -> str:
    return "SEND_CAN CH0 " + can_id + " " + payload + "\n"


def cmd0_poll(wait_s: float = 0.30, expect_response: bool = True) -> str:
    text = ""
    text += send_can_cmd(CTRL1_CMD0_CAN_ID, CTRL1_CMD0_BYTES_RAW)
    text += "Command = 0 : NULL : WAIT = " + f"{wait_s:.2f}" + "\n"
    if expect_response:
        text += "NULL : Response = 0 | 0.1 | 0.3\n"
    return text


all_input_relays_off = "J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0"

outstr = ""
outstr += "#43009-1\n"
outstr += "#Version 0.1\n"
outstr += "#Low Voltage Hold AD2/AD3 clear check using INPUT-ALL relay method at 2.5V\n"
outstr += "#Per input: verify normal 2.5V reading, force low-voltage-hold, verify AD2/AD3 ports clear to 0\n"
outstr += "UUT_DBC = 43009-560.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#-----setup PAT fixture-----\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#keep PAT bench supply path off (Rigol provides battery/input voltages)\n"
outstr += "PwrRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "PwrSetCurrent = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#initialize Rigol channels\n"
outstr += rigol_set_cmd(BATTERY_CH, NOMINAL_BATTERY_V, BATTERY_CURRENT_A, "on", settle_s=0.300)
outstr += rigol_set_cmd(INPUT_CH, 0.00, INPUT_CURRENT_A, "off", settle_s=0.050)
outstr += "\n"

outstr += "#initialize relays\n"
outstr += "J4_03 = 1 : NULL : WAIT = 0.2\n"
outstr += "J4_01 = 0 : NULL : WAIT = 0.1\n"
outstr += all_input_relays_off + " : NULL : WAIT = 0.2\n"
outstr += "\n"

outstr += "#one-time enable of telemetry; then switch to Command=0 polling for the rest of the test\n"
outstr += cmd0_poll(wait_s=0.30, expect_response=True)
outstr += "Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, Enable_DPLF2 = 1, Enable_FAULT = 1 : NULL : WAIT = 0.5\n"
outstr += "NULL : Response = 1 | 0.1 | 0.5\n"
outstr += cmd0_poll(wait_s=0.40, expect_response=True)
outstr += "\n"

for feedback, status, relay, ad_group in PORTS:
    outstr += "#-----" + feedback + f" ({ad_group}) low-voltage-hold clear check-----\n"
    outstr += all_input_relays_off + " : NULL : WAIT = 0.1\n"
    outstr += relay + " = 1 : NULL : WAIT = 0.1\n"
    outstr += "J4_01 = 1 : NULL : WAIT = 0.1\n"
    outstr += rigol_set_cmd(INPUT_CH, INPUT_V, INPUT_CURRENT_A, "on", settle_s=0.050)
    outstr += cmd0_poll(wait_s=0.40, expect_response=True)
    outstr += "NULL : MeterVolts = " + f"{INPUT_V:.2f}" + " | " + METER_TOL + " | 0.2\n"
    outstr += "NULL : " + feedback + " = " + f"{INPUT_V:.2f}" + " | " + PORT_TOL + " | 0.2\n"
    outstr += "NULL : " + status + " = 1 | 0.1 | 0.2\n"
    outstr += "\n"

    outstr += "#enter low-voltage hold (<8V for >=8s) while continuously polling Command=0\n"
    outstr += rigol_set_cmd(BATTERY_CH, HOLD_BATTERY_V, BATTERY_CURRENT_A, "on", settle_s=0.100)
    for _ in range(HOLD_POLL_COUNT):
        outstr += cmd0_poll(wait_s=HOLD_POLL_WAIT_S, expect_response=True)

    outstr += "#fault and input-clear checks during hold\n"
    outstr += "NULL : Active_Fault_Code = 21 | 0.1 | 0.6\n"
    for verify_feedback, verify_status, _, _ in PORTS:
        outstr += "NULL : " + verify_feedback + " = 0.00 | " + ZERO_TOL + " | 0.2\n"
        outstr += "NULL : " + verify_status + " = 0 | 0.1 | 0.2\n"
    outstr += "\n"

    outstr += "#recover battery and verify selected input resumes normal reporting\n"
    outstr += rigol_set_cmd(BATTERY_CH, NOMINAL_BATTERY_V, BATTERY_CURRENT_A, "on", settle_s=0.250)
    outstr += cmd0_poll(wait_s=0.60, expect_response=True)
    outstr += "NULL : " + feedback + " = " + f"{INPUT_V:.2f}" + " | " + PORT_TOL + " | 0.3\n"
    outstr += "NULL : " + status + " = 1 | 0.1 | 0.3\n"
    outstr += "\n"

    outstr += "#clear relay routing before next input\n"
    outstr += relay + " = 0 : NULL : WAIT = 0.1\n"
    outstr += "J4_01 = 0 : NULL : WAIT = 0.1\n"
    outstr += rigol_set_cmd(INPUT_CH, 0.00, INPUT_CURRENT_A, "off", settle_s=0.050)
    outstr += "\n"

outstr += "#-----teardown-----\n"
outstr += all_input_relays_off + " : NULL : WAIT = 0.2\n"
outstr += "J4_01 = 0 : NULL : WAIT = 0.1\n"
outstr += "J4_03 = 0 : NULL : WAIT = 0.2\n"
outstr += rigol_set_cmd(INPUT_CH, 0.00, INPUT_CURRENT_A, "off", settle_s=0.050)
outstr += rigol_set_cmd(BATTERY_CH, NOMINAL_BATTERY_V, BATTERY_CURRENT_A, "on", settle_s=0.200)
outstr += "\n"

outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrSetCurrent = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1\n"
outstr += "PwrRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "SAVE\n"
outstr += "END\n"

with open(datafile, "w", encoding="utf-8", newline="\n") as f:
    f.write(outstr)

print(outstr)
print(TestName + ".pat")
