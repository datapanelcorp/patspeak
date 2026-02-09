from __future__ import annotations

from dataclasses import dataclass
from types import SimpleNamespace
from typing import Any, Dict, List, Optional

import pytest

from patspeak import can_db


# -----------------
# Minimal fakes
# -----------------


@dataclass
class FakeConversion:
    raw_to_scaled_raises: bool = False
    scaled_to_raw_raises: bool = False

    def raw_to_scaled(self, raw: int) -> float:
        if self.raw_to_scaled_raises:
            raise ValueError("boom")
        return float(raw) * 2.0

    def scaled_to_raw(self, scaled: Any) -> int:
        if self.scaled_to_raw_raises:
            raise ValueError("boom")
        return int(float(scaled) / 2.0)


@dataclass
class FakeSignal:
    name: str
    start: Any = 0
    length: Any = 8
    byte_order: str = "little_endian"
    is_signed: bool = False
    # cantools compatibility
    is_multiplexer: bool = False
    multiplexer_ids: Optional[List[Any]] = None
    # scaling fields
    scale: Optional[float] = None
    factor: float = 1.0
    offset: Optional[float] = None
    conversion: Any = None
    # default
    initial: Any = None


class FakeMessage:
    def __init__(
        self,
        name: str,
        frame_id: int,
        *,
        signals: List[FakeSignal],
        senders: Optional[List[str]] = None,
        is_extended_frame: Optional[bool] = None,
        length: Any = 8,
        # encode/decode behavior knobs
        raise_on_encode_scaling: bool = False,
        raise_on_encode_plain: bool = False,
        raise_on_decode: bool = False,
        decode_returns: Optional[Dict[str, Any]] = None,
    ) -> None:
        self.name = name
        self.frame_id = frame_id
        self.signals = signals
        self.senders = senders
        self.is_extended_frame = is_extended_frame
        self.length = length

        self.raise_on_encode_scaling = raise_on_encode_scaling
        self.raise_on_encode_plain = raise_on_encode_plain
        self.raise_on_decode = raise_on_decode
        self.decode_returns = decode_returns if decode_returns is not None else {"X": 1}

        self.encode_calls: List[Dict[str, Any]] = []

    def encode(self, sigs: Dict[str, Any], **kwargs: Any) -> bytes:
        """Behaves like cantools.Message.encode."""
        self.encode_calls.append({"sigs": dict(sigs), "kwargs": dict(kwargs)})
        if kwargs.get("scaling") is True:
            if self.raise_on_encode_scaling:
                raise ValueError("encode scaling failed")
        else:
            if self.raise_on_encode_plain:
                raise ValueError("encode plain failed")

        # Deterministic payload: first byte = frame_id LSB, second byte = mux if provided.
        payload = bytearray(int(self.length) if str(self.length).isdigit() else 8)
        payload[0] = int(self.frame_id) & 0xFF
        # If there's a mux signal, pack it into byte0 LSBs via the helper.
        for s in self.signals:
            if getattr(s, "is_multiplexer", False) and s.name in sigs:
                can_db._patch_signal_raw_into(payload, s, int(sigs[s.name]))
        return bytes(payload)

    def decode(self, data: bytes, **kwargs: Any) -> Dict[str, Any]:
        if self.raise_on_decode:
            raise ValueError("decode failed")
        return dict(self.decode_returns)


class FakeDatabase:
    def __init__(self, messages: List[FakeMessage]) -> None:
        self.messages = messages

        # Optional lookup behavior
        self._by_id: Dict[int, FakeMessage] = {int(m.frame_id): m for m in messages}

    def get_message_by_frame_id(self, fid: int) -> FakeMessage:
        if fid not in self._by_id:
            raise KeyError(fid)
        return self._by_id[fid]


