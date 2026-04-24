import argparse
import os
from pathlib import Path
import subprocess
import sys
import time

import can


CAN_RECV_TIMEOUT_SEC = 0.01
READ_SLEEP_SEC = 0.001

PGN_ADDRESS_CLAIM = 0x00EE00
PGN_PROPRIETARY_A = 0x00EF00
PGN_DPLF2 = 0x00FFFC

FAULT_LOW_VOLTAGE = 21
FAULT_LOW_VOLTAGE_HOLD = 41

DEFAULT_CMD_PAYLOAD = [0x00] * 8
CONFIG_PAYLOAD = [0x01, 0x54, 0x00, 0x05, 0x01, 0x00, 0x00, 69]


def _env_truthy(name, default):
    raw = os.environ.get(name, "")
    if raw == "":
        return default
    return str(raw).strip().lower() not in {"0", "false", "no", "off"}


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
    default_channel = os.environ.get("PATSPEAK_CAN_CH0", "0")
    default_bitrate = int(os.environ.get("PATSPEAK_CAN_BITRATE", "250000"))

    parser = argparse.ArgumentParser(
        description=(
            "43009 Low Voltage Hold verifier. Drives Rigol supply channel and watches DUT CAN behavior "
            "for low-voltage faults and low-voltage-hold transitions."
        )
    )

    parser.add_argument("--interface", default=default_interface, help="python-can interface.")
    parser.add_argument("--channel", default=default_channel, help="python-can channel.")
    parser.add_argument("--bitrate", type=int, default=default_bitrate, help="CAN bitrate.")
    parser.add_argument("--expected-sa", type=_parse_int_auto, default=_parse_int_auto("0xD9"), help="Expected DUT SA.")
    parser.add_argument("--controller-sa", type=_parse_int_auto, default=_parse_int_auto("0xD1"), help="Tester SA.")

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

    parser.add_argument("--nominal-voltage", type=float, default=13.0, help="Normal battery voltage.")
    parser.add_argument("--powerup-hold-voltage", type=float, default=8.5, help="Power-up voltage below 9.0 V.")
    parser.add_argument("--release-voltage", type=float, default=12.0, help="Voltage used to exit power-up hold.")
    parser.add_argument("--low-fault-voltage", type=float, default=9.5, help="Voltage used for low-voltage-fault phase.")
    parser.add_argument(
        "--low-fault-threshold-voltage",
        type=float,
        default=10.0,
        help="Low-voltage fault threshold; voltage must remain below this value.",
    )
    parser.add_argument(
        "--low-fault-min-sec",
        type=float,
        default=8.0,
        help="Minimum time below low-fault threshold before expecting fault code.",
    )
    parser.add_argument("--hold-voltage", type=float, default=7.8, help="Voltage used to trigger low-voltage hold.")

    parser.add_argument("--power-off-wait-sec", type=float, default=2.0, help="Power-off dwell before power-up.")
    parser.add_argument("--powerup-hold-check-sec", type=float, default=12.0, help="No-address-claim window below 9.0 V.")
    parser.add_argument("--release-claim-timeout-sec", type=float, default=45.0, help="Timeout for address claim after release.")
    parser.add_argument("--fault-dwell-sec", type=float, default=10.0, help="Dwell for low-voltage fault check.")
    parser.add_argument("--hold-dwell-sec", type=float, default=10.0, help="Dwell below 8.0 V for hold check.")
    parser.add_argument("--recovery-observe-sec", type=float, default=10.0, help="Observe window after hold recovery.")
    parser.add_argument("--max-silence-sec", type=float, default=2.5, help="Allowed DUT CAN silence during operation checks.")
    parser.add_argument(
        "--ctrl-keepalive-sec",
        type=float,
        default=0.25,
        help="Period for sending Command=0 keepalive during observe phases; 0 disables.",
    )
    parser.add_argument(
        "--enable-retry-sec",
        type=float,
        default=1.0,
        help="Period for re-sending Command=1 message-enable while waiting for telemetry.",
    )
    parser.add_argument(
        "--enable-timeout-sec",
        type=float,
        default=6.0,
        help="Timeout for message-enable handshake to start STAT/DPLF2 telemetry.",
    )
    parser.set_defaults(send_config_once_after_claim=True)
    parser.add_argument(
        "--send-config-once-after-claim",
        dest="send_config_once_after_claim",
        action="store_true",
        help="Send one Command=1 after address claim (default: enabled).",
    )
    parser.add_argument(
        "--no-send-config-once-after-claim",
        dest="send_config_once_after_claim",
        action="store_false",
        help="Never send Command=1 after claim (debug mode).",
    )

    parser.add_argument("--restore-voltage", type=float, default=13.0, help="Voltage to restore in cleanup.")
    parser.add_argument("--restore-output", choices=["on", "off", "leave"], default="on", help="Rigol output state in cleanup.")
    parser.set_defaults(restore_on_exit=True)
    parser.add_argument(
        "--restore-on-exit",
        dest="restore_on_exit",
        action="store_true",
        help="Restore Rigol voltage/output during cleanup (default: enabled).",
    )
    parser.add_argument(
        "--no-restore-on-exit",
        dest="restore_on_exit",
        action="store_false",
        help="Do not modify Rigol state during cleanup.",
    )

    args = parser.parse_args()
    args.channel = _parse_can_channel(args.channel)

    if args.hold_dwell_sec < 8.0:
        raise ValueError("--hold-dwell-sec must be at least 8.0 seconds for requirement coverage.")
    if args.low_fault_min_sec <= 0:
        raise ValueError("--low-fault-min-sec must be > 0.")
    if args.fault_dwell_sec < args.low_fault_min_sec:
        raise ValueError("--fault-dwell-sec must be >= --low-fault-min-sec.")
    if args.ctrl_keepalive_sec < 0:
        raise ValueError("--ctrl-keepalive-sec must be >= 0.")
    if args.enable_retry_sec <= 0:
        raise ValueError("--enable-retry-sec must be > 0.")
    if args.enable_timeout_sec <= 0:
        raise ValueError("--enable-timeout-sec must be > 0.")

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


