#!/usr/bin/env python3
"""
rigol_dp800_sweep_ch2.py

Rigol DP800 series:
- Select CH2 (or user-selected channel)
- Turn channel output ON
- Sweep set voltage between start/stop in exact step increments

Modes:
- up      : start -> stop
- updown  : start -> stop -> start (triangle)

Safety:
- Ctrl+C will kill power (turn output OFF) by default.
  Disable with --no-kill-on-interrupt.

Requirements:
  pip install pyvisa pyvisa-py pyusb
"""

from __future__ import annotations

import argparse
import sys
import time
from dataclasses import dataclass
from typing import Iterable, Optional, Tuple, List

import pyvisa


def list_resources(backend: Optional[str]) -> Tuple[str, ...]:
    rm = pyvisa.ResourceManager(backend) if backend else pyvisa.ResourceManager()
    return tuple(rm.list_resources())


def pick_dp800_resource(resources: Iterable[str]) -> Optional[str]:
    for r in resources:
        u = r.upper()
        if "0X1AB1" in u and "0X0E11" in u:
            return r
    for r in resources:
        if r.upper().startswith("USB"):
            return r
    return next(iter(resources), None)


@dataclass(frozen=True)
class SweepConfig:
    start_v: float
    stop_v: float
    step_v: float
    current_limit_a: float
    dwell_s: float
    opc_every: int
    print_every: int
    output_off_at_end: bool
    mode: str
    cycles: int
    kill_on_interrupt: bool


def _uV(v: float) -> int:
    return int(round(v * 1_000_000))


def _v(uV: int) -> float:
    return uV / 1_000_000.0


def _range_inclusive(start: int, stop: int, step: int) -> List[int]:
    if step <= 0:
        raise ValueError("step must be > 0")
    if stop < start:
        raise ValueError("stop must be >= start")
    return list(range(start, stop + 1, step))


def build_sweep_points(start_v: float, stop_v: float, step_v: float, mode: str, cycles: int) -> List[float]:
    if cycles <= 0:
        raise ValueError("cycles must be >= 1")

    start_uV = _uV(start_v)
    stop_uV = _uV(stop_v)
    step_uV = _uV(step_v)

    if step_uV <= 0:
        raise ValueError("step must be > 0")
    if stop_uV < start_uV:
        raise ValueError("stop must be >= start")

    up_uV = _range_inclusive(start_uV, stop_uV, step_uV)

    if mode == "up":
        one_cycle = up_uV
    elif mode == "updown":
        down_uV = list(range(stop_uV - step_uV, start_uV - 1, -step_uV))
        one_cycle = up_uV + down_uV
    else:
        raise ValueError("mode must be 'up' or 'updown'")

    full = one_cycle * cycles
    return [_v(u) for u in full]


def open_instrument(resource: str, backend: Optional[str], timeout_ms: int = 10_000):
    rm = pyvisa.ResourceManager(backend) if backend else pyvisa.ResourceManager()
    inst = rm.open_resource(resource)
    inst.timeout = timeout_ms
    inst.write_termination = "\n"
    inst.read_termination = "\n"
    return inst


def drain_error_queue(inst, max_reads: int = 20) -> None:
    for _ in range(max_reads):
        try:
            err = inst.query(":SYST:ERR?").strip()
        except Exception:
            return
        if err.startswith("0,") or err == "0":
            return
        print(f"[DP800] ERROR: {err}", file=sys.stderr)


def kill_power_best_effort(inst, channel: int) -> None:
    """
    Best-effort attempt to shut off the specified channel output.
    Do not raise if this fails—we want shutdown to be robust.
    """
    try:
        inst.write(f":OUTP CH{channel},OFF")
        # Try to ensure it is executed, but don't block forever on errors/timeouts.
        try:
            inst.query("*OPC?")
        except Exception:
            pass
    except Exception:
        pass


