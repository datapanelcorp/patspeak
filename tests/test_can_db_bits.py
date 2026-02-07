from __future__ import annotations

from types import SimpleNamespace

import pytest

from support import can_db


def test_dbc_to_arbitration_id_strips_extended_flag():
    # When bit31 is set, arbitration id on the wire is only 29 bits.
    fid = can_db.EXTENDED_ID_FLAG | 0x1ABCDE
    assert can_db._dbc_to_arbitration_id(fid) == (0x1ABCDE & can_db.EXTENDED_ID_MASK)

    # Standard ids should be unchanged.
    assert can_db._dbc_to_arbitration_id(0x123) == 0x123


def test_candidate_dbc_frame_ids_covers_plain_and_flagged_ids():
    arb = 0x1ABCDE
    cands = can_db._candidate_dbc_frame_ids(arb)

    # Should include the provided value and its flagged representation.
    assert arb in cands
    assert (arb | can_db.EXTENDED_ID_FLAG) in cands

    # All entries should be unique while preserving order.
    assert len(cands) == len(set(cands))


def test_iter_signal_bit_positions_little_endian_is_contiguous():
    sig = SimpleNamespace(start=0, length=5, byte_order="little_endian")
    assert list(can_db._iter_signal_bit_positions(sig)) == [0, 1, 2, 3, 4]


def test_iter_signal_bit_positions_big_endian_walks_motorola_order():
    # start=7 length=8 should cover bits 7..0 in the same byte.
    sig = SimpleNamespace(start=7, length=8, byte_order="big_endian")
    assert list(can_db._iter_signal_bit_positions(sig)) == [7, 6, 5, 4, 3, 2, 1, 0]


@pytest.mark.parametrize(
    "sig, raw_value, expected_first_byte",
    [
        (SimpleNamespace(start=0, length=3, byte_order="little_endian", is_signed=False), 0b101, 0x05),
        (SimpleNamespace(start=7, length=3, byte_order="big_endian", is_signed=False), 0b101, 0xA0),
    ],
)
def test_patch_and_extract_roundtrip_unsigned(sig, raw_value, expected_first_byte):
    payload = bytearray(8)
    can_db._patch_signal_raw_into(payload, sig, raw_value)
    assert payload[0] == expected_first_byte

    extracted = can_db._extract_signal_raw_from(bytes(payload), sig)
    assert extracted == raw_value


def test_patch_and_extract_roundtrip_signed_negative_value():
    # 4-bit signed little endian: 0b1111 is -1.
    sig = SimpleNamespace(start=0, length=4, byte_order="little_endian", is_signed=True)
    payload = bytearray(8)

    can_db._patch_signal_raw_into(payload, sig, -1)
    assert payload[0] & 0x0F == 0x0F

    extracted = can_db._extract_signal_raw_from(bytes(payload), sig)
    assert extracted == -1