def _workspace_home_from_script():
    try:
        return Path(__file__).resolve().parents[3]
    except Exception:
        return Path.cwd()


def resolve_rigol_helper(explicit_path):
    if explicit_path:
        p = Path(explicit_path).expanduser()
        if p.exists():
            return p.resolve()
        return None

    env_home = str(os.environ.get("PATSPEAK_HOME", "")).strip()
    if env_home:
        candidate = Path(env_home) / "scripts" / "pat_scripts" / "dp800" / "rigol_dp800_set_ch.py"
        if candidate.exists():
            return candidate.resolve()

    candidate = _workspace_home_from_script() / "scripts" / "pat_scripts" / "dp800" / "rigol_dp800_set_ch.py"
    if candidate.exists():
        return candidate.resolve()

    return None


def set_rigol_voltage(args, helper_path, voltage, output):
    if output not in {"on", "off", "leave"}:
        raise ValueError(f"Unsupported output mode: {output}")

    cmd = [sys.executable, "-u", str(helper_path)]
    if args.rigol_connection == "ip":
        if args.rigol_transport == "visa":
            cmd += ["--resource", f"TCPIP0::{args.rigol_ip}::INSTR"]
        else:
            cmd += ["--ip", args.rigol_ip]
            cmd += ["--transport", args.rigol_transport]
            cmd += ["--socket-ports", args.rigol_socket_ports]
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

    print(
        f"Rigol CH{args.rigol_channel}: set {float(voltage):.2f}V, "
        f"ilim={float(args.rigol_current_a):.2f}A, output={output}"
    )
    completed = subprocess.run(
        cmd,
        capture_output=True,
        text=True,
        check=False,
    )
    if completed.returncode == 0:
        if not args.rigol_quiet:
            text = (completed.stdout or "").strip()
            if text:
                print(text)
        return True

    print(f"[FAIL] Rigol helper failed (rc={completed.returncode}).")
    if completed.stdout:
        print("Rigol stdout:")
        print(completed.stdout.rstrip())
    if completed.stderr:
        print("Rigol stderr:")
        print(completed.stderr.rstrip())
    return False


