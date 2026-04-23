#!/usr/bin/env python3
import argparse
import csv
import os
import sys
from pathlib import Path


PORT_TO_SPWR = {
    "Port_1A": "Spwr1",
    "Port_1B": "Spwr1",
    "Port_2A": "Spwr2",
    "Port_2B": "Spwr2",
    "Port_3A": "Spwr3",
    "Port_3B": "Spwr3",
    "Port_4A": "Spwr4",
    "Port_4B": "Spwr4",
}

ROUTE_TO_PORT = {
    "J1_01": "Port_1A",
    "J1_02": "Port_1B",
    "J1_03": "Port_2A",
    "J1_04": "Port_2B",
    "J1_05": "Port_3A",
    "J1_06": "Port_3B",
    "J1_07": "Port_4A",
    "J1_08": "Port_4B",
}

PWR_SET_COUNTS_PER_VOLT = 10.0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Validate ratiometric behavior from PATSpeak CSV rows using:\n"
            "Adjusted = (MeterVolts / SpwrN) * FullScale"
        )
    )
    parser.add_argument("--tolerance", type=float, default=0.050, help="Absolute tolerance in DBC voltage units.")
    parser.add_argument("--full-scale", type=float, default=5.000, help="Full-scale value in DBC units.")
    parser.add_argument("--min-meter", type=float, default=1.0, help="Ignore rows below this meter voltage.")
    parser.add_argument("--min-port", type=float, default=0.5, help="Ignore rows where active port is below this value.")
    parser.add_argument(
        "--meter-window",
        type=float,
        default=0.050,
        help=(
            "Accept a row meter sample as synchronized when |MeterVolts - (PwrSetVoltage/10)| is within this window."
        ),
    )
    parser.add_argument(
        "--meter-row-consistency",
        type=float,
        default=0.100,
        help=(
            "Skip ratio evaluation on rows where |MeterVolts - latched_meter| exceeds this value "
            "(guards against asynchronous meter snapshots)."
        ),
    )
    parser.add_argument(
        "--port-settle-delta",
        type=float,
        default=0.020,
        help="Treat a port as settled only when consecutive rows change by <= this delta.",
    )
    parser.add_argument(
        "--min-stable-rows",
        type=int,
        default=2,
        help="Require this many consecutive settled rows before evaluating ratio.",
    )
    parser.add_argument(
        "--max-report",
        type=int,
        default=10,
        help="Maximum failing samples to print.",
    )
    return parser.parse_args()


def to_float(value: str | None) -> float | None:
    if value is None:
        return None
    try:
        return float(value)
    except (TypeError, ValueError):
        return None


def resolve_csv_path(results_dir: str, unit_name: str, run_stamp: str) -> Path | None:
    root = Path(results_dir)
    if not root.exists():
        return None

    if unit_name and run_stamp:
        exact = root / f"{unit_name}_{run_stamp}.csv"
        if exact.exists():
            return exact

    if unit_name:
        candidates = sorted(root.glob(f"{unit_name}_*.csv"), key=lambda p: p.stat().st_mtime, reverse=True)
        if candidates:
            return candidates[0]

    any_csv = sorted(root.glob("*.csv"), key=lambda p: p.stat().st_mtime, reverse=True)
    if any_csv:
        return any_csv[0]

    return None


def active_port_from_routes(row: dict[str, str | None]) -> str | None:
    active: list[str] = []
    for route_signal, port_signal in ROUTE_TO_PORT.items():
        route_val = to_float(row.get(route_signal))
        if route_val is not None and route_val >= 0.5:
            active.append(port_signal)
    if len(active) == 1:
        return active[0]
    return None


def active_port_from_max_value(row: dict[str, str | None]) -> tuple[str | None, float]:
    active_port = None
    active_value = -1.0
    for port_name in PORT_TO_SPWR:
        port_val = to_float(row.get(port_name))
        if port_val is None:
            continue
        if port_val > active_value:
            active_value = port_val
            active_port = port_name
    return active_port, active_value


