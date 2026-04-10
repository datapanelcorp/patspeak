#!/usr/bin/env python3
"""Minimal sanity check for enabling DPLF1 traffic on 43019.

This script sends a small set of CTRL1 (Command=0x52) frames and then watches
the bus for DPLF1 (0x18FFFBD9) traffic.

Use this when you want to isolate "does the node emit DPLF1?" without running
the full PAT test flow.
"""

from __future__ import annotations

import argparse
import sys
import time
from pathlib import Path
from typing import Any

import can
import cantools


EXT_MASK = 0x1FFFFFFF


def wire_id(frame_id: int) -> int:
    """Convert DBC frame id to on-wire arbitration id."""
    return int(frame_id) & EXT_MASK


def default_signal_map(msg: Any) -> dict[str, Any]:
    """Initialize all message signals (cantools may require full mux payload)."""
    out: dict[str, Any] = {}
    for s in msg.signals:
        out[s.name] = s.initial if getattr(s, "initial", None) is not None else 0
    return out


def build_ctrl82_payload(db: cantools.database.Database, *, fault_reset: int, save_settings: int) -> bytes:
    """Build a CTRL1 Command=82 payload with DPLF1/DPLF2 enabled."""
    msg = db.get_message_by_name("CTRL1")

    signal_names = {s.name for s in msg.signals}
    adraw_name = "ADRaw" if "ADRaw" in signal_names else "Analog_Raw_Value"

    signals = default_signal_map(msg)
    signals.update(
        {
            "Command": 82,
            "FaultReset": fault_reset,
            "SaveSettings": save_settings,
            "Enable_FAULT": 1,
            "Enable_DPLF1": 1,
            "Enable_DPLF2": 1,
            "MODE2": 0,
            adraw_name: 0,
            "ID1": 0,
        }
    )
    return bytes(msg.encode(signals, scaling=True, strict=False))


def build_ctrl83_payload(db: cantools.database.Database) -> bytes:
    """Build a CTRL1 Command=83 payload with MODE1..MODE5 set to 1."""
    msg = db.get_message_by_name("CTRL1")
    signals = default_signal_map(msg)
    signals.update(
        {
            "Command": 83,
            "MODE1A": 1,
            "MODE1B": 1,
            "MODE2A": 1,
            "MODE2B": 1,
            "MODE3A": 1,
            "MODE3B": 1,
            "MODE4A": 1,
            "MODE4B": 1,
            "MODE5A": 1,
            "MODE5B": 1,
        }
    )
    return bytes(msg.encode(signals, scaling=True, strict=False))


def parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser(description="Enable DPLF1 and monitor traffic")
    p.add_argument("--dbc", default="dbc/43019-560.dbc", help="Path to UUT DBC")
    p.add_argument("--interface", default="kvaser", help="python-can interface (default: kvaser)")
    p.add_argument("--channel", default="0", help="CAN channel (default: 0)")
    p.add_argument("--bitrate", type=int, default=250000, help="CAN bitrate (default: 250000)")
    p.add_argument("--tx-seconds", type=float, default=3.0, help="Seconds to send enable command")
    p.add_argument("--tx-rate-hz", type=float, default=10.0, help="Enable command send rate")
    p.add_argument("--rx-seconds", type=float, default=5.0, help="Additional listen time after TX")
    p.add_argument(
        "--include-mode83",
        action="store_true",
        help="Also send Command=83 MODE1..5=1 before enable (matches PAT setup)",
    )
    p.add_argument(
        "--save-settings",
        action="store_true",
        help="Set SaveSettings=1 on enable frames (default: off to avoid persistent writes)",
    )
    p.add_argument(
        "--send-no-logic",
        action="store_true",
        help="Send bootloader/no-logic frame (05 05 01 09 07 07 00 00) before config commands",
    )
    p.add_argument(
        "--node-address",
        default="0xD9",
        help="Node address byte for bootloader/no-logic frame (default: 0xD9)",
    )
    p.add_argument(
        "--boot-sa",
        default="0x27",
        help="Source address byte for bootloader/no-logic frame (default: 0x27 / 39)",
    )
    p.add_argument(
        "--no-logic-count",
        type=int,
        default=5,
        help="How many no-logic frames to send when --send-no-logic is set (default: 5)",
    )
    p.add_argument(
        "--no-logic-interval-ms",
        type=float,
        default=50.0,
        help="Delay between no-logic frames in milliseconds (default: 50)",
    )
    p.add_argument("--dry-run", action="store_true", help="Print frames only, do not open CAN")
    return p.parse_args()


