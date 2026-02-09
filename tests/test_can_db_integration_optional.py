from __future__ import annotations

from pathlib import Path

import pytest


def test_can_db_loads_dbc_and_encodes_frames(tmp_path):
    # This is an *optional* integration test: it exercises the real cantools
    # encode/decode path. It is skipped unless cantools is installed.
    pytest.importorskip("cantools")

    from patspeak.can_db import CanDb

    repo_root = Path(__file__).resolve().parents[1]
    dbc_file = repo_root / "dbc" / "PAT.dbc"
    if not dbc_file.exists():
        pytest.skip("PAT.dbc not present in this checkout")

    db = CanDb(dbc_filename=str(dbc_file))

    # Basic sanity: should have at least some signals.
    all_signals = list(db.iter_signal_names())
    assert all_signals

    # If the DBC defines no CTRL/TX messages, encode_tx() will return nothing.
    # That would make this test meaningless, so skip.
    if not getattr(db, "tx_messages", None):
        pytest.skip("No CTRL/TX messages found in PAT.dbc")

    frames = db.encode_tx()
    assert frames, "Expected at least one TX frame from PAT.dbc"

    # Roundtrip one frame through decode (should return some signal values).
    f0 = frames[0]
    decoded = db.decode(f0.arbitration_id, f0.data)
    assert decoded is not None
    assert isinstance(decoded, dict)
    assert decoded  # at least one signal


def test_can_db_set_and_get_tx_signal_when_available():
    pytest.importorskip("cantools")

    from patspeak.can_db import CanDb

    repo_root = Path(__file__).resolve().parents[1]
    dbc_file = repo_root / "dbc" / "PAT.dbc"
    if not dbc_file.exists():
        pytest.skip("PAT.dbc not present in this checkout")

    db = CanDb(dbc_filename=str(dbc_file))

    # Pick any TX signal exposed by the DB.
    tx_signal_map = getattr(db, "_tx_signal_to_message_name", {})
    if not tx_signal_map:
        pytest.skip("No TX signals found in PAT.dbc")

    sig = sorted(tx_signal_map.keys())[0]
    assert db.has_tx_signal(sig)

    assert db.set_tx_signal(sig, 1) is True
    assert db.get_tx_signal(sig) == 1
