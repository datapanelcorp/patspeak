from __future__ import annotations

from dataclasses import dataclass

import pytest

from patspeak.preflight import run_preflight


class FakeDb:
    """Minimal stand-in for patspeak.can_db.CanDb used by preflight.

    The real CanDb provides:
      - iter_signal_names()
      - has_tx_signal(signal)

    Preflight also accepts *any* object for ... and only calls
    those two methods.
    """

    def __init__(self, signals: set[str], tx_signals: set[str] | None = None):
        self._signals = set(signals)
        self._tx_signals = set(tx_signals or set())

    def iter_signal_names(self):
        return sorted(self._signals)

    def has_tx_signal(self, sig: str) -> bool:
        return sig in self._tx_signals


def _ok_lines(*body: str) -> list[str]:
    """Build a minimal .pat file with required directive + END."""
    return [
        "UUT_DBC = something.dbc\n",
        *[b + "\n" for b in body],
        "END\n",
    ]


def test_preflight_missing_end_is_fatal(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals={"A"}, tx_signals={"A"})

    # No END anywhere.
    lines = ["UUT_DBC = something.dbc\n", "A=1:NULL\n"]

    ok = run_preflight(
        lines,
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="something.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_end_must_be_uppercase(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals={"A"}, tx_signals={"A"})
    lines = ["UUT_DBC = something.dbc\n", "A=1:NULL\n", "End\n"]

    ok = run_preflight(
        lines,
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="something.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_unknown_signal_is_error(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals={"Known"}, tx_signals={"Known"})
    lines = _ok_lines("Known=1:Unknown=0|0|0")

    ok = run_preflight(
        lines,
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="something.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_pat_signal_not_allowed_when_suppressed(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals={"UUT_SIG"}, tx_signals={"UUT_SIG"})
    pat = FakeDb(signals={"PAT_ONLY"}, tx_signals={"PAT_ONLY"})

    lines = _ok_lines("NULL:PAT_ONLY=0|0|0")

    ok = run_preflight(
        lines,
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=pat,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_warns_when_output_not_in_tx_messages_but_allows_in_error_mode(monkeypatch):
    # If a signal exists in the DBC but isn't part of any CTRL/TX message,
    # set_tx_signal() will be a no-op. Preflight reports this as a warning
    # (or error in strict mode).
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals={"OUT_NOT_TX"}, tx_signals=set())
    lines = _ok_lines("OUT_NOT_TX=1:NULL")

    ok = run_preflight(
        lines,
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is True


def test_preflight_treats_warnings_as_errors_in_strict_mode(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "strict")

    uut = FakeDb(signals={"OUT_NOT_TX"}, tx_signals=set())
    lines = _ok_lines("OUT_NOT_TX=1:NULL")

    ok = run_preflight(
        lines,
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_off_mode_skips_all_checks(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "off")

    uut = FakeDb(signals=set(), tx_signals=set())

    # Even a nonsense script should be allowed when mode=off.
    lines = ["this is not valid\n"]

    ok = run_preflight(
        lines,
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is True
