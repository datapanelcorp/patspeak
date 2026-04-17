#!/usr/bin/env python3
"""
rigol_dp800_set_ch.py

One-shot Rigol DP800 channel set helper for PAT external-script steps.

Example (LAN / raw SCPI socket):
  PAT dp800/rigol_dp800_set_ch.py --ip 192.168.45.178 --channel 2 --voltage 1.23 --output on

Example (USB VISA resource):
  PAT dp800/rigol_dp800_set_ch.py --resource USB0::...::INSTR --channel 2 --voltage 1.23 --output on
"""

from __future__ import annotations

import argparse
import socket
import sys
import time
from typing import Iterable, Optional

try:
    import pyvisa  # type: ignore[import-not-found]
except Exception:
    pyvisa = None


class SCPISocketInstrument:
    """Small synchronous SCPI-over-TCP helper."""

    def __init__(self, host: str, port: int, timeout_s: float) -> None:
        self._sock = socket.create_connection((host, port), timeout=timeout_s)
        self._sock.settimeout(timeout_s)
        self._buffer = b""

    def close(self) -> None:
        try:
            self._sock.close()
        except Exception:
            pass

    def write(self, command: str) -> None:
        payload = (command.strip() + "\n").encode("ascii")
        self._sock.sendall(payload)

    def query(self, command: str) -> str:
        self.write(command)
        return self._readline()

    def _readline(self) -> str:
        while b"\n" not in self._buffer:
            chunk = self._sock.recv(4096)
            if not chunk:
                raise ConnectionError("SCPI socket closed by peer.")
            self._buffer += chunk

        line, self._buffer = self._buffer.split(b"\n", 1)
        return line.decode("ascii", errors="replace").strip()


def _require_pyvisa() -> None:
    if pyvisa is None:
        raise RuntimeError(
            "pyvisa is not available. Install pyvisa for VISA/USB mode, "
            "or use --ip with --transport socket."
        )


def list_resources(backend: Optional[str]) -> tuple[str, ...]:
    _require_pyvisa()
    rm = pyvisa.ResourceManager(backend) if backend else pyvisa.ResourceManager()
    return tuple(rm.list_resources())


def pick_dp800_resource(resources: Iterable[str]) -> Optional[str]:
    for resource in resources:
        upper = resource.upper()
        if "0X1AB1" in upper and "0X0E11" in upper:
            return resource
    for resource in resources:
        if resource.upper().startswith("USB"):
            return resource
    return next(iter(resources), None)


def open_instrument(resource: str, rm, timeout_ms: int = 10_000):
    inst = rm.open_resource(resource)
    inst.timeout = timeout_ms
    inst.write_termination = "\n"
    inst.read_termination = "\n"
    return inst


def tcpip_resource_from_ip(ip_or_resource: str) -> str:
    """Build a VISA TCPIP resource from a plain IPv4/hostname string."""
    token = (ip_or_resource or "").strip()
    if not token:
        raise ValueError("IP address cannot be empty.")
    if token.upper().startswith("TCPIP"):
        return token
    return f"TCPIP0::{token}::INSTR"


def tcpip_resource_candidates(ip_or_resource: str) -> list[str]:
    """Return likely VISA resource variants for LAN connection."""
    token = (ip_or_resource or "").strip()
    if not token:
        raise ValueError("IP address cannot be empty.")
    if token.upper().startswith("TCPIP"):
        return [token]
    return [
        f"TCPIP0::{token}::INSTR",
        f"TCPIP0::{token}::inst0::INSTR",
    ]


def parse_socket_ports(port_text: str) -> list[int]:
    values: list[int] = []
    for token in (port_text or "").split(","):
        item = token.strip()
        if not item:
            continue
        port = int(item)
        if port <= 0 or port > 65535:
            raise ValueError(f"Invalid TCP port: {port}")
        values.append(port)
    if not values:
        raise ValueError("No valid socket ports provided.")
    return values


def parse_scpi_float(response: str, command: str) -> float:
    token = response.strip().split(",")[0].strip()
    try:
        return float(token)
    except ValueError as exc:
        raise ValueError(f"Could not parse numeric response for {command}: {response!r}") from exc


def parse_output_state(response: str) -> Optional[bool]:
    normalized = response.strip().upper()
    if normalized in {"1", "ON"}:
        return True
    if normalized in {"0", "OFF"}:
        return False
    if "ON" in normalized:
        return True
    if "OFF" in normalized:
        return False
    return None