def main() -> int:
    p = argparse.ArgumentParser(description="Rigol DP800: enable channel output and sweep voltage.")
    p.add_argument("--backend", default=None, help="VISA backend, e.g. '@py' for pyvisa-py.")
    p.add_argument("--resource", help="VISA resource string. If omitted, auto-detect by USB VID/PID.")
    p.add_argument("--list", action="store_true", help="List VISA resources and exit.")
    p.add_argument("--channel", type=int, default=2, choices=[1, 2, 3], help="Channel to control (default: 2)")
    p.add_argument("--start", type=float, default=4.0, help="Start voltage (V). Default: 4.0")
    p.add_argument("--stop", type=float, default=5.0, help="Stop voltage (V). Default: 5.0")
    p.add_argument("--step", type=float, default=0.001, help="Step voltage (V). Default: 0.001")
    p.add_argument("--current", type=float, default=1.0, help="Current limit (A). Default: 1.0")
    p.add_argument("--dwell", type=float, default=0.02, help="Seconds to wait after each step. Default: 0.02")
    p.add_argument(
        "--opc-every",
        type=int,
        default=25,
        help="Every N steps, query *OPC? to force catch-up (0 disables). Default: 25",
    )
    p.add_argument("--print-every", type=int, default=50, help="Print progress every N steps. Default: 50")
    p.add_argument("--output-off-at-end", action="store_true", help="Turn output OFF at end (default: leave ON).")

    p.add_argument("--mode", choices=["up", "updown"], default="up", help="Sweep mode. Default: up")
    p.add_argument("--cycles", type=int, default=1, help="Repeat sweep pattern N times. Default: 1")

    # New safety behavior
    p.add_argument(
        "--kill-on-interrupt",
        dest="kill_on_interrupt",
        action="store_true",
        default=True,
        help="On Ctrl+C or error, turn the channel output OFF (default: enabled).",
    )
    p.add_argument(
        "--no-kill-on-interrupt",
        dest="kill_on_interrupt",
        action="store_false",
        help="Disable kill-power behavior on Ctrl+C or error.",
    )

    args = p.parse_args()

    if args.list:
        try:
            res = list_resources(args.backend)
        except Exception as e:
            print(f"Error listing VISA resources (backend={args.backend!r}): {e}", file=sys.stderr)
            return 2
        if not res:
            print("No VISA resources found.", file=sys.stderr)
            return 1
        print("\n".join(res))
        return 0

    cfg = SweepConfig(
        start_v=args.start,
        stop_v=args.stop,
        step_v=args.step,
        current_limit_a=args.current,
        dwell_s=max(0.0, args.dwell),
        opc_every=max(0, args.opc_every),
        print_every=max(0, args.print_every),
        output_off_at_end=bool(args.output_off_at_end),
        mode=args.mode,
        cycles=args.cycles,
        kill_on_interrupt=bool(args.kill_on_interrupt),
    )

    try:
        resources = list_resources(args.backend)
    except Exception as e:
        print(f"Error initializing VISA (backend={args.backend!r}): {e}", file=sys.stderr)
        return 2

    resource = args.resource or pick_dp800_resource(resources)
    if not resource:
        print("Could not auto-detect a DP800 VISA resource. Use --list, then pass --resource.", file=sys.stderr)
        return 1

    inst = None
    ch = args.channel
    try:
        inst = open_instrument(resource, args.backend)
        idn = inst.query("*IDN?").strip()
        print(f"Connected: {idn}")
        print(f"VISA resource: {resource}")

        # Configure channel
        inst.write(f":INST CH{ch}")
        inst.write("*CLS")
        inst.write(f":CURR {cfg.current_limit_a:.6f}")
        inst.write(f":VOLT {cfg.start_v:.6f}")

        # Turn channel ON
        inst.write(f":OUTP CH{ch},ON")
        inst.query("*OPC?")

        points = build_sweep_points(cfg.start_v, cfg.stop_v, cfg.step_v, cfg.mode, cfg.cycles)

        desc = f"{cfg.start_v:.6f} V -> {cfg.stop_v:.6f} V"
        if cfg.mode == "updown":
            desc += f" -> {cfg.start_v:.6f} V"
        if cfg.cycles != 1:
            desc += f" (x{cfg.cycles})"

        print(
            f"Sweeping CH{ch} mode={cfg.mode}: {desc} in {cfg.step_v:.6f} V steps "
            f"({len(points)} points)"
        )

        for idx, v in enumerate(points):
            inst.write(f":VOLT {v:.6f}")

            if cfg.dwell_s:
                time.sleep(cfg.dwell_s)

            if cfg.opc_every > 0 and (idx % cfg.opc_every == 0):
                inst.query("*OPC?")

            if cfg.print_every > 0 and (idx % cfg.print_every == 0):
                print(f"  {idx:6d}/{len(points)-1} set={v:.6f} V")

        inst.query("*OPC?")
        print("Sweep complete.")

        if cfg.output_off_at_end:
            kill_power_best_effort(inst, ch)
            print("Output turned OFF.")

        drain_error_queue(inst)
        return 0

    except KeyboardInterrupt:
        print("\nInterrupted (Ctrl+C).", file=sys.stderr)
        if inst is not None and cfg.kill_on_interrupt:
            kill_power_best_effort(inst, ch)
            print("Killed power (output OFF).", file=sys.stderr)
        return 130

    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        if inst is not None and cfg.kill_on_interrupt:
            kill_power_best_effort(inst, ch)
            print("Killed power (output OFF) due to error.", file=sys.stderr)
        return 2

    finally:
        try:
            if inst is not None:
                inst.close()
        except Exception:
            pass


if __name__ == "__main__":
    raise SystemExit(main())
