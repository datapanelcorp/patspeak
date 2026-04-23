import time
from time import sleep
import can
import os

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


# Bench configuration (aligned with PAT defaults)
CAN_INTERFACE = str(os.environ.get("PATSPEAK_CAN_INTERFACE", "kvaser")).strip().lower() or "kvaser"
CAN_CHANNEL = _parse_can_channel(os.environ.get("PATSPEAK_CAN_CH0", "0"))
CAN_BITRATE = int(os.environ.get("PATSPEAK_CAN_BITRATE", "250000"))
CAN_RECV_TIMEOUT_SEC = 0.01
READ_SLEEP_SEC = 0.001

# PAT relay (K1) auto-start configuration
AUTO_CYCLE_K1 = _env_truthy("PATSPEAK_AUTO_CYCLE_K1", True)
RELAY_CAN_CHANNEL = _parse_can_channel(
    os.environ.get("PATSPEAK_CAN_CH1", os.environ.get("PATSPEAK_RELAY_CAN_CHANNEL", "1"))
)
RELAY_CAN_BITRATE = int(os.environ.get("PATSPEAK_RELAY_CAN_BITRATE", str(CAN_BITRATE)))
CTRL_RLY_FRAME_ID = 0x8CFF0500  # PAT.dbc: CTRL_RLY
K1_OFF_WAIT_SEC = 1.0
K1_ON_WAIT_SEC = 2.0
K1_SETTLE_WAIT_SEC = 1.0

# Use this source address unless your DUT was re-addressed.
EXPECTED_MODULE_SOURCE_ADDRESS = 0xD9

# Tester source addresses
CONFIG_SOURCE_ADDRESS = 0xD1
REQUEST_SOURCE_ADDRESS = 0xD1

# Timing targets under test
STARTUP_TIMER_SEC = 180.0  # 3 minutes
BURST_COUNT = 5
BURST_INTERVAL_SEC = 1.0
PERIODIC_INTERVAL_SEC = 300.0  # 5 minutes

# Timing tolerances for jitter / scheduler skew
STARTUP_TOLERANCE_SEC = 8.0
BURST_TOLERANCE_SEC = 0.40
PERIODIC_TOLERANCE_SEC = 10.0

# Script action timeouts
ADDRESS_CLAIM_TIMEOUT_SEC = 180.0
ENABLE_VERIFY_TIMEOUT_SEC = 20.0
FIRST_65196_EXTRA_WAIT_SEC = 45.0
PERIODIC_EXTRA_WAIT_SEC = 45.0
REQUEST_RESPONSE_TIMEOUT_SEC = 3.0
POST_ADDRESS_CLAIM_SETTLE_SEC = 1.0
CONFIG_RETRY_INTERVAL_SEC = 0.5

# J1939 PGNs
PGN_ADDRESS_CLAIM = 0x00EE00
PGN_REQUEST = 0x00EA00
PGN_CMD_CONFIG = 0x00EF00
PGN_65196 = 0x00FEAC
PGN_ACKM = 0x00E800

REQUIRED_ENABLED_MESSAGES = {
    "DIGIN1": 0x00FF15,
    "AD2": 0x00FF16,
    "AD3": 0x00FF17,
    "DPLF2": 0x00FFFC,
    "FAULT": 0x00FFE6,
}

# CMD_CONFIG payload:
# byte0 command=0x01
# byte1 enable DIGIN1 + AD2 + AD3 => 0x54
# byte2 no additional bits set
# byte3 enable DPLF2(F2) + FAULT => 0x05
# byte4 PWS mode preserved as 0x01
# byte7 user id
CONFIG_PAYLOAD = [0x01, 0x54, 0x00, 0x05, 0x01, 0x00, 0x00, 69]

# Request PGN 65196 (0x00FEAC) using J1939 LSB-first payload
REQUEST_65196_PAYLOAD = [0xAC, 0xFE, 0x00]
UNSUPPORTED_REQUEST_PAYLOAD = [0x23, 0xF1, 0x00]  # PGN 0x00F123


def format_error(exc):
    return f"{type(exc).__name__}: {exc}"


