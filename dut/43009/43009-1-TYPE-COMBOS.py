import os


script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
script_dir = os.path.dirname(os.path.abspath(__file__))
datafile = os.path.join(script_dir, TestName + ".pat")


PWS_REQUEST_CAN_ID = "0x0CEAFFFF"
#PWS_REQUEST_BYTES = "0 254 172 0 0 0 0 0"  # Request FEAC
PWS_REQUEST_BYTES = "172 254 0 0 0 0 0 0"  # Request FEAC
# Firmware rejects controller SA 0x00. Use fixed controller SA 0xD1.
CTRL1_CMD0_CAN_ID = "0x18EFD9D1"
# Probe both command-byte encodings observed in the field docs/tools.
CTRL1_CMD0_BYTES_RAW = "0 0 0 0 0 0 0 0"
SUPPLY_V = 1.50
SUPPLY_SET_COUNTS = int(round(SUPPLY_V * 10.0))  # PAT supply uses 0.1 V units

METER_TOL = "0.080"
PORT_TOL = "0.150"
# Requirement 5.5.3.c: values below 0.800 V are invalid.
INVALID_INPUT_MAX_V = 0.800
INACTIVE_PORT_TOL = f"{(INVALID_INPUT_MAX_V - 0.050):.3f}"
COUNT_TOL = "1.0"
COUNT_ACTIVE = 80.0
# Raw value 255 is "invalid/faulted" in the DBC, which decodes to 102.0%.
COUNT_INACTIVE = 102.0
REQUESTS_PER_COMBO = 2
WARMUP_REQUESTS_PER_COMBO = 1
RELAY_SETTLE_WAIT_S = 0.35
A_MODE_SETTLE_WAIT_S = 1.00
POST_REQUEST_SETTLE_S = 0.40
AD3_LABELS = {"3A", "3B", "4A", "4B"}
AD4_SIGNALS = ("Spwr1", "Spwr2", "Spwr3", "Spwr4")
AD4_EXPECTED_V = 5.00
AD4_TOL = "0.200"

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


def pws_request_cmd() -> str:
    return "SEND_CAN CH0 " + PWS_REQUEST_CAN_ID + " " + PWS_REQUEST_BYTES + "\n"


def send_can_cmd(can_id: str, payload: str) -> str:
    return "SEND_CAN CH0 " + can_id + " " + payload + "\n"


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
outstr += f"#WheelBrakeLiningRemaining count-position combination test (PAT supply fixed {SUPPLY_V:.2f}V)\n"
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

outstr += "#-----setup pat-----\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#use PAT bench supply as test source\n"
outstr += "PwrRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "PwrSetCurrent = 100 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.5\n"
outstr += "\n"

outstr += "J4_03 = 1 : NULL : WAIT = 0.2\n"
outstr += relay_assignments(set()) + " : NULL : WAIT = 0.2\n"
outstr += "\n"

outstr += "#enable all input processing features used by this test\n"
outstr += "Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, Enable_DPLF2 = 1, Enable_FAULT = 1 : NULL : WAIT = 0.5\n"
outstr += "\n"

outstr += "#set fixed test voltage\n"
outstr += f"PwrSetVoltage = {SUPPLY_SET_COUNTS} : NULL : WAIT = 0.3\n"
outstr += "NULL : MeterVolts = " + f"{SUPPLY_V:.2f}" + " | " + METER_TOL + " | 0.2\n"
outstr += "#verify AD4 sensor-power telemetry\n"
for spwr in AD4_SIGNALS:
    outstr += "NULL : " + spwr + " = " + f"{AD4_EXPECTED_V:.2f}" + " | " + AD4_TOL + " | 0.1\n"
outstr += "\n"

combo_total = 1 << len(PORTS)
prev_use_type2 = False

for mask in range(combo_total):
    active_labels = {PORTS[i]["label"] for i in range(len(PORTS)) if (mask & (1 << i))}
    use_type2, expected = expected_counts(active_labels)
    mode_name = "Type2" if use_type2 else "Type1"
    combo_name = "NONE" if not active_labels else ",".join(TYPE2_ORDER[i] for i in range(8) if TYPE2_ORDER[i] in active_labels)
    entering_type2 = use_type2 and (not prev_use_type2)
    settle_wait = A_MODE_SETTLE_WAIT_S if entering_type2 else RELAY_SETTLE_WAIT_S

    outstr += f"#combo {mask:03d}/{combo_total - 1:03d} active={combo_name} mode={mode_name}\n"
    outstr += relay_assignments(active_labels) + " : NULL : WAIT = " + f"{settle_wait:.2f}" + "\n"
    outstr += "NULL : MeterVolts = " + f"{SUPPLY_V:.2f}" + " | " + METER_TOL + " | 0.1\n"

    for p in PORTS:
        expected_status = "1" if p["label"] in active_labels else "0"
        outstr += "NULL : " + p["status"] + " = " + expected_status + " | 0.1 | 0.1\n"

    for p in PORTS:
        if p["label"] in active_labels and p["label"] not in AD3_LABELS:
            outstr += "NULL : " + p["feedback"] + " = " + f"{SUPPLY_V:.2f}" + " | " + PORT_TOL + " | 0.1\n"

    # Explicit AD3 checks (Port_3A..Port_4B) to enforce valid/invalid voltage
    # behavior that drives Type1 vs Type2 count-byte mapping.
    for p in PORTS:
        if p["label"] in AD3_LABELS:
            if p["label"] in active_labels:
                outstr += "NULL : " + p["feedback"] + " = " + f"{SUPPLY_V:.2f}" + " | " + PORT_TOL + " | 0.1\n"
            else:
                outstr += "NULL : " + p["feedback"] + " = 0.00 | " + INACTIVE_PORT_TOL + " | 0.1\n"

    outstr += "#request WheelBrakeLiningRemaining PGN (FEAC) warm-up (discard)\n"
    for _ in range(WARMUP_REQUESTS_PER_COMBO):
        outstr += pws_request_cmd()
    outstr += "NULL : MeterVolts = " + f"{SUPPLY_V:.2f}" + " | " + METER_TOL + " | 0.1\n"

    outstr += "#request WheelBrakeLiningRemaining PGN (FEAC) for validation\n"
    for _ in range(REQUESTS_PER_COMBO):
        outstr += pws_request_cmd()
    # Hold after requests so count bytes are sampled from a fresh updated frame
    # instead of a transition-era stale response.
    outstr += "NULL : MeterVolts = " + f"{SUPPLY_V:.2f}" + " | " + METER_TOL + " | " + f"{POST_REQUEST_SETTLE_S:.2f}" + "\n"

    for idx in range(1, 9):
        sig = f"Count{idx}"
        outstr += "NULL : " + sig + " = " + f"{expected[sig]:.1f}" + " | " + COUNT_TOL + " | 0.1\n"

    outstr += "\n"
    prev_use_type2 = use_type2

outstr += "#restore safe state\n"
outstr += relay_assignments(set()) + " : NULL : WAIT = 0.2\n"
outstr += "PwrSetVoltage = 0 : NULL : WAIT = 0.2\n"
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