def set_channel_and_verify(
    inst,
    channel: int,
    voltage: float,
    current: float,
    output: str,
    settle_s: float,
    verify: bool,
    verify_tol_v: float,
) -> None:
    """
    Configure voltage/current/output for a channel and optionally verify readback.
    Uses explicit channel-qualified SCPI writes to avoid channel-selection ambiguity.
    """
    inst.write("*CLS")
    inst.write(f":SOUR{channel}:CURR {current:.6f}")
    inst.write(f":SOUR{channel}:VOLT {voltage:.6f}")

    if output == "on":
        inst.write(f":OUTP CH{channel},ON")
    elif output == "off":
        inst.write(f":OUTP CH{channel},OFF")

    inst.query("*OPC?")

    if settle_s > 0:
        time.sleep(settle_s)

    if not verify:
        return

    voltage_readback = parse_scpi_float(inst.query(f":SOUR{channel}:VOLT?"), f":SOUR{channel}:VOLT?")
    if abs(voltage_readback - voltage) > verify_tol_v:
        raise RuntimeError(
            f"Voltage verify failed on CH{channel}: expected {voltage:.6f} V, read {voltage_readback:.6f} V"
        )

    if output in {"on", "off"}:
        output_response = inst.query(f":OUTP? CH{channel}")
        output_readback = parse_output_state(output_response)
        if output_readback is None:
            raise RuntimeError(
                f"Output verify failed on CH{channel}: unrecognized state response {output_response!r}"
            )
        expected_state = output == "on"
        if output_readback != expected_state:
            expected_text = "ON" if expected_state else "OFF"
            actual_text = "ON" if output_readback else "OFF"
            raise RuntimeError(
                f"Output verify failed on CH{channel}: expected {expected_text}, read {actual_text}"
            )


