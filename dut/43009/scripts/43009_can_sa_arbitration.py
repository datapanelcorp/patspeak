#!/usr/bin/env python3
"""43009 J1939 source-address arbitration sweep runner.

This script is intended to be called from a PAT file via:
  PAT 43009_can_sa_arbitration.py [args...]

It is DBC-independent and works with raw J1939 CAN IDs so arbitration and
source-address behavior can be validated without signal decoding dependencies.
"""

from __future__ import annotations

import argparse
import sys
import time
from dataclasses import dataclass, field
from typing import Any

try:
    import can
except Exception as exc:  # pragma: no cover - environment-dependent import
    print(f"ERROR: python-can import failed: {exc}")
    print("PATSPEAK_RESULT=FAIL")
    raise SystemExit(2)


EXT_MASK = 0x1FFFFFFF

PERIODIC_ID_PREFIXES: list[tuple[str, int]] = [
    ("STAT", 0x18EFD100),
    ("DIGIN", 0x18FF1500),
    ("AD2", 0x18FF1600),
    ("AD3", 0x18FF1700),
    ("AD4", 0x18FF1800),
    ("DPLF2", 0x18FFFC00),
    ("FAULT", 0x18FFE600),
]

LOSING_NAME = bytes([0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF])
WINNING_NAME = bytes([0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])


def fmt_id(can_id: int) -> str:
    return "0x" + f"{(int(can_id) & EXT_MASK):08X}"


def fmt_data(data: bytes) -> str:
    return " ".join(f"{b:02X}" for b in data)


def parse_byte(value: str) -> int:
    return int(str(value).strip(), 0) & 0xFF


def parse_channel(value: str) -> Any:
    s = str(value).strip()
    if s == "":
        return s
    if s.lower().startswith("0x"):
        return int(s, 16)
    if s.isdigit():
        return int(s)
    return s


def ctrl1_id_for_dest(dest_sa: int, ctrl_sa: int) -> int:
    # Proprietary A, PDU1 destination semantics:
    # 0x18EF<dest><ctrl_src>
    return 0x18EF0000 | ((dest_sa & 0xFF) << 8) | (ctrl_sa & 0xFF)


def claim_id_for_sa(sa: int) -> int:
    # J1939 Address Claimed PGN 0xEE00 to global destination:
    # 0x18EEFF<source_sa>
    return 0x18EEFF00 | (sa & 0xFF)


def payload_set_sa(sa: int) -> bytes:
    # CTRL1 command 0x11 (CAN config / source address write)
    return bytes([0x11, 0x51, 0x50, sa & 0xFF, 0xFF, 0xFF, 0xFF, 0x05])


def payload_cmd0() -> bytes:
    return bytes([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])


def payload_enable_msgs() -> bytes:
    # Command 0x01 -> Enable DIGIN/AD2/AD3/AD4/DPLF2/FAULT.
    # Match DBC encoding used by 43009-1-EN_MSG-IDCHECK:
    # 01 54 01 05 00 00 00 00
    return bytes([0x01, 0x54, 0x01, 0x05, 0x00, 0x00, 0x00, 0x00])


@dataclass
class Results:
    failures: list[str] = field(default_factory=list)

    def pass_check(self, message: str) -> None:
        print(f"PASS: {message}")

    def fail_check(self, message: str) -> None:
        print(f"FAIL: {message}")
        self.failures.append(message)


def send_frame(bus: can.BusABC, can_id: int, data: bytes, note: str = "") -> None:
    msg = can.Message(arbitration_id=(can_id & EXT_MASK), data=data, is_extended_id=True)
    bus.send(msg)
    if note:
        print(f"TX {note}: {fmt_id(can_id)} : {fmt_data(data)}")
    else:
        print(f"TX: {fmt_id(can_id)} : {fmt_data(data)}")


def drain_bus(bus: can.BusABC, duration_s: float) -> int:
    if duration_s <= 0:
        return 0
    end = time.monotonic() + duration_s
    seen = 0
    while time.monotonic() < end:
        msg = bus.recv(timeout=min(0.02, max(0.0, end - time.monotonic())))
        if msg is not None:
            seen += 1
    return seen


def wait_for_id(bus: can.BusABC, can_id: int, timeout_s: float) -> bool:
    end = time.monotonic() + max(timeout_s, 0.0)
    target = can_id & EXT_MASK
    while time.monotonic() < end:
        remaining = max(0.0, end - time.monotonic())
        msg = bus.recv(timeout=min(0.05, remaining))
        if msg is None:
            continue
        arb = int(msg.arbitration_id) & EXT_MASK
        if arb == target:
            return True
    return False


def wait_for_stat_payload(
    bus: can.BusABC,
    *,
    sa: int,
    expected_payload: bytes,
    timeout_s: float,
) -> tuple[bool, bytes | None]:
    end = time.monotonic() + max(timeout_s, 0.0)
    stat_id = PERIODIC_ID_PREFIXES[0][1] | (sa & 0xFF)
    target = stat_id & EXT_MASK
    last_stat: bytes | None = None
    while time.monotonic() < end:
        remaining = max(0.0, end - time.monotonic())
        msg = bus.recv(timeout=min(0.05, remaining))
        if msg is None:
            continue
        arb = int(msg.arbitration_id) & EXT_MASK
        if arb != target:
            continue
        payload = bytes(msg.data)
        last_stat = payload
        if len(payload) >= len(expected_payload) and payload[: len(expected_payload)] == expected_payload:
            return True, payload
    return False, last_stat


def count_id(bus: can.BusABC, can_id: int, timeout_s: float) -> int:
    end = time.monotonic() + max(timeout_s, 0.0)
    target = can_id & EXT_MASK
    count = 0
    while time.monotonic() < end:
        remaining = max(0.0, end - time.monotonic())
        msg = bus.recv(timeout=min(0.05, remaining))
        if msg is None:
            continue
        arb = int(msg.arbitration_id) & EXT_MASK
        if arb == target:
            count += 1
    return count


def spray_set_sa(
    tx_bus: can.BusABC,
    *,
    target_sa: int,
    min_sa: int,
    max_sa: int,
    ctrl_sa: int,
    repeats: int,
    tx_gap_s: float,
) -> None:
    payload = payload_set_sa(target_sa)
    for _ in range(max(repeats, 1)):
        for dest_sa in range(min_sa, max_sa + 1):
            send_frame(
                tx_bus,
                ctrl1_id_for_dest(dest_sa, ctrl_sa),
                payload,
                note=f"SET_SA->{target_sa:02X}",
            )
            if tx_gap_s > 0:
                time.sleep(tx_gap_s)


def force_base_recovery_sweep(
    tx_bus: can.BusABC,
    rx_bus: can.BusABC,
    *,
    base_sa: int,
    recovery_min_sa: int,
    recovery_max_sa: int,
    ctrl_sa: int,
    recovery_repeats: int,
    tx_gap_s: float,
    recovery_settle_s: float,
    drain_s: float,
) -> None:
    print(
        "\n---- base recovery sweep "
        + f"(target=0x{base_sa:02X}, range=0x{recovery_min_sa:02X}..0x{recovery_max_sa:02X}) ----"
    )
    spray_set_sa(
        tx_bus,
        target_sa=base_sa,
        min_sa=recovery_min_sa,
        max_sa=recovery_max_sa,
        ctrl_sa=ctrl_sa,
        repeats=recovery_repeats,
        tx_gap_s=tx_gap_s,
    )
    if recovery_settle_s > 0:
        time.sleep(recovery_settle_s)
    drained = drain_bus(rx_bus, drain_s)
    print(f"INFO: base recovery sweep complete (drained {drained} frame(s))")


def send_cmd0_sequence(
    tx_bus: can.BusABC,
    *,
    sa: int,
    ctrl_sa: int,
    cmd0_retries: int,
    tx_gap_s: float,
) -> None:
    cmd0 = payload_cmd0()
    ctrl_id = ctrl1_id_for_dest(sa, ctrl_sa)

    for _ in range(max(cmd0_retries, 1)):
        send_frame(tx_bus, ctrl_id, cmd0, note=f"CMD0@{sa:02X}")
        if tx_gap_s > 0:
            time.sleep(tx_gap_s)