def wait_for_address_claim(bus, expected_sa, timeout_s):
    deadline = time.monotonic() + float(timeout_s)
    next_progress = time.monotonic() + 5.0
    while time.monotonic() < deadline:
        message, rx_time = poll_bus_once(bus)
        if message is not None and message.is_extended_id:
            pgn, source_address, destination_address = parse_j1939_id(message.arbitration_id)
            if pgn == PGN_ADDRESS_CLAIM and destination_address == 0xFF:
                if expected_sa is None or source_address == expected_sa:
                    return source_address, rx_time

        now = time.monotonic()
        if now >= next_progress:
            remaining = max(0.0, deadline - now)
            if expected_sa is None:
                print(f"...waiting for any address claim ({remaining:.0f}s left)")
            else:
                print(f"...waiting for address claim from SA=0x{expected_sa:02X} ({remaining:.0f}s left)")
            next_progress = now + 5.0
        time.sleep(READ_SLEEP_SEC)
    return None, None


def send_control_primer(bus, module_sa, controller_sa):
    cmd_id = build_j1939_id(6, PGN_PROPRIETARY_A, controller_sa, module_sa)
    sent_any = False
    for payload in (DEFAULT_CMD_PAYLOAD, DEFAULT_CMD_PAYLOAD):
        ok, err = write_ext_message(bus, cmd_id, payload)
        if not ok:
            print(f"[WARN] control primer send failed: {err}")
        else:
            sent_any = True
        time.sleep(0.05)
    return sent_any


def send_config_once(bus, module_sa, controller_sa):
    cmd_id = build_j1939_id(6, PGN_PROPRIETARY_A, controller_sa, module_sa)
    ok, err = write_ext_message(bus, cmd_id, CONFIG_PAYLOAD)
    if not ok:
        print(f"[WARN] CMD_CONFIG send failed: {err}")
        return False
    return True


def ensure_messages_enabled(
    bus,
    module_sa,
    controller_sa,
    timeout_s,
    cmd0_period_sec,
    config_period_sec,
    phase_label,
    send_config_retries=False,
):
    cmd_id = build_j1939_id(6, PGN_PROPRIETARY_A, controller_sa, module_sa)
    timeout = max(0.1, float(timeout_s))
    cfg_tx = 0
    cmd0_tx = 0
    saw_rsp0 = False
    saw_rsp1 = False
    saw_dplf2 = False

    if send_config_retries:
        phase_a_deadline = time.monotonic() + timeout
        next_cfg = time.monotonic()
        while time.monotonic() < phase_a_deadline:
            now = time.monotonic()
            if now >= next_cfg:
                ok, err = write_ext_message(bus, cmd_id, CONFIG_PAYLOAD)
                if not ok:
                    print(f"[WARN] {phase_label}: Command=1 tx failed: {err}")
                cfg_tx += 1
                next_cfg = now + max(0.01, float(config_period_sec))

            message, _ = poll_bus_once(bus)
            if message is None:
                time.sleep(READ_SLEEP_SEC)
                continue
            if not message.is_extended_id:
                continue
            pgn, source_address, _ = parse_j1939_id(message.arbitration_id)
            if source_address != module_sa or pgn != PGN_PROPRIETARY_A:
                continue
            rsp = _decode_stat_response_code(bytes(message.data))
            if rsp == 1:
                saw_rsp1 = True
                print(f"[INFO] {phase_label}: Response=1 ACK seen, switching to Command=0 only.")
                break

        if not saw_rsp1:
            print(
                f"[FAIL] {phase_label}: no Response=1 ACK for Command=1 within {timeout:.1f}s "
                f"(cfg_tx={cfg_tx})."
            )
            return False

    phase_b_deadline = time.monotonic() + timeout
    next_cmd0 = time.monotonic()
    while time.monotonic() < phase_b_deadline:
        now = time.monotonic()
        if now >= next_cmd0:
            ok, err = write_ext_message(bus, cmd_id, DEFAULT_CMD_PAYLOAD)
            if not ok:
                print(f"[WARN] {phase_label}: Command=0 tx failed: {err}")
            cmd0_tx += 1
            next_cmd0 = now + max(0.01, float(cmd0_period_sec))

        message, _ = poll_bus_once(bus)
        if message is None:
            time.sleep(READ_SLEEP_SEC)
            continue
        if not message.is_extended_id:
            continue

        pgn, source_address, _ = parse_j1939_id(message.arbitration_id)
        if source_address != module_sa:
            continue
        if pgn == PGN_PROPRIETARY_A:
            rsp = _decode_stat_response_code(bytes(message.data))
            if rsp == 0:
                saw_rsp0 = True
            elif rsp == 1:
                saw_rsp1 = True
        elif pgn == PGN_DPLF2:
            saw_dplf2 = True

        if saw_rsp0 and (not send_config_retries or saw_rsp1):
            print(
                f"[PASS] {phase_label}: telemetry active after "
                f"{cfg_tx}x Command=1 and {cmd0_tx}x Command=0 "
                f"(rsp0={saw_rsp0}, rsp1={saw_rsp1}, dplf2={saw_dplf2})."
            )
            return True

    print(
        f"[FAIL] {phase_label}: telemetry did not fully start within {float(timeout_s):.1f}s "
        f"(rsp0={saw_rsp0}, rsp1={saw_rsp1}, dplf2={saw_dplf2}, cfg_tx={cfg_tx}, cmd0_tx={cmd0_tx})."
    )
    return False