def open_can_bus():
    # interface=... is preferred in newer python-can; bustype=... keeps backward compatibility.
    try:
        return can.Bus(interface=CAN_INTERFACE, channel=CAN_CHANNEL, bitrate=CAN_BITRATE)
    except TypeError:
        return can.Bus(bustype=CAN_INTERFACE, channel=CAN_CHANNEL, bitrate=CAN_BITRATE)


def open_relay_bus():
    # interface=... is preferred in newer python-can; bustype=... keeps backward compatibility.
    try:
        return can.Bus(interface=CAN_INTERFACE, channel=RELAY_CAN_CHANNEL, bitrate=RELAY_CAN_BITRATE)
    except TypeError:
        return can.Bus(bustype=CAN_INTERFACE, channel=RELAY_CAN_CHANNEL, bitrate=RELAY_CAN_BITRATE)


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
        print(f"[WARN] Read error: {format_error(exc)}")
        return None, None

    if message is None:
        return None, None

    return message, time.monotonic()


def write_k1(relay_bus, state):
    # PAT.dbc CTRL_RLY: RLY_K1 is a 2-bit value at bit 0.
    data = bytearray(8)
    data[0] = int(state) & 0x03
    return write_ext_message(relay_bus, CTRL_RLY_FRAME_ID, data)


def cycle_k1(relay_bus):
    print("Cycling K1 relay to auto-start DUT...")

    ok, err = write_k1(relay_bus, 0)
    if not ok:
        return False, f"K1 OFF write failed: {err}"
    print(f"K1=0, wait {K1_OFF_WAIT_SEC:.1f}s")
    sleep(K1_OFF_WAIT_SEC)

    ok, err = write_k1(relay_bus, 1)
    if not ok:
        return False, f"K1 ON write failed: {err}"
    print(f"K1=1, wait {K1_ON_WAIT_SEC:.1f}s")
    sleep(K1_ON_WAIT_SEC)

    ok, err = write_k1(relay_bus, 0)
    if not ok:
        return False, f"K1 settle write failed: {err}"
    print(f"K1=0, wait {K1_SETTLE_WAIT_SEC:.1f}s")
    sleep(K1_SETTLE_WAIT_SEC)

    return True, None


def wait_for_address_claim(bus):
    print("Waiting for DUT address claim to start 3-minute timer...")
    print("Tip: power-cycle the module now so timing starts from boot.")

    deadline = time.monotonic() + ADDRESS_CLAIM_TIMEOUT_SEC
    next_progress = time.monotonic() + 10.0

    while time.monotonic() < deadline:
        message, rx_time = poll_bus_once(bus)
        if message is not None:
            if not message.is_extended_id:
                continue

            pgn, source_address, destination_address = parse_j1939_id(message.arbitration_id)
            if pgn == PGN_ADDRESS_CLAIM and destination_address == 0xFF:
                if EXPECTED_MODULE_SOURCE_ADDRESS is None or source_address == EXPECTED_MODULE_SOURCE_ADDRESS:
                    print(f"Address claim detected from DUT SA=0x{source_address:02X}.")
                    return source_address, rx_time

        now = time.monotonic()
        if now >= next_progress:
            remaining = max(0.0, deadline - now)
            print(f"...still waiting for address claim ({remaining:.0f}s timeout remaining)")
            next_progress = now + 10.0
        sleep(READ_SLEEP_SEC)

    return None, None