def send_enable_and_expect_ack(
    results: Results,
    tx_bus: can.BusABC,
    rx_bus: can.BusABC,
    *,
    sa: int,
    ctrl_sa: int,
    enable_retries: int,
    tx_gap_s: float,
    ack_timeout_s: float,
) -> bool:
    cmd1 = payload_enable_msgs()
    ctrl_id = ctrl1_id_for_dest(sa, ctrl_sa)

    for attempt in range(1, max(enable_retries, 1) + 1):
        send_frame(tx_bus, ctrl_id, cmd1, note=f"CMD1_ENABLE@{sa:02X}")
        if tx_gap_s > 0:
            time.sleep(tx_gap_s)
        ok, payload = wait_for_stat_payload(
            rx_bus,
            sa=sa,
            expected_payload=cmd1,
            timeout_s=ack_timeout_s,
        )
        if ok:
            results.pass_check(
                f"CMD1 ACK at SA 0x{sa:02X}: {fmt_data(payload if payload is not None else cmd1)}"
            )
            return True
        if payload is not None:
            print(
                "INFO: CMD1 attempt "
                + str(attempt)
                + f" at SA 0x{sa:02X} saw STAT payload "
                + fmt_data(payload)
            )
        else:
            print(
                "INFO: CMD1 attempt "
                + str(attempt)
                + f" at SA 0x{sa:02X} saw no STAT payload"
            )

    results.fail_check(
        f"CMD1 ACK missing at SA 0x{sa:02X} (expected {fmt_data(cmd1)} within {ack_timeout_s:.2f}s)"
    )
    return False


def verify_periodic_ids(
    results: Results,
    rx_bus: can.BusABC,
    *,
    sa: int,
    timeout_s: float,
    status_only: bool,
) -> bool:
    ids_to_check = PERIODIC_ID_PREFIXES if not status_only else PERIODIC_ID_PREFIXES[:1]
    ok = True
    for name, prefix in ids_to_check:
        can_id = prefix | (sa & 0xFF)
        if wait_for_id(rx_bus, can_id, timeout_s):
            results.pass_check(f"{name} present at {fmt_id(can_id)}")
        else:
            ok = False
            results.fail_check(f"{name} missing at {fmt_id(can_id)} (timeout {timeout_s:.2f}s)")
    return ok


def run_claim(
    tx_bus: can.BusABC,
    *,
    sa: int,
    payload: bytes,
    burst_count: int,
    spacing_s: float,
    label: str,
) -> None:
    can_id = claim_id_for_sa(sa)
    for _ in range(max(burst_count, 1)):
        send_frame(tx_bus, can_id, payload, note=f"CLAIM_{label}@{sa:02X}")
        if spacing_s > 0:
            time.sleep(spacing_s)


def ensure_online_and_enabled(
    results: Results,
    tx_bus: can.BusABC,
    rx_bus: can.BusABC,
    *,
    sa: int,
    min_sa: int,
    max_sa: int,
    ctrl_sa: int,
    set_scan_repeats: int,
    cmd0_retries: int,
    enable_retries: int,
    ack_timeout_s: float,
    tx_gap_s: float,
    set_settle_s: float,
    enable_settle_s: float,
    present_timeout_s: float,
    status_only: bool,
    drain_s: float,
) -> bool:
    print(f"\n---- bring online SA 0x{sa:02X} ----")
    spray_set_sa(
        tx_bus,
        target_sa=sa,
        min_sa=min_sa,
        max_sa=max_sa,
        ctrl_sa=ctrl_sa,
        repeats=set_scan_repeats,
        tx_gap_s=tx_gap_s,
    )
    if set_settle_s > 0:
        time.sleep(set_settle_s)
    drain_bus(rx_bus, drain_s)

    send_cmd0_sequence(
        tx_bus,
        sa=sa,
        ctrl_sa=ctrl_sa,
        cmd0_retries=cmd0_retries,
        tx_gap_s=tx_gap_s,
    )
    if not send_enable_and_expect_ack(
        results,
        tx_bus,
        rx_bus,
        sa=sa,
        ctrl_sa=ctrl_sa,
        enable_retries=enable_retries,
        tx_gap_s=tx_gap_s,
        ack_timeout_s=ack_timeout_s,
    ):
        return False
    if enable_settle_s > 0:
        time.sleep(enable_settle_s)

    return verify_periodic_ids(
        results,
        rx_bus,
        sa=sa,
        timeout_s=present_timeout_s,
        status_only=status_only,
    )


def parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser(description="43009 J1939 SA arbitration sweep runner")
    p.add_argument("--interface", default="kvaser", help="python-can interface (default: kvaser)")
    p.add_argument("--tx-channel", default="0", help="TX channel (default: 0)")
    p.add_argument("--rx-channel", default="1", help="RX channel (default: 1)")
    p.add_argument("--bitrate", type=int, default=250000, help="CAN bitrate (default: 250000)")
    p.add_argument("--ctrl-sa", default="0xD1", help="Controller source address (default: 0xD1)")
    p.add_argument("--base-sa", default="0xD9", help="Base source address (default: 0xD9)")
    p.add_argument("--min-sa", default="0xD9", help="Min SA for sweep (default: 0xD9)")
    p.add_argument("--max-sa", default="0xE0", help="Max SA for sweep (default: 0xE0)")
    p.add_argument(
        "--recovery-min-sa",
        default="0xD9",
        help="Recovery-sweep min SA used for reset-to-base (default: 0xD9)",
    )
    p.add_argument(
        "--recovery-max-sa",
        default="0xE0",
        help="Recovery-sweep max SA used for reset-to-base (default: 0xE0)",
    )
    p.add_argument(
        "--recovery-repeats",
        type=int,
        default=2,
        help="Number of full-range reset-to-base sweep passes (default: 2)",
    )
    p.add_argument(
        "--recovery-settle-s",
        type=float,
        default=0.30,
        help="Wait after base recovery sweep before checks (default: 0.30)",
    )
    p.add_argument("--set-scan-repeats", type=int, default=2, help="Times to scan destination range when writing SA")
    p.add_argument("--cmd0-retries", type=int, default=2, help="CTRL1 command 0 retries before enabling")
    p.add_argument("--enable-retries", type=int, default=3, help="CTRL1 command 1 retries to enable status messages")
    p.add_argument("--ack-timeout-s", type=float, default=1.20, help="Timeout for CTRL1 command ACK in STAT payload")
    p.add_argument("--tx-gap-s", type=float, default=0.03, help="Inter-frame gap during command bursts")
    p.add_argument("--set-settle-s", type=float, default=0.20, help="Wait after SA write scan")
    p.add_argument("--enable-settle-s", type=float, default=0.30, help="Wait after enable writes")
    p.add_argument("--present-timeout-s", type=float, default=1.20, help="Timeout for expected-present checks")
    p.add_argument("--absent-timeout-s", type=float, default=1.20, help="Timeout for expected-absent checks")
    p.add_argument("--claim-burst-count", type=int, default=6, help="Address-claim burst frames per case")
    p.add_argument("--claim-spacing-s", type=float, default=0.05, help="Address-claim inter-frame delay")
    p.add_argument("--claim-settle-s", type=float, default=0.30, help="Wait after claim burst before checking")
    p.add_argument("--drain-s", type=float, default=0.05, help="Short bus drain window before checks")
    p.add_argument("--status-only", action="store_true", help="Validate STAT only (skip DIGIN/AD2/AD3/AD4/DPLF2/FAULT)")
    p.add_argument(
        "--reset-to-base-only",
        action="store_true",
        help="Only sweep/reset SA to base and exit",
    )
    p.add_argument("--no-return-base", action="store_true", help="Do not restore base SA at end")
    p.add_argument("--dry-run", action="store_true", help="Print configuration only; do not open CAN")
    return p.parse_args()


