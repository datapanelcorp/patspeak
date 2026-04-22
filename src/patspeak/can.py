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

Auto-detect order (when PATSPEAK_CAN_INTERFACE=auto):
  - Windows:
      1) Kvaser (CANlib)
      2) PCAN (PCAN-Basic)
      3) SocketCAN
  - Non-Windows:
      1) Kvaser (CANlib)
      2) PCAN (PCAN-Basic)
      3) SocketCAN
"""

from __future__ import annotations

import os
import time
import queue
import threading
from dataclasses import dataclass
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


# -----------------
# Raw CAN TX support (SEND_CAN)
# -----------------


@dataclass
class RawTxRequest:
    """A one-shot raw CAN transmission request.

    This is used by the SEND_CAN PAT command to push a raw frame to the CAN
    thread for a given channel and optionally wait for the send attempt to
    complete.
    """

    arbitration_id: int
    data: bytes
    is_extended_id: bool
    done: threading.Event
    ok: bool | None = None
    error: str | None = None


# Per-channel raw TX queues.
_RAW_TX_QUEUES: dict[int, "queue.Queue[RawTxRequest]"] = {
    0: queue.Queue(),
    1: queue.Queue(),
}


def send_raw_can(
    *,
    channel_number: int,
    arbitration_id: int,
    data: bytes | bytearray | Sequence[int] = b"",
    is_extended_id: bool | None = None,
    timeout_s: float = 0.25,
) -> tuple[bool, str | None]:
    """Request a one-shot raw CAN frame send on a given channel.

    This does *not* open a new bus. It hands the request to the existing
    CAN thread so we don't fight over the hardware handle.

    Returns:
        (ok, error)
    """

    try:
        ch = int(channel_number)
    except Exception:
        return False, f"invalid channel: {channel_number!r}"

    if ch not in (0, 1):
        return False, f"invalid channel: {ch} (expected 0 or 1)"

    try:
        arb = int(arbitration_id)
    except Exception:
        return False, f"invalid arbitration id: {arbitration_id!r}"

    if arb < 0:
        return False, "arbitration id must be >= 0"
    if arb > 0x1FFFFFFF:
        return False, "arbitration id must be <= 0x1FFFFFFF (29-bit max)"

    if is_extended_id is None:
        is_ext = arb > 0x7FF
    else:
        is_ext = bool(is_extended_id)

    # Coerce data.
    try:
        if isinstance(data, (bytes, bytearray)):
            payload = bytes(data)
        else:
            payload = bytes(int(x) & 0xFF for x in data)
    except Exception:
        return False, "invalid data payload"

    # Classic CAN is 0..8 bytes. The rest of PATSpeak assumes classic CAN.
    if len(payload) > 8:
        return False, f"data payload too long ({len(payload)} bytes); max is 8"

    # Hand to the CAN thread.
    q = _RAW_TX_QUEUES.get(ch)
    if q is None:
        return False, f"CAN channel {ch} is not available"

    done = threading.Event()
    req = RawTxRequest(
        arbitration_id=arb,
        data=payload,
        is_extended_id=is_ext,
        done=done,
    )
    try:
        q.put(req, block=False)
    except Exception as e:
        return False, f"failed to queue CAN TX: {e}"

    # Wait for the CAN thread to attempt the send.
    if not done.wait(timeout=float(timeout_s)):
        return False, f"timeout waiting for CAN{ch} thread to send"

    if req.ok:
        return True, None
    return False, req.error or "CAN send failed"


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

    def _coerce_channel(ch: str) -> Any:
        """Coerce env channel strings to ints when appropriate (Kvaser uses ints)."""

        ch = (ch or "").strip()
        try:
            return int(ch)
        except Exception:
            return ch

    def _apply_backend(interface: str, channels: List[Any], *, note: str = "") -> None:
        rt.CAN_INTERFACE = interface
        rt.CAN_CHANNELS = channels
        rt.CAN_BITRATE = bitrate
        msg = f"CAN backend {'forced' if interface_env != 'auto' else 'auto-detected'}: {interface} {channels} @ {bitrate} bps"
        if note:
            msg += f" ({note})"
        print(msg)

    def _force_single_channel(interface: str, ch0: Any, *, note: str = "") -> None:
        # Persist this across tests: runtime.initialize will treat this as if
        # SUPPRESS_PAT_SUPPORT=True regardless of what's in the .pat file.
        try:
            rt.FORCE_SUPPRESS_PAT_SUPPORT = True
        except Exception:
            pass

        # Match the legacy runtime flag as well so the running process
        # immediately behaves as UUT-only.
        try:
            rt.SuppressPatSupport = "True"
        except Exception:
            pass

        # Keep runtime state consistent (inputs fall back to UUT, no PAT TX).
        try:
            rt.pat_db = None
        except Exception:
            pass
        try:
            rt.PAT_Fdbk = {}
        except Exception:
            pass

        _apply_backend(interface, [ch0], note=note or "only 1 CAN channel available; PAT support suppressed")

    def _ok_single(interface: str, ch0: Any) -> bool:
        return _try_open(interface, ch0, bitrate)

    # Helper to validate both channels (when PAT support is required).
    def _ok_dual(interface: str, ch0: Any, ch1: Any) -> bool:
        if not _ok_single(interface, ch0):
            return False
        if ch1 is None:
            return False
        return _try_open(interface, ch1, bitrate)

    # -----------------
    # User-forced config (via env)
    # -----------------
    if interface_env != "auto":
        interface = interface_env

        if ch0_env is None:
            raise RuntimeError(
                "PATSPEAK_CAN_INTERFACE is set but PATSPEAK_CAN_CH0 is missing. "
                "Set PATSPEAK_CAN_CH0 (and CH1 if you want PAT support)."
            )

        ch0 = _coerce_channel(ch0_env)
        ch1 = _coerce_channel(ch1_env) if ch1_env is not None else None

        # If PAT support is requested but CH1 wasn't specified, treat this as a
        # single-channel configuration and suppress PAT support.
        if need_ch1 and ch1 is None:
            if _ok_single(interface, ch0):
                _force_single_channel(interface, ch0, note="PATSPEAK_CAN_CH1 not set")
                return
            raise RuntimeError(
                "PATSPEAK_CAN_INTERFACE is set but PATSPEAK_CAN_CH0 could not be opened. "
                "Check drivers / permissions / cable / device."
            )

        # Normal forced open.
        if (need_ch1 and _ok_dual(interface, ch0, ch1)) or (not need_ch1 and _ok_single(interface, ch0)):
            channels = [ch0, ch1] if (need_ch1 and ch1 is not None) else [ch0]
            _apply_backend(interface, channels)
            return

        # If channel 0 works but channel 1 doesn't, fall back to UUT-only.
        if need_ch1 and _ok_single(interface, ch0):
            _force_single_channel(interface, ch0, note="channel 1 unavailable")
            return

        # Special case requested: if Kvaser was forced but isn't available,
        # fall back to PCAN USB (and then SocketCAN).
        if interface == "kvaser":
            for fb_iface, fb_ch0, fb_ch1 in [
                ("pcan", "PCAN_USBBUS1", "PCAN_USBBUS2"),
                ("socketcan", "can0", "can1"),
            ]:
                if need_ch1 and _ok_dual(fb_iface, fb_ch0, fb_ch1):
                    _apply_backend(fb_iface, [fb_ch0, fb_ch1], note="Kvaser not detected; fell back")
                    return
                if not need_ch1 and _ok_single(fb_iface, fb_ch0):
                    _apply_backend(fb_iface, [fb_ch0], note="Kvaser not detected; fell back")
                    return
                if need_ch1 and _ok_single(fb_iface, fb_ch0):
                    _force_single_channel(fb_iface, fb_ch0, note="Kvaser not detected; only 1 CAN channel available")
                    return

        raise RuntimeError(
            f"Failed to open CAN interface={interface!r} channel0={ch0!r} channel1={ch1!r} bitrate={bitrate}. "
            "Check drivers / permissions / cable / device."
        )

    # -----------------
    # Auto-detect
    # -----------------
    # Auto-detect in a reasonable order.
    # On Windows, prefer Kvaser so it can take precedence over connected
    # single-channel PCAN adapters when PAT requires CH1.
    # The generic candidate loop below still prefers any dual-channel backend
    # over a single-channel fallback.

    if os.name == "nt":
        candidates: List[Tuple[str, Any, Any]] = [
            ("kvaser", 0, 1),
            ("pcan", "PCAN_USBBUS1", "PCAN_USBBUS2"),
            ("socketcan", "can0", "can1"),
        ]
    else:
        candidates = [
            ("kvaser", 0, 1),
            ("pcan", "PCAN_USBBUS1", "PCAN_USBBUS2"),
            ("socketcan", "can0", "can1"),
        ]

    # Allow overriding channels but keeping auto interface detection.
    if ch0_env is not None:
        # Try overrides as-is against each candidate interface.
        # If user specifies custom channel names, they probably know what they're doing.
        ch0_override = _coerce_channel(ch0_env)
        ch1_override = _coerce_channel(ch1_env) if ch1_env is not None else None
        candidates = [(iface, ch0_override, ch1_override) for (iface, _, _) in candidates]

    single_fallback: Optional[Tuple[str, Any]] = None

    for iface, ch0, ch1 in candidates:
        if need_ch1:
            if _ok_dual(iface, ch0, ch1):
                _apply_backend(iface, [ch0, ch1])
                return
            # Remember the first interface where channel 0 works; we can still
            # run UUT-only if only 1 channel is available.
            if single_fallback is None and _ok_single(iface, ch0):
                single_fallback = (iface, ch0)
        else:
            if _ok_single(iface, ch0):
                _apply_backend(iface, [ch0])
                return

    if need_ch1 and single_fallback is not None:
        iface, ch0 = single_fallback
        _force_single_channel(iface, ch0)
        return

    raise RuntimeError(
        "No CAN interface detected. Tried: Kvaser, PCAN, SocketCAN. "
        "Install the correct vendor driver for your hardware or set PATSPEAK_CAN_INTERFACE/CH0/CH1."
    )


def _open_bus(channel_number: int):
    _require_python_can()
    autodetect_can_backend()

    iface = rt.CAN_INTERFACE
    channels = rt.CAN_CHANNELS
    bitrate = rt.CAN_BITRATE

    if not channels or channel_number >= len(channels) or channels[channel_number] is None:
        raise RuntimeError(
            f"CAN channel {channel_number} is not available (detected channels: {channels!r})."
        )

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

        # Channel 0 is mandatory. Channel 1 (PAT) is optional; if it fails we
        # fall back to UUT-only by forcing SUPPRESS_PAT_SUPPORT.
        if channel_number == 0:
            rt.finished = 1
        else:
            try:
                rt.FORCE_SUPPRESS_PAT_SUPPORT = True
                rt.SuppressPatSupport = "True"
                rt.pat_db = None
                rt.PAT_Fdbk = {}
            except Exception:
                pass
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
                        # Track raw traffic by arbitration ID (DBC-independent).
                        # This powers UUT_TXCHECK_ID / UUT_TXCHECK_NOT_ID.
                        try:
                            arb_id = int(arbitration_id) & 0x1FFFFFFF
                            seen_by_id = getattr(rt, "UUT_TxSeenCountById", None)
                            if isinstance(seen_by_id, dict):
                                seen_by_id[arb_id] = int(seen_by_id.get(arb_id, 0) or 0) + 1

                            last_by_id = getattr(rt, "UUT_TxLastSeenById", None)
                            if isinstance(last_by_id, dict):
                                last_by_id[arb_id] = time.time()
                        except Exception:
                            pass

                        # Track raw UUT-originated traffic (per DBC Tx Node tagging).
                        # This powers the UUT_TXCHECK PAT command.
                        try:
                            ids = getattr(rt, "UUT_TxMsgIds", None)
                            if ids:
                                # python-can gives the on-the-wire 11/29-bit arbitration id.
                                arb_id = int(arbitration_id) & 0x1FFFFFFF
                                is_ext = bool(getattr(msg, "is_extended_id", False)) or (arb_id > 0x7FF)

                                # Be forgiving about representation mismatches.
                                if (
                                    (arb_id, is_ext) in ids
                                    or (arb_id, True) in ids
                                    or (arb_id, False) in ids
                                    or arb_id in ids
                                ):
                                    rt.UUT_TxSeenCount = int(getattr(rt, "UUT_TxSeenCount", 0) or 0) + 1
                                    rt.UUT_TxLastSeen = time.time()
                                    rt.UUT_TxLastSeenId = arb_id
                        except Exception:
                            pass

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
            # TX: one-shot raw frames (SEND_CAN)
            # -----------------
            try:
                q = _RAW_TX_QUEUES.get(channel_number)
                if q is not None:
                    while True:
                        try:
                            req = q.get_nowait()
                        except queue.Empty:
                            break

                        try:
                            if trace_tx:
                                ext = " EXT" if req.is_extended_id else ""
                                step = getattr(rt, "TestStep", None)
                                step_s = (
                                    str(step).zfill(5) + " "
                                    if isinstance(step, int)
                                    else ""
                                )
                                test = os.path.basename(str(getattr(rt, "TestFile", "") or ""))
                                if test:
                                    test = f" [{test}]"

                                print(
                                    step_s
                                    + f"CAN{channel_number} SEND_CAN 0x{int(req.arbitration_id):X}{ext} : "
                                    + " ".join(f"{b:02X}" for b in req.data)
                                    + test
                                )

                            out = can.Message(
                                arbitration_id=req.arbitration_id,
                                data=req.data,
                                is_extended_id=req.is_extended_id,
                            )
                            bus.send(out)
                            req.ok = True
                        except Exception as e:
                            req.ok = False
                            req.error = str(e)
                        finally:
                            try:
                                req.done.set()
                            except Exception:
                                pass
            except Exception:
                # Never allow SEND_CAN plumbing to break the CAN thread.
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