class FakeCantoolsModule:
    def __init__(self, db: FakeDatabase, *, raise_typeerror_on_strict_kw: bool = False):
        self._db = db
        self._raise_typeerror_on_strict_kw = raise_typeerror_on_strict_kw
        self.load_calls: List[Dict[str, Any]] = []

        class _DatabaseNS:
            pass

        self.database = _DatabaseNS()

        def load_file(filename: str, *args: Any, **kwargs: Any) -> FakeDatabase:
            self.load_calls.append({"filename": filename, "args": args, "kwargs": dict(kwargs)})
            if self._raise_typeerror_on_strict_kw and "strict" in kwargs:
                raise TypeError("strict kw not supported")
            return self._db

        self.database.load_file = load_file


# -----------------
# Helper function coverage
# -----------------


def test_require_cantools_raises_when_missing(monkeypatch):
    monkeypatch.setattr(can_db, "cantools", None)
    with pytest.raises(ImportError):
        can_db._require_cantools()


def test_get_message_signal_found_and_not_found():
    msg = SimpleNamespace(signals=[SimpleNamespace(name="A"), SimpleNamespace(name="B")])
    assert can_db._get_message_signal(msg, "B").name == "B"
    assert can_db._get_message_signal(msg, "C") is None


def test_patch_signal_raw_into_guards_invalid_defs():
    payload = bytearray(2)

    # Missing start/length -> no-op
    can_db._patch_signal_raw_into(payload, SimpleNamespace(name="X"), 1)
    assert payload == bytearray(2)

    # length <= 0 -> no-op
    can_db._patch_signal_raw_into(payload, SimpleNamespace(name="X", start=0, length=0), 1)
    assert payload == bytearray(2)


def test_signal_mux_ids_handles_bad_values():
    sig = SimpleNamespace(multiplexer_ids=["1", "bad", 2])
    assert can_db._signal_mux_ids(sig) == {1, 2}
    assert can_db._signal_mux_ids(SimpleNamespace(multiplexer_ids=None)) == set()


def test_iter_signal_bit_positions_invalid_returns_empty():
    # start cannot be coerced to int -> generator yields nothing
    sig = SimpleNamespace(start=None, length=8)
    assert list(can_db._iter_signal_bit_positions(sig)) == []

    # length <= 0 -> yields nothing
    sig2 = SimpleNamespace(start=0, length=0)
    assert list(can_db._iter_signal_bit_positions(sig2)) == []


def test_extract_signal_raw_from_length_invalid_and_signed_behavior():
    # Missing/invalid length -> returns 0
    sig = SimpleNamespace(start=0, length=None)
    assert can_db._extract_signal_raw_from(b"\xFF", sig) == 0

    # Signed 4-bit little endian: 0b1111 should decode to -1
    sig2 = SimpleNamespace(start=0, length=4, byte_order="little_endian", is_signed=True)
    assert can_db._extract_signal_raw_from(b"\x0F", sig2) == -1


def test_raw_to_scaled_prefers_conversion_and_falls_back(monkeypatch):
    sig = SimpleNamespace(conversion=FakeConversion(raw_to_scaled_raises=False))
    assert can_db._raw_to_scaled(sig, 3) == 6.0

    # conversion raises -> fallback to raw*scale + offset
    sig2 = SimpleNamespace(conversion=FakeConversion(raw_to_scaled_raises=True), scale=2.0, offset=1.0)
    assert can_db._raw_to_scaled(sig2, 3) == 7.0

    # Fallback math raises -> return raw_value
    sig3 = SimpleNamespace(conversion=None, scale="bad", offset=0)
    assert can_db._raw_to_scaled(sig3, 3) == 3


