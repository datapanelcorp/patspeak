import os
import sys
import types
from unittest.mock import MagicMock, patch
import pytest

from patspeak import revision, preflight, can_db

# -------------------------------------------------------------------------
# revision.py Coverage
# -------------------------------------------------------------------------

def test_revision_env_override(monkeypatch):
    """Cover lines 60-61: explicit PATSPEAK_REVISION env var."""
    monkeypatch.setenv("PATSPEAK_REVISION", "1234567890")
    revision.get_revision.cache_clear()
    
    assert revision.get_revision(short=True) == "1234567"
    assert revision.get_revision(short=False) == "1234567890"

def test_revision_generated_module(monkeypatch):
    """Cover lines 63-65: presence of patspeak._revision module."""
    # Mock patspeak._revision module
    mod = types.ModuleType("patspeak._revision")
    mod.GIT_SHA = "abcdef123456"
    monkeypatch.setitem(sys.modules, "patspeak._revision", mod)
    
    # Ensure env override doesn't interfere
    monkeypatch.delenv("PATSPEAK_REVISION", raising=False)
    monkeypatch.delenv("PATSPEAK_GIT_SHA", raising=False)
    
    revision.get_revision.cache_clear()
    assert revision.get_revision(short=True) == "abcdef1"

def test_revision_ci_fallback(monkeypatch):
    """Cover lines 129-135: CI env var fallback when not in git."""
    # Ensure no git root found
    monkeypatch.setattr(revision, "_find_repo_root", lambda x: None)
    # Ensure no env override or module
    monkeypatch.delenv("PATSPEAK_REVISION", raising=False)
    sys.modules.pop("patspeak._revision", None)
    
    # Set CI var
    monkeypatch.setenv("GITHUB_SHA", "ci123456789")
    
    revision.get_revision.cache_clear()
    assert revision.get_revision(short=True) == "ci12345"

# -------------------------------------------------------------------------
# preflight.py Coverage
# -------------------------------------------------------------------------

def test_preflight_strict_mode_and_syntax_edge_cases():
    """Cover lines 146, 195, 272, 284, etc: Strict mode and syntax checks."""
    lines = [
        "UUT_DBC = dummy.dbc",
        "UUT_DATANAME = dummy",
        "PAUSE-Test",       # Valid
        "UUT_DBC = t.dbc # comment", # Inline comment on directive (Warn -> Error in strict)
        "Signal = 1\t2",    # Tab char (Warn -> Error in strict)
        "Signal # comment", # Inline comment on step (Warn -> Error in strict)
        "END"
    ]
    
    with patch.dict(os.environ, {"PATSPEAK_PREFLIGHT_MODE": "strict"}):
        uut_db = MagicMock()
        uut_db.iter_signal_names.return_value = ["Signal"]
        
        # run_preflight returns False if strict mode catches warnings
        ret = preflight.run_preflight(
            lines,
            uut_db=uut_db,
            pat_db_runtime=None,
            pat_db_for_check=None,
            uut_dbc_name="uut",
            pat_dbc_name="pat",
            pat_support_active=False
        )
        assert ret is False

# -------------------------------------------------------------------------
# can_db.py Coverage
# -------------------------------------------------------------------------

def test_encode_tx_fallback_exception_handling():
    """Cover exception handlers in encode_tx that fallback to bit_encode."""
    with patch("cantools.database.load_file") as mock_load:
        # Setup a message that fails to encode via cantools
        msg = MagicMock()
        msg.name = "TestMsg"
        msg.senders = ["CTRL"]
        msg.signals = []
        msg.frame_id = 123
        msg.is_extended_frame = False
        
        # Make encode raise Exception twice (for scaling=True and scaling=False tries)
        msg.encode.side_effect = Exception("Encoding failed")
        
        db_mock = MagicMock()
        db_mock.messages = [msg]
        mock_load.return_value = db_mock
        
        db = can_db.CanDb("dummy.dbc")
        
        # This triggers the try...except...fallback logic
        frames = db.encode_tx()
        
        # Should have fallen back to _bit_encode_message (which returns empty bytes for 0 signals)
        assert len(frames) == 1
        assert frames[0].arbitration_id == 123

def test_decode_fallback_exception_handling():
    """Cover exception handler in decode that fallbacks to bit_decode."""
    with patch("cantools.database.load_file") as mock_load:
        msg = MagicMock()
        msg.name = "TestMsg"
        msg.frame_id = 0x123
        msg.signals = []
        
        # Make decode raise Exception
        msg.decode.side_effect = Exception("Decoding failed")
        
        db_mock = MagicMock()
        db_mock.messages = [msg]
        mock_load.return_value = db_mock
        
        db = can_db.CanDb("dummy.dbc")
        
        # This triggers the try...except...fallback logic in decode()
        res = db.decode(0x123, b'\x00\x00')
        
        # Should return None (empty dict from bit_decode) rather than raising
        assert res is None