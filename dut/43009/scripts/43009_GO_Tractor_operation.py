import argparse
import os
import time

import can


# CAN IDs used by the PWS simulator handshake/state machine
ID_CMD_CONFIG = 0x18EFD9D1
ID_PWS_INIT = 0x000FDB81
ID_PWS_DATA = 0x000FDB80
ID_PWS_ACK = 0x000FDB02
ID_PWS_RESET_TIMER = 0x18EEFFD9
ID_PGN_65196 = 0x1CFEACD9
ID_PGN_64512 = 0x1CFC00D9
ID_REQ_FEAC = 0x0CEAD9FF
ID_CTRL_RLY = 0x8CFF0500  # PAT.dbc CTRL_RLY, byte0 bits[1:0] = RLY_K1

PWS_INIT_ACK = 0x81
PWS_DATA_ACK = 0x80
ACCEPTED_INIT_PAYLOADS = {(0x70, 0x10), (0xE9, 0x10)}
EXPECTED_STATUS_CODES = [0x1C, 0x1D, 0x1E, 0x1F, 0x20, 0x21, 0x22, 0x23]
WHEEL_LABELS = [
    "Axle1_Left",
    "Axle1_Right",
    "Axle2_Left",
    "Axle2_Right",
    "Axle3_Left",
    "Axle3_Right",
    "Axle4_Left",
    "Axle4_Right",
]

CAN_RECV_TIMEOUT_SEC = 0.01
READ_SLEEP_SEC = 0.001


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


def _default_can_settings():
    interface = str(os.environ.get("PATSPEAK_CAN_INTERFACE", "kvaser")).strip().lower() or "kvaser"
    channel = _parse_can_channel(os.environ.get("PATSPEAK_CAN_CH0", "0"))
    bitrate = int(os.environ.get("PATSPEAK_CAN_BITRATE", "250000"))
    return interface, channel, bitrate


def _default_relay_settings(default_interface, default_bitrate):
    relay_interface = str(os.environ.get("PATSPEAK_RELAY_CAN_INTERFACE", default_interface)).strip().lower() or default_interface
    relay_channel = _parse_can_channel(
        os.environ.get("PATSPEAK_CAN_CH1", os.environ.get("PATSPEAK_RELAY_CAN_CHANNEL", "1"))
    )
    relay_bitrate = int(os.environ.get("PATSPEAK_RELAY_CAN_BITRATE", str(default_bitrate)))
    auto_cycle_k1 = _env_truthy("PATSPEAK_AUTO_CYCLE_K1", True)
    return relay_interface, relay_channel, relay_bitrate, auto_cycle_k1


def format_error(exc):
    return f"{type(exc).__name__}: {exc}"


