import argparse
import os
import time

import can


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


def _j1939_pgn_from_id(arbitration_id):
    arb = int(arbitration_id) & 0x1FFFFFFF
    pf = (arb >> 16) & 0xFF
    pgn = (arb >> 8) & 0x3FFFF
    if pf < 240:
        pgn &= 0x3FF00
    return pgn


def _format_id(arbitration_id):
    return f"0x{(int(arbitration_id) & 0x1FFFFFFF):08X}"


def _format_data(data):
    return " ".join(f"{int(b) & 0xFF:02X}" for b in bytes(data))


def _request_id(dest_sa, source_sa):
    return 0x18EA0000 | ((int(dest_sa) & 0xFF) << 8) | (int(source_sa) & 0xFF)


def _request_payload(requested_pgn):
    pgn = int(requested_pgn) & 0x3FFFF
    return bytes([pgn & 0xFF, (pgn >> 8) & 0xFF, (pgn >> 16) & 0xFF, 0, 0, 0, 0, 0])


def _send_request_burst(bus, *, requested_pgn, source_sa, dest_sa, include_global, repeat, interval_s):
    ids = []
    if include_global:
        ids.append(_request_id(0xFF, source_sa))
    if dest_sa is not None:
        ids.append(_request_id(dest_sa, source_sa))
    if not ids:
        return

    payload = _request_payload(requested_pgn)
    for i in range(max(1, int(repeat))):
        for arbitration_id in ids:
            out = can.Message(arbitration_id=arbitration_id, is_extended_id=True, data=payload)
            bus.send(out)
            print(f"TX REQ {_format_id(arbitration_id)} data={_format_data(payload)}")
        if i + 1 < max(1, int(repeat)) and float(interval_s) > 0.0:
            time.sleep(float(interval_s))


def parse_args():
    default_interface, default_channel, default_bitrate = _default_can_settings()

    parser = argparse.ArgumentParser(
        description="Wait for a J1939 frame matching PGN (and optional source SA)."
    )
    parser.add_argument("--interface", default=default_interface, help="python-can interface.")
    parser.add_argument("--channel", default=str(default_channel), help="python-can channel.")
    parser.add_argument("--bitrate", type=int, default=default_bitrate, help="CAN bitrate.")
    parser.add_argument("--pgn", type=lambda x: int(str(x), 0), required=True, help="Target J1939 PGN.")
    parser.add_argument(
        "--source-sa",
        type=lambda x: int(str(x), 0),
        default=None,
        help="Optional expected source address (0..255).",
    )
    parser.add_argument(
        "--request-from-sa",
        type=lambda x: int(str(x), 0),
        default=None,
        help="Optional request source SA; if set, sends Request PGN burst before waiting.",
    )
    parser.add_argument(
        "--request-dest-sa",
        type=lambda x: int(str(x), 0),
        default=None,
        help="Optional directed request destination SA.",
    )
    parser.add_argument(
        "--request-global",
        action="store_true",
        help="Also send global request (DA=0xFF).",
    )
    parser.add_argument("--request-repeat", type=int, default=2, help="Request burst count.")
    parser.add_argument("--request-interval", type=float, default=0.05, help="Seconds between repeats.")
    parser.add_argument("--timeout", type=float, default=2.0, help="Timeout in seconds.")
    return parser.parse_args()


def main():
    args = parse_args()
    target_pgn = int(args.pgn) & 0x3FFFF
    source_sa = None if args.source_sa is None else (int(args.source_sa) & 0xFF)
    request_from_sa = None if args.request_from_sa is None else (int(args.request_from_sa) & 0xFF)
    request_dest_sa = None if args.request_dest_sa is None else (int(args.request_dest_sa) & 0xFF)
    can_channel = _parse_can_channel(args.channel)

    print(
        "wait_for_j1939_pgn: "
        f"interface={args.interface} channel={can_channel} bitrate={int(args.bitrate)} "
        f"pgn=0x{target_pgn:05X} sa="
        + ("ANY" if source_sa is None else f"0x{source_sa:02X}")
        + f" timeout={float(args.timeout):.3f}s"
    )

    try:
        try:
            bus = can.Bus(interface=str(args.interface).strip().lower(), channel=can_channel, bitrate=int(args.bitrate))
        except TypeError:
            bus = can.Bus(bustype=str(args.interface).strip().lower(), channel=can_channel, bitrate=int(args.bitrate))
    except Exception as exc:
        print(f"[FAIL] Unable to open CAN bus: {type(exc).__name__}: {exc}")
        print("PATSPEAK_RESULT=FAIL")
        return 2

    found = None
    rx_total = 0
    deadline = time.monotonic() + max(0.0, float(args.timeout))

    try:
        if request_from_sa is not None:
            _send_request_burst(
                bus,
                requested_pgn=target_pgn,
                source_sa=request_from_sa,
                dest_sa=request_dest_sa,
                include_global=bool(args.request_global),
                repeat=int(args.request_repeat),
                interval_s=float(args.request_interval),
            )

        while time.monotonic() < deadline:
            timeout = max(0.0, min(0.05, deadline - time.monotonic()))
            msg = bus.recv(timeout=timeout)
            if msg is None:
                continue
            rx_total += 1
            arb = int(getattr(msg, "arbitration_id", 0)) & 0x1FFFFFFF
            pgn = _j1939_pgn_from_id(arb)
            sa = arb & 0xFF
            if pgn != target_pgn:
                continue
            if source_sa is not None and sa != source_sa:
                continue
            found = (arb, bytes(getattr(msg, "data", b"")))
            break
    finally:
        try:
            bus.shutdown()
        except Exception:
            pass

    if found is None:
        print(
            "[FAIL] No matching frame seen: "
            f"PGN=0x{target_pgn:05X} SA="
            + ("ANY" if source_sa is None else f"0x{source_sa:02X}")
            + f" (rx_total={rx_total})"
        )
        print("PATSPEAK_RESULT=FAIL")
        return 1

    arb, data = found
    print(f"[PASS] Observed {_format_id(arb)} data={_format_data(data)}")
    print("PATSPEAK_RESULT=PASS")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
