import os


script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
script_dir = os.path.dirname(os.path.abspath(__file__))
datafile = os.path.join(script_dir, TestName + ".pat")


RIGOL_SCRIPT = "dp800/rigol_dp800_set_ch.py"
RIGOL_CONNECTION = "ip"  # "ip" or "usb"
RIGOL_IP = "192.168.45.197"
RIGOL_RESOURCE = "USB0::0x1AB1::0x0E11::DP8C180100022::INSTR"
RIGOL_TRANSPORT = "visa"  # "auto", "socket", or "visa" (IP mode only)
RIGOL_SOCKET_PORTS = "5025,5555"
RIGOL_CHANNEL = 2
RIGOL_CURRENT_A = 1.0
RIGOL_SETTLE_S = 0.050
RIGOL_RETRIES = 8
RIGOL_RETRY_DELAY_S = 0.50
RIGOL_RELAY = "J4_01"

PWS_REQUEST_CAN_ID = "0x0CEAFFFF"
PWS_REQUEST_BYTES = "0 254 172 0 0 0 0 0"  # Request FEAC

ACTIVE_V = 1.00
METER_TOL = "0.050"
PORT_TOL = "0.080"
COUNT_TOL = "2.0"
COUNT_ACTIVE = 100.0
# Raw value 255 is "invalid/faulted" in the DBC, which decodes to 102.0%.
COUNT_INACTIVE = 102.0
REQUESTS_PER_COMBO = 2

PORTS = [
    {"label": "1A", "feedback": "Port_1A", "status": "Input_1A", "relay": "J1_01"},
    {"label": "1B", "feedback": "Port_1B", "status": "Input_1B", "relay": "J1_02"},
    {"label": "2A", "feedback": "Port_2A", "status": "Input_2A", "relay": "J1_03"},
    {"label": "2B", "feedback": "Port_2B", "status": "Input_2B", "relay": "J1_04"},
    {"label": "3A", "feedback": "Port_3A", "status": "Input_3A", "relay": "J1_05"},
    {"label": "3B", "feedback": "Port_3B", "status": "Input_3B", "relay": "J1_06"},
    {"label": "4A", "feedback": "Port_4A", "status": "Input_4A", "relay": "J1_07"},
    {"label": "4B", "feedback": "Port_4B", "status": "Input_4B", "relay": "J1_08"},
]

TYPE2_ORDER = ["1A", "1B", "2A", "2B", "3A", "3B", "4A", "4B"]
TYPE1_B_MAP = {"1B": 1, "2B": 2, "3B": 3, "4B": 4}


def rigol_set_cmd(volts: float, output: str = "on", settle_s: float = RIGOL_SETTLE_S) -> str:
    conn_mode = RIGOL_CONNECTION.strip().lower()
    if conn_mode == "ip":
        transport_mode = RIGOL_TRANSPORT.strip().lower()
        if transport_mode not in {"auto", "socket", "visa"}:
            raise ValueError(f"Unsupported RIGOL_TRANSPORT: {RIGOL_TRANSPORT!r}")
        if transport_mode == "visa":
            target = " --resource " + f"TCPIP0::{RIGOL_IP}::INSTR"
        else:
            target = " --ip " + RIGOL_IP
            target += " --transport " + transport_mode
            target += " --socket-ports " + RIGOL_SOCKET_PORTS
    elif conn_mode == "usb":
        target = " --resource " + RIGOL_RESOURCE
    else:
        raise ValueError(f"Unsupported RIGOL_CONNECTION: {RIGOL_CONNECTION!r}")

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
        + f"{RIGOL_RETRY_DELAY_S:.3f}"
        + "\n"
    )


def pws_request_cmd() -> str:
    return "SEND_CAN CH0 " + PWS_REQUEST_CAN_ID + " " + PWS_REQUEST_BYTES + "\n"


def count_signal_for_label(label: str, use_type2: bool) -> str | None:
    if use_type2:
        idx = TYPE2_ORDER.index(label) + 1
        return f"Count{idx}"
    b_idx = TYPE1_B_MAP.get(label)
    return f"Count{b_idx}" if b_idx is not None else None


def expected_counts(active_labels: set[str]) -> tuple[bool, dict[str, float]]:
    use_type2 = any(lbl.endswith("A") for lbl in active_labels)
    expected = {f"Count{i}": COUNT_INACTIVE for i in range(1, 9)}
    for label in active_labels:
        sig = count_signal_for_label(label, use_type2)
        if sig:
            expected[sig] = COUNT_ACTIVE
    return use_type2, expected