def parse_args():
    default_interface, default_channel, default_bitrate = _default_can_settings()
    relay_interface, relay_channel, relay_bitrate, auto_cycle_k1 = _default_relay_settings(
        default_interface, default_bitrate
    )
    parser = argparse.ArgumentParser(
        description=(
            "43009 PWS state-machine verifier (sim side): waits for DUT-driven "
            "FDB81/FDB80 sequence and sends ACKs."
        )
    )
    parser.add_argument("--interface", default=default_interface, help="python-can interface (default from PATSPEAK_CAN_INTERFACE).")
    parser.add_argument("--channel", default=str(default_channel), help="python-can channel (default from PATSPEAK_CAN_CH0).")
    parser.add_argument("--bitrate", type=int, default=default_bitrate, help="CAN bitrate (default from PATSPEAK_CAN_BITRATE).")
    parser.add_argument("--cycles", type=int, default=1, help="Number of PWS handshake cycles to verify.")
    parser.add_argument(
        "--startup-timeout",
        type=float,
        default=220.0,
        help="Seconds to wait for first PWS init frame (covers 3-minute startup timer).",
    )
    parser.add_argument(
        "--intercycle-timeout",
        type=float,
        default=330.0,
        help="Seconds to wait for next cycle init (after cycle 1, default covers 5-minute cadence).",
    )
    parser.add_argument(
        "--cycle-timeout",
        type=float,
        default=20.0,
        help="Seconds allowed to complete one FDB81+8-data handshake once cycle starts.",
    )
    parser.add_argument("--max-psi", type=int, default=250, help="Max PSI used for percentage printout.")
    parser.add_argument("--strict-init", action="store_true", help="Require init payload exactly 70 10.")
    parser.set_defaults(verify_timing=True)
    parser.add_argument("--verify-timing", dest="verify_timing", action="store_true", help="Enable timing checks.")
    parser.add_argument("--no-verify-timing", dest="verify_timing", action="store_false", help="Disable timing checks.")
    parser.add_argument("--startup-target-sec", type=float, default=180.0, help="Expected first INIT delay (seconds).")
    parser.add_argument("--startup-tolerance-sec", type=float, default=12.0, help="+/- tolerance for first INIT delay.")
    parser.add_argument(
        "--startup-reference",
        choices=["auto", "reset", "k1"],
        default="auto",
        help="Reference clock for startup timing (auto prefers reset frame, then K1 cycle).",
    )
    parser.add_argument("--step-target-sec", type=float, default=0.10, help="Expected spacing between 8 status frames.")
    parser.add_argument("--step-tolerance-sec", type=float, default=0.08, help="+/- tolerance for status frame spacing.")
    parser.add_argument("--intercycle-target-sec", type=float, default=300.0, help="Expected interval between cycle INIT frames.")
    parser.add_argument("--intercycle-tolerance-sec", type=float, default=15.0, help="+/- tolerance for inter-cycle INIT spacing.")
    parser.add_argument(
        "--no-mode-config",
        action="store_true",
        help=(
            "Do not send CMD_CONFIG. By default script sends CMD_CONFIG with only "
            "PWSMode=1 (status-enable bits remain 0)."
        ),
    )
    parser.add_argument("--config-user-id", type=int, default=69, help="User ID byte for CMD_CONFIG (default 69).")
    parser.add_argument(
        "--request-feac-once",
        action="store_true",
        help="Send one FEAC request frame (0x0CEAD9FF 00 FE AC) at startup; default is passive.",
    )
    parser.set_defaults(cycle_k1=auto_cycle_k1)
    parser.add_argument("--cycle-k1", dest="cycle_k1", action="store_true", help="Cycle K1 relay before test.")
    parser.add_argument("--no-cycle-k1", dest="cycle_k1", action="store_false", help="Disable K1 relay cycling.")
    parser.add_argument("--relay-interface", default=relay_interface, help="Relay CAN interface (default: same as CAN interface).")
    parser.add_argument("--relay-channel", default=str(relay_channel), help="Relay CAN channel (default from PATSPEAK_CAN_CH1/PATSPEAK_RELAY_CAN_CHANNEL).")
    parser.add_argument("--relay-bitrate", type=int, default=relay_bitrate, help="Relay CAN bitrate.")
    parser.add_argument("--k1-off-wait", type=float, default=1.0, help="Seconds to hold K1 off before on.")
    parser.add_argument("--k1-on-wait", type=float, default=2.0, help="Seconds to hold K1 on.")
    parser.add_argument("--k1-settle-wait", type=float, default=1.0, help="Seconds to hold K1 off after on pulse.")
    parser.add_argument("--drop-init-acks", type=int, default=0, help="Drop this many INIT ACKs intentionally before acknowledging.")
    parser.add_argument("--drop-data-acks", type=int, default=0, help="Drop this many DATA ACKs intentionally before acknowledging.")
    return parser.parse_args()


def open_can_bus(interface, channel, bitrate):
    # interface=... preferred in newer python-can; bustype=... for compatibility.
    try:
        return can.Bus(interface=interface, channel=channel, bitrate=bitrate)
    except TypeError:
        return can.Bus(bustype=interface, channel=channel, bitrate=bitrate)


def send_msg(bus, can_id, data_bytes, note):
    msg = can.Message(arbitration_id=can_id, is_extended_id=True, data=data_bytes)
    try:
        bus.send(msg)
    except can.CanError as exc:
        raise RuntimeError(f"{note}: send failed ({format_error(exc)})") from exc
    print(f"TX {note}: {can_id:#010x} [{len(data_bytes)}] " + " ".join(f"{value:02X}" for value in data_bytes))


