"""CAN database + TX state utilities.

The original PATSpeak implementation relied on Kvaser's Python bindings
(`canlib`/`kvadblib`) for two big pieces of functionality:

1) Loading + decoding DBC files (kvadblib.Dbc + phys_from)
2) Maintaining a set of "CTRL" messages to transmit continuously
   (kvadblib.FrameBox)

This module replaces those pieces using `cantools` so the project doesn't have
to depend on Kvaser libraries for DBC handling.

Notes:
  - Kvaser hardware support (USBCan, etc.) is handled separately by the CAN
    interface layer (python-can). On Windows, a Kvaser driver/CANlib install is
    still required to use Kvaser hardware.
  - On Linux, Kvaser devices can often be used via SocketCAN (kvaser_usb) with
    no proprietary user-space libraries.
"""

from __future__ import annotations

from dataclasses import dataclass
import os
from typing import Any, Dict, Iterable, List, Optional, Set


try:
    import cantools  # type: ignore
except Exception:  # pragma: no cover
    cantools = None



# Many DBC exporters (including ones commonly used for J1939 networks) encode
# "extended frame format" by setting bit 31 in the frame id (0x80000000).
# The *real* CAN arbitration id on the wire is still only 29 bits.
#
# python-can exposes the 29-bit id in Message.arbitration_id and uses a
# separate Message.is_extended_id flag, so we need to normalize between the
# two representations to reliably match RX frames against DBC definitions.
EXTENDED_ID_FLAG = 0x80000000
EXTENDED_ID_MASK = 0x1FFFFFFF  # 29-bit mask


def _dbc_to_arbitration_id(frame_id: int) -> int:
    """Convert a DBC/cantools frame id into a real CAN arbitration id."""
    if frame_id & EXTENDED_ID_FLAG:
        return frame_id & EXTENDED_ID_MASK
    return frame_id


def _candidate_dbc_frame_ids(arbitration_id: int) -> List[int]:
    """Return candidate DBC frame ids for a received arbitration id.

    Some tooling stores extended ids as (0x80000000 | id). Others store the
    plain 29-bit id. We try both.
    """
    base = arbitration_id & EXTENDED_ID_MASK
    # Preserve order while de-duplicating.
    out: List[int] = []
    for v in (arbitration_id, base, base | EXTENDED_ID_FLAG):
        if v not in out:
            out.append(v)
    return out

def _require_cantools() -> None:
    if cantools is None:
        raise ImportError(
            "cantools is required for DBC parsing/encoding/decoding. "
            "Install it with: pip install cantools"
        )


def _get_message_signal(message: Any, signal_name: str) -> Optional[Any]:
    """Return the cantools Signal object for a name, or None."""
    for s in getattr(message, "signals", []) or []:
        if getattr(s, "name", None) == signal_name:
            return s
    return None


def _patch_signal_raw_into(payload: bytearray, signal: Any, raw_value: int) -> None:
    """Patch a raw (unscaled) signal value into an existing payload.

    This is used to emulate the legacy kvadblib behaviour where scripts may set a
    multiplexer to a value not declared in the DBC (e.g. Command=0 to "clear").
    """

    try:
        start = int(getattr(signal, "start"))
        length = int(getattr(signal, "length"))
    except Exception:
        return

    # Clamp raw_value to the signal width (treat as unsigned).
    if length <= 0:
        return
    if length < 64:
        raw_value &= (1 << length) - 1

    byte_order = getattr(signal, "byte_order", "little_endian")

    if byte_order == "big_endian":
        # DBC/Motorola bit ordering: start is the MSB. The next bit is:
        #   - previous bit in the same byte, or
        #   - the MSB of the next byte when we cross a byte boundary.
        pos = start
        for i in range(length):
            bit = (raw_value >> (length - 1 - i)) & 1
            byte_index = pos // 8
            bit_in_byte = pos % 8
            if 0 <= byte_index < len(payload):
                if bit:
                    payload[byte_index] |= (1 << bit_in_byte)
                else:
                    payload[byte_index] &= ~(1 << bit_in_byte)
            pos = pos + 15 if (pos % 8) == 0 else pos - 1
    else:
        # little_endian / Intel bit ordering: contiguous bits increasing from start.
        for i in range(length):
            bit = (raw_value >> i) & 1
            pos = start + i
            byte_index = pos // 8
            bit_in_byte = pos % 8
            if 0 <= byte_index < len(payload):
                if bit:
                    payload[byte_index] |= (1 << bit_in_byte)
                else:
                    payload[byte_index] &= ~(1 << bit_in_byte)