def relay_assignments(active_labels: set[str]) -> str:
    assigns = []
    for p in PORTS:
        val = "1" if p["label"] in active_labels else "0"
        assigns.append(f"{p['relay']} = {val}")
    return ", ".join(assigns)


outstr = ""
outstr += "#43009-1\n"
outstr += "#Version 0.1\n"
outstr += "#WheelBrakeLiningRemaining count-position combination test (Rigol DP800 fixed 1.00V)\n"
outstr += "UUT_DBC = 43009-560.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#-----setup pat-----\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#keep PAT bench supply path off (Rigol drives test voltage)\n"
outstr += "PwrRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "PwrSetCurrent = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#force Rigol to known-safe state before routing\n"
outstr += rigol_set_cmd(0.0, output="off", settle_s=0.050)
outstr += "\n"

outstr += "J4_03 = 1 : NULL : WAIT = 0.2\n"
outstr += f"{RIGOL_RELAY} = 0 : NULL : WAIT = 0.1\n"
outstr += relay_assignments(set()) + " : NULL : WAIT = 0.2\n"
outstr += "\n"

outstr += "#record firmware identifiers in test log\n"
outstr += "Command = 0 : NULL : WAIT = 0.5\n"
outstr += "NULL : Response = 0 | 0.1 | 0.3\n"
outstr += "NULL : Software_Version = 0 | 255 | 0.3\n"
outstr += "NULL : Software_Revision = 0 | 255 | 0.3\n"
outstr += "\n"

outstr += "#enable all input processing features used by this test\n"
outstr += "Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, Enable_DPLF2 = 1, Enable_FAULT = 1 : NULL : WAIT = 0.5\n"
outstr += "\n"

outstr += "#route Rigol and set fixed test voltage\n"
outstr += f"{RIGOL_RELAY} = 1 : NULL : WAIT = 0.1\n"
outstr += rigol_set_cmd(ACTIVE_V, output="on", settle_s=0.050)
outstr += "NULL : MeterVolts = " + f"{ACTIVE_V:.2f}" + " | " + METER_TOL + " | 0.2\n"
outstr += "\n"

combo_total = 1 << len(PORTS)

for mask in range(combo_total):
    active_labels = {PORTS[i]["label"] for i in range(len(PORTS)) if (mask & (1 << i))}
    use_type2, expected = expected_counts(active_labels)
    mode_name = "Type2" if use_type2 else "Type1"
    combo_name = "NONE" if not active_labels else ",".join(TYPE2_ORDER[i] for i in range(8) if TYPE2_ORDER[i] in active_labels)

    outstr += f"#combo {mask:03d}/{combo_total - 1:03d} active={combo_name} mode={mode_name}\n"
    outstr += relay_assignments(active_labels) + " : NULL : WAIT = 0.2\n"
    outstr += "NULL : MeterVolts = " + f"{ACTIVE_V:.2f}" + " | " + METER_TOL + " | 0.1\n"

    for p in PORTS:
        expected_status = "1" if p["label"] in active_labels else "0"
        outstr += "NULL : " + p["status"] + " = " + expected_status + " | 0.1 | 0.1\n"

    for p in PORTS:
        if p["label"] in active_labels:
            outstr += "NULL : " + p["feedback"] + " = " + f"{ACTIVE_V:.2f}" + " | " + PORT_TOL + " | 0.1\n"

    outstr += "#request WheelBrakeLiningRemaining PGN (FEAC)\n"
    for _ in range(REQUESTS_PER_COMBO):
        outstr += pws_request_cmd()

    for idx in range(1, 9):
        sig = f"Count{idx}"
        outstr += "NULL : " + sig + " = " + f"{expected[sig]:.1f}" + " | " + COUNT_TOL + " | 0.1\n"

    outstr += "\n"

outstr += "#restore safe state\n"
outstr += relay_assignments(set()) + " : NULL : WAIT = 0.2\n"
outstr += rigol_set_cmd(0.0, output="off", settle_s=0.050)
outstr += f"{RIGOL_RELAY} = 0 : NULL : WAIT = 0.1\n"
outstr += "\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#tear down bench setup\n"
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrSetCurrent = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1\n"
outstr += "PwrRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "J4_03 = 0 : NULL : WAIT = 0.2\n"
outstr += "SAVE\n"
outstr += "END\n"

with open(datafile, "w", encoding="utf-8", newline="\n") as f:
    f.write(outstr)

print(outstr)
print(TestName + ".pat")