def read_next(bus):
    try:
        msg = bus.recv(timeout=CAN_RECV_TIMEOUT_SEC)
    except can.CanError as exc:
        return None, format_error(exc), time.monotonic()
    return msg, None, time.monotonic()


def as_percent(value, max_psi):
    if value > max_psi:
        return "NA"
    return f"{(float(value) / float(max_psi)) * 100.0:.1f}%"


def update_diag(diag, can_id):
    diag["rx_total"] += 1
    diag["id_counts"][can_id] = diag["id_counts"].get(can_id, 0) + 1


def diag_top_ids(diag, limit=5):
    top = sorted(diag["id_counts"].items(), key=lambda item: item[1], reverse=True)[:limit]
    return ",".join(f"{can_id:#010x}:{count}" for can_id, count in top)


def send_mode_config(bus, user_id):
    # Mirrors sim_verifaction behavior: PWSMode=1, status-enable bytes remain 0.
    payload = [0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, int(user_id) & 0xFF]
    send_msg(bus, ID_CMD_CONFIG, payload, "CMD_CONFIG_PWSMODE_ONLY")


def write_k1(relay_bus, state, note):
    payload = [int(state) & 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
    send_msg(relay_bus, ID_CTRL_RLY, payload, note)


def cycle_k1(relay_bus, off_wait_s, on_wait_s, settle_wait_s):
    print("Cycling K1 relay for known DUT startup state...")
    write_k1(relay_bus, 0, "K1_OFF_PRE")
    print(f"K1=0, wait {off_wait_s:.1f}s")
    time.sleep(off_wait_s)

    write_k1(relay_bus, 1, "K1_ON")
    print(f"K1=1, wait {on_wait_s:.1f}s")
    time.sleep(on_wait_s)

    write_k1(relay_bus, 0, "K1_OFF_SETTLE")
    print(f"K1=0, wait {settle_wait_s:.1f}s")
    time.sleep(settle_wait_s)


def pick_start_reference(args, runtime, init_time):
    reset_time = runtime.get("last_reset_time")
    k1_time = runtime.get("k1_cycle_done_time")

    if args.startup_reference == "reset":
        if reset_time is not None and reset_time <= init_time:
            return "reset", reset_time
        return None, None

    if args.startup_reference == "k1":
        if k1_time is not None and k1_time <= init_time:
            return "k1", k1_time
        return None, None

    # auto: prefer reset frame when available, otherwise use K1 cycle anchor.
    if reset_time is not None and reset_time <= init_time:
        return "reset", reset_time
    if k1_time is not None and k1_time <= init_time:
        return "k1", k1_time
    return None, None


def wait_for_init(bus, timeout_s, strict_init, diag, runtime):
    start = time.monotonic()
    deadline = start + timeout_s
    next_progress = start + 10.0

    while time.monotonic() < deadline:
        msg, err, now = read_next(bus)
        if err is not None:
            print(f"[WARN] Read error: {err}")
            time.sleep(READ_SLEEP_SEC)
            continue
        if msg is None:
            time.sleep(READ_SLEEP_SEC)
        else:
            if not msg.is_extended_id:
                continue

            can_id = int(msg.arbitration_id) & 0x1FFFFFFF
            update_diag(diag, can_id)
            payload = [int(value) for value in msg.data]

            if can_id == ID_PWS_RESET_TIMER:
                runtime["last_reset_time"] = now
                print("[INFO] reset-timer frame seen (18EEFFD9).")
                continue

            if can_id != ID_PWS_INIT:
                continue

            if len(payload) != 2:
                print(f"[WARN] init frame with DLC={len(payload)} ignored")
                continue

            pair = (payload[0], payload[1])
            if strict_init:
                if pair != (0x70, 0x10):
                    print(f"[WARN] init payload ignored: {payload[0]:02X} {payload[1]:02X} (strict mode)")
                    continue
            elif pair not in ACCEPTED_INIT_PAYLOADS:
                print(f"[WARN] init payload ignored: {payload[0]:02X} {payload[1]:02X}")
                continue

            return True, now, payload

        if now >= next_progress:
            remaining = max(0.0, deadline - now)
            top = diag_top_ids(diag)
            if top == "":
                top = "none"
            print(f"...waiting INIT (remaining {remaining:.0f}s, rx_total={diag['rx_total']}, top_ids={top})")
            next_progress = now + 10.0

    return False, None, None


def finish_cycle_after_init(bus, cycle_idx, cycle_timeout_s, max_psi, drop_data_acks, diag, runtime, args):
    start = time.monotonic()
    deadline = start + cycle_timeout_s
    expected_idx = 0
    dropped_data_left = int(drop_data_acks)
    step_ack_sent = 0
    step_times = []

    while time.monotonic() < deadline:
        msg, err, now = read_next(bus)
        if err is not None:
            print(f"[WARN] Read error: {err}")
            time.sleep(READ_SLEEP_SEC)
            continue
        if msg is None:
            time.sleep(READ_SLEEP_SEC)
            continue
        if not msg.is_extended_id:
            continue

        can_id = int(msg.arbitration_id) & 0x1FFFFFFF
        update_diag(diag, can_id)
        payload = [int(value) for value in msg.data]

        if can_id == ID_PWS_RESET_TIMER:
            runtime["last_reset_time"] = now
            print("[INFO] reset-timer frame seen during cycle; state likely restarted.")
            continue

        if can_id != ID_PWS_DATA:
            continue

        if len(payload) != 6:
            print(f"[WARN] status frame ignored: DLC={len(payload)}")
            continue
        if payload[1] != 0x08:
            print(f"[WARN] status frame ignored: byte1={payload[1]:02X} (expected 08)")
            continue
        if payload[3] != 0x00 or payload[4] != 0x00 or payload[5] != 0x00:
            print(
                "[WARN] status frame ignored: tail="
                f"{payload[3]:02X} {payload[4]:02X} {payload[5]:02X} (expected 00 00 00)"
            )
            continue

        if expected_idx >= len(EXPECTED_STATUS_CODES):
            print("[WARN] extra status frame after expected 8 steps; ignoring")
            continue

        expected_code = EXPECTED_STATUS_CODES[expected_idx]
        actual_code = payload[0]
        value = payload[2]

        if actual_code != expected_code:
            # If a previous step is repeated, this is usually an ACK timing/retry artifact.
            if expected_idx > 0 and actual_code == EXPECTED_STATUS_CODES[expected_idx - 1]:
                print(
                    f"[INFO] repeat of previous step code 0x{actual_code:02X} while waiting for "
                    f"0x{expected_code:02X}; ignoring"
                )
                continue
            return False, f"status code mismatch at step {expected_idx + 1}: expected 0x{expected_code:02X}, got 0x{actual_code:02X}"

        if dropped_data_left > 0:
            dropped_data_left -= 1
            print(
                f"[TEST] dropped DATA ACK for step#{expected_idx + 1} "
                f"(remaining drops={dropped_data_left})"
            )
            continue

        send_msg(bus, ID_PWS_ACK, [PWS_DATA_ACK], f"DATA_ACK cycle#{cycle_idx} step#{expected_idx + 1}")
        step_ack_sent += 1
        step_times.append(now)
        print(
            f"RX STATUS cycle#{cycle_idx} step#{expected_idx + 1}/8 "
            f"SPN={0x0800 + actual_code} code=0x{actual_code:02X} "
            f"d1={value} ({as_percent(value, max_psi)}) "
            f"wheel={WHEEL_LABELS[expected_idx]}"
        )
        expected_idx += 1
        deadline = now + cycle_timeout_s

        if expected_idx == len(EXPECTED_STATUS_CODES):
            if len(step_times) >= 2:
                intervals = [step_times[idx] - step_times[idx - 1] for idx in range(1, len(step_times))]
                print("Step intervals: " + ", ".join(f"{value:.3f}s" for value in intervals))
                if args.verify_timing:
                    for value in intervals:
                        if abs(value - args.step_target_sec) > args.step_tolerance_sec:
                            return (
                                False,
                                f"step timing out of tolerance "
                                f"(target={args.step_target_sec:.3f}s +/- {args.step_tolerance_sec:.3f}s)",
                            )
            return True, f"step ACKs sent={step_ack_sent}"

    return False, f"timeout waiting for remaining status frames ({expected_idx}/8 complete)"


def run_cycle(bus, cycle_idx, args, diag, runtime):
    init_timeout = args.startup_timeout if cycle_idx == 1 else args.intercycle_timeout
    ok, init_time, init_payload = wait_for_init(
        bus=bus,
        timeout_s=init_timeout,
        strict_init=args.strict_init,
        diag=diag,
        runtime=runtime,
    )
    if not ok:
        return {"ok": False, "reason": "timeout_waiting_for_init_fdb81", "init_time": None}

    print(f"RX INIT cycle#{cycle_idx}: 0x{ID_PWS_INIT:08X} [2] {init_payload[0]:02X} {init_payload[1]:02X}")

    ref_name, ref_time = pick_start_reference(args, runtime, init_time)
    if ref_time is not None:
        delta = init_time - ref_time
        print(f"[INFO] INIT delay from {ref_name} reference: {delta:.3f}s")
    else:
        print("[INFO] No startup timing reference observed yet (reset/k1).")

    if args.verify_timing and cycle_idx == 1:
        if ref_time is None:
            return {"ok": False, "reason": "startup_timing_unverifiable_no_reference", "init_time": init_time}
        startup_delta = init_time - ref_time
        if abs(startup_delta - args.startup_target_sec) <= args.startup_tolerance_sec:
            print(
                f"[PASS] Startup timing: {startup_delta:.3f}s "
                f"(target={args.startup_target_sec:.1f}s +/- {args.startup_tolerance_sec:.1f}s)"
            )
        else:
            return {
                "ok": False,
                "reason": (
                    f"startup timing out of tolerance: {startup_delta:.3f}s "
                    f"(target={args.startup_target_sec:.1f}s +/- {args.startup_tolerance_sec:.1f}s)"
                ),
                "init_time": init_time,
            }

    dropped_init_left = int(args.drop_init_acks)
    while dropped_init_left > 0:
        dropped_init_left -= 1
        print(f"[TEST] dropped INIT ACK (remaining drops={dropped_init_left})")
        ok, init_time, init_payload = wait_for_init(
            bus=bus,
            timeout_s=args.cycle_timeout,
            strict_init=args.strict_init,
            diag=diag,
            runtime=runtime,
        )
        if not ok:
            return {"ok": False, "reason": "timeout_waiting_for_retry_init_after_dropped_ack", "init_time": init_time}
        print(f"RX INIT RETRY cycle#{cycle_idx}: {init_payload[0]:02X} {init_payload[1]:02X}")

    send_msg(bus, ID_PWS_ACK, [PWS_INIT_ACK], f"INIT_ACK cycle#{cycle_idx}")
    ok, reason = finish_cycle_after_init(
        bus=bus,
        cycle_idx=cycle_idx,
        cycle_timeout_s=args.cycle_timeout,
        max_psi=args.max_psi,
        drop_data_acks=args.drop_data_acks,
        diag=diag,
        runtime=runtime,
        args=args,
    )
    return {"ok": ok, "reason": reason, "init_time": init_time}


def main():
    args = parse_args()
    can_interface = str(args.interface).strip().lower()
    can_channel = _parse_can_channel(args.channel)
    can_bitrate = int(args.bitrate)
    relay_interface = str(args.relay_interface).strip().lower() or can_interface
    relay_channel = _parse_can_channel(args.relay_channel)
    relay_bitrate = int(args.relay_bitrate)

    print("43009 PWS mode state-machine verifier (sim side)")
    print(
        f"CAN backend: interface={can_interface}, channel={can_channel}, bitrate={can_bitrate}; "
        f"cycles={args.cycles}"
    )
    print(
        f"K1 relay: {'enabled' if args.cycle_k1 else 'disabled'} "
        f"(interface={relay_interface}, channel={relay_channel}, bitrate={relay_bitrate})"
    )
    print(
        f"Timing: startup_timeout={args.startup_timeout:.1f}s, "
        f"intercycle_timeout={args.intercycle_timeout:.1f}s, cycle_timeout={args.cycle_timeout:.1f}s"
    )
    print(
        f"Timing checks: {'enabled' if args.verify_timing else 'disabled'}"
        + (
            f", startup={args.startup_target_sec:.1f}+/-{args.startup_tolerance_sec:.1f}s "
            f"(ref={args.startup_reference}), step={args.step_target_sec:.3f}+/-{args.step_tolerance_sec:.3f}s, "
            f"intercycle={args.intercycle_target_sec:.1f}+/-{args.intercycle_tolerance_sec:.1f}s"
            if args.verify_timing
            else ""
        )
    )

    try:
        bus = open_can_bus(can_interface, can_channel, can_bitrate)
    except Exception as exc:
        raise RuntimeError(
            "Unable to open CAN bus with python-can. "
            f"Check interface/channel/bitrate and driver install. Details: {format_error(exc)}"
        ) from exc

    diag = {"rx_total": 0, "id_counts": {}}
    runtime = {"last_reset_time": None, "k1_cycle_done_time": None}
    cycle_results = []
    relay_bus = None
    relay_bus_owns_handle = False

    try:
        if args.cycle_k1:
            same_path = (
                str(relay_channel).strip() == str(can_channel).strip()
                and relay_interface == can_interface
                and relay_bitrate == can_bitrate
            )
            if same_path:
                relay_bus = bus
                relay_bus_owns_handle = False
            else:
                relay_bus = open_can_bus(relay_interface, relay_channel, relay_bitrate)
                relay_bus_owns_handle = True
            cycle_k1(relay_bus, args.k1_off_wait, args.k1_on_wait, args.k1_settle_wait)
            runtime["k1_cycle_done_time"] = time.monotonic()
            print("[INFO] K1 cycle complete; startup timing anchor captured.")

        if args.no_mode_config:
            print("Mode config disabled by --no-mode-config.")
        else:
            send_mode_config(bus, args.config_user_id)

        if args.request_feac_once:
            send_msg(bus, ID_REQ_FEAC, [0x00, 0xFE, 0xAC], "REQ_FEAC_ONCE")

        previous_init_time = None
        for cycle_idx in range(1, args.cycles + 1):
            print("")
            print(f"--- Cycle {cycle_idx}/{args.cycles} ---")
            cycle_start = time.monotonic()
            result = run_cycle(bus, cycle_idx, args, diag, runtime)
            elapsed = time.monotonic() - cycle_start

            ok = bool(result["ok"])
            reason = str(result["reason"])
            init_time = result.get("init_time")

            if ok and args.verify_timing and previous_init_time is not None and init_time is not None:
                gap = init_time - previous_init_time
                print(f"[INFO] Inter-cycle INIT gap: {gap:.3f}s")
                if abs(gap - args.intercycle_target_sec) <= args.intercycle_tolerance_sec:
                    print(
                        f"[PASS] Inter-cycle timing: {gap:.3f}s "
                        f"(target={args.intercycle_target_sec:.1f}s +/- {args.intercycle_tolerance_sec:.1f}s)"
                    )
                else:
                    ok = False
                    reason = (
                        f"inter-cycle timing out of tolerance: {gap:.3f}s "
                        f"(target={args.intercycle_target_sec:.1f}s +/- {args.intercycle_tolerance_sec:.1f}s)"
                    )

            if init_time is not None:
                previous_init_time = init_time

            cycle_results.append((ok, elapsed, reason))
            if ok:
                print(f"[PASS] cycle#{cycle_idx} complete in {elapsed:.3f}s ({reason})")
            else:
                print(f"[FAIL] cycle#{cycle_idx} failed in {elapsed:.3f}s ({reason})")
                break

        print("")
        print("========== FINAL SUMMARY ==========")
        overall_pass = True
        for idx, (ok, elapsed, reason) in enumerate(cycle_results, start=1):
            status = "PASS" if ok else "FAIL"
            print(f"{status} cycle#{idx} ({elapsed:.3f}s) - {reason}")
            if not ok:
                overall_pass = False

        top = diag_top_ids(diag)
        if top == "":
            top = "none"
        print(f"DIAG rx_total={diag['rx_total']} top_ids={top}")
        print("OVERALL:", "PASS" if overall_pass else "FAIL")
    finally:
        if relay_bus_owns_handle and relay_bus is not None:
            relay_bus.shutdown()
        bus.shutdown()


if __name__ == "__main__":
    main()