def drain_bus(bus, duration_s=0.4):
    deadline = time.monotonic() + max(0.0, float(duration_s))
    drained = 0
    while time.monotonic() < deadline:
        message, _ = poll_bus_once(bus)
        if message is not None:
            drained += 1
            continue
        time.sleep(READ_SLEEP_SEC)
    return drained


def _decode_stat_response_code(data):
    if len(data) < 1:
        return None
    return int(data[0]) & 0x3F


def _decode_fault_code_if_present(pgn, data):
    if pgn != PGN_PROPRIETARY_A or len(data) < 5:
        return None
    response_code = _decode_stat_response_code(data)
    # Active fault code is only valid for STAT response 0 (default response).
    if response_code != 0:
        return None
    return int(data[4]) & 0xFF


def _decode_vbat_if_present(pgn, data):
    if pgn != PGN_DPLF2 or len(data) < 4:
        return None
    raw = int(data[2]) | ((int(data[3]) & 0x0F) << 8)
    return raw * 0.1


def observe_phase(
    bus,
    module_sa,
    duration_s,
    label,
    ignore_initial_sec=0.0,
    keepalive_can_id=None,
    keepalive_payload=None,
    keepalive_period_sec=0.0,
):
    start = time.monotonic()
    deadline = start + float(duration_s)
    active_start = start + max(0.0, float(ignore_initial_sec))
    next_progress = start + max(2.0, min(10.0, duration_s / 2.0))
    keepalive_period = max(0.0, float(keepalive_period_sec))
    next_keepalive = start if (keepalive_can_id is not None and keepalive_period > 0.0) else None
    keepalive_warned = False

    observation = {
        "label": label,
        "start": start,
        "analysis_start": active_start,
        "end": start,
        "ctrl_keepalive_tx": 0,
        "ctrl_keepalive_fail": 0,
        "bus_frames": 0,
        "dut_frames": 0,
        "claim_seen": False,
        "inter_gap_max": 0.0,
        "trailing_gap": 0.0,
        "last_tx_time": None,
        "fault_codes": set(),
        "last_fault_code": None,
        "vbat_min": None,
        "vbat_max": None,
        "vbat_last": None,
        "stat_response_counts": {},
    }

    while time.monotonic() < deadline:
        now = time.monotonic()
        if next_keepalive is not None and now >= next_keepalive:
            ok, err = write_ext_message(
                bus,
                keepalive_can_id,
                DEFAULT_CMD_PAYLOAD if keepalive_payload is None else keepalive_payload,
            )
            if ok:
                observation["ctrl_keepalive_tx"] += 1
            if not ok and not keepalive_warned:
                print(f"[WARN] CTRL keepalive tx failed in {label}: {err}")
                keepalive_warned = True
            if not ok:
                observation["ctrl_keepalive_fail"] += 1
            next_keepalive = now + keepalive_period

        message, rx_time = poll_bus_once(bus)
        if message is None:
            if now >= next_progress:
                remaining = max(0.0, deadline - now)
                print(
                    f"...{label}: remaining {remaining:.1f}s, "
                    f"dut_frames={observation['dut_frames']}"
                )
                next_progress = now + max(2.0, min(10.0, duration_s / 2.0))
            time.sleep(READ_SLEEP_SEC)
            continue

        observation["bus_frames"] += 1
        if rx_time < active_start:
            continue
        if not message.is_extended_id:
            continue

        pgn, source_address, destination_address = parse_j1939_id(message.arbitration_id)
        if pgn == PGN_ADDRESS_CLAIM and destination_address == 0xFF and source_address == module_sa:
            observation["claim_seen"] = True

        if source_address != module_sa:
            continue

        observation["dut_frames"] += 1
        if observation["last_tx_time"] is not None:
            gap = rx_time - observation["last_tx_time"]
            if gap > observation["inter_gap_max"]:
                observation["inter_gap_max"] = gap
        observation["last_tx_time"] = rx_time

        payload = bytes(message.data)
        if pgn == PGN_PROPRIETARY_A:
            rsp = _decode_stat_response_code(payload)
            if rsp is not None:
                observation["stat_response_counts"][rsp] = observation["stat_response_counts"].get(rsp, 0) + 1
        code = _decode_fault_code_if_present(pgn, payload)
        if code is not None:
            observation["fault_codes"].add(code)
            observation["last_fault_code"] = code

        vbat = _decode_vbat_if_present(pgn, payload)
        if vbat is not None:
            observation["vbat_last"] = vbat
            if observation["vbat_min"] is None or vbat < observation["vbat_min"]:
                observation["vbat_min"] = vbat
            if observation["vbat_max"] is None or vbat > observation["vbat_max"]:
                observation["vbat_max"] = vbat

    observation["end"] = time.monotonic()
    if observation["last_tx_time"] is None:
        observation["trailing_gap"] = observation["end"] - observation["start"]
    else:
        observation["trailing_gap"] = observation["end"] - observation["last_tx_time"]
    return observation