def test_scaled_to_raw_prefers_conversion_and_falls_back():
    sig = SimpleNamespace(conversion=FakeConversion(scaled_to_raw_raises=False))
    assert can_db._scaled_to_raw(sig, 10) == 5

    # bool inputs normalize
    assert can_db._scaled_to_raw(SimpleNamespace(conversion=None, scale=1, offset=0), True) == 1

    # conversion raises -> fallback uses scale/offset
    sig2 = SimpleNamespace(conversion=FakeConversion(scaled_to_raw_raises=True), scale=2.0, offset=1.0)
    assert can_db._scaled_to_raw(sig2, 5.0) == 2

    # fallback math raises -> int(scaled_value)
    sig3 = SimpleNamespace(conversion=None, scale="bad", offset=0)
    assert can_db._scaled_to_raw(sig3, 7) == 7

    # int conversion fails -> 0
    sig4 = SimpleNamespace(conversion=None, scale="bad", offset=0)
    assert can_db._scaled_to_raw(sig4, object()) == 0


def test_normalize_raw_for_signal_handles_signed_negative_and_bad_length():
    # Bad/zero length -> return raw_value as int
    sig = SimpleNamespace(length=None)
    assert can_db._normalize_raw_for_signal(sig, 123) == 123

    # Signed negative clamps into two's complement
    sig2 = SimpleNamespace(length=4, is_signed=True)
    assert can_db._normalize_raw_for_signal(sig2, -1) == 0x0F


# -----------------
# CanDb class coverage (using faked cantools)
# -----------------


def _make_db_for_core_tests() -> FakeDatabase:
    # Non-mux message that succeeds on scaling encode.
    m_ok = FakeMessage(
        "MSG_OK",
        0x100,
        signals=[FakeSignal("A", start=0, length=8)],
        senders=["CTRL"],
        is_extended_frame=None,
        raise_on_encode_scaling=False,
        raise_on_encode_plain=False,
        decode_returns={"A": 1},
    )

    # Non-mux message that fails scaling encode but succeeds on plain.
    m_plain = FakeMessage(
        "MSG_PLAIN",
        0x101,
        signals=[FakeSignal("B", start=8, length=8)],
        senders=["CTRL"],
        is_extended_frame=False,
        raise_on_encode_scaling=True,
        raise_on_encode_plain=False,
        decode_returns={},  # exercise empty decode -> None
    )

    # Non-mux message that fails all encodes -> bit encode fallback.
    m_bit = FakeMessage(
        "MSG_BIT",
        0x102,
        signals=[FakeSignal("C", start=0, length=3)],
        senders=["CTRL"],
        is_extended_frame=False,
        raise_on_encode_scaling=True,
        raise_on_encode_plain=True,
        decode_returns={"C": 3},
    )

    # Mux message with one mux signal and two variants.
    mux = FakeSignal("MUX", start=0, length=2, is_multiplexer=True)
    s1 = FakeSignal("D1", start=8, length=8, multiplexer_ids=[1])
    s2 = FakeSignal("D2", start=16, length=8, multiplexer_ids=[2])
    common = FakeSignal("DC", start=24, length=8)
    m_mux = FakeMessage(
        "MSG_MUX",
        can_db.EXTENDED_ID_FLAG | 0x1ABCDE,  # exercises extended id normalization
        signals=[mux, s1, s2, common],
        senders=["CTRL"],
        is_extended_frame=None,
        # Let encode succeed.
        raise_on_encode_scaling=False,
        raise_on_encode_plain=False,
        decode_returns={"MUX": 1, "D1": 10, "DC": 99},
    )

    # A message with overlapping signals to force overlap detection.
    ov1 = FakeSignal("OV1", start=0, length=8)
    ov2 = FakeSignal("OV2", start=4, length=8)
    m_ov = FakeMessage(
        "MSG_OV",
        0x200,
        signals=[ov1, ov2],
        senders=None,
        is_extended_frame=True,
        decode_returns={"OV1": 1},
    )

    # A message with muxed signals that cannot co-occur (cooccur=False branch).
    mmux = FakeSignal("MMUX", start=0, length=1, is_multiplexer=True)
    mx1 = FakeSignal("MX1", start=0, length=1, multiplexer_ids=[1])
    mx2 = FakeSignal("MX2", start=0, length=1, multiplexer_ids=[2])
    m_no_cooccur = FakeMessage(
        "MSG_NO_CO",
        0x201,
        signals=[mmux, mx1, mx2],
        senders=None,
        is_extended_frame=False,
        decode_returns={"MMUX": 1},
    )

    # A message with an invalid signal definition to hit "not bits" branch.
    bad = FakeSignal("BAD", start=None, length=8)
    good = FakeSignal("GOOD", start=8, length=8)
    m_bad_bits = FakeMessage(
        "MSG_BAD_BITS",
        0x202,
        signals=[bad, good],
        senders=None,
        is_extended_frame=False,
        decode_returns={"GOOD": 1},
    )

    return FakeDatabase([m_ok, m_plain, m_bit, m_mux, m_ov, m_no_cooccur, m_bad_bits])