def main() -> int:
    args = parse_args()

    ctrl_sa = parse_byte(args.ctrl_sa)
    base_sa = parse_byte(args.base_sa)
    min_sa = parse_byte(args.min_sa)
    max_sa = parse_byte(args.max_sa)
    recovery_min_sa = parse_byte(args.recovery_min_sa)
    recovery_max_sa = parse_byte(args.recovery_max_sa)
    if min_sa > max_sa:
        min_sa, max_sa = max_sa, min_sa
    if recovery_min_sa > recovery_max_sa:
        recovery_min_sa, recovery_max_sa = recovery_max_sa, recovery_min_sa

    tx_channel = parse_channel(args.tx_channel)
    rx_channel = parse_channel(args.rx_channel)
    sa_range = list(range(min_sa, max_sa + 1))

    print("43009 CAN SA arbitration runner")
    print(f"  interface: {args.interface}")
    print(f"  tx/rx:     {tx_channel} / {rx_channel}")
    print(f"  bitrate:   {args.bitrate}")
    print(f"  ctrl-sa:   0x{ctrl_sa:02X}")
    print(f"  sa-range:  0x{min_sa:02X}..0x{max_sa:02X}")
    print(f"  recovery:  0x{recovery_min_sa:02X}..0x{recovery_max_sa:02X}")
    print(f"  base-sa:   0x{base_sa:02X}")
    print(f"  mode:      {'STAT-only' if args.status_only else 'All periodic IDs'}")

    if args.dry_run:
        print("Dry run only. No CAN activity performed.")
        print("PATSPEAK_RESULT=PASS")
        return 0

    results = Results()
    tx_bus: can.BusABC | None = None
    rx_bus: can.BusABC | None = None

    try:
        tx_bus = can.Bus(interface=args.interface, channel=tx_channel, bitrate=args.bitrate)
        if tx_channel == rx_channel:
            rx_bus = tx_bus
        else:
            rx_bus = can.Bus(interface=args.interface, channel=rx_channel, bitrate=args.bitrate)
    except Exception as exc:
        print(f"ERROR: failed to open CAN bus: {exc}")
        print("PATSPEAK_RESULT=FAIL")
        return 2

    assert tx_bus is not None
    assert rx_bus is not None

    current_sa = base_sa
    try:
        force_base_recovery_sweep(
            tx_bus,
            rx_bus,
            base_sa=base_sa,
            recovery_min_sa=recovery_min_sa,
            recovery_max_sa=recovery_max_sa,
            ctrl_sa=ctrl_sa,
            recovery_repeats=args.recovery_repeats,
            tx_gap_s=args.tx_gap_s,
            recovery_settle_s=args.recovery_settle_s,
            drain_s=args.drain_s,
        )

        if args.reset_to_base_only:
            print("\nSummary: PASS (reset-to-base-only complete)")
            print("PATSPEAK_RESULT=PASS")
            return 0

        print("\n==== startup: force base + enable ====")
        ok = ensure_online_and_enabled(
            results,
            tx_bus,
            rx_bus,
            sa=base_sa,
            min_sa=min_sa,
            max_sa=max_sa,
            ctrl_sa=ctrl_sa,
            set_scan_repeats=args.set_scan_repeats,
            cmd0_retries=args.cmd0_retries,
            enable_retries=args.enable_retries,
            ack_timeout_s=args.ack_timeout_s,
            tx_gap_s=args.tx_gap_s,
            set_settle_s=args.set_settle_s,
            enable_settle_s=args.enable_settle_s,
            present_timeout_s=args.present_timeout_s,
            status_only=args.status_only,
            drain_s=args.drain_s,
        )
        if ok:
            current_sa = base_sa
        else:
            # One retry: perform a broader base-recovery sweep and re-attempt startup.
            force_base_recovery_sweep(
                tx_bus,
                rx_bus,
                base_sa=base_sa,
                recovery_min_sa=recovery_min_sa,
                recovery_max_sa=recovery_max_sa,
                ctrl_sa=ctrl_sa,
                recovery_repeats=max(args.recovery_repeats, 2),
                tx_gap_s=args.tx_gap_s,
                recovery_settle_s=args.recovery_settle_s,
                drain_s=args.drain_s,
            )
            ensure_online_and_enabled(
                results,
                tx_bus,
                rx_bus,
                sa=base_sa,
                min_sa=min_sa,
                max_sa=max_sa,
                ctrl_sa=ctrl_sa,
                set_scan_repeats=args.set_scan_repeats,
                cmd0_retries=args.cmd0_retries,
                enable_retries=args.enable_retries,
                ack_timeout_s=args.ack_timeout_s,
                tx_gap_s=args.tx_gap_s,
                set_settle_s=args.set_settle_s,
                enable_settle_s=args.enable_settle_s,
                present_timeout_s=args.present_timeout_s,
                status_only=args.status_only,
                drain_s=args.drain_s,
            )

        for sa in sa_range:
            print(f"\n==== SA 0x{sa:02X} arbitration ====")
            if not ensure_online_and_enabled(
                results,
                tx_bus,
                rx_bus,
                sa=sa,
                min_sa=min_sa,
                max_sa=max_sa,
                ctrl_sa=ctrl_sa,
                set_scan_repeats=args.set_scan_repeats,
                cmd0_retries=args.cmd0_retries,
                enable_retries=args.enable_retries,
                ack_timeout_s=args.ack_timeout_s,
                tx_gap_s=args.tx_gap_s,
                set_settle_s=args.set_settle_s,
                enable_settle_s=args.enable_settle_s,
                present_timeout_s=args.present_timeout_s,
                status_only=args.status_only,
                drain_s=args.drain_s,
            ):
                current_sa = sa
                continue
            current_sa = sa

            # Losing NAME should not bump the UUT offline.
            run_claim(
                tx_bus,
                sa=sa,
                payload=LOSING_NAME,
                burst_count=args.claim_burst_count,
                spacing_s=args.claim_spacing_s,
                label="LOSING",
            )
            if args.claim_settle_s > 0:
                time.sleep(args.claim_settle_s)
            drain_bus(rx_bus, args.drain_s)
            stat_id = PERIODIC_ID_PREFIXES[0][1] | sa
            if wait_for_id(rx_bus, stat_id, args.present_timeout_s):
                results.pass_check(f"Losing claim keeps STAT online at {fmt_id(stat_id)}")
            else:
                results.fail_check(f"Losing claim unexpectedly removed STAT at {fmt_id(stat_id)}")

            # Winning NAME should bump the UUT offline.
            run_claim(
                tx_bus,
                sa=sa,
                payload=WINNING_NAME,
                burst_count=args.claim_burst_count,
                spacing_s=args.claim_spacing_s,
                label="WINNING",
            )
            if args.claim_settle_s > 0:
                time.sleep(args.claim_settle_s)
            drain_bus(rx_bus, args.drain_s)
            seen = count_id(rx_bus, stat_id, args.absent_timeout_s)
            if seen == 0:
                results.pass_check(f"Winning claim drives STAT offline at {fmt_id(stat_id)}")
            else:
                results.fail_check(
                    f"Winning claim expected STAT offline at {fmt_id(stat_id)}, saw {seen} frame(s)"
                )

            # Recover same SA for next sweep step.
            ensure_online_and_enabled(
                results,
                tx_bus,
                rx_bus,
                sa=sa,
                min_sa=min_sa,
                max_sa=max_sa,
                ctrl_sa=ctrl_sa,
                set_scan_repeats=args.set_scan_repeats,
                cmd0_retries=args.cmd0_retries,
                enable_retries=args.enable_retries,
                ack_timeout_s=args.ack_timeout_s,
                tx_gap_s=args.tx_gap_s,
                set_settle_s=args.set_settle_s,
                enable_settle_s=args.enable_settle_s,
                present_timeout_s=args.present_timeout_s,
                status_only=True,
                drain_s=args.drain_s,
            )

        if not args.no_return_base and current_sa != base_sa:
            print("\n==== restore base SA ====")
            force_base_recovery_sweep(
                tx_bus,
                rx_bus,
                base_sa=base_sa,
                recovery_min_sa=recovery_min_sa,
                recovery_max_sa=recovery_max_sa,
                ctrl_sa=ctrl_sa,
                recovery_repeats=args.recovery_repeats,
                tx_gap_s=args.tx_gap_s,
                recovery_settle_s=args.recovery_settle_s,
                drain_s=args.drain_s,
            )
            ensure_online_and_enabled(
                results,
                tx_bus,
                rx_bus,
                sa=base_sa,
                min_sa=min_sa,
                max_sa=max_sa,
                ctrl_sa=ctrl_sa,
                set_scan_repeats=args.set_scan_repeats,
                cmd0_retries=args.cmd0_retries,
                enable_retries=args.enable_retries,
                ack_timeout_s=args.ack_timeout_s,
                tx_gap_s=args.tx_gap_s,
                set_settle_s=args.set_settle_s,
                enable_settle_s=args.enable_settle_s,
                present_timeout_s=args.present_timeout_s,
                status_only=True,
                drain_s=args.drain_s,
            )

    finally:
        try:
            if rx_bus is not None and rx_bus is not tx_bus:
                rx_bus.shutdown()
        except Exception:
            pass
        try:
            if tx_bus is not None:
                tx_bus.shutdown()
        except Exception:
            pass

    if results.failures:
        print("\nSummary: FAIL")
        for idx, failure in enumerate(results.failures, start=1):
            print(f"  {idx:02d}. {failure}")
        print("PATSPEAK_RESULT=FAIL")
        return 1

    print("\nSummary: PASS")
    print("PATSPEAK_RESULT=PASS")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