def _signal_mux_ids(signal: Any) -> Set[int]:
    """Return the set of multiplexer ids a signal is valid for.

    - Empty set means "always valid" (common / not muxed)
    - Non-empty set means the signal is only valid when the message's
      multiplexer is one of those ids.
    """

    mids = getattr(signal, "multiplexer_ids", None)
    if not mids:
        return set()
    out: Set[int] = set()
    for v in mids:
        try:
            out.add(int(v))
        except Exception:
            pass
    return out


def _iter_signal_bit_positions(signal: Any) -> Iterable[int]:
    """Yield the physical bit positions (0..63) occupied by a signal.

    This follows the same DBC bit numbering that cantools uses:
      - little_endian/Intel: contiguous bits increasing from start
      - big_endian/Motorola: start is MSB, then walks backwards within a byte
        and jumps to next byte MSB when crossing a boundary.

    We use this for overlap detection and for overlap-tolerant manual
    encode/decode.
    """

    try:
        start = int(getattr(signal, "start"))
        length = int(getattr(signal, "length"))
    except Exception:
        return

    if length <= 0:
        return

    byte_order = getattr(signal, "byte_order", "little_endian")

    if byte_order == "big_endian":
        pos = start
        for _ in range(length):
            yield pos
            pos = pos + 15 if (pos % 8) == 0 else pos - 1
    else:
        for i in range(length):
            yield start + i


def _extract_signal_raw_from(payload: bytes, signal: Any) -> int:
    """Extract the *raw* (unscaled) integer value for a signal from payload."""

    try:
        length = int(getattr(signal, "length"))
    except Exception:
        length = 0

    if length <= 0:
        return 0

    byte_order = getattr(signal, "byte_order", "little_endian")

    # Collect bits.
    if byte_order == "big_endian":
        # Build MSB->LSB.
        value = 0
        for pos in _iter_signal_bit_positions(signal):
            byte_index = pos // 8
            bit_in_byte = pos % 8
            bit = 0
            if 0 <= byte_index < len(payload):
                bit = (payload[byte_index] >> bit_in_byte) & 1
            value = (value << 1) | bit
    else:
        # Build LSB->MSB.
        value = 0
        for i, pos in enumerate(_iter_signal_bit_positions(signal)):
            byte_index = pos // 8
            bit_in_byte = pos % 8
            bit = 0
            if 0 <= byte_index < len(payload):
                bit = (payload[byte_index] >> bit_in_byte) & 1
            value |= (bit << i)

    # Apply sign.
    is_signed = bool(getattr(signal, "is_signed", False))
    if is_signed and length < 64:
        sign_bit = 1 << (length - 1)
        if value & sign_bit:
            value -= (1 << length)

    return int(value)


def _raw_to_scaled(signal: Any, raw_value: int) -> Any:
    """Convert a raw (integer) value into a scaled/physical value."""

    conv = getattr(signal, "conversion", None)
    if conv is not None and hasattr(conv, "raw_to_scaled"):
        try:
            return conv.raw_to_scaled(raw_value)
        except Exception:
            pass

    # Fallback to (raw * scale + offset)
    scale = getattr(signal, "scale", None)
    if scale is None:
        scale = getattr(signal, "factor", 1)
    offset = getattr(signal, "offset", None)
    if offset is None:
        offset = 0

    try:
        return raw_value * scale + offset
    except Exception:
        return raw_value


def _scaled_to_raw(signal: Any, scaled_value: Any) -> int:
    """Convert a scaled/physical value into a raw integer."""

    # Normalize boolean-like inputs.
    if isinstance(scaled_value, bool):
        scaled_value = int(scaled_value)

    conv = getattr(signal, "conversion", None)
    if conv is not None and hasattr(conv, "scaled_to_raw"):
        try:
            return int(conv.scaled_to_raw(scaled_value))
        except Exception:
            pass

    scale = getattr(signal, "scale", None)
    if scale is None:
        scale = getattr(signal, "factor", 1)
    offset = getattr(signal, "offset", None)
    if offset is None:
        offset = 0

    try:
        return int(round((float(scaled_value) - float(offset)) / float(scale)))
    except Exception:
        try:
            return int(scaled_value)
        except Exception:
            return 0


def _normalize_raw_for_signal(signal: Any, raw_value: int) -> int:
    """Clamp/normalize raw_value into the signal's bit width.

    For signed signals, raw_value may be negative; we convert it into a two's
    complement representation within the bit width.
    """

    try:
        length = int(getattr(signal, "length"))
    except Exception:
        length = 0

    if length <= 0 or length >= 64:
        return int(raw_value)

    mask = (1 << length) - 1

    is_signed = bool(getattr(signal, "is_signed", False))
    if is_signed and raw_value < 0:
        raw_value = (1 << length) + int(raw_value)

    return int(raw_value) & mask