def test_candb_init_strict_env_and_typeerror_fallback(monkeypatch):
    db = _make_db_for_core_tests()
    fake = FakeCantoolsModule(db, raise_typeerror_on_strict_kw=True)

    monkeypatch.setattr(can_db, "cantools", fake)
    monkeypatch.setenv("PATSPEAK_DBC_STRICT", "yes")

    _ = can_db.CanDb("dummy.dbc")

    # First call includes strict kw and raises TypeError, second call retries without strict.
    assert len(fake.load_calls) == 2
    assert "strict" in fake.load_calls[0]["kwargs"]
    assert fake.load_calls[0]["kwargs"]["strict"] is True
    assert fake.load_calls[1]["kwargs"] == {}


def test_candb_encode_tx_and_set_get_signal_paths(monkeypatch):
    db = _make_db_for_core_tests()
    fake = FakeCantoolsModule(db)
    monkeypatch.setattr(can_db, "cantools", fake)

    # Enable send-all-mux path.
    monkeypatch.setenv("PATSPEAK_SEND_ALL_MUX", "1")
    monkeypatch.delenv("PATSPEAK_DBC_STRICT", raising=False)

    cdb = can_db.CanDb("dummy.dbc")

    # Unknown TX signal -> False
    assert cdb.set_tx_signal("NOPE", 1) is False

    # Known TX signal set/get
    assert cdb.set_tx_signal("A", 123) is True
    assert cdb.get_tx_signal("A") == 123

    # get_tx_signal for unknown -> None
    assert cdb.get_tx_signal("NOPE") is None

    # Mux signal set to a valid mid -> touches it
    assert cdb.set_tx_signal("MUX", 1) is True

    # Mux signal set to a non-int -> doesn't crash
    assert cdb.set_tx_signal("MUX", "bad") is True

    # Setting a muxed signal touches its mux id
    assert cdb.set_tx_signal("D1", 7) is True

    frames = cdb.encode_tx()
    assert frames

    # Because PATSPEAK_SEND_ALL_MUX=1, we should see multiple mux frames.
    mux_frames = [f for f in frames if f.arbitration_id == (0x1ABCDE & can_db.EXTENDED_ID_MASK)]
    assert len(mux_frames) >= 2

    # Non-mux frames should exist too.
    assert any(f.arbitration_id == 0x100 for f in frames)


def test_candb_encode_tx_mux_unknown_mid_patches_bits(monkeypatch):
    # Build a minimal DB with a muxed CTRL message.
    mux = FakeSignal("MUX", start=0, length=2, is_multiplexer=True)
    d1 = FakeSignal("D1", start=8, length=8, multiplexer_ids=[1])
    msg = FakeMessage(
        "MUXMSG",
        0x123,
        signals=[mux, d1],
        senders=["CTRL"],
        is_extended_frame=False,
    )
    db = FakeDatabase([msg])
    fake = FakeCantoolsModule(db)
    monkeypatch.setattr(can_db, "cantools", fake)
    monkeypatch.delenv("PATSPEAK_SEND_ALL_MUX", raising=False)

    cdb = can_db.CanDb("dummy.dbc")

    # Force an unknown mux id (0) -> should encode base mux and patch bits to 0.
    assert cdb.set_tx_signal("MUX", 0) is True
    frames = cdb.encode_tx()
    assert len(frames) == 1

    # MUX signal is at start bit0..1; value 0 should leave those bits cleared.
    assert frames[0].data[0] & 0b11 == 0