def summarize_observation(obs):
    faults = sorted(obs["fault_codes"])
    if faults:
        fault_text = ", ".join(str(value) for value in faults)
    else:
        fault_text = "none"
    vbat_text = "n/a"
    if obs["vbat_last"] is not None:
        vbat_text = (
            f"last={obs['vbat_last']:.1f}V"
            f", min={obs['vbat_min']:.1f}V"
            f", max={obs['vbat_max']:.1f}V"
        )
    print(
        f"{obs['label']}: dut_frames={obs['dut_frames']} "
        f"max_inter_gap={obs['inter_gap_max']:.3f}s trailing_gap={obs['trailing_gap']:.3f}s "
        f"faults={fault_text} vbat({vbat_text}) "
        f"ctrl_cmd0_tx={obs['ctrl_keepalive_tx']} ctrl_cmd0_fail={obs['ctrl_keepalive_fail']}"
    )
    if obs["stat_response_counts"]:
        rsp_text = ", ".join(
            f"{code}:{count}" for code, count in sorted(obs["stat_response_counts"].items(), key=lambda item: item[0])
        )
        print(f"{obs['label']}: STAT response mix [{rsp_text}]")


def low_fault_window_check(obs, threshold_v, min_sec, commanded_voltage=None):
    analysis_duration = max(0.0, float(obs["end"] - obs["analysis_start"]))
    if analysis_duration < float(min_sec):
        return False, f"analysis window {analysis_duration:.3f}s is < required {float(min_sec):.3f}s"
    if obs["vbat_max"] is not None:
        if float(obs["vbat_max"]) >= float(threshold_v):
            return False, f"VBAT max {float(obs['vbat_max']):.2f}V is not below {float(threshold_v):.2f}V"
        return True, f"VBAT stayed below {float(threshold_v):.2f}V for {analysis_duration:.3f}s"
    if commanded_voltage is not None and float(commanded_voltage) < float(threshold_v):
        return (
            True,
            f"no VBAT samples; used commanded supply {float(commanded_voltage):.2f}V "
            f"< {float(threshold_v):.2f}V for {analysis_duration:.3f}s",
        )
    return False, "no VBAT samples observed and commanded voltage did not prove threshold condition"


def continuity_check(obs, max_silence_sec):
    if obs["dut_frames"] < 2:
        return False, f"only {obs['dut_frames']} DUT frame(s) observed"
    worst_gap = max(float(obs["inter_gap_max"]), float(obs["trailing_gap"]))
    if worst_gap > float(max_silence_sec):
        return False, f"worst silence {worst_gap:.3f}s exceeds {float(max_silence_sec):.3f}s"
    return True, f"worst silence {worst_gap:.3f}s"