@dataclass
class EncodedFrame:
    """A small carrier type for an encoded CAN frame."""

    arbitration_id: int
    data: bytes
    is_extended_id: bool


@dataclass(frozen=True)
class _MuxInfo:
    """Bookkeeping for a (single-level) multiplexed CAN message.

    cantools represents a multiplexed message as:
      - one *multiplexer* signal (e.g. "Command")
      - a set of signals that are only valid for specific multiplexer ids

    The legacy kvadblib.FrameBox abstraction in PATSpeak effectively behaved
    like it held *one frame per multiplexer id* for a multiplexed message.
    This structure lets us reproduce that behavior using cantools.
    """

    mux_signal: str
    mux_ids: List[int]
    mux_id_to_signals: Dict[int, List[str]]
    common_signals: List[str]


class CanDb:
    """Wraps a cantools Database and maintains TX state for CTRL messages."""

    def __init__(self, dbc_filename: str, tx_sender: str = "CTRL") -> None:
        _require_cantools()
        # cantools.database.load_file is the most stable entry point.
        #
        # IMPORTANT: Many real-world DBCs contain overlapping signals (often
        # due to vendor tooling quirks, legacy definitions, or signals that are
        # "logically multiplexed" but not declared as such in the DBC).
        #
        # cantools will refuse to load those databases when strict=True.
        # We default to strict=False to match the permissive behavior of
        # kvadblib/FrameBox that PATSpeak historically relied on.
        strict = False
        strict_env = os.environ.get("PATSPEAK_DBC_STRICT")
        if strict_env is not None and strict_env.strip() != "":
            strict = strict_env.strip().lower() in {"1", "true", "yes", "on"}

        try:
            self.db = cantools.database.load_file(dbc_filename, strict=strict)
        except TypeError:
            # Older cantools versions may not accept strict as a keyword arg.
            self.db = cantools.database.load_file(dbc_filename)

        # All messages in the database
        self.messages = list(getattr(self.db, "messages", []))

        # Build helpers.
        #
        # IMPORTANT: Extended CAN ids are often represented in DBCs by setting
        # bit 31 (0x80000000). python-can (and most CAN APIs) represent extended
        # ids as a plain 29-bit arbitration id plus a separate "extended" flag.
        #
        # To avoid missing RX frames due to this representation mismatch, we
        # index messages by *both* the stored DBC id and the on-the-wire id.
        self._frame_id_to_message: Dict[int, Any] = {}
        for m in self.messages:
            fid = int(getattr(m, "frame_id", 0))

            # As stored in the DBC/cantools object model.
            self._frame_id_to_message[fid] = m

            # On-the-wire arbitration id (strip bit 31 if present).
            wire_id = _dbc_to_arbitration_id(fid)
            self._frame_id_to_message[wire_id] = m

            # Also map the "DBC extended flag" representation of the wire id.
            # Some python-can backends / log formats use this convention too.
            is_ext = getattr(m, "is_extended_frame", None)
            if is_ext is None:
                is_ext = (fid & EXTENDED_ID_FLAG) != 0 or wire_id > 0x7FF
            else:
                is_ext = bool(is_ext) or (fid & EXTENDED_ID_FLAG) != 0

            if is_ext:
                self._frame_id_to_message[wire_id | EXTENDED_ID_FLAG] = m

        # Map signal name -> message (first occurrence wins)
        self._signal_to_message: Dict[str, Any] = {}
        for m in self.messages:
            for s in getattr(m, "signals", []) or []:
                self._signal_to_message.setdefault(s.name, m)

        # -----------------------------
        # Overlap analysis (hybrid mode)
        # -----------------------------
        #
        # Many real-world DBCs model "union" fields by defining multiple signals
        # on the same bits (overlapping signals). This is very common when the
        # firmware reinterprets the same bytes depending on an *external* mode
        # (configured elsewhere), which standard DBC multiplexing cannot express.
        #
        # Kvaser kvadblib tolerated this because it effectively treated each
        # signal as an independent bit-view. cantools is stricter and may omit
        # or throw on overlapping definitions.
        #
        # To keep PATSpeak usable across many products without per-DBC hacks,
        # we detect messages containing overlapping signals and decode them with
        # a generic bit-level decoder that tolerates overlaps.
        self._message_has_overlaps: Dict[str, bool] = {}
        self._message_mux_signal: Dict[str, Any] = {}

        for m in self.messages:
            # Record multiplexer signal (for manual decode).
            mux_sig = None
            for s in getattr(m, "signals", []) or []:
                if getattr(s, "is_multiplexer", False):
                    mux_sig = s
                    break
            if mux_sig is not None:
                self._message_mux_signal[m.name] = mux_sig

            # Detect overlaps among signals that can co-occur.
            sigs = list(getattr(m, "signals", []) or [])
            bitsets: Dict[str, Set[int]] = {}
            muxsets: Dict[str, Set[int]] = {}
            for s in sigs:
                bitsets[s.name] = set(_iter_signal_bit_positions(s))
                muxsets[s.name] = _signal_mux_ids(s)

            has_overlap = False
            for i in range(len(sigs)):
                a = sigs[i]
                bits_a = bitsets.get(a.name, set())
                mux_a = muxsets.get(a.name, set())
                for j in range(i + 1, len(sigs)):
                    b = sigs[j]
                    bits_b = bitsets.get(b.name, set())
                    if not bits_a or not bits_b:
                        continue

                    mux_b = muxsets.get(b.name, set())

                    # Signals can co-occur if either is "common" (no mux ids)
                    # or if they share at least one mux id.
                    cooccur = (not mux_a) or (not mux_b) or bool(mux_a & mux_b)
                    if not cooccur:
                        continue

                    if bits_a & bits_b:
                        has_overlap = True
                        break
                if has_overlap:
                    break

            self._message_has_overlaps[m.name] = has_overlap


        # TX messages: any message whose senders include tx_sender
        self.tx_sender = tx_sender
        self.tx_messages = [m for m in self.messages if tx_sender in (m.senders or [])]

        # Per-message signal value state for TX messages.
        #
        # IMPORTANT: Some CTRL messages in real-world DBCs are *multiplexed*.
        # kvadblib.FrameBox implicitly handled multiplexers by behaving like
        # there was one stored frame per multiplexer-id.
        #
        # When migrating to cantools we need to recreate that behavior,
        # otherwise cantools will rightfully error when trying to encode a
        # multiplexed message without a valid multiplexer id.
        self._tx_signal_values: Dict[str, Dict[str, Any]] = {}
        self._tx_signal_to_message_name: Dict[str, str] = {}
        self._tx_signal_to_mux_ids: Dict[str, List[int]] = {}
        self._tx_message_mux_info: Dict[str, _MuxInfo] = {}
        self._tx_touched_mux_ids: Dict[str, Set[int]] = {}
        # Encode shadow caches:
        #   key = (arbitration_id, is_extended_id, mux_id_or_none)
        # This mirrors the can_transformer concept (tx shadow -> rx shadow ->
        # cold start) without changing PATSpeak's parser strictness behavior.
        self._tx_payload_shadow: Dict[tuple[int, bool, Optional[int]], bytes] = {}
        self._rx_payload_shadow: Dict[tuple[int, bool, Optional[int]], bytes] = {}
        self._latest_rx_mux_by_message: Dict[tuple[int, bool], int] = {}

        # Multiplexed TX behaviour:
        #
        # kvadblib.FrameBox transmits a *single* frame for a multiplexed message,
        # based on the current value of the multiplexer signal. Legacy PATSpeak
        # .pat scripts also use the pattern `Command = 0` to "clear" the
        # multiplexer (even if the DBC does not define 0 as a valid mux id).
        #
        # cantools is stricter and refuses to encode a multiplexed message when
        # the mux id isn't one of the declared multiplexor ids. We emulate the
        # legacy behaviour by encoding a valid mux variant and then patching
        # the mux bits to the requested value.
        #
        # For debugging you can force sending *all* mux variants each TX cycle:
        #   PATSPEAK_SEND_ALL_MUX=1
        send_all_mux = False
        env = os.environ.get("PATSPEAK_SEND_ALL_MUX")
        if env is not None and env.strip() != "":
            send_all_mux = env.strip().lower() in {"1", "true", "yes", "on"}
        self._tx_send_all_mux = send_all_mux

        for m in self.tx_messages:
            values: Dict[str, Any] = {}

            # Detect whether this message is multiplexed and (if so) build a plan.
            mux_signal_name: Optional[str] = None
            for s in m.signals:
                if getattr(s, "is_multiplexer", False):
                    mux_signal_name = s.name
                    break

            mux_id_to_signals: Dict[int, List[str]] = {}
            common_signals: List[str] = []

            for s in m.signals:
                default = 0
                if getattr(s, "initial", None) is not None:
                    default = s.initial
                values[s.name] = default

                # Keep the original "first occurrence wins" behavior.
                self._tx_signal_to_message_name.setdefault(s.name, m.name)

                # Mux bookkeeping (only relevant for TX encoding)
                if mux_signal_name is None:
                    self._tx_signal_to_mux_ids.setdefault(s.name, [])
                    continue

                if s.name == mux_signal_name:
                    # Multiplexer select signal (e.g. "Command")
                    self._tx_signal_to_mux_ids.setdefault(s.name, [])
                    continue

                mux_ids = getattr(s, "multiplexer_ids", None)
                if mux_ids:
                    mids = list(mux_ids)
                    self._tx_signal_to_mux_ids.setdefault(s.name, mids)
                    for mid in mids:
                        mux_id_to_signals.setdefault(int(mid), []).append(s.name)
                else:
                    self._tx_signal_to_mux_ids.setdefault(s.name, [])
                    common_signals.append(s.name)

            self._tx_signal_values[m.name] = values

            if mux_signal_name is not None and mux_id_to_signals:
                mux_ids_sorted = sorted(mux_id_to_signals.keys())
                self._tx_message_mux_info[m.name] = _MuxInfo(
                    mux_signal=mux_signal_name,
                    mux_ids=mux_ids_sorted,
                    mux_id_to_signals=mux_id_to_signals,
                    common_signals=common_signals,
                )
                self._tx_touched_mux_ids[m.name] = set()

    # -----------------
    # Introspection
    # -----------------
    def iter_signal_names(self) -> Iterable[str]:
        for m in self.messages:
            for s in m.signals:
                yield s.name

    def has_signal(self, signal_name: str) -> bool:
        return signal_name in self._signal_to_message

    def has_tx_signal(self, signal_name: str) -> bool:
        return signal_name in self._tx_signal_to_message_name

    # -----------------
    # TX (encode)
    # -----------------
    def set_tx_signal(self, signal_name: str, value: Any) -> bool:
        """Set a signal value in the TX state.

        Returns True if the signal exists in any configured TX (CTRL) message.
        """

        msg_name = self._tx_signal_to_message_name.get(signal_name)
        if msg_name is None:
            return False

        # Store the value.
        self._tx_signal_values[msg_name][signal_name] = value

        # If this is a multiplexed message, remember which mux ids are now
        # "interesting" so we can (optionally) avoid transmitting unused
        # mux variants.
        mux_info = self._tx_message_mux_info.get(msg_name)
        if mux_info is not None:
            if signal_name == mux_info.mux_signal:
                # User explicitly set the mux select. Try to mark it as touched.
                try:
                    mid = int(value)
                except Exception:
                    mid = None
                if mid is not None and mid in mux_info.mux_ids:
                    self._tx_touched_mux_ids[msg_name].add(mid)
            else:
                for mid in self._tx_signal_to_mux_ids.get(signal_name, []):
                    if mid in mux_info.mux_ids:
                        self._tx_touched_mux_ids[msg_name].add(int(mid))

        return True

    def get_tx_signal(self, signal_name: str) -> Optional[Any]:
        msg_name = self._tx_signal_to_message_name.get(signal_name)
        if msg_name is None:
            return None
        return self._tx_signal_values[msg_name].get(signal_name)


    def _bit_encode_message(self, message: Any, sigs: Dict[str, Any]) -> bytes:
        """Encode a message by patching signals bit-by-bit.

        This is used as a fallback when cantools encoding fails (or for unusual
        DBC definitions). It also inherently tolerates overlapping signals;
        if multiple signals overlap, the last-written signal wins.
        """

        try:
            length_bytes = int(getattr(message, 'length', 8) or 8)
        except Exception:
            length_bytes = 8
        if length_bytes <= 0:
            length_bytes = 8

        payload = bytearray(length_bytes)

        for s in getattr(message, 'signals', []) or []:
            if s.name not in sigs:
                continue
            raw = _scaled_to_raw(s, sigs[s.name])
            raw = _normalize_raw_for_signal(s, raw)
            _patch_signal_raw_into(payload, s, raw)

        return bytes(payload)

    def _message_tx_identity(self, message: Any) -> tuple[int, bool]:
        """Return (arbitration_id, is_extended_id) for a message."""
        fid = int(getattr(message, "frame_id", 0))
        arb_id = _dbc_to_arbitration_id(fid)

        is_ext = getattr(message, "is_extended_frame", None)
        if is_ext is None:
            is_ext = (fid & EXTENDED_ID_FLAG) != 0 or arb_id > 0x7FF
        else:
            is_ext = bool(is_ext) or (fid & EXTENDED_ID_FLAG) != 0

        return arb_id, bool(is_ext)

    def _normalize_payload_size(
        self, payload: bytes | bytearray, expected_len: int
    ) -> bytearray:
        """Crop/pad payload to message length."""
        normalized = bytearray(payload[:expected_len])
        if len(normalized) != expected_len:
            normalized = (normalized + bytearray(expected_len))[:expected_len]
        return normalized

    def _build_cold_start_payload(self, message: Any, mux_value: Optional[int]) -> bytearray:
        """Synthesize a payload from zeroes + mux selector + signal initial values."""
        try:
            length_bytes = int(getattr(message, "length", 8) or 8)
        except Exception:
            length_bytes = 8
        if length_bytes <= 0:
            length_bytes = 8

        payload = bytearray(length_bytes)
        message_name = getattr(message, "name", "")
        mux_sig = self._message_mux_signal.get(message_name)

        if mux_sig is not None and mux_value is not None:
            _patch_signal_raw_into(payload, mux_sig, int(mux_value))

        for s in getattr(message, "signals", []) or []:
            # If a target mux is known, preserve that selector value.
            if mux_sig is not None and getattr(s, "name", None) == getattr(mux_sig, "name", None):
                if mux_value is not None:
                    continue

            mids = getattr(s, "multiplexer_ids", None)
            if mids:
                if mux_value is None:
                    continue
                include = False
                for mid in mids:
                    try:
                        if int(mid) == int(mux_value):
                            include = True
                            break
                    except Exception:
                        pass
                if not include:
                    continue

            initial = getattr(s, "initial", None)
            if initial is None:
                continue

            raw = _scaled_to_raw(s, initial)
            raw = _normalize_raw_for_signal(s, raw)
            _patch_signal_raw_into(payload, s, raw)

        return payload

    def _resolve_encode_base_payload(
        self,
        *,
        message: Any,
        arbitration_id: int,
        is_extended_id: bool,
        mux_value: Optional[int],
    ) -> bytearray:
        """Pick TX shadow, then RX shadow, then cold-start payload."""
        try:
            length_bytes = int(getattr(message, "length", 8) or 8)
        except Exception:
            length_bytes = 8
        if length_bytes <= 0:
            length_bytes = 8

        key = (
            int(arbitration_id),
            bool(is_extended_id),
            None if mux_value is None else int(mux_value),
        )
        base = self._tx_payload_shadow.get(key)
        if base is None:
            base = self._rx_payload_shadow.get(key)
        if base is not None:
            return self._normalize_payload_size(base, length_bytes)
        return self._build_cold_start_payload(message, mux_value)

    def _overlay_encoded_signals(
        self,
        *,
        message: Any,
        base_payload: bytes | bytearray,
        encoded_payload: bytes | bytearray,
        selected_signals: Set[str],
    ) -> bytearray:
        """Overlay selected signal bits from encoded payload onto a base payload."""
        try:
            length_bytes = int(getattr(message, "length", 8) or 8)
        except Exception:
            length_bytes = 8
        if length_bytes <= 0:
            length_bytes = 8

        out = self._normalize_payload_size(base_payload, length_bytes)
        encoded = self._normalize_payload_size(encoded_payload, length_bytes)
        if not selected_signals:
            return out

        encoded_bytes = bytes(encoded)
        for s in getattr(message, "signals", []) or []:
            name = getattr(s, "name", None)
            if name not in selected_signals:
                continue
            raw = _extract_signal_raw_from(encoded_bytes, s)
            raw = _normalize_raw_for_signal(s, raw)
            _patch_signal_raw_into(out, s, raw)
        return out

    def _cache_tx_shadow(
        self,
        *,
        message: Any,
        arbitration_id: int,
        is_extended_id: bool,
        mux_value: Optional[int],
        payload: bytes | bytearray,
    ) -> None:
        try:
            length_bytes = int(getattr(message, "length", 8) or 8)
        except Exception:
            length_bytes = 8
        if length_bytes <= 0:
            length_bytes = 8

        key = (
            int(arbitration_id),
            bool(is_extended_id),
            None if mux_value is None else int(mux_value),
        )
        self._tx_payload_shadow[key] = bytes(self._normalize_payload_size(payload, length_bytes))

    def _update_rx_shadow(
        self,
        *,
        message: Any,
        arbitration_id: int,
        is_extended_id: bool,
        payload: bytes,
    ) -> None:
        """Cache last received payload by message + mux context."""
        try:
            length_bytes = int(getattr(message, "length", 8) or 8)
        except Exception:
            length_bytes = 8
        if length_bytes <= 0:
            length_bytes = 8

        message_name = getattr(message, "name", "")
        mux_sig = self._message_mux_signal.get(message_name)

        if mux_sig is None:
            key = (int(arbitration_id), bool(is_extended_id), None)
        else:
            try:
                mux_raw = int(_extract_signal_raw_from(payload, mux_sig))
            except Exception:
                return
            key = (int(arbitration_id), bool(is_extended_id), mux_raw)
            self._latest_rx_mux_by_message[(int(arbitration_id), bool(is_extended_id))] = mux_raw

        self._rx_payload_shadow[key] = bytes(self._normalize_payload_size(payload, length_bytes))

    def encode_tx(self) -> List[EncodedFrame]:
        """Encode all TX messages using the current signal state."""

        frames: List[EncodedFrame] = []

        for m in self.tx_messages:
            sig_values = self._tx_signal_values.get(m.name, {})
            mux_info = self._tx_message_mux_info.get(m.name)

            arb_id, is_ext = self._message_tx_identity(m)


            # -------------------------
            # Non-multiplexed messages
            # -------------------------
            if mux_info is None:
                try:

                    data = m.encode(sig_values, scaling=True, strict=False)

                except Exception:

                    try:

                        data = m.encode(sig_values)

                    except Exception:

                        data = self._bit_encode_message(m, sig_values)

                merged_payload = self._overlay_encoded_signals(
                    message=m,
                    base_payload=self._resolve_encode_base_payload(
                        message=m,
                        arbitration_id=arb_id,
                        is_extended_id=is_ext,
                        mux_value=None,
                    ),
                    encoded_payload=bytes(data),
                    selected_signals=set(sig_values.keys()),
                )
                self._cache_tx_shadow(
                    message=m,
                    arbitration_id=arb_id,
                    is_extended_id=is_ext,
                    mux_value=None,
                    payload=merged_payload,
                )

                frames.append(
                    EncodedFrame(
                        arbitration_id=arb_id,
                        data=bytes(merged_payload),
                        is_extended_id=is_ext,
                    )
                )
                continue

            # ----------------------
            # Multiplexed messages
            # ----------------------
            # The legacy kvadblib.FrameBox sends a single frame for a multiplexed
            # message, using whatever value the multiplexer signal currently has.
            #
            # PATSpeak .pat scripts commonly do `Command = 0` to clear / no-op the
            # message. cantools will raise on such values because 0 isn't one of
            # the declared multiplexer ids in the DBC.
            #
            # We emulate the legacy behaviour by:
            #   - encoding normally when the mux id is valid
            #   - otherwise, encoding a "base" mux variant and patching the mux bits
            #     to the requested value.
            #
            # If PATSPEAK_SEND_ALL_MUX=1 is set, we still support emitting one frame
            # per mux-id (useful for troubleshooting), but this is NOT the default.
            mux_signal_obj = _get_message_signal(m, mux_info.mux_signal)

            # Current desired mux id (may be 0 in scripts).
            desired_mid: int
            try:
                desired_mid = int(sig_values.get(mux_info.mux_signal, 0) or 0)
            except Exception:
                desired_mid = 0

            if self._tx_send_all_mux:
                mux_ids_to_send = list(mux_info.mux_ids)
            else:
                mux_ids_to_send = [desired_mid]

            for mid in mux_ids_to_send:
                sigs: Dict[str, Any] = {}

                # Common (non-muxed) signals, if any.
                for name in mux_info.common_signals:
                    if name in sig_values:
                        sigs[name] = sig_values[name]

                if mid in mux_info.mux_ids:
                    # Signals for this mux-id.
                    for name in mux_info.mux_id_to_signals.get(int(mid), []):
                        if name in sig_values:
                            sigs[name] = sig_values[name]

                    # Use the desired mux id directly.
                    sigs[mux_info.mux_signal] = int(mid)

                    try:


                        data = m.encode(sigs, scaling=True, strict=False)


                    except Exception:


                        try:


                            data = m.encode(sigs)


                        except Exception:


                            data = self._bit_encode_message(m, sigs)

                    merged_payload = self._overlay_encoded_signals(
                        message=m,
                        base_payload=self._resolve_encode_base_payload(
                            message=m,
                            arbitration_id=arb_id,
                            is_extended_id=is_ext,
                            mux_value=int(mid),
                        ),
                        encoded_payload=bytes(data),
                        selected_signals=set(sigs.keys()),
                    )
                    self._cache_tx_shadow(
                        message=m,
                        arbitration_id=arb_id,
                        is_extended_id=is_ext,
                        mux_value=int(mid),
                        payload=merged_payload,
                    )

                    frames.append(
                        EncodedFrame(
                            arbitration_id=arb_id,
                            data=bytes(merged_payload),
                            is_extended_id=is_ext,
                        )
                    )
                    continue

                # -----------------------------
                # Unknown / "clear" mux-id path
                # -----------------------------
                # Encode a base mux id (first declared) with all its muxed signals forced
                # to 0. Then patch the mux bits to the requested value.
                base_mid = mux_info.mux_ids[0] if mux_info.mux_ids else 0

                for name in mux_info.mux_id_to_signals.get(int(base_mid), []):
                    sigs[name] = 0

                sigs[mux_info.mux_signal] = int(base_mid)

                try:


                    data = m.encode(sigs, scaling=True, strict=False)


                except Exception:


                    try:


                        data = m.encode(sigs)


                    except Exception:


                        data = self._bit_encode_message(m, sigs)

                payload = bytearray(bytes(data))
                if mux_signal_obj is not None:
                    _patch_signal_raw_into(payload, mux_signal_obj, int(mid))

                merged_payload = self._overlay_encoded_signals(
                    message=m,
                    base_payload=self._resolve_encode_base_payload(
                        message=m,
                        arbitration_id=arb_id,
                        is_extended_id=is_ext,
                        mux_value=int(mid),
                    ),
                    encoded_payload=payload,
                    selected_signals=set(sigs.keys()) | {mux_info.mux_signal},
                )
                self._cache_tx_shadow(
                    message=m,
                    arbitration_id=arb_id,
                    is_extended_id=is_ext,
                    mux_value=int(mid),
                    payload=merged_payload,
                )

                frames.append(
                    EncodedFrame(
                        arbitration_id=arb_id,
                        data=bytes(merged_payload),
                        is_extended_id=is_ext,
                    )
                )


        return frames

    # -----------------
    # RX (decode)
    # -----------------

    def _bit_decode_message(self, message: Any, data: bytes) -> Optional[Dict[str, Any]]:
        """Decode a message using a generic bit-level decoder.

        This decoder tolerates overlapping signals by extracting each signal
        independently from the raw payload bytes.

        For multiplexed messages, only signals valid for the active mux-id are
        included (plus common signals).
        """

        out: Dict[str, Any] = {}

        mux_sig = self._message_mux_signal.get(getattr(message, "name", ""))
        mux_raw: Optional[int] = None

        if mux_sig is not None:
            mux_raw = _extract_signal_raw_from(data, mux_sig)
            out[mux_sig.name] = _raw_to_scaled(mux_sig, mux_raw)

        for s in getattr(message, "signals", []) or []:
            if mux_sig is not None and s.name == mux_sig.name:
                continue

            mids = getattr(s, "multiplexer_ids", None)
            if mids:
                if mux_raw is None:
                    continue
                ok = False
                for v in mids:
                    try:
                        if int(v) == int(mux_raw):
                            ok = True
                            break
                    except Exception:
                        pass
                if not ok:
                    continue

            raw = _extract_signal_raw_from(data, s)
            out[s.name] = _raw_to_scaled(s, raw)

        return out if out else None


    def decode(self, arbitration_id: int, data: bytes) -> Optional[Dict[str, Any]]:
        """Decode a frame into signal values.

        Strategy ("hybrid"):
          - For normal messages (no overlapping signals), use cantools decode.
          - For messages with overlapping signals, use a generic bit-level
            decoder that tolerates overlaps.
          - If cantools throws on a message for any reason, fall back to the
            bit-level decoder.

        Returns None if the frame id isn't known.
        """

        # Find the message for this frame id.
        m_obj = None
        for fid in _candidate_dbc_frame_ids(int(arbitration_id)):
            m_obj = self._frame_id_to_message.get(fid)
            if m_obj is not None:
                break

        if m_obj is None:
            # Last-chance: ask cantools directly.
            try:
                m_obj = self.db.get_message_by_frame_id(int(arbitration_id))
            except Exception:
                try:
                    m_obj = self.db.get_message_by_frame_id(int(arbitration_id) | EXTENDED_ID_FLAG)
                except Exception:
                    return None

        name = getattr(m_obj, "name", "")
        msg_arb_id, msg_is_ext = self._message_tx_identity(m_obj)
        self._update_rx_shadow(
            message=m_obj,
            arbitration_id=msg_arb_id,
            is_extended_id=msg_is_ext,
            payload=data,
        )

        # If this message is known to have overlaps, always use bit decode.
        if self._message_has_overlaps.get(name, False):
            return self._bit_decode_message(m_obj, data)

        # Fast path: cantools decode.
        try:
            decoded = m_obj.decode(data, decode_choices=False)
            decoded_dict = dict(decoded)
            return decoded_dict if decoded_dict else None
        except Exception:
            # Fallback: bit decode (covers odd DBC quirks too).
            return self._bit_decode_message(m_obj, data)
