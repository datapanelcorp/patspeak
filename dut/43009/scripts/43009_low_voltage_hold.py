import argparse
import os
from pathlib import Path
import subprocess
import sys
import threading
import time

import can
import cantools


CAN_RECV_TIMEOUT_SEC = 0.02
READ_SLEEP_SEC = 0.001

PGN_ADDRESS_CLAIM = 0x00EE00
PGN_PROPRIETARY_A = 0x00EF00
PGN_DIGIN = 0x00FF15
PGN_AD2 = 0x00FF16
PGN_AD3 = 0x00FF17
PGN_DPLF2 = 0x00FFFC

CTRL_CMD0_PAYLOAD = [0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
CTRL_ENABLE_PAYLOAD = [0x81, 0x54, 0x00, 0x05, 0x01, 0x00, 0x00, 0x45]

FAULT_LOW_VOLTAGE_HOLD = 41

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

ALL_J1_SIGNALS = [f"J1_0{i}" for i in range(1, 9)]
ALL_PORT_SIGNALS = [p[0] for p in PORTS]
ALL_INPUT_SIGNALS = [p[1] for p in PORTS]


def _parse_can_channel(value):
    text = str(value).strip()
    if text == "":
        return text
    if text.lower().startswith("0x"):
        try:
            return int(text, 16)
        except ValueError:
            return text
    if text.isdigit():
        return int(text)
    return text


def _parse_int_auto(value):
    text = str(value).strip()
    base = 16 if text.lower().startswith("0x") else 10
    return int(text, base)


def _workspace_home_from_script():
    try:
        return Path(__file__).resolve().parents[3]
    except Exception:
        return Path.cwd()


def format_error(exc):
    return f"{type(exc).__name__}: {exc}"


def emit_result(passed):
    if passed:
        print("PATSPEAK_RESULT=PASS")
        return 0
    print("PATSPEAK_RESULT=FAIL")
    return 1


def parse_args():
    default_interface = str(os.environ.get("PATSPEAK_CAN_INTERFACE", "kvaser")).strip().lower() or "kvaser"
    default_ch0 = os.environ.get("PATSPEAK_CAN_CH0", "0")
    default_ch1 = os.environ.get("PATSPEAK_CAN_CH1", "1")
    default_bitrate = int(os.environ.get("PATSPEAK_CAN_BITRATE", "250000"))

    parser = argparse.ArgumentParser(
        description=(
            "43009 Low Voltage Hold AD2/AD3 sweep with direct Python control of "
            "UUT CAN + continuous PAT fixture control messages."
        )
    )

    parser.add_argument("--interface", default=default_interface, help="python-can interface.")
    parser.add_argument("--uut-channel", default=default_ch0, help="UUT CAN channel (CH0).")
    parser.add_argument("--pat-channel", default=default_ch1, help="PAT fixture CAN channel (CH1).")
    parser.add_argument("--bitrate", type=int, default=default_bitrate, help="CAN bitrate.")
    parser.add_argument("--expected-sa", type=_parse_int_auto, default=_parse_int_auto("0xD9"), help="Expected DUT SA.")
    parser.add_argument("--controller-sa", type=_parse_int_auto, default=_parse_int_auto("0xD1"), help="Tester SA.")
    parser.add_argument(
        "--fault-code",
        type=int,
        default=21,
        help="Expected low-voltage fault code (21). Hold code 41 is always accepted in hold phase.",
    )

    parser.add_argument("--pat-dbc", default="", help="Optional PAT.dbc path override.")
    parser.add_argument("--uut-dbc", default="", help="Optional 43009 DBC path override.")
    parser.add_argument("--pat-tx-period-sec", type=float, default=0.05, help="Continuous PAT control TX period.")

    parser.add_argument("--rigol-helper", default="", help="Path to rigol_dp800_set_ch.py override.")
    parser.add_argument("--rigol-connection", choices=["ip", "usb"], default="ip", help="Rigol connection mode.")
    parser.add_argument("--rigol-ip", default="192.168.45.178", help="Rigol LAN IP/hostname.")
    parser.add_argument(
        "--rigol-transport",
        choices=["auto", "socket", "visa"],
        default="visa",
        help="Rigol transport for --rigol-connection ip.",
    )
    parser.add_argument("--rigol-socket-ports", default="5025,5555", help="SCPI socket port list.")
    parser.add_argument(
        "--rigol-resource",
        default="USB0::0x1AB1::0x0E11::DP8C180100022::INSTR",
        help="Rigol VISA resource (USB mode).",
    )
    parser.add_argument("--rigol-channel", type=int, choices=[1, 2, 3], default=1, help="Rigol output channel.")
    parser.add_argument("--rigol-current-a", type=float, default=2.0, help="Rigol current limit.")
    parser.add_argument("--rigol-settle-sec", type=float, default=0.30, help="Rigol settle time.")
    parser.add_argument("--rigol-retries", type=int, default=8, help="Rigol helper retries.")
    parser.add_argument("--rigol-retry-delay-sec", type=float, default=0.50, help="Rigol retry delay.")
    parser.set_defaults(rigol_quiet=True)
    parser.add_argument("--rigol-quiet", dest="rigol_quiet", action="store_true", help="Quiet Rigol helper output.")
    parser.add_argument("--no-rigol-quiet", dest="rigol_quiet", action="store_false", help="Verbose Rigol helper output.")

    parser.add_argument("--nominal-voltage", type=float, default=13.0, help="Nominal battery voltage.")
    parser.add_argument("--powerup-hold-voltage", type=float, default=8.5, help="Power-up voltage below 9.0V.")
    parser.add_argument("--release-voltage", type=float, default=12.0, help="Voltage used to exit power-up hold.")
    parser.add_argument("--low-fault-voltage", type=float, default=9.5, help="Voltage used for low-voltage-fault phase.")
    parser.add_argument(
        "--low-fault-threshold-voltage",
        type=float,
        default=10.0,
        help="Low-voltage fault threshold used for the below-threshold timing check.",
    )
    parser.add_argument(
        "--low-fault-min-sec",
        type=float,
        default=8.0,
        help="Minimum time below low-fault threshold before expecting low-voltage fault code.",
    )
    parser.add_argument("--hold-voltage", type=float, default=7.8, help="Voltage used to trigger low voltage hold.")
    parser.add_argument("--input-voltage", type=float, default=2.50, help="Input sweep voltage in volts.")
    parser.add_argument(
        "--hold-fault-code",
        type=int,
        default=FAULT_LOW_VOLTAGE_HOLD,
        help="Expected low-voltage-hold fault code (default 41).",
    )

    parser.add_argument("--power-off-wait-sec", type=float, default=2.0, help="Power-off dwell before power-up hold check.")
    parser.add_argument("--powerup-hold-check-sec", type=float, default=12.0, help="No-address-claim window below 9.0V.")
    parser.add_argument("--release-claim-timeout-sec", type=float, default=45.0, help="Timeout waiting for address claim after voltage release.")
    parser.add_argument("--low-fault-dwell-sec", type=float, default=10.0, help="Observe window at low-fault voltage.")

    parser.add_argument("--post-enable-quiet-sec", type=float, default=3.0, help="No CTRL TX time after one-shot Command=1.")
    parser.add_argument("--enable-timeout-sec", type=float, default=8.0, help="Timeout waiting for STAT Response=0.")
    parser.add_argument("--cmd0-period-sec", type=float, default=0.20, help="Command=0 poll period.")
    parser.add_argument("--precheck-sec", type=float, default=1.50, help="Baseline check window per input.")
    parser.add_argument("--hold-duration-sec", type=float, default=9.5, help="Hold window below 8V.")
    parser.add_argument("--recovery-sec", type=float, default=1.50, help="Recovery check window per input.")
    parser.add_argument("--recovery-observe-sec", type=float, default=10.0, help="Recovery observe window for low-voltage-hold behavior check.")
    parser.add_argument("--claim-timeout-sec", type=float, default=45.0, help="Address claim timeout.")
    parser.add_argument("--max-silence-sec", type=float, default=2.5, help="Allowed max DUT CAN silence in behavior phases.")
    parser.add_argument("--input-tol", type=float, default=0.150, help="Allowed input voltage tolerance in volts.")
    parser.add_argument("--zero-tol", type=float, default=0.150, help="Allowed hold-zero tolerance in volts.")

    parser.set_defaults(cycle_k1=True)
    parser.add_argument("--cycle-k1", dest="cycle_k1", action="store_true", help="Cycle K1 at startup.")
    parser.add_argument("--no-cycle-k1", dest="cycle_k1", action="store_false", help="Skip K1 cycle.")

    parser.add_argument(
        "--cleanup-rigol",
        choices=["leave", "nominal", "off"],
        default="leave",
        help="Rigol cleanup action on exit.",
    )
    parser.add_argument("--dry-run", action="store_true", help="Validate configuration and exit without hardware I/O.")

    args = parser.parse_args()
    args.uut_channel = _parse_can_channel(args.uut_channel)
    args.pat_channel = _parse_can_channel(args.pat_channel)

    if args.hold_duration_sec < 8.0:
        raise ValueError("--hold-duration-sec must be >= 8.0.")
    if args.low_fault_min_sec <= 0:
        raise ValueError("--low-fault-min-sec must be > 0.")
    if args.low_fault_dwell_sec < args.low_fault_min_sec:
        raise ValueError("--low-fault-dwell-sec must be >= --low-fault-min-sec.")
    if args.cmd0_period_sec <= 0:
        raise ValueError("--cmd0-period-sec must be > 0.")
    if args.pat_tx_period_sec <= 0:
        raise ValueError("--pat-tx-period-sec must be > 0.")
    if args.input_voltage < 0:
        raise ValueError("--input-voltage must be >= 0.")
    if args.max_silence_sec <= 0:
        raise ValueError("--max-silence-sec must be > 0.")

    return args


def open_can_bus(interface, channel, bitrate):
    try:
        return can.Bus(interface=interface, channel=channel, bitrate=bitrate)
    except TypeError:
        return can.Bus(bustype=interface, channel=channel, bitrate=bitrate)


def build_j1939_id(priority, pgn, source_address, destination_address=None):
    data_page = (pgn >> 16) & 0x01
    pdu_format = (pgn >> 8) & 0xFF
    if pdu_format < 240:
        if destination_address is None:
            raise ValueError("destination_address is required for PDU1 PGNs")
        pdu_specific = destination_address & 0xFF
    else:
        pdu_specific = pgn & 0xFF

    can_id = ((priority & 0x7) << 26)
    can_id |= (data_page << 24)
    can_id |= (pdu_format << 16)
    can_id |= (pdu_specific << 8)
    can_id |= (source_address & 0xFF)
    return can_id


def parse_j1939_id(can_id):
    can_id &= 0x1FFFFFFF
    source_address = can_id & 0xFF
    pdu_specific = (can_id >> 8) & 0xFF
    pdu_format = (can_id >> 16) & 0xFF
    data_page = (can_id >> 24) & 0x01

    if pdu_format < 240:
        pgn = (data_page << 16) | (pdu_format << 8)
        destination_address = pdu_specific
    else:
        pgn = (data_page << 16) | (pdu_format << 8) | pdu_specific
        destination_address = None
    return pgn, source_address, destination_address


def write_ext_message(bus, can_id, data_bytes):
    message = can.Message(arbitration_id=can_id, is_extended_id=True, data=data_bytes)
    try:
        bus.send(message)
        return True, None
    except can.CanError as exc:
        return False, format_error(exc)


def poll_bus_once(bus):
    try:
        message = bus.recv(timeout=CAN_RECV_TIMEOUT_SEC)
    except can.CanError as exc:
        print(f"[WARN] CAN read error: {format_error(exc)}")
        return None, None
    if message is None:
        return None, None
    return message, time.monotonic()


def resolve_path(explicit_path, *fallback_parts):
    if explicit_path:
        p = Path(explicit_path).expanduser()
        if p.exists():
            return p.resolve()
        return None
    candidate = _workspace_home_from_script().joinpath(*fallback_parts)
    if candidate.exists():
        return candidate.resolve()
    return None


def resolve_rigol_helper(explicit_path):
    return resolve_path(explicit_path, "scripts", "pat_scripts", "dp800", "rigol_dp800_set_ch.py")


def set_rigol_voltage(args, helper_path, voltage, output):
    cmd = [sys.executable, "-u", str(helper_path)]
    if args.rigol_connection == "ip":
        if args.rigol_transport == "visa":
            cmd += ["--resource", f"TCPIP0::{args.rigol_ip}::INSTR"]
        else:
            cmd += ["--ip", args.rigol_ip, "--transport", args.rigol_transport, "--socket-ports", args.rigol_socket_ports]
    else:
        cmd += ["--resource", args.rigol_resource]

    cmd += [
        "--channel",
        str(args.rigol_channel),
        "--voltage",
        f"{float(voltage):.3f}",
        "--current",
        f"{float(args.rigol_current_a):.3f}",
        "--output",
        output,
        "--settle",
        f"{float(args.rigol_settle_sec):.3f}",
        "--retries",
        str(int(args.rigol_retries)),
        "--retry-delay",
        f"{float(args.rigol_retry_delay_sec):.3f}",
    ]
    if args.rigol_quiet:
        cmd.append("--quiet")

    print(f"Rigol CH{args.rigol_channel}: {float(voltage):.2f}V output={output}")
    completed = subprocess.run(cmd, capture_output=True, text=True, check=False)
    if completed.returncode == 0:
        if not args.rigol_quiet and completed.stdout:
            print(completed.stdout.strip())
        return True

    print(f"[FAIL] Rigol helper failed (rc={completed.returncode}).")
    if completed.stdout:
        print(completed.stdout.rstrip())
    if completed.stderr:
        print(completed.stderr.rstrip())
    return False


class ContinuousPatController:
    CONTROL_MESSAGES = ("PAT_J0", "PAT_J1", "PAT_J4", "CTRL_SUPPLY", "CTRL_LOAD", "CTRL_RLY")

    def __init__(self, bus, dbc_path, tx_period_sec):
        self.bus = bus
        self.tx_period_sec = float(tx_period_sec)
        self.db = cantools.database.load_file(str(dbc_path), strict=False)
        self.messages = {}
        self.signal_to_message = {}
        self.state = {}
        for name in self.CONTROL_MESSAGES:
            msg = self.db.get_message_by_name(name)
            self.messages[name] = msg
            msg_values = {}
            for sig in msg.signals:
                msg_values[sig.name] = int(sig.initial) if getattr(sig, "initial", None) is not None else 0
                self.signal_to_message[sig.name] = name
            self.state[name] = msg_values
        self._lock = threading.Lock()
        self._stop = threading.Event()
        self._thread = None
        self.tx_failures = 0

    def _encode_message(self, msg_name, values):
        msg = self.messages[msg_name]
        data = msg.encode(values, scaling=True, strict=False)
        can_id = int(msg.frame_id) & 0x1FFFFFFF
        return can_id, bytes(data)

    def _send_snapshot_once(self, snapshot):
        for msg_name in self.CONTROL_MESSAGES:
            can_id, data = self._encode_message(msg_name, snapshot[msg_name])
            ok, err = write_ext_message(self.bus, can_id, data)
            if not ok:
                self.tx_failures += 1
                if self.tx_failures <= 3:
                    print(f"[WARN] PAT TX failed for {msg_name}: {err}")

    def _run(self):
        while not self._stop.is_set():
            t0 = time.monotonic()
            with self._lock:
                snapshot = {k: dict(v) for k, v in self.state.items()}
            self._send_snapshot_once(snapshot)
            elapsed = time.monotonic() - t0
            sleep_s = self.tx_period_sec - elapsed
            if sleep_s > 0:
                self._stop.wait(sleep_s)

    def start(self):
        if self._thread is not None:
            return
        self._thread = threading.Thread(target=self._run, name="pat-controller", daemon=True)
        self._thread.start()

    def stop(self):
        self._stop.set()
        if self._thread is not None:
            self._thread.join(timeout=max(1.0, self.tx_period_sec * 20.0))

    def set_signals(self, updates):
        with self._lock:
            for signal_name, value in updates.items():
                msg_name = self.signal_to_message.get(signal_name)
                if msg_name is None:
                    raise KeyError(f"Unknown PAT signal: {signal_name}")
                self.state[msg_name][signal_name] = int(value)


def wait_for_address_claim(bus, expected_sa, timeout_s):
    deadline = time.monotonic() + float(timeout_s)
    while time.monotonic() < deadline:
        message, rx_time = poll_bus_once(bus)
        if message is None or not message.is_extended_id:
            time.sleep(READ_SLEEP_SEC)
            continue
        pgn, source_address, destination_address = parse_j1939_id(message.arbitration_id)
        if pgn == PGN_ADDRESS_CLAIM and destination_address == 0xFF:
            if expected_sa is None or source_address == expected_sa:
                return source_address, rx_time
    return None, None


def _decode_response_code(stat_data):
    if not stat_data:
        return None
    return int(stat_data[0]) & 0x3F


def _decode_vbat_from_dplf2(data):
    if len(data) < 4:
        return None
    raw = int(data[2]) | ((int(data[3]) & 0x0F) << 8)
    return raw * 0.1


def send_cmd(bus, module_sa, controller_sa, payload):
    cmd_id = build_j1939_id(6, PGN_PROPRIETARY_A, controller_sa, module_sa)
    ok, err = write_ext_message(bus, cmd_id, payload)
    if not ok:
        print(f"[WARN] CTRL TX failed: {err}")
    return ok


class Command0Keepalive:
    def __init__(self, bus, module_sa, controller_sa, period_sec):
        self.bus = bus
        self.module_sa = int(module_sa)
        self.controller_sa = int(controller_sa)
        self.period_sec = float(period_sec)
        self._stop = threading.Event()
        self._thread = None

    def _run(self):
        # Send immediately, then periodically.
        next_send = 0.0
        while not self._stop.is_set():
            now = time.monotonic()
            if now >= next_send:
                send_cmd(self.bus, self.module_sa, self.controller_sa, CTRL_CMD0_PAYLOAD)
                next_send = now + self.period_sec
            sleep_s = max(0.001, min(0.02, next_send - now))
            self._stop.wait(sleep_s)

    def start(self):
        if self._thread is not None:
            return
        self._thread = threading.Thread(target=self._run, name="cmd0-keepalive", daemon=True)
        self._thread.start()

    def stop(self):
        self._stop.set()
        if self._thread is not None:
            self._thread.join(timeout=max(1.0, self.period_sec * 20.0))


def ensure_response_zero(bus, module_sa, controller_sa, timeout_s, cmd0_period_s):
    deadline = time.monotonic() + float(timeout_s)
    next_cmd0 = time.monotonic()
    counts = {}
    while time.monotonic() < deadline:
        now = time.monotonic()
        if now >= next_cmd0:
            send_cmd(bus, module_sa, controller_sa, CTRL_CMD0_PAYLOAD)
            next_cmd0 = now + float(cmd0_period_s)
        message, _ = poll_bus_once(bus)
        if message is None or not message.is_extended_id:
            time.sleep(READ_SLEEP_SEC)
            continue
        pgn, source_address, _ = parse_j1939_id(message.arbitration_id)
        if source_address != module_sa or pgn != PGN_PROPRIETARY_A:
            continue
        rsp = _decode_response_code(bytes(message.data))
        if rsp is None:
            continue
        counts[rsp] = counts.get(rsp, 0) + 1
        if rsp == 0:
            return True, counts
    return False, counts


def observe_window(
    bus,
    module_sa,
    uut_db,
    duration_s,
    controller_sa=None,
    cmd0_period_s=None,
):
    ad2 = uut_db.get_message_by_name("AD2")
    ad3 = uut_db.get_message_by_name("AD3")
    digin = uut_db.get_message_by_name("DIGIN")
    start = time.monotonic()
    out = {
        "fault_codes": set(),
        "last_fault_code": None,
        "response_counts": {},
        "ports": {},
        "inputs": {},
        "dut_frames": 0,
        "max_inter_gap": 0.0,
        "trailing_gap": 0.0,
        "last_dut_rx_time": None,
        "vbat_last": None,
        "vbat_min": None,
        "vbat_max": None,
        "analysis_duration": float(duration_s),
    }
    deadline = start + float(duration_s)
    next_cmd0 = start if (controller_sa is not None and cmd0_period_s is not None) else None
    while time.monotonic() < deadline:
        now = time.monotonic()
        if next_cmd0 is not None and now >= next_cmd0:
            send_cmd(bus, module_sa, controller_sa, CTRL_CMD0_PAYLOAD)
            next_cmd0 = now + float(cmd0_period_s)

        message, rx_time = poll_bus_once(bus)
        if message is None or not message.is_extended_id:
            time.sleep(READ_SLEEP_SEC)
            continue
        pgn, source_address, _ = parse_j1939_id(message.arbitration_id)
        if source_address != module_sa:
            continue
        out["dut_frames"] += 1
        if out["last_dut_rx_time"] is not None:
            gap = float(rx_time - out["last_dut_rx_time"])
            if gap > out["max_inter_gap"]:
                out["max_inter_gap"] = gap
        out["last_dut_rx_time"] = float(rx_time)
        data = bytes(message.data)
        if pgn == PGN_PROPRIETARY_A:
            rsp = _decode_response_code(data)
            if rsp is not None:
                out["response_counts"][rsp] = out["response_counts"].get(rsp, 0) + 1
            if rsp == 0 and len(data) >= 5:
                code = int(data[4]) & 0xFF
                out["fault_codes"].add(code)
                out["last_fault_code"] = code
            continue
        if pgn == PGN_DPLF2:
            vbat = _decode_vbat_from_dplf2(data)
            if vbat is not None:
                out["vbat_last"] = vbat
                if out["vbat_min"] is None or vbat < out["vbat_min"]:
                    out["vbat_min"] = vbat
                if out["vbat_max"] is None or vbat > out["vbat_max"]:
                    out["vbat_max"] = vbat
            continue
        if pgn == PGN_AD2:
            try:
                out["ports"].update(ad2.decode(data, decode_choices=False))
            except Exception:
                pass
            continue
        if pgn == PGN_AD3:
            try:
                out["ports"].update(ad3.decode(data, decode_choices=False))
            except Exception:
                pass
            continue
        if pgn == PGN_DIGIN:
            try:
                out["inputs"].update(digin.decode(data, decode_choices=False))
            except Exception:
                pass
            continue
    end = time.monotonic()
    if out["last_dut_rx_time"] is None:
        out["trailing_gap"] = float(end - start)
    else:
        out["trailing_gap"] = float(end - out["last_dut_rx_time"])
    return out


def continuity_check(observation, max_silence_sec):
    if int(observation["dut_frames"]) < 2:
        return False, f"only {int(observation['dut_frames'])} DUT frame(s) observed"
    worst_gap = max(float(observation["max_inter_gap"]), float(observation["trailing_gap"]))
    if worst_gap > float(max_silence_sec):
        return False, f"worst silence {worst_gap:.3f}s exceeds {float(max_silence_sec):.3f}s"
    return True, f"worst silence {worst_gap:.3f}s"


def low_fault_window_check(observation, threshold_v, min_sec, commanded_voltage=None):
    analysis_duration = float(observation.get("analysis_duration", 0.0))
    if analysis_duration < float(min_sec):
        return False, f"analysis window {analysis_duration:.3f}s is < required {float(min_sec):.3f}s"
    vbat_max = observation.get("vbat_max")
    if vbat_max is not None:
        if float(vbat_max) >= float(threshold_v):
            return False, f"VBAT max {float(vbat_max):.2f}V is not below {float(threshold_v):.2f}V"
        return True, f"VBAT stayed below {float(threshold_v):.2f}V for {analysis_duration:.3f}s"
    if commanded_voltage is not None and float(commanded_voltage) < float(threshold_v):
        return (
            True,
            f"no VBAT samples; used commanded supply {float(commanded_voltage):.2f}V "
            f"< {float(threshold_v):.2f}V for {analysis_duration:.3f}s",
        )
    return False, "no VBAT samples observed and commanded voltage did not prove threshold condition"


def cycle_k1(pat):
    pat.set_signals({"RLY_K1": 0})
    time.sleep(1.0)
    pat.set_signals({"RLY_K1": 1})
    time.sleep(2.0)
    pat.set_signals({"RLY_K1": 0})
    time.sleep(1.0)


def main():
    args = parse_args()

    pat_dbc_path = resolve_path(args.pat_dbc, "dbc", "PAT.dbc")
    uut_dbc_path = resolve_path(args.uut_dbc, "dbc", "43009-560.dbc")
    rigol_helper = resolve_rigol_helper(args.rigol_helper)
    if pat_dbc_path is None or uut_dbc_path is None or rigol_helper is None:
        print("[FAIL] Missing required file(s): PAT.dbc, 43009-560.dbc, or rigol helper.")
        return emit_result(False)

    print("43009 Low Voltage Hold merged verifier (behavior + AD2/AD3 sweep)")
    print(f"UUT CAN: {args.interface} ch={args.uut_channel} @ {args.bitrate}")
    print(f"PAT CAN: {args.interface} ch={args.pat_channel} @ {args.bitrate} (continuous)")
    print(f"Rigol helper: {rigol_helper}")
    print(f"CTRL behavior: one-shot Command=1, quiet {args.post_enable_quiet_sec:.1f}s, then Command=0 polling")
    print(f"Fault acceptance in hold/sweep phases: low fault {args.fault_code}, hold {args.hold_fault_code}")

    if args.dry_run:
        print("Dry-run requested; exiting before opening CAN or touching hardware.")
        return emit_result(True)

    try:
        uut_bus = open_can_bus(args.interface, args.uut_channel, args.bitrate)
    except Exception as exc:
        print(f"[FAIL] Could not open UUT CAN bus: {format_error(exc)}")
        return emit_result(False)

    pat_bus = None
    pat = None
    cmd0_keepalive = None
    overall_pass = True
    behavior_checks = {
        "Power-up below 9.0V blocks address claim": None,
        "Voltage above 9.0V after hold allows address claim": None,
        "Low-voltage fault does not interrupt operation": None,
        "Below 8.0V for 8s enters low-voltage hold": None,
        "CAN transmission continues during low-voltage hold": None,
        "Voltage recovery exits low-voltage hold": None,
    }
    per_port_results = []
    uut_db = cantools.database.load_file(str(uut_dbc_path), strict=False)

    try:
        if str(args.pat_channel) == str(args.uut_channel):
            pat_bus = uut_bus
        else:
            pat_bus = open_can_bus(args.interface, args.pat_channel, args.bitrate)

        pat = ContinuousPatController(pat_bus, pat_dbc_path, args.pat_tx_period_sec)
        pat.start()

        safe_pat = {
            "LdRemote": 0,
            "LdCurrentSet": 0,
            "LdEnable": 0,
            "J0_08_METER_LOAD": 0,
            "PwrRemote": 0,
            "PwrSetCurrent": 0,
            "PwrSetVoltage": 0,
            "PwrEnable": 0,
            "J0_09_TEST_SUPPLY": 0,
            "J4_03": 0,
            "RLY_K1": 0,
        }
        safe_pat.update({s: 0 for s in ALL_J1_SIGNALS})
        pat.set_signals(safe_pat)
        time.sleep(max(0.2, args.pat_tx_period_sec * 4.0))

        if args.cycle_k1:
            print("Cycling K1...")
            cycle_k1(pat)

        print("Setting up PAT fixture paths...")
        pat.set_signals(
            {
                "LdRemote": 1,
                "LdCurrentSet": 0,
                "LdEnable": 0,
                "J0_08_METER_LOAD": 1,
                "PwrRemote": 1,
                "PwrSetCurrent": 100,
                "PwrSetVoltage": 0,
                "PwrEnable": 1,
                "J0_09_TEST_SUPPLY": 1,
                "J4_03": 1,
                **{s: 0 for s in ALL_J1_SIGNALS},
            }
        )
        time.sleep(0.5)

        print("")
        print("Phase 1: Power-up below 9.0V and verify address claim is postponed.")
        if not set_rigol_voltage(args, rigol_helper, args.powerup_hold_voltage, "off"):
            return emit_result(False)
        time.sleep(max(0.0, float(args.power_off_wait_sec)))
        if not set_rigol_voltage(args, rigol_helper, args.powerup_hold_voltage, "on"):
            return emit_result(False)
        claim_sa, _ = wait_for_address_claim(uut_bus, args.expected_sa, args.powerup_hold_check_sec)
        behavior_checks["Power-up below 9.0V blocks address claim"] = claim_sa is None
        if claim_sa is None:
            print("[PASS] No DUT address claim observed while below 9.0V at power-up.")
        else:
            print(f"[FAIL] Address claim appeared early from SA=0x{claim_sa:02X}.")
            overall_pass = False

        print("")
        print("Phase 2: Raise voltage above 9.0V and verify address claim resumes.")
        if not set_rigol_voltage(args, rigol_helper, args.release_voltage, "on"):
            return emit_result(False)
        print("Waiting for DUT address claim...")
        module_sa, _ = wait_for_address_claim(uut_bus, args.expected_sa, args.release_claim_timeout_sec)
        if module_sa is None:
            print("[FAIL] No matching DUT address claim observed.")
            behavior_checks["Voltage above 9.0V after hold allows address claim"] = False
            return emit_result(False)
        behavior_checks["Voltage above 9.0V after hold allows address claim"] = True
        print(f"[PASS] DUT address claim seen from SA=0x{module_sa:02X}")

        send_cmd(uut_bus, module_sa, args.controller_sa, CTRL_ENABLE_PAYLOAD)
        print("Sent one-shot Command=1 enable.")
        time.sleep(max(0.0, float(args.post_enable_quiet_sec)))

        ok_rsp0, rsp_counts = ensure_response_zero(
            uut_bus,
            module_sa,
            args.controller_sa,
            timeout_s=args.enable_timeout_sec,
            cmd0_period_s=args.cmd0_period_sec,
        )
        print(f"STAT response counts after quiet: {rsp_counts}")
        if not ok_rsp0:
            print("[FAIL] Did not observe STAT Response=0 after quiet+Command=0 polling.")
            return emit_result(False)
        print("[PASS] STAT Response=0 observed before sweep.")
        cmd0_keepalive = Command0Keepalive(
            uut_bus,
            module_sa,
            args.controller_sa,
            args.cmd0_period_sec,
        )
        cmd0_keepalive.start()
        print(f"[INFO] Continuous Command=0 keepalive started ({args.cmd0_period_sec:.3f}s period).")

        print("")
        print("Phase 3: Low-voltage fault check (operation should continue).")
        if not set_rigol_voltage(args, rigol_helper, args.low_fault_voltage, "on"):
            behavior_checks["Low-voltage fault does not interrupt operation"] = False
            overall_pass = False
        else:
            low_obs = observe_window(
                uut_bus,
                module_sa,
                uut_db,
                duration_s=args.low_fault_dwell_sec,
                controller_sa=None,
                cmd0_period_s=None,
            )
            continuity_ok, continuity_note = continuity_check(low_obs, args.max_silence_sec)
            saw_fault = int(args.fault_code) in low_obs["fault_codes"]
            low_window_ok, low_window_note = low_fault_window_check(
                low_obs,
                threshold_v=args.low_fault_threshold_voltage,
                min_sec=args.low_fault_min_sec,
                commanded_voltage=args.low_fault_voltage,
            )
            behavior_checks["Low-voltage fault does not interrupt operation"] = continuity_ok and low_window_ok and saw_fault
            if behavior_checks["Low-voltage fault does not interrupt operation"]:
                print(
                    f"[PASS] Low-voltage phase: continuity OK ({continuity_note}), "
                    + f"{low_window_note}, and fault code {args.fault_code} observed."
                )
            else:
                print(
                    "[FAIL] Low-voltage phase: "
                    + f"continuity_ok={continuity_ok} ({continuity_note}), "
                    + f"low_window_ok={low_window_ok} ({low_window_note}), "
                    + f"fault{args.fault_code}_seen={saw_fault}."
                )
                overall_pass = False

        print("")
        print("Phase 4: Drive below 8.0V for >=8s to trigger low-voltage hold.")
        if not set_rigol_voltage(args, rigol_helper, args.hold_voltage, "on"):
            behavior_checks["Below 8.0V for 8s enters low-voltage hold"] = False
            behavior_checks["CAN transmission continues during low-voltage hold"] = False
            overall_pass = False
        else:
            hold_behavior_obs = observe_window(
                uut_bus,
                module_sa,
                uut_db,
                duration_s=args.hold_duration_sec,
                controller_sa=None,
                cmd0_period_s=None,
            )
            hold_fault_seen = (
                int(args.hold_fault_code) in hold_behavior_obs["fault_codes"]
                or FAULT_LOW_VOLTAGE_HOLD in hold_behavior_obs["fault_codes"]
            )
            continuity_ok, continuity_note = continuity_check(hold_behavior_obs, args.max_silence_sec)
            behavior_checks["Below 8.0V for 8s enters low-voltage hold"] = hold_fault_seen
            behavior_checks["CAN transmission continues during low-voltage hold"] = continuity_ok
            if hold_fault_seen:
                print(f"[PASS] Low-voltage-hold fault observed (codes={sorted(hold_behavior_obs['fault_codes'])}).")
            else:
                print(f"[FAIL] Low-voltage-hold fault code not observed (codes={sorted(hold_behavior_obs['fault_codes'])}).")
                overall_pass = False
            if continuity_ok:
                print(f"[PASS] CAN transmission continued in hold ({continuity_note}).")
            else:
                print(f"[FAIL] CAN continuity failed in hold ({continuity_note}).")
                overall_pass = False

        print("")
        print("Phase 5: Recover above 9.0V and verify hold exits.")
        if not set_rigol_voltage(args, rigol_helper, args.nominal_voltage, "on"):
            behavior_checks["Voltage recovery exits low-voltage hold"] = False
            overall_pass = False
        else:
            recovery_behavior_obs = observe_window(
                uut_bus,
                module_sa,
                uut_db,
                duration_s=args.recovery_observe_sec,
                controller_sa=None,
                cmd0_period_s=None,
            )
            continuity_ok, continuity_note = continuity_check(recovery_behavior_obs, args.max_silence_sec)
            last_fault = recovery_behavior_obs["last_fault_code"]
            exited_hold = last_fault is not None and int(last_fault) != int(args.hold_fault_code)
            behavior_checks["Voltage recovery exits low-voltage hold"] = continuity_ok and exited_hold
            if behavior_checks["Voltage recovery exits low-voltage hold"]:
                print(f"[PASS] Recovery phase resumed operation (last fault code={int(last_fault)}; {continuity_note}).")
            else:
                print(
                    "[FAIL] Recovery phase: "
                    + f"continuity_ok={continuity_ok} ({continuity_note}), "
                    + f"last_fault_code={last_fault}."
                )
                overall_pass = False

        if not set_rigol_voltage(args, rigol_helper, args.nominal_voltage, "on"):
            return emit_result(False)
        time.sleep(0.3)

        print("")
        print("Phase 5b: Re-enable telemetry for AD2/AD3 sweep (Command=1 -> quiet -> Command=0).")
        if cmd0_keepalive is not None:
            cmd0_keepalive.stop()
            cmd0_keepalive = None
        send_cmd(uut_bus, module_sa, args.controller_sa, CTRL_ENABLE_PAYLOAD)
        print("Sent one-shot Command=1 re-enable before AD2/AD3 sweep.")
        # Required by DUT behavior: true quiet gap before requesting STAT Response=0.
        time.sleep(max(0.0, float(args.post_enable_quiet_sec)))
        ok_rsp0, rsp_counts = ensure_response_zero(
            uut_bus,
            module_sa,
            args.controller_sa,
            timeout_s=args.enable_timeout_sec,
            cmd0_period_s=args.cmd0_period_sec,
        )
        print(f"STAT response counts after AD2/AD3 re-enable quiet: {rsp_counts}")
        if not ok_rsp0:
            print("[FAIL] Did not observe STAT Response=0 after AD2/AD3 re-enable quiet+Command=0 polling.")
            return emit_result(False)
        print("[PASS] STAT Response=0 observed before AD2/AD3 sweep.")
        cmd0_keepalive = Command0Keepalive(
            uut_bus,
            module_sa,
            args.controller_sa,
            args.cmd0_period_sec,
        )
        cmd0_keepalive.start()
        print(f"[INFO] Continuous Command=0 keepalive restarted ({args.cmd0_period_sec:.3f}s period).")

        print("")
        print("Phase 6: AD2/AD3 + input clear sweep during low-voltage hold.")
        input_counts = int(round(float(args.input_voltage) * 10.0))
        for port_signal, input_signal, relay_signal, group in PORTS:
            print("")
            print(f"--- {port_signal} / {input_signal} ({group}) ---")

            pat.set_signals({**{s: 0 for s in ALL_J1_SIGNALS}, "PwrSetVoltage": input_counts, "J0_09_TEST_SUPPLY": 1, relay_signal: 1})
            time.sleep(0.15)

            baseline = observe_window(
                uut_bus,
                module_sa,
                uut_db,
                duration_s=args.precheck_sec,
                controller_sa=None,
                cmd0_period_s=None,
            )
            baseline_port = baseline["ports"].get(port_signal)
            baseline_input = baseline["inputs"].get(input_signal)
            baseline_ok = (
                baseline_port is not None
                and abs(float(baseline_port) - float(args.input_voltage)) <= float(args.input_tol)
                and baseline_input is not None
                and int(baseline_input) == 1
            )

            if not set_rigol_voltage(args, rigol_helper, args.hold_voltage, "on"):
                baseline_ok = False

            hold = observe_window(
                uut_bus,
                module_sa,
                uut_db,
                duration_s=args.hold_duration_sec,
                controller_sa=None,
                cmd0_period_s=None,
            )
            hold_fault_ok = (
                int(args.fault_code) in hold["fault_codes"]
                or int(args.hold_fault_code) in hold["fault_codes"]
                or FAULT_LOW_VOLTAGE_HOLD in hold["fault_codes"]
            )
            hold_ports_ok = True
            hold_inputs_ok = True
            missing_ports = []
            missing_inputs = []
            for name in ALL_PORT_SIGNALS:
                value = hold["ports"].get(name)
                if value is None:
                    hold_ports_ok = False
                    missing_ports.append(name)
                    continue
                if abs(float(value)) > float(args.zero_tol):
                    hold_ports_ok = False
            for name in ALL_INPUT_SIGNALS:
                value = hold["inputs"].get(name)
                if value is None:
                    hold_inputs_ok = False
                    missing_inputs.append(name)
                    continue
                if int(value) != 0:
                    hold_inputs_ok = False

            if not set_rigol_voltage(args, rigol_helper, args.nominal_voltage, "on"):
                overall_pass = False

            recovery = observe_window(
                uut_bus,
                module_sa,
                uut_db,
                duration_s=args.recovery_sec,
                controller_sa=None,
                cmd0_period_s=None,
            )
            recovery_port = recovery["ports"].get(port_signal)
            recovery_input = recovery["inputs"].get(input_signal)
            recovery_ok = (
                recovery_port is not None
                and abs(float(recovery_port) - float(args.input_voltage)) <= float(args.input_tol)
                and recovery_input is not None
                and int(recovery_input) == 1
            )

            port_pass = baseline_ok and hold_fault_ok and hold_ports_ok and hold_inputs_ok and recovery_ok
            detail = (
                f"baseline_ok={baseline_ok}; "
                f"hold_fault_ok={hold_fault_ok}; "
                f"hold_ports_ok={hold_ports_ok}; "
                f"hold_inputs_ok={hold_inputs_ok}; "
                f"recovery_ok={recovery_ok}; "
                f"faults={sorted(hold['fault_codes'])}; "
                f"hold_rsp={hold['response_counts']}"
            )
            per_port_results.append(
                {
                    "port": port_signal,
                    "passed": port_pass,
                    "detail": detail,
                }
            )
            if not port_pass:
                overall_pass = False

            print(
                f"baseline_ok={baseline_ok} "
                f"(port={baseline_port}, input={baseline_input}), "
                f"hold_fault_ok={hold_fault_ok} "
                f"(faults={sorted(hold['fault_codes'])}), "
                f"hold_ports_ok={hold_ports_ok}, hold_inputs_ok={hold_inputs_ok}, "
                f"recovery_ok={recovery_ok} "
                f"(port={recovery_port}, input={recovery_input})"
            )
            if missing_ports:
                print(f"[WARN] Missing hold port samples: {', '.join(missing_ports)}")
            if missing_inputs:
                print(f"[WARN] Missing hold input samples: {', '.join(missing_inputs)}")

            pat.set_signals({relay_signal: 0, "PwrSetVoltage": 0})
            time.sleep(0.1)

    finally:
        print("")
        print("Cleanup: returning fixture to safe state.")
        if cmd0_keepalive is not None:
            cmd0_keepalive.stop()
        if pat is not None:
            try:
                pat.set_signals(
                    {
                        **{s: 0 for s in ALL_J1_SIGNALS},
                        "J4_03": 0,
                        "J0_09_TEST_SUPPLY": 0,
                        "PwrSetVoltage": 0,
                        "PwrSetCurrent": 0,
                        "PwrEnable": 0,
                        "PwrRemote": 0,
                        "LdEnable": 0,
                        "LdCurrentSet": 0,
                        "LdRemote": 0,
                        "J0_08_METER_LOAD": 0,
                        "RLY_K1": 0,
                    }
                )
                time.sleep(max(0.2, args.pat_tx_period_sec * 4.0))
            except Exception as exc:
                print(f"[WARN] PAT cleanup set failed: {format_error(exc)}")
            pat.stop()

        if args.cleanup_rigol != "leave":
            try:
                if args.cleanup_rigol == "nominal":
                    set_rigol_voltage(args, rigol_helper, args.nominal_voltage, "on")
                elif args.cleanup_rigol == "off":
                    set_rigol_voltage(args, rigol_helper, args.nominal_voltage, "off")
            except Exception as exc:
                print(f"[WARN] Rigol cleanup failed: {format_error(exc)}")

        try:
            uut_bus.shutdown()
        except Exception:
            pass
        try:
            if pat_bus is not None and pat_bus is not uut_bus:
                pat_bus.shutdown()
        except Exception:
            pass

    print("")
    print("========== FINAL SUMMARY ==========")
    behavior_overall = True
    for check_name, passed in behavior_checks.items():
        if passed is True:
            print(f"PASS - {check_name}")
        else:
            print(f"FAIL - {check_name}")
            behavior_overall = False
    for row in per_port_results:
        print(("PASS" if row["passed"] else "FAIL") + f" - {row['port']} ({row['detail']})")
    if not per_port_results:
        overall_pass = False
    overall_pass = overall_pass and behavior_overall
    print("OVERALL:", "PASS" if overall_pass else "FAIL")
    return emit_result(overall_pass)


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except SystemExit:
        raise
    except Exception as exc:
        print(f"[FAIL] Unhandled exception: {format_error(exc)}")
        print("PATSPEAK_RESULT=FAIL")
        raise SystemExit(2)