def test_candb_bit_encode_message_length_handling(monkeypatch):
    db = _make_db_for_core_tests()
    fake = FakeCantoolsModule(db)
    monkeypatch.setattr(can_db, "cantools", fake)
    cdb = can_db.CanDb("dummy.dbc")

    # length is not int-coercible -> fallback to 8 bytes
    msg = FakeMessage(
        "LEN_BAD",
        0x300,
        signals=[FakeSignal("S", start=0, length=8)],
        senders=["CTRL"],
        length="bad",
        raise_on_encode_scaling=True,
        raise_on_encode_plain=True,
    )

    payload = cdb._bit_encode_message(msg, {"S": 1})
    assert isinstance(payload, (bytes, bytearray))
    assert len(payload) == 8

    # length <= 0 -> coerces to 8 (negative length is truthy, so it passes the `or 8` guard)
    msg2 = FakeMessage(
        "LEN_ZERO",
        0x301,
        signals=[FakeSignal("S", start=0, length=8)],
        senders=["CTRL"],
        length=-1,
        raise_on_encode_scaling=True,
        raise_on_encode_plain=True,
    )
    payload2 = cdb._bit_encode_message(msg2, {"S": 1})
    assert len(payload2) == 8


def test_candb_decode_paths_and_fallbacks(monkeypatch):
    # Message that raises on decode to force bit-decode fallback.
    mux = FakeSignal("MUX", start=0, length=2, is_multiplexer=True)
    s1 = FakeSignal("D1", start=8, length=8, multiplexer_ids=[1])
    msg = FakeMessage(
        "RX",
        0x555,
        signals=[mux, s1],
        senders=None,
        is_extended_frame=False,
        raise_on_decode=True,
        decode_returns={"MUX": 1, "D1": 10},
    )

    db = FakeDatabase([msg])
    fake = FakeCantoolsModule(db)
    monkeypatch.setattr(can_db, "cantools", fake)

    cdb = can_db.CanDb("dummy.dbc")

    # Build a payload where mux raw is 1 and D1 raw is 0x2A.
    payload = bytearray(8)
    can_db._patch_signal_raw_into(payload, mux, 1)
    can_db._patch_signal_raw_into(payload, s1, 0x2A)

    out = cdb.decode(0x555, bytes(payload))
    assert out is not None
    assert out.get("MUX") == 1 or out.get("MUX") == 2.0  # conversion may apply depending on signal

    # Unknown arbitration id -> None (both db lookups fail)
    assert cdb.decode(0x999, b"\x00" * 8) is None


def test_candb_decode_last_chance_db_lookup(monkeypatch):
    # Force the last-chance lookup path by ensuring the normal frame-id mapping
    # does *not* contain the arbitration id we decode.
    msg = FakeMessage(
        "LC",
        0x999,  # does not match the decode() arbitration id below
        signals=[FakeSignal("A", start=0, length=8)],
        senders=None,
        is_extended_frame=None,
        decode_returns={"A": 1},
    )

    class DBWithWeirdLookup:
        def __init__(self, message: FakeMessage):
            self.messages = [message]

        def get_message_by_frame_id(self, fid: int) -> FakeMessage:
            # First attempt fails, second attempt (with EXTENDED flag) succeeds.
            if fid == 0x123:
                raise KeyError(fid)
            if fid == (0x123 | can_db.EXTENDED_ID_FLAG):
                return msg
            raise KeyError(fid)

    fake = FakeCantoolsModule(DBWithWeirdLookup(msg))
    monkeypatch.setattr(can_db, "cantools", fake)
    cdb = can_db.CanDb("dummy.dbc")

    out = cdb.decode(0x123, b"\x00" * 8)
    assert out is not None