def main() -> int:
    args = parse_args()

    dbc_path = Path(args.dbc)
    if not dbc_path.exists():
        print(f"ERROR: DBC not found: {dbc_path}")
        return 2

    db = cantools.database.load_file(str(dbc_path), strict=False)

    ctrl_id = wire_id(db.get_message_by_name("CTRL1").frame_id)
    dplf1_id = wire_id(db.get_message_by_name("DPLF1").frame_id)
    dplf2_id = wire_id(db.get_message_by_name("DPLF2").frame_id)
    stat_id = wire_id(db.get_message_by_name("STAT").frame_id)
    digin_id = wire_id(db.get_message_by_name("DIGIN").frame_id)

    payload_reset = build_ctrl82_payload(
        db,
        fault_reset=1,
        save_settings=1 if args.save_settings else 0,
    )
    payload_hold = build_ctrl82_payload(
        db,
        fault_reset=0,
        save_settings=1 if args.save_settings else 0,
    )
    payload_mode83 = build_ctrl83_payload(db) if args.include_mode83 else None

    def parse_byte(value: str) -> int:
        return int(str(value).strip(), 0) & 0xFF

    node_addr = parse_byte(args.node_address)
    boot_sa = parse_byte(args.boot_sa)
    boot_pf = 0xFE
    # 29-bit J1939-ish ID: priority 6 (0x18), PF=0xFE, PS=node, SA=boot_sa
    no_logic_id = 0x18000000 | (boot_pf << 16) | (node_addr << 8) | boot_sa
    no_logic_payload = bytes([0x05, 0x05, 0x01, 0x09, 0x07, 0x07, 0x00, 0x00])

    print("Sanity check config:")
    print(f"  DBC:        {dbc_path}")
    print(f"  CAN iface:  {args.interface}")
    print(f"  CAN ch:     {args.channel}")
    print(f"  Bitrate:    {args.bitrate}")
    print(f"  CTRL1 ID:   0x{ctrl_id:08X}")
    print(f"  DPLF1 ID:   0x{dplf1_id:08X}")
    print(f"  DPLF2 ID:   0x{dplf2_id:08X}")
    print("")
    print(f"  Command=82 reset frame: {payload_reset.hex(' ')}")
    print(f"  Command=82 hold frame:  {payload_hold.hex(' ')}")
    if payload_mode83 is not None:
        print(f"  Command=83 mode frame:  {payload_mode83.hex(' ')}")
    if args.send_no_logic:
        print(f"  NO-LOGIC frame ID:      0x{no_logic_id:08X}")
        print(f"  NO-LOGIC frame data:    {no_logic_payload.hex(' ')}")

    if args.dry_run:
        print("\nDry run only. No CAN traffic sent.")
        return 0

    channel: Any
    ch_str = str(args.channel).strip()
    if ch_str.isdigit():
        channel = int(ch_str)
    else:
        channel = ch_str

    tx_period = 1.0 / max(args.tx_rate_hz, 0.1)
    tx_until = time.monotonic() + max(args.tx_seconds, 0.0)
    rx_until = tx_until + max(args.rx_seconds, 0.0)

    counts = {
        dplf1_id: 0,
        dplf2_id: 0,
        stat_id: 0,
        digin_id: 0,
    }

    first_dplf1: bytes | None = None
    sent = 0
    sent_no_logic = 0
    sent_cmds: list[tuple[str, bytes]] = []

    if payload_mode83 is not None:
        sent_cmds.append(("CMD53_MODE", payload_mode83))
    sent_cmds.append(("CMD52_RESET", payload_reset))
    sent_cmds.append(("CMD52_HOLD", payload_hold))
    sent_cmd_code_by_label = {label: int(cmd[0]) for label, cmd in sent_cmds if len(cmd) == 8}

    stat_ack_events: list[tuple[float, str, bytes]] = []
    stat_nak_events: list[tuple[float, str, bytes]] = []
    stat_other_frames: list[tuple[float, bytes]] = []
    last_stat_raw: bytes | None = None
    last_stat_decoded: dict[str, Any] | None = None

    bus = can.Bus(interface=args.interface, channel=channel, bitrate=args.bitrate)
    try:
        if args.send_no_logic:
            interval_s = max(args.no_logic_interval_ms, 0.0) / 1000.0
            count = max(int(args.no_logic_count), 0)
            for _ in range(count):
                bus.send(
                    can.Message(
                        arbitration_id=no_logic_id,
                        data=no_logic_payload,
                        is_extended_id=True,
                    )
                )
                sent_no_logic += 1
                if interval_s > 0:
                    time.sleep(interval_s)

        # Optional setup frame first.
        if payload_mode83 is not None:
            bus.send(can.Message(arbitration_id=ctrl_id, data=payload_mode83, is_extended_id=True))
            time.sleep(0.05)

        # Pulse reset once, then hold enable.
        bus.send(can.Message(arbitration_id=ctrl_id, data=payload_reset, is_extended_id=True))
        time.sleep(0.05)

        next_tx = time.monotonic()
        while time.monotonic() < rx_until:
            now = time.monotonic()

            if now < tx_until and now >= next_tx:
                bus.send(can.Message(arbitration_id=ctrl_id, data=payload_hold, is_extended_id=True))
                sent += 1
                next_tx = now + tx_period

            msg = bus.recv(timeout=0.02)
            if msg is None:
                continue

            arb = int(msg.arbitration_id) & EXT_MASK
            if arb in counts:
                counts[arb] += 1
            if arb == dplf1_id and first_dplf1 is None:
                first_dplf1 = bytes(msg.data)
            if arb == stat_id:
                now_wall = time.time()
                raw = bytes(msg.data)
                last_stat_raw = raw
                # Decode with DBC view when possible (normal STAT format).
                try:
                    last_stat_decoded = db.get_message_by_name("STAT").decode(raw, decode_choices=False)
                except Exception:
                    last_stat_decoded = None

                # Firmware special-response format:
                #   ACK: Data[0] = LastCommand, Data[1..7] = echoed CmdData[1..7]
                #   NAK: Data[0] = 0xFE,       Data[1..7] = echoed CmdData[1..7]
                matched_label = ""
                if len(raw) == 8:
                    echo_tail = raw[1:8]
                    for label, cmd in sent_cmds:
                        if len(cmd) == 8 and echo_tail == cmd[1:8]:
                            matched_label = label
                            break

                    if raw[0] == 0xFE:
                        stat_nak_events.append((now_wall, matched_label or "UNKNOWN_CMD", raw))
                    elif matched_label and int(raw[0]) == sent_cmd_code_by_label.get(matched_label, -1):
                        stat_ack_events.append((now_wall, matched_label, raw))
                    else:
                        stat_other_frames.append((now_wall, raw))

    finally:
        try:
            bus.shutdown()
        except Exception:
            pass

    print("\nObserved traffic:")
    print(f"  DPLF1 (0x{dplf1_id:08X}) count: {counts[dplf1_id]}")
    print(f"  DPLF2 (0x{dplf2_id:08X}) count: {counts[dplf2_id]}")
    print(f"  STAT  (0x{stat_id:08X}) count: {counts[stat_id]}")
    print(f"  DIGIN (0x{digin_id:08X}) count: {counts[digin_id]}")
    print(f"  CTRL1 hold frames sent:        {sent}")
    if args.send_no_logic:
        print(f"  NO-LOGIC frames sent:          {sent_no_logic}")

    print("\nSTAT analysis:")
    print(f"  ACK echoes: {len(stat_ack_events)}")
    print(f"  NAK echoes: {len(stat_nak_events)}")
    print(f"  Other STAT frames: {len(stat_other_frames)}")
    if stat_ack_events:
        labels = {}
        for _, label, _ in stat_ack_events:
            labels[label] = labels.get(label, 0) + 1
        print("  ACK by command:")
        for label, n in sorted(labels.items()):
            print(f"    {label}: {n}")
    if stat_nak_events:
        labels = {}
        for _, label, _ in stat_nak_events:
            labels[label] = labels.get(label, 0) + 1
        print("  NAK by command:")
        for label, n in sorted(labels.items()):
            print(f"    {label}: {n}")
    if last_stat_raw is not None:
        cmd_status = int(last_stat_raw[6]) | (int(last_stat_raw[7]) << 8)
        print(f"  Last STAT raw: {last_stat_raw.hex(' ')}")
        print(f"  Last STAT CmdStatus word (D6/D7 LE): 0x{cmd_status:04X}")
    if last_stat_decoded:
        keys = [
            "CMND_52h_RCVD",
            "CMND_53h_RCVD",
            "CMND_54h_RCVD",
            "CMND_55h_RCVD",
            "CMND_56h_RCVD",
            "CMND_57h_RCVD",
        ]
        present = [k for k in keys if k in last_stat_decoded]
        if present:
            print("  Last STAT decoded command flags:")
            for k in present:
                print(f"    {k}: {last_stat_decoded[k]}")

    if first_dplf1 is not None:
        dplf1_msg = db.get_message_by_name("DPLF1")
        decoded = dplf1_msg.decode(first_dplf1, decode_choices=False)
        print(f"\nFirst DPLF1 frame data: {first_dplf1.hex(' ')}")
        print("Decoded DPLF1 subset:")
        for name in ("SpwrStat1", "SpwrStat2", "SpwrStat3", "SpwrStat4", "Save_Counter"):
            if name in decoded:
                print(f"  {name}: {decoded[name]}")
        return 0

    print("\nRESULT: No DPLF1 frames observed.")
    print("If DPLF2/STAT/DIGIN are present, this strongly points to a DUT firmware/feature issue.")
    return 1


if __name__ == "__main__":
    sys.exit(main())