def main() -> int:
    parser = argparse.ArgumentParser(description="Rigol DP800 one-shot channel set helper.")
    parser.add_argument("--backend", default=None, help="VISA backend, e.g. '@py' for pyvisa-py.")
    parser.add_argument("--resource", default=None, help="Explicit VISA resource string (typically USB).")
    parser.add_argument("--ip", default=None, help="Rigol LAN IP/hostname, e.g. 192.168.45.178.")
    parser.add_argument(
        "--transport",
        choices=["auto", "socket", "visa"],
        default="auto",
        help="Transport for --ip mode: auto (socket then VISA), socket, or visa. Default: auto.",
    )
    parser.add_argument(
        "--socket-ports",
        default="5025,5555",
        help="Comma-separated SCPI TCP ports to try for --ip socket mode. Default: 5025,5555.",
    )
    parser.add_argument(
        "--socket-timeout",
        type=float,
        default=1.5,
        help="Socket connect/read timeout seconds for SCPI socket mode. Default: 1.5.",
    )
    parser.add_argument("--channel", type=int, default=2, choices=[1, 2, 3], help="Channel number (default: 2).")
    parser.add_argument("--voltage", type=float, required=True, help="Set voltage in volts.")
    parser.add_argument("--current", type=float, default=1.0, help="Current limit in amps (default: 1.0).")
    parser.add_argument(
        "--output",
        choices=["on", "off", "leave"],
        default="on",
        help="Channel output state after set (default: on).",
    )
    parser.add_argument("--settle", type=float, default=0.0, help="Optional settle time in seconds after *OPC?.")
    parser.add_argument(
        "--verify",
        dest="verify",
        action="store_true",
        default=True,
        help="Read back and verify voltage/output state after set (default: enabled).",
    )
    parser.add_argument(
        "--no-verify",
        dest="verify",
        action="store_false",
        help="Disable readback verification for speed.",
    )
    parser.add_argument(
        "--verify-tol",
        type=float,
        default=0.005,
        help="Voltage readback tolerance in volts for verification (default: 0.005).",
    )
    parser.add_argument("--list", action="store_true", help="List VISA resources and exit.")
    parser.add_argument("--quiet", action="store_true", help="Suppress informational prints.")
    parser.add_argument(
        "--log-retry-errors",
        action="store_true",
        help="Print every transient retry failure (default: only summarize on recovery/final failure).",
    )
    parser.add_argument(
        "--retries",
        type=int,
        default=5,
        help="Retry attempts for transient VISA failures (default: 5).",
    )
    parser.add_argument(
        "--retry-delay",
        type=float,
        default=0.20,
        help="Seconds between retries after a failure (default: 0.20).",
    )
    args = parser.parse_args()

    if args.resource and args.ip:
        print("Use only one of --resource or --ip.", file=sys.stderr)
        return 2
    if args.transport == "socket" and not args.ip:
        print("--transport socket requires --ip.", file=sys.stderr)
        return 2

    if args.list:
        try:
            resources = list_resources(args.backend)
        except Exception as exc:
            print(f"Error listing VISA resources (backend={args.backend!r}): {exc}", file=sys.stderr)
            return 2
        if not resources:
            print("No VISA resources found.", file=sys.stderr)
            return 1
        print("\n".join(resources))
        return 0

    endpoints: list[tuple[str, str, Optional[int]]] = []
    if args.ip:
        if args.transport in {"auto", "socket"}:
            try:
                socket_ports = parse_socket_ports(args.socket_ports)
            except Exception as exc:
                print(f"Invalid --socket-ports value: {exc}", file=sys.stderr)
                return 2
            for port in socket_ports:
                endpoints.append(("socket", args.ip, port))

        if args.transport in {"auto", "visa"}:
            for resource in tcpip_resource_candidates(args.ip):
                endpoints.append(("visa", resource, None))

    elif args.resource:
        endpoints = [("visa", args.resource, None)]
    else:
        try:
            resources = list_resources(args.backend)
        except Exception as exc:
            print(f"Error initializing VISA (backend={args.backend!r}): {exc}", file=sys.stderr)
            return 2
        resource = pick_dp800_resource(resources)
        if not resource:
            print("Could not auto-detect a DP800 VISA resource. Use --list, then pass --resource or --ip.", file=sys.stderr)
            return 1
        endpoints = [("visa", resource, None)]

    attempts = max(1, int(args.retries))
    retry_delay_s = max(0.0, float(args.retry_delay))
    last_exc: Exception | None = None
    used_target: str | None = None
    transient_failures = 0
    visa_rm = None

    if any(transport == "visa" for transport, _, _ in endpoints):
        try:
            _require_pyvisa()
            visa_rm = pyvisa.ResourceManager(args.backend) if args.backend else pyvisa.ResourceManager()
        except Exception as exc:
            print(f"Error initializing VISA (backend={args.backend!r}): {exc}", file=sys.stderr)
            return 2

    for attempt in range(1, attempts + 1):
        for transport, target, port in endpoints:
            inst = None
            label = f"{transport}:{target}" if port is None else f"{transport}:{target}:{port}"
            try:
                used_target = label
                if transport == "socket":
                    if port is None:
                        raise RuntimeError("Internal error: socket transport missing port.")
                    inst = SCPISocketInstrument(target, port, timeout_s=max(0.2, float(args.socket_timeout)))
                else:
                    if visa_rm is None:
                        raise RuntimeError("VISA resource manager is not initialized.")
                    inst = open_instrument(target, visa_rm)

                set_channel_and_verify(
                    inst=inst,
                    channel=args.channel,
                    voltage=args.voltage,
                    current=args.current,
                    output=args.output,
                    settle_s=args.settle,
                    verify=bool(args.verify),
                    verify_tol_v=max(0.0, float(args.verify_tol)),
                )

                if not args.quiet:
                    print(
                        f"DP800 CH{args.channel}: voltage={args.voltage:.6f}V "
                        f"current={args.current:.6f}A output={args.output} via {label}"
                    )
                    if transient_failures > 0:
                        print(
                            f"[DP800] recovered after {transient_failures} transient connection failure(s).",
                            file=sys.stderr,
                        )
                return 0

            except Exception as exc:
                last_exc = exc
                transient_failures += 1
                if not args.quiet and args.log_retry_errors:
                    print(
                        f"[DP800] attempt {attempt}/{attempts} failed on {label}: {exc}",
                        file=sys.stderr,
                    )

            finally:
                try:
                    if inst is not None:
                        inst.close()
                except Exception:
                    pass

        if attempt < attempts and retry_delay_s > 0:
            time.sleep(retry_delay_s)

    if used_target:
        print(f"Error: failed to set DP800 via {used_target}. Last error: {last_exc}", file=sys.stderr)
    else:
        print(f"Error: failed to set DP800. Last error: {last_exc}", file=sys.stderr)
    return 2


if __name__ == "__main__":
    raise SystemExit(main())