def test_candb_decode_overlap_short_circuit(monkeypatch):
    db = _make_db_for_core_tests()
    fake = FakeCantoolsModule(db)
    monkeypatch.setattr(can_db, "cantools", fake)
    cdb = can_db.CanDb("dummy.dbc")

    # MSG_OV has overlapping signals, so decode() should short-circuit to bit decode.
    payload = b"\xFF" * 8
    out = cdb.decode(0x200, payload)
    assert out is not None
    assert "OV1" in out


def test_candb_introspection_helpers(monkeypatch):
    db = _make_db_for_core_tests()
    fake = FakeCantoolsModule(db)
    monkeypatch.setattr(can_db, "cantools", fake)
    cdb = can_db.CanDb("dummy.dbc")

    names = list(cdb.iter_signal_names())
    assert "A" in names
    assert cdb.has_signal("A") is True
    assert cdb.has_signal("NOPE") is False
    assert cdb.has_tx_signal("A") is True
    assert cdb.has_tx_signal("OV1") is False  # not a CTRL/TX message


def test_candb_decode_empty_dict_returns_none(monkeypatch):
    db = _make_db_for_core_tests()
    fake = FakeCantoolsModule(db)
    monkeypatch.setattr(can_db, "cantools", fake)
    cdb = can_db.CanDb("dummy.dbc")

    # MSG_PLAIN decode_returns is {}, so decode() should return None.
    assert cdb.decode(0x101, b"\x00" * 8) is None


def test_candb_bit_decode_message_edge_cases(monkeypatch):
    # Message with muxed signal but no mux selector -> mux_raw stays None and muxed signals are skipped.
    mx = FakeSignal("MX", start=0, length=1, multiplexer_ids=[1, "bad"])  # includes a bad id to hit exception path
    msg = FakeMessage("EDGE", 0x400, signals=[mx], senders=None)
    db = FakeDatabase([msg])
    fake = FakeCantoolsModule(db)
    monkeypatch.setattr(can_db, "cantools", fake)
    cdb = can_db.CanDb("dummy.dbc")

    assert cdb._bit_decode_message(msg, b"\x01") is None


def test_candb_mux_encode_fallback_paths(monkeypatch):
    # Scaling encode fails, plain encode succeeds.
    mux = FakeSignal("MUX", start=0, length=2, is_multiplexer=True)
    d1 = FakeSignal("D1", start=8, length=8, multiplexer_ids=[1])
    msg = FakeMessage(
        "MUX_FALLBACK",
        0x500,
        signals=[mux, d1],
        senders=["CTRL"],
        raise_on_encode_scaling=True,
        raise_on_encode_plain=False,
    )
    db = FakeDatabase([msg])
    fake = FakeCantoolsModule(db)
    monkeypatch.setattr(can_db, "cantools", fake)
    cdb = can_db.CanDb("dummy.dbc")
    cdb.set_tx_signal("MUX", 1)
    cdb.set_tx_signal("D1", 7)
    frames = cdb.encode_tx()
    assert len(frames) == 1

    # Scaling + plain encode both fail -> bit-encode fallback.
    msg2 = FakeMessage(
        "MUX_BIT",
        0x501,
        signals=[mux, d1],
        senders=["CTRL"],
        raise_on_encode_scaling=True,
        raise_on_encode_plain=True,
    )
    db2 = FakeDatabase([msg2])
    fake2 = FakeCantoolsModule(db2)
    monkeypatch.setattr(can_db, "cantools", fake2)
    cdb2 = can_db.CanDb("dummy.dbc")
    cdb2.set_tx_signal("MUX", 1)
    cdb2.set_tx_signal("D1", 7)
    frames2 = cdb2.encode_tx()
    assert len(frames2) == 1