def main() -> int:
    args = parse_args()

    results_dir = os.environ.get("PATSPEAK_RESULTS_DIR", "")
    unit_name = os.environ.get("PATSPEAK_UNITNAME", "")
    run_stamp = os.environ.get("PATSPEAK_RUNSTAMP", "")

    csv_path = resolve_csv_path(results_dir, unit_name, run_stamp)
    if csv_path is None:
        print(f"RATIOMETRIC CHECK: CSV not found in '{results_dir}' for unit='{unit_name}' runstamp='{run_stamp}'")
        print("PATSPEAK_RESULT=FAIL")
        return 2

    evaluated = 0
    failed = 0
    failures: list[str] = []
    skipped_no_route = 0
    skipped_no_meter_sync = 0
    skipped_meter_inconsistent = 0
    skipped_unsettled = 0

    with csv_path.open("r", encoding="utf-8", newline="") as f:
        reader = csv.DictReader(f)
        required = {"MeterVolts", "PwrSetVoltage", *PORT_TO_SPWR.keys(), "Spwr1", "Spwr2", "Spwr3", "Spwr4"}
        missing = sorted(required.difference(set(reader.fieldnames or [])))
        if missing:
            print(f"RATIOMETRIC CHECK: Missing required CSV columns: {', '.join(missing)}")
            print("PATSPEAK_RESULT=FAIL")
            return 3

        route_columns_present = all(route in set(reader.fieldnames or []) for route in ROUTE_TO_PORT)
        if route_columns_present:
            route_mode = "single-route"
        else:
            route_mode = "max-port-fallback"

        context_key: tuple[str | None, float | None] | None = None
        synced_meter: float | None = None
        prev_port_value: float | None = None
        settled_rows = 0

        for row in reader:
            if route_columns_present:
                active_port = active_port_from_routes(row)
                if active_port is None:
                    skipped_no_route += 1
                    context_key = None
                    synced_meter = None
                    prev_port_value = None
                    settled_rows = 0
                    continue
            else:
                active_port, _ = active_port_from_max_value(row)
                if active_port is None:
                    skipped_no_route += 1
                    context_key = None
                    synced_meter = None
                    prev_port_value = None
                    settled_rows = 0
                    continue

            active_value = to_float(row.get(active_port))
            if active_value is None or active_value < args.min_port:
                continue

            set_counts = to_float(row.get("PwrSetVoltage"))
            setpoint_volts = None if set_counts is None else set_counts / PWR_SET_COUNTS_PER_VOLT
            row_context = (active_port, set_counts)
            if row_context != context_key:
                context_key = row_context
                synced_meter = None
                prev_port_value = None
                settled_rows = 0

            meter = to_float(row.get("MeterVolts"))
            if meter is not None and meter >= args.min_meter and setpoint_volts is not None:
                if abs(meter - setpoint_volts) <= args.meter_window:
                    synced_meter = meter

            if synced_meter is None:
                skipped_no_meter_sync += 1
                continue

            if meter is not None and abs(meter - synced_meter) > args.meter_row_consistency:
                skipped_meter_inconsistent += 1
                continue

            spwr_signal = PORT_TO_SPWR[active_port]
            spwr = to_float(row.get(spwr_signal))
            if spwr is None or spwr <= 0.0:
                continue

            if prev_port_value is None:
                prev_port_value = active_value
                skipped_unsettled += 1
                continue

            port_delta = abs(active_value - prev_port_value)
            prev_port_value = active_value
            if port_delta > args.port_settle_delta:
                settled_rows = 0
                skipped_unsettled += 1
                continue

            settled_rows += 1
            if settled_rows < args.min_stable_rows:
                skipped_unsettled += 1
                continue

            expected = (synced_meter / spwr) * args.full_scale
            error = abs(active_value - expected)
            evaluated += 1

            if error > args.tolerance:
                failed += 1
                if len(failures) < args.max_report:
                    step = row.get("Step", "?")
                    failures.append(
                        "step="
                        + str(step)
                        + f" port={active_port}"
                        + f" meter_sync={synced_meter:.3f}"
                        + ("" if meter is None else f" meter_row={meter:.3f}")
                        + f" spwr={spwr:.3f}"
                        + f" actual={active_value:.3f}"
                        + f" expected={expected:.3f}"
                        + f" err={error:.3f}"
                        + f" d_port={port_delta:.3f}"
                    )

    print(
        "RATIOMETRIC CHECK: "
        + f"file={csv_path.name} "
        + f"evaluated={evaluated} "
        + f"tolerance={args.tolerance:.3f} "
        + f"full_scale={args.full_scale:.3f} "
        + f"mode={route_mode}"
    )
    print(
        "RATIOMETRIC CHECK: "
        + f"skip_no_route={skipped_no_route} "
        + f"skip_no_meter_sync={skipped_no_meter_sync} "
        + f"skip_meter_inconsistent={skipped_meter_inconsistent} "
        + f"skip_unsettled={skipped_unsettled}"
    )

    if evaluated == 0:
        print("RATIOMETRIC CHECK: No valid samples evaluated.")
        print("PATSPEAK_RESULT=FAIL")
        return 4

    if failed > 0:
        print(f"RATIOMETRIC CHECK: FAIL ({failed} samples out of {evaluated})")
        for line in failures:
            print("  " + line)
        print("PATSPEAK_RESULT=FAIL")
        return 1

    print(f"RATIOMETRIC CHECK: PASS ({evaluated} samples)")
    print("PATSPEAK_RESULT=PASS")
    return 0


if __name__ == "__main__":
    sys.exit(main())