def main():
    print("Default Mode Operation verifier started.")
    print(
        "Checks under test: startup timer, 65196 burst, periodic/on-request 65196, "
        "CAN-control enable, and unsupported-request NACK behavior"
    )
    print(f"CAN backend: interface={CAN_INTERFACE}, uut_channel={CAN_CHANNEL}, bitrate={CAN_BITRATE}")
    print(
        f"K1 relay control: {'enabled' if AUTO_CYCLE_K1 else 'disabled'} "
        f"(channel={RELAY_CAN_CHANNEL}, bitrate={RELAY_CAN_BITRATE})"
    )

    try:
        bus = open_can_bus()
    except Exception as exc:
        print(
            "[FAIL] Unable to open CAN bus with python-can. "
            "Check python-can driver install, interface name, and channel."
        )
        print(f"       Details: {format_error(exc)}")
        return

    relay_bus = None
    relay_bus_owns_handle = False
    relay_auto_enabled = AUTO_CYCLE_K1

    if AUTO_CYCLE_K1:
        try:
            if str(RELAY_CAN_CHANNEL).strip() == str(CAN_CHANNEL).strip():
                relay_bus = bus
                relay_bus_owns_handle = False
            else:
                relay_bus = open_relay_bus()
                relay_bus_owns_handle = True
        except Exception as exc:
            relay_auto_enabled = False
            print(
                "[WARN] Unable to open relay CAN bus for K1 auto-cycle; "
                "continuing with manual startup flow."
            )
            print(f"       Details: {format_error(exc)}")
            print("       Set PATSPEAK_AUTO_CYCLE_K1=0 to silence this warning.")

    results = {
        "Startup 3-minute timer": False,
        "65196 burst (5x @1s)": False,
        "65196 periodic 5-minute + on-request response": False,
        "DIGIN1/AD2/AD3/DPLF2/FAULT enabled via CAN Control": False,
        "Request behavior: unsupported PGN returns NACK ACKM": False,
    }

    seen_enabled = {}
    pgn65196_timestamps = []

    try:
        if relay_auto_enabled:
            ok, err = cycle_k1(relay_bus)
            if not ok:
                relay_auto_enabled = False
                print(f"[WARN] K1 auto-cycle failed: {err}")
                print("       Continuing with manual startup flow.")
        else:
            print("Manual startup mode: cycle K1/power now if needed.")

        module_sa, t_address_claim = wait_for_address_claim(bus)
        if module_sa is None:
            expected_text = (
                f" SA 0x{EXPECTED_MODULE_SOURCE_ADDRESS:02X}" if EXPECTED_MODULE_SOURCE_ADDRESS is not None else ""
            )
            print(f"[FAIL] No DUT address claim received within timeout{expected_text}.")
            return

        # Let AddressClaimed settle before first config command. Without this,
        # early commands can be dropped while MsgIncoming still ignores traffic.
        settle_deadline = time.monotonic() + POST_ADDRESS_CLAIM_SETTLE_SEC
        print(f"Waiting {POST_ADDRESS_CLAIM_SETTLE_SEC:.1f}s after address claim before CMD_CONFIG...")
        while time.monotonic() < settle_deadline:
            message, rx_time = poll_bus_once(bus)
            if message is not None and message.is_extended_id:
                pgn, source_address, _ = parse_j1939_id(message.arbitration_id)
                if source_address == module_sa and pgn == PGN_65196:
                    pgn65196_timestamps.append(rx_time)
                    rel = rx_time - t_address_claim
                    print(f"PGN 65196 observed early at +{rel:.2f}s (tracking).")
            sleep(READ_SLEEP_SEC)

        # Enable required messages using CAN Control CMD_CONFIG
        config_id = build_j1939_id(6, PGN_CMD_CONFIG, CONFIG_SOURCE_ADDRESS, module_sa)
        config_tx_count = 0
        config_ack_seen = False

        enable_deadline = time.monotonic() + ENABLE_VERIFY_TIMEOUT_SEC
        next_config_tx = 0.0
        while time.monotonic() < enable_deadline:
            now = time.monotonic()
            if now >= next_config_tx:
                write_ok, error_text = write_ext_message(bus, config_id, CONFIG_PAYLOAD)
                config_tx_count += 1
                if not write_ok:
                    print(f"[WARN] CMD_CONFIG tx#{config_tx_count} failed: {error_text}")
                elif config_tx_count == 1:
                    print(
                        f"Sent CMD_CONFIG to SA=0x{module_sa:02X}: "
                        f"{' '.join(f'{value:02X}' for value in CONFIG_PAYLOAD)}"
                    )
                next_config_tx = now + CONFIG_RETRY_INTERVAL_SEC

            message, rx_time = poll_bus_once(bus)
            if message is not None and message.is_extended_id:
                pgn, source_address, _ = parse_j1939_id(message.arbitration_id)
                if source_address == module_sa:
                    if pgn == PGN_CMD_CONFIG and len(message.data) >= 1:
                        status_cmd = message.data[0] & 0xFF
                        if status_cmd == 0x01 and not config_ack_seen:
                            config_ack_seen = True
                            print("CMD_CONFIG response observed (command accepted).")
                        elif status_cmd == 0xFE:
                            print("[WARN] CMD_CONFIG response indicates NACK.")
                    for name, required_pgn in REQUIRED_ENABLED_MESSAGES.items():
                        if pgn == required_pgn and name not in seen_enabled:
                            seen_enabled[name] = rx_time
                            rel = rx_time - t_address_claim
                            print(f"Enabled message seen: {name} (PGN 0x{required_pgn:05X}) at +{rel:.2f}s")
                    if pgn == PGN_65196:
                        pgn65196_timestamps.append(rx_time)
                        rel = rx_time - t_address_claim
                        print(f"PGN 65196 observed early at +{rel:.2f}s (tracking).")
            if len(seen_enabled) == len(REQUIRED_ENABLED_MESSAGES):
                break
            sleep(READ_SLEEP_SEC)

        missing = [name for name in REQUIRED_ENABLED_MESSAGES if name not in seen_enabled]
        if not missing:
            results["DIGIN1/AD2/AD3/DPLF2/FAULT enabled via CAN Control"] = True
            print("[PASS] All required messages were enabled and observed.")
        else:
            print(f"[FAIL] Missing enabled messages: {', '.join(missing)}")
            print(f"       CMD_CONFIG retries sent: {config_tx_count}, ack observed: {config_ack_seen}")

        # First 65196 after ~3 minutes, then 5x @1s
        first_65196_deadline = t_address_claim + STARTUP_TIMER_SEC + STARTUP_TOLERANCE_SEC + FIRST_65196_EXTRA_WAIT_SEC
        next_progress = time.monotonic() + 15.0
        while len(pgn65196_timestamps) < 1 and time.monotonic() < first_65196_deadline:
            message, rx_time = poll_bus_once(bus)
            if message is not None and message.is_extended_id:
                pgn, source_address, _ = parse_j1939_id(message.arbitration_id)
                if source_address == module_sa and pgn == PGN_65196:
                    pgn65196_timestamps.append(rx_time)
                    rel = rx_time - t_address_claim
                    print(f"PGN 65196 #1 seen at +{rel:.2f}s")
            now = time.monotonic()
            if now >= next_progress:
                remaining = max(0.0, first_65196_deadline - now)
                print(f"...waiting for first PGN 65196 ({remaining:.0f}s remaining)")
                next_progress = now + 15.0
            sleep(READ_SLEEP_SEC)

        if len(pgn65196_timestamps) < 1:
            print("[FAIL] First PGN 65196 not seen in expected startup window.")
        else:
            first_delay = pgn65196_timestamps[0] - t_address_claim
            print(f"First PGN 65196 delay from address claim: {first_delay:.3f}s")
            if abs(first_delay - STARTUP_TIMER_SEC) <= STARTUP_TOLERANCE_SEC:
                results["Startup 3-minute timer"] = True
                print("[PASS] First PGN 65196 aligns with 3-minute startup timer.")
            else:
                print(
                    "[FAIL] First PGN 65196 did not align with 3-minute timer "
                    f"(target={STARTUP_TIMER_SEC:.1f}s, tolerance=+/-{STARTUP_TOLERANCE_SEC:.1f}s)."
                )

            burst_deadline = pgn65196_timestamps[0] + (BURST_COUNT * (BURST_INTERVAL_SEC + BURST_TOLERANCE_SEC)) + 5.0
            while len(pgn65196_timestamps) < BURST_COUNT and time.monotonic() < burst_deadline:
                message, rx_time = poll_bus_once(bus)
                if message is not None and message.is_extended_id:
                    pgn, source_address, _ = parse_j1939_id(message.arbitration_id)
                    if source_address == module_sa and pgn == PGN_65196:
                        pgn65196_timestamps.append(rx_time)
                        idx = len(pgn65196_timestamps)
                        delta = pgn65196_timestamps[-1] - pgn65196_timestamps[-2]
                        rel = pgn65196_timestamps[-1] - t_address_claim
                        print(f"PGN 65196 #{idx} at +{rel:.2f}s (delta {delta:.3f}s)")
                sleep(READ_SLEEP_SEC)

            if len(pgn65196_timestamps) < BURST_COUNT:
                print(
                    f"[FAIL] Only {len(pgn65196_timestamps)} PGN 65196 "
                    f"messages seen in initial burst window."
                )
            else:
                burst_intervals = []
                burst_ok = True
                for i in range(1, BURST_COUNT):
                    dt = pgn65196_timestamps[i] - pgn65196_timestamps[i - 1]
                    burst_intervals.append(dt)
                    if abs(dt - BURST_INTERVAL_SEC) > BURST_TOLERANCE_SEC:
                        burst_ok = False

                print("Initial burst intervals: " + ", ".join(f"{dt:.3f}s" for dt in burst_intervals))
                if burst_ok:
                    results["65196 burst (5x @1s)"] = True
                    print("[PASS] Initial 5-message burst spacing is ~1 second.")
                else:
                    print(
                        "[FAIL] Initial burst interval(s) out of tolerance "
                        f"(target={BURST_INTERVAL_SEC:.1f}s, tolerance=+/-{BURST_TOLERANCE_SEC:.2f}s)."
                    )

        # Periodic at 5 minutes, plus request/response
        periodic_ok = False
        request_ok = False
        unsupported_request_ok = False

        if len(pgn65196_timestamps) >= BURST_COUNT:
            periodic_deadline = (
                pgn65196_timestamps[BURST_COUNT - 1]
                + PERIODIC_INTERVAL_SEC
                + PERIODIC_TOLERANCE_SEC
                + PERIODIC_EXTRA_WAIT_SEC
            )
            next_progress = time.monotonic() + 30.0
            while len(pgn65196_timestamps) < BURST_COUNT + 1 and time.monotonic() < periodic_deadline:
                message, rx_time = poll_bus_once(bus)
                if message is not None and message.is_extended_id:
                    pgn, source_address, _ = parse_j1939_id(message.arbitration_id)
                    if source_address == module_sa and pgn == PGN_65196:
                        pgn65196_timestamps.append(rx_time)
                        idx = len(pgn65196_timestamps)
                        delta = pgn65196_timestamps[-1] - pgn65196_timestamps[-2]
                        rel = pgn65196_timestamps[-1] - t_address_claim
                        print(f"PGN 65196 #{idx} at +{rel:.2f}s (delta {delta:.3f}s)")
                now = time.monotonic()
                if now >= next_progress:
                    remaining = max(0.0, periodic_deadline - now)
                    print(f"...waiting for periodic 5-minute PGN 65196 ({remaining:.0f}s remaining)")
                    next_progress = now + 30.0
                sleep(READ_SLEEP_SEC)

            if len(pgn65196_timestamps) >= BURST_COUNT + 1:
                periodic_gap = pgn65196_timestamps[BURST_COUNT] - pgn65196_timestamps[BURST_COUNT - 1]
                print(f"Post-burst periodic gap: {periodic_gap:.3f}s")
                if abs(periodic_gap - PERIODIC_INTERVAL_SEC) <= PERIODIC_TOLERANCE_SEC:
                    periodic_ok = True
                    print("[PASS] Periodic check: PGN 65196 repeated at ~5 minutes.")
                else:
                    print(
                        "[FAIL] Periodic check: gap out of tolerance "
                        f"(target={PERIODIC_INTERVAL_SEC:.1f}s, tolerance=+/-{PERIODIC_TOLERANCE_SEC:.1f}s)."
                    )
            else:
                print("[FAIL] Periodic check: no post-burst 5-minute PGN 65196 observed.")

            request_id = build_j1939_id(3, PGN_REQUEST, REQUEST_SOURCE_ADDRESS, module_sa)
            write_ok, error_text = write_ext_message(bus, request_id, REQUEST_65196_PAYLOAD)
            if not write_ok:
                print(f"[FAIL] Request check: failed to send request: {error_text}")
            else:
                request_sent = time.monotonic()
                print(
                    f"Sent PGN 65196 request to SA=0x{module_sa:02X}: "
                    f"{' '.join(f'{value:02X}' for value in REQUEST_65196_PAYLOAD)}"
                )

                response_deadline = request_sent + REQUEST_RESPONSE_TIMEOUT_SEC
                while time.monotonic() < response_deadline:
                    message, rx_time = poll_bus_once(bus)
                    if message is not None and message.is_extended_id:
                        pgn, source_address, _ = parse_j1939_id(message.arbitration_id)
                        if source_address == module_sa and pgn == PGN_65196:
                            delay = rx_time - request_sent
                            request_ok = True
                            print(f"On-request PGN 65196 response delay: {delay:.3f}s")
                            break
                    sleep(READ_SLEEP_SEC)

                if request_ok:
                    print("[PASS] Request check: DUT responded to PGN request.")
                else:
                    print(
                        "[FAIL] Request check: no PGN 65196 response within "
                        f"{REQUEST_RESPONSE_TIMEOUT_SEC:.1f}s."
                    )

            # Unsupported PGN request should return ACKM/NACK (PGN 0xE800)
            write_ok, error_text = write_ext_message(bus, request_id, UNSUPPORTED_REQUEST_PAYLOAD)
            if not write_ok:
                print(f"[FAIL] Unsupported request: failed to send request: {error_text}")
            else:
                req_pgn = (
                    ((UNSUPPORTED_REQUEST_PAYLOAD[2] & 0x03) << 16)
                    | (UNSUPPORTED_REQUEST_PAYLOAD[1] << 8)
                    | UNSUPPORTED_REQUEST_PAYLOAD[0]
                )
                print(
                    f"Sent unsupported PGN request 0x{req_pgn:05X} to SA=0x{module_sa:02X}: "
                    f"{' '.join(f'{value:02X}' for value in UNSUPPORTED_REQUEST_PAYLOAD)}"
                )
                nack_deadline = time.monotonic() + REQUEST_RESPONSE_TIMEOUT_SEC
                last_ackm_data = None
                while time.monotonic() < nack_deadline:
                    message, _ = poll_bus_once(bus)
                    if message is None or not message.is_extended_id:
                        sleep(READ_SLEEP_SEC)
                        continue

                    pgn, source_address, destination_address = parse_j1939_id(message.arbitration_id)
                    if source_address == module_sa and pgn == PGN_ACKM:
                        last_ackm_data = bytes(message.data)
                        if (
                            destination_address == REQUEST_SOURCE_ADDRESS
                            and len(last_ackm_data) >= 8
                            and last_ackm_data[0] == 0x01
                            and last_ackm_data[5] == UNSUPPORTED_REQUEST_PAYLOAD[0]
                            and last_ackm_data[6] == UNSUPPORTED_REQUEST_PAYLOAD[1]
                            and last_ackm_data[7] == UNSUPPORTED_REQUEST_PAYLOAD[2]
                        ):
                            unsupported_request_ok = True
                            print(
                                "[PASS] Unsupported request returned ACKM/NACK with matching requested PGN bytes."
                            )
                            break
                    sleep(READ_SLEEP_SEC)

                if not unsupported_request_ok:
                    if last_ackm_data is None:
                        print(
                            "[FAIL] Unsupported request: no ACKM/NACK received within "
                            f"{REQUEST_RESPONSE_TIMEOUT_SEC:.1f}s."
                        )
                    else:
                        print(
                            "[FAIL] Unsupported request: ACKM seen but payload mismatch: "
                            + " ".join(f"{b:02X}" for b in last_ackm_data)
                        )

        if periodic_ok and request_ok:
            results["65196 periodic 5-minute + on-request response"] = True
        if unsupported_request_ok:
            results["Request behavior: unsupported PGN returns NACK ACKM"] = True

        print("")
        print("========== FINAL SUMMARY ==========")
        for name, passed in results.items():
            status = "PASS" if passed else "FAIL"
            print(f"{status} - {name}")
        print("OVERALL:", "PASS" if all(results.values()) else "FAIL")

    finally:
        try:
            if relay_bus_owns_handle and relay_bus is not None:
                relay_bus.shutdown()
        except Exception:
            pass
        bus.shutdown()


if __name__ == "__main__":
    main()
