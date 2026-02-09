"""CAN I/O thread based on python-can.

This module replaces the previous Kvaser-only CAN implementation
(`canlib`/`kvadblib`) with a generic python-can implementation.

Key goals:
  - No hard dependency on Kvaser libraries for DBC handling (we use cantools)
  - Support multiple CAN interfaces (PCAN, Kvaser, SocketCAN, etc.)
  - Only require vendor driver/software if you are *actually* using that
    vendor's hardware.

Environment overrides (optional):
  - PATSPEAK_CAN_INTERFACE: auto|pcan|kvaser|socketcan
  - PATSPEAK_CAN_CH0: override channel 0 (e.g. PCAN_USBBUS1, 0, can0)
  - PATSPEAK_CAN_CH1: override channel 1 (e.g. PCAN_USBBUS2, 1, can1)
  - PATSPEAK_CAN_BITRATE: default 250000
"""

from __future__ import annotations

import os
import time
from typing import Any, Dict, List, Optional, Sequence, Tuple

import patspeak.runtime as rt


try:
    import can  # python-can
except Exception as e:  # pragma: no cover
    can = None
    _import_error = e
else:
    _import_error = None


DEFAULT_BITRATE = 250_000


def _require_python_can() -> None:
    if can is None:
        raise ImportError(
            "python-can is required for CAN I/O. Install it with: pip install python-can\n"
            f"Original import error: {_import_error}"
        )


def _try_open(interface: str, channel: Any, bitrate: int) -> bool:
    """Probe-open a CAN bus and immediately close it."""

    _require_python_can()

    try:
        bus = can.Bus(interface=interface, channel=channel, bitrate=bitrate)
        bus.shutdown()
        return True
    except Exception:
        return False


def autodetect_can_backend() -> None:
    """Populate rt.CAN_INTERFACE / rt.CAN_CHANNELS / rt.CAN_BITRATE.

    This is designed to be called once near startup (before starting CAN threads).
    """

    _require_python_can()

    # If already configured, keep it.
    if getattr(rt, "CAN_INTERFACE", None) not in (None, "", "auto") and getattr(
        rt, "CAN_CHANNELS", None
    ):
        return

    bitrate = int(os.environ.get("PATSPEAK_CAN_BITRATE", str(DEFAULT_BITRATE)))
    interface_env = os.environ.get("PATSPEAK_CAN_INTERFACE", "auto").strip().lower()
    ch0_env = os.environ.get("PATSPEAK_CAN_CH0")
    ch1_env = os.environ.get("PATSPEAK_CAN_CH1")

    need_ch1 = getattr(rt, "SuppressPatSupport", "False") == "False"

    # Helper to validate both channels if needed.
    def ok(interface: str, ch0: Any, ch1: Any) -> bool:
        if not _try_open(interface, ch0, bitrate):
            return False
        if need_ch1 and not _try_open(interface, ch1, bitrate):
            return False
        return True

    # User-forced config (via env)
    if interface_env != "auto":
        interface = interface_env
        if ch0_env is None or (need_ch1 and ch1_env is None):
            raise RuntimeError(
                "PATSPEAK_CAN_INTERFACE is set but PATSPEAK_CAN_CH0/CH1 are missing. "
                "Set PATSPEAK_CAN_CH0 (and CH1 if PAT support is enabled)."
            )

        # Allow integer-like channels for Kvaser.
        def _coerce(ch: str) -> Any:
            ch = ch.strip()
            try:
                return int(ch)
            except Exception:
                return ch

        channels = [_coerce(ch0_env), _coerce(ch1_env) if ch1_env is not None else None]

        if not ok(interface, channels[0], channels[1]):
            raise RuntimeError(
                f"Failed to open CAN interface={interface!r} channels={channels!r} bitrate={bitrate}. "
                "Check drivers / permissions / cable / device."
            )

        rt.CAN_INTERFACE = interface
        rt.CAN_CHANNELS = channels
        rt.CAN_BITRATE = bitrate
        print(f"CAN backend forced via env: {interface} {channels} @ {bitrate} bps")
        return

    # Auto-detect in a reasonable order.
    candidates: List[Tuple[str, Any, Any]] = []

    # 1) PCAN (common on Windows)
    candidates.append(("pcan", "PCAN_USBBUS1", "PCAN_USBBUS2"))
    # 2) Kvaser (Windows typically needs Kvaser CANlib installed)
    candidates.append(("kvaser", 0, 1))
    # 3) SocketCAN (Linux / RPi, including many Kvaser devices via kvaser_usb)
    candidates.append(("socketcan", "can0", "can1"))

    # Allow overriding channels but keeping auto interface detection.
    if ch0_env is not None:
        # Try overrides as-is against each candidate interface.
        # If user specifies custom channel names, they probably know what they're doing.
        def _coerce(ch: str) -> Any:
            ch = ch.strip()
            try:
                return int(ch)
            except Exception:
                return ch

        ch0_override = _coerce(ch0_env)
        ch1_override = _coerce(ch1_env) if ch1_env is not None else None
        candidates = [(iface, ch0_override, ch1_override) for (iface, _, _) in candidates]

    for iface, ch0, ch1 in candidates:
        if ok(iface, ch0, ch1):
            rt.CAN_INTERFACE = iface
            rt.CAN_CHANNELS = [ch0, ch1]
            rt.CAN_BITRATE = bitrate
            print(f"CAN backend auto-detected: {iface} {[ch0, ch1]} @ {bitrate} bps")
            return

    raise RuntimeError(
        "No CAN interface detected. Tried: PCAN, Kvaser, SocketCAN. "
        "Install the correct vendor driver for your hardware or set PATSPEAK_CAN_INTERFACE/CH0/CH1."
    )