def main():
    args = parse_args()

    print("43009 Low Voltage Hold verifier")
    print(
        f"CAN: interface={args.interface}, channel={args.channel}, bitrate={args.bitrate}, "
        f"expected_sa=0x{args.expected_sa:02X}"
    )
    print(
        "Rigol: "
        f"connection={args.rigol_connection}, channel={args.rigol_channel}, "
        f"transport={args.rigol_transport}, ip={args.rigol_ip}"
    )
    print(
        "Voltage plan: "
        f"powerup_hold={args.powerup_hold_voltage:.2f}V, "
        f"release={args.release_voltage:.2f}V, "
        f"low_fault={args.low_fault_voltage:.2f}V, "
        f"hold={args.hold_voltage:.2f}V, nominal={args.nominal_voltage:.2f}V"
    )
    print(
        "Low-fault criteria: "
        f"code={FAULT_LOW_VOLTAGE}, vbat<{args.low_fault_threshold_voltage:.2f}V "
        f"for >= {args.low_fault_min_sec:.1f}s"
    )
    if args.ctrl_keepalive_sec > 0:
        print(f"CTRL keepalive during observe phases: every {args.ctrl_keepalive_sec:.3f}s")
    else:
        print("CTRL keepalive during observe phases: disabled")
    print(
        "Message-enable handshake: "
        + (
            "Command=1 one-shot after address claim, then Command=0 handshake/keepalive; "
            if args.send_config_once_after_claim
            else "Command=1 disabled, Command=0 handshake/keepalive only; "
        )
        + f"timeout {args.enable_timeout_sec:.1f}s"
    )
    print(f"Cleanup restore on exit: {'enabled' if args.restore_on_exit else 'disabled'}")

    rigol_helper = resolve_rigol_helper(args.rigol_helper)
    if rigol_helper is None:
        print("[FAIL] Could not locate rigol_dp800_set_ch.py. Set --rigol-helper explicitly.")
        return emit_result(False)
    print(f"Rigol helper: {rigol_helper}")

    try:
        bus = open_can_bus(args.interface, args.channel, args.bitrate)
    except Exception as exc:
        print("[FAIL] Unable to open CAN bus with python-can.")
        print(f"       Details: {format_error(exc)}")
        return emit_result(False)

    checks = {
        "Power-up below 9.0 V blocks address claim": None,
        "Voltage above 9.0 V after hold allows address claim": None,
        "Low-voltage fault does not interrupt operation": None,
        "Below 8.0 V for 8s enters Low Voltage Hold": None,
        "CAN transmission continues during Low Voltage Hold": None,
        "Voltage recovery exits Low Voltage Hold": None,
    }

    module_sa = args.expected_sa
    critical_failure = False
    ctrl_keepalive_id = None
    cmd0_handshake_sec = args.ctrl_keepalive_sec if args.ctrl_keepalive_sec > 0 else 0.25

    try:
        print("")
        print("Phase 1: Power-up below 9.0 V and verify address claim is postponed.")
        if not set_rigol_voltage(args, rigol_helper, args.powerup_hold_voltage, "off"):
            critical_failure = True
        else:
            time.sleep(max(0.0, float(args.power_off_wait_sec)))
            if not set_rigol_voltage(args, rigol_helper, args.powerup_hold_voltage, "on"):
                critical_failure = True

        if not critical_failure:
            claim_sa, _ = wait_for_address_claim(bus, args.expected_sa, args.powerup_hold_check_sec)
            if claim_sa is None:
                checks["Power-up below 9.0 V blocks address claim"] = True
                print("[PASS] No DUT address claim observed while below 9.0 V at power-up.")
            else:
                checks["Power-up below 9.0 V blocks address claim"] = False
                print(f"[FAIL] Address claim appeared early from SA=0x{claim_sa:02X}.")

        print("")
        print("Phase 2: Raise voltage above 9.0 V and verify address claim resumes.")
        if not critical_failure and set_rigol_voltage(args, rigol_helper, args.release_voltage, "on"):
            claim_sa, _ = wait_for_address_claim(bus, args.expected_sa, args.release_claim_timeout_sec)
            if claim_sa is None:
                checks["Voltage above 9.0 V after hold allows address claim"] = False
                print("[FAIL] No DUT address claim observed after voltage release.")
                critical_failure = True
            else:
                module_sa = claim_sa
                ctrl_keepalive_id = build_j1939_id(6, PGN_PROPRIETARY_A, args.controller_sa, module_sa)
                checks["Voltage above 9.0 V after hold allows address claim"] = True
                print(f"[PASS] DUT address claim observed from SA=0x{module_sa:02X}.")
                if args.send_config_once_after_claim:
                    send_config_once(bus, module_sa, args.controller_sa)
                else:
                    print("[INFO] Skipping Command=1 after claim (--no-send-config-once-after-claim).")
        elif not critical_failure:
            critical_failure = True

        if not critical_failure:
            if not set_rigol_voltage(args, rigol_helper, args.nominal_voltage, "on"):
                critical_failure = True
            else:
                send_control_primer(bus, module_sa, args.controller_sa)
                if not ensure_messages_enabled(
                    bus,
                    module_sa,
                    args.controller_sa,
                    timeout_s=args.enable_timeout_sec,
                    cmd0_period_sec=cmd0_handshake_sec,
                    config_period_sec=args.enable_retry_sec,
                    phase_label="Baseline enable",
                    send_config_retries=not args.send_config_once_after_claim,
                ):
                    critical_failure = True
                if critical_failure:
                    checks["Low-voltage fault does not interrupt operation"] = False
                    checks["Below 8.0 V for 8s enters Low Voltage Hold"] = False
                    checks["CAN transmission continues during Low Voltage Hold"] = False
                    checks["Voltage recovery exits Low Voltage Hold"] = False
                    print("[FAIL] Stopping because telemetry enable failed at baseline.")
                    return emit_result(False)
                baseline = observe_phase(
                    bus,
                    module_sa,
                    3.0,
                    "Baseline @ nominal",
                    keepalive_can_id=ctrl_keepalive_id,
                    keepalive_payload=DEFAULT_CMD_PAYLOAD,
                    keepalive_period_sec=args.ctrl_keepalive_sec,
                )
                summarize_observation(baseline)

        if not critical_failure:
            print("")
            print("Phase 3: Low-voltage fault check (operation should continue).")
            if set_rigol_voltage(args, rigol_helper, args.low_fault_voltage, "on"):
                drained = drain_bus(bus, 0.5)
                if drained > 0:
                    print(f"[INFO] Drained {drained} queued CAN frame(s) after voltage transition.")
                send_control_primer(bus, module_sa, args.controller_sa)
                if not ensure_messages_enabled(
                    bus,
                    module_sa,
                    args.controller_sa,
                    timeout_s=args.enable_timeout_sec,
                    cmd0_period_sec=cmd0_handshake_sec,
                    config_period_sec=args.enable_retry_sec,
                    phase_label="Low-voltage enable",
                    send_config_retries=False,
                ):
                    print("[WARN] Low-voltage enable did not confirm Response=0 before phase observe; continuing with Command=0 only.")
                print(
                    "[INFO] Low-voltage phase: sending Command=0 keepalive until fault code is observed "
                    f"or {args.fault_dwell_sec:.1f}s timeout."
                )
                low_obs = observe_phase(
                    bus,
                    module_sa,
                    args.fault_dwell_sec,
                    "Low-voltage fault phase",
                    ignore_initial_sec=1.0,
                    keepalive_can_id=ctrl_keepalive_id,
                    keepalive_payload=DEFAULT_CMD_PAYLOAD,
                    keepalive_period_sec=args.ctrl_keepalive_sec,
                )
                summarize_observation(low_obs)
                continuity_ok, continuity_note = continuity_check(low_obs, args.max_silence_sec)
                saw_fault = FAULT_LOW_VOLTAGE in low_obs["fault_codes"]
                low_window_ok, low_window_note = low_fault_window_check(
                    low_obs,
                    threshold_v=args.low_fault_threshold_voltage,
                    min_sec=args.low_fault_min_sec,
                    commanded_voltage=args.low_fault_voltage,
                )
                checks["Low-voltage fault does not interrupt operation"] = continuity_ok and low_window_ok and saw_fault
                if checks["Low-voltage fault does not interrupt operation"]:
                    print(
                        f"[PASS] Low-voltage phase: continuity OK ({continuity_note}), "
                        + f"{low_window_note}, and fault code {FAULT_LOW_VOLTAGE} observed."
                    )
                else:
                    print(
                        "[FAIL] Low-voltage phase: "
                        + f"continuity_ok={continuity_ok} ({continuity_note}), "
                        + f"low_window_ok={low_window_ok} ({low_window_note}), "
                        + f"fault{FAULT_LOW_VOLTAGE}_seen={saw_fault}."
                    )
            else:
                checks["Low-voltage fault does not interrupt operation"] = False
                critical_failure = True

        if not critical_failure:
            print("")
            print("Phase 4: Drive below 8.0 V for >=8s to trigger Low Voltage Hold.")
            if set_rigol_voltage(args, rigol_helper, args.hold_voltage, "on"):
                drained = drain_bus(bus, 0.5)
                if drained > 0:
                    print(f"[INFO] Drained {drained} queued CAN frame(s) after voltage transition.")
                send_control_primer(bus, module_sa, args.controller_sa)
                if not ensure_messages_enabled(
                    bus,
                    module_sa,
                    args.controller_sa,
                    timeout_s=args.enable_timeout_sec,
                    cmd0_period_sec=cmd0_handshake_sec,
                    config_period_sec=args.enable_retry_sec,
                    phase_label="Hold enable",
                    send_config_retries=False,
                ):
                    print("[WARN] Hold enable did not confirm Response=0 before hold observe; continuing with Command=0 only.")
                hold_obs = observe_phase(
                    bus,
                    module_sa,
                    args.hold_dwell_sec,
                    "Low Voltage Hold phase",
                    keepalive_can_id=ctrl_keepalive_id,
                    keepalive_payload=DEFAULT_CMD_PAYLOAD,
                    keepalive_period_sec=args.ctrl_keepalive_sec,
                )
                summarize_observation(hold_obs)
                entered_hold = FAULT_LOW_VOLTAGE_HOLD in hold_obs["fault_codes"]
                continuity_ok, continuity_note = continuity_check(hold_obs, args.max_silence_sec)
                checks["Below 8.0 V for 8s enters Low Voltage Hold"] = entered_hold
                checks["CAN transmission continues during Low Voltage Hold"] = continuity_ok
                if entered_hold:
                    print("[PASS] Low Voltage Hold fault code 41 observed.")
                else:
                    print("[FAIL] Low Voltage Hold fault code 41 was not observed.")
                if continuity_ok:
                    print(f"[PASS] CAN transmission continued in hold ({continuity_note}).")
                else:
                    print(f"[FAIL] CAN continuity failed in hold ({continuity_note}).")
            else:
                checks["Below 8.0 V for 8s enters Low Voltage Hold"] = False
                checks["CAN transmission continues during Low Voltage Hold"] = False
                critical_failure = True

        if not critical_failure:
            print("")
            print("Phase 5: Recover above 9.0 V and verify hold exits.")
            if set_rigol_voltage(args, rigol_helper, args.nominal_voltage, "on"):
                send_control_primer(bus, module_sa, args.controller_sa)
                recovery_obs = observe_phase(
                    bus,
                    module_sa,
                    args.recovery_observe_sec,
                    "Recovery phase",
                    keepalive_can_id=ctrl_keepalive_id,
                    keepalive_payload=DEFAULT_CMD_PAYLOAD,
                    keepalive_period_sec=args.ctrl_keepalive_sec,
                )
                summarize_observation(recovery_obs)
                continuity_ok, continuity_note = continuity_check(recovery_obs, args.max_silence_sec)
                last_fault = recovery_obs["last_fault_code"]
                exited_hold = last_fault is not None and int(last_fault) != FAULT_LOW_VOLTAGE_HOLD
                checks["Voltage recovery exits Low Voltage Hold"] = continuity_ok and exited_hold
                if checks["Voltage recovery exits Low Voltage Hold"]:
                    print(
                        "[PASS] Recovery phase: operation resumed, "
                        + f"last fault code={int(last_fault)} ({continuity_note})."
                    )
                else:
                    print(
                        "[FAIL] Recovery phase: "
                        + f"continuity_ok={continuity_ok} ({continuity_note}), "
                        + f"last_fault_code={last_fault}."
                    )
            else:
                checks["Voltage recovery exits Low Voltage Hold"] = False

    finally:
        print("")
        print("Cleanup: restoring Rigol output state.")
        if args.restore_on_exit:
            try:
                set_rigol_voltage(args, rigol_helper, args.restore_voltage, args.restore_output)
            except Exception as exc:
                print(f"[WARN] Rigol restore step failed: {format_error(exc)}")
        else:
            print("Cleanup restore skipped by --no-restore-on-exit.")
        bus.shutdown()

    print("")
    print("========== FINAL SUMMARY ==========")
    overall_pass = True
    for name, passed in checks.items():
        if passed is True:
            status = "PASS"
        elif passed is False:
            status = "FAIL"
            overall_pass = False
        else:
            status = "SKIP"
            overall_pass = False
        print(f"{status} - {name}")
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