def _open_bus(channel_number: int):
    _require_python_can()
    autodetect_can_backend()

    iface = rt.CAN_INTERFACE
    channels = rt.CAN_CHANNELS
    bitrate = rt.CAN_BITRATE

    channel = channels[channel_number]
    return can.Bus(interface=iface, channel=channel, bitrate=bitrate)


def CANThread(i: int) -> None:
    """Main CAN loop.

    Channel 0 = UUT
    Channel 1 = PAT (if enabled)
    """

    print("Ch", i)
    channel_number = i

    try:
        bus = _open_bus(channel_number)
    except Exception as e:
        print(f"Failed to open CAN channel {channel_number}: {e}")
        rt.finished = 1
        return

    tracker_last_time = 0.0
    tx_accum = 0.0

    # Super-verbose: only print TX frames when they *change*.
    # This avoids spamming every 10ms, while still showing relay/signal switching.
    trace_tx = getattr(rt, "Verbose", 0) >= 2 or bool(
        os.environ.get("PATSPEAK_TRACE_TX", "")
    )
    last_tx_payload: Dict[Tuple[int, bool], bytes] = {}

    # Tune as needed; original behavior was ~10ms.
    tx_period_s = 0.01

    try:
        while not rt.finished:
            now = time.time()
            dt = 0.0
            if tracker_last_time:
                dt = now - tracker_last_time
            tracker_last_time = now
            tx_accum += dt

            # -----------------
            # RX: decode frames
            # -----------------
            try:
                # Drain all currently-available RX frames (non-blocking).
                # This avoids building up a backlog when the bus is chatty.
                while True:
                    msg = bus.recv(timeout=0.0)
                    if msg is None:
                        break

                    arbitration_id = int(getattr(msg, "arbitration_id", 0))
                    data = bytes(getattr(msg, "data", b""))

                    if channel_number == 0:
                        decoded = rt.uut_db.decode(arbitration_id, data)
                        if decoded:
                            rt.UUT_Fdbk.update(decoded)
                    else:
                        if rt.SuppressPatSupport == 'False' and rt.pat_db is not None:
                            decoded = rt.pat_db.decode(arbitration_id, data)
                            if decoded:
                                rt.PAT_Fdbk.update(decoded)
            except Exception:
                # Keep looping; a malformed frame shouldn't kill the test.
                pass

            # -----------------
            # TX: send CTRL set
            # -----------------
            if tx_accum >= tx_period_s:
                tx_accum = 0.0

                if channel_number == 0:
                    frames = rt.uut_db.encode_tx()
                else:
                    if rt.SuppressPatSupport == 'False' and rt.pat_db is not None:
                        frames = rt.pat_db.encode_tx()
                    else:
                        frames = []

                for f in frames:
                    try:
                        if trace_tx:
                            key = (int(f.arbitration_id), bool(f.is_extended_id))
                            data = bytes(getattr(f, "data", b""))
                            prev = last_tx_payload.get(key)
                            if prev != data:
                                last_tx_payload[key] = data
                                ext = " EXT" if key[1] else ""

                                # Add a bit of context so the operator can
                                # correlate switching to a specific .pat line.
                                step = getattr(rt, "TestStep", None)
                                step_s = str(step).zfill(5) + " " if isinstance(step, int) else ""
                                test = os.path.basename(str(getattr(rt, "TestFile", "") or ""))
                                if test:
                                    test = f" [{test}]"

                                print(
                                    step_s
                                    + f"CAN{channel_number} TX 0x{key[0]:X}{ext} : "
                                    + " ".join(f"{b:02X}" for b in data)
                                    + test
                                )

                        out = can.Message(
                            arbitration_id=f.arbitration_id,
                            data=f.data,
                            is_extended_id=f.is_extended_id,
                        )
                        bus.send(out)
                    except Exception:
                        pass

            # Avoid pegging a CPU core in quiet-bus scenarios.
            time.sleep(0.001)

    finally:
        try:
            bus.shutdown()
        except Exception:
            pass
