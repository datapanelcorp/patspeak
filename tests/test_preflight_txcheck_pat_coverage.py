from __future__ import annotations


import pytest

from patspeak.preflight import run_preflight


class FakeDb:
    """Minimal stand-in for patspeak.can_db.CanDb used by preflight."""

    def __init__(self, signals: set[str], tx_signals: set[str] | None = None):
        self._signals = set(signals)
        self._tx_signals = set(tx_signals or set())

    def iter_signal_names(self):
        return sorted(self._signals)

    def has_tx_signal(self, sig: str) -> bool:
        return sig in self._tx_signals


def _lines(*body: str) -> list[str]:
    return [
        "UUT_DBC = uut.dbc\n",
        *[b + "\n" for b in body],
        "END\n",
    ]


def test_preflight_allows_uut_txcheck_step(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("UUT_TXCHECK-2.0"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is True


def test_preflight_uut_txcheck_warn_on_unexpected_syntax(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    # Missing '-' or '=' separator becomes a warning (but should still allow execution in error mode).
    ok = run_preflight(
        _lines("UUT_TXCHECK 2.0"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is True


def test_preflight_uut_txcheck_error_on_non_numeric_timeout(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("UUT_TXCHECK-abc"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_pat_command_missing_script_name_is_error(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("PAT-"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_pat_command_with_script_is_ok(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("PAT my_script.py --arg 1"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is True


def test_preflight_skips_blank_and_comment_lines(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        [
            "UUT_DBC = uut.dbc\n",
            "\n",
            "# comment\n",
            "NULL:NULL\n",
            "END\n",
        ],
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is True


def test_preflight_case_sensitive_pat_and_uut_txcheck_keywords(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    # Wrong-case forms should be flagged as FATAL because the runtime parser is case-sensitive.
    ok = run_preflight(
        _lines(
            "pat-my_script.py",
            "uut_txcheck-1.0",
        ),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_strict_mode_warn_only_aborts(monkeypatch):
    # Some warnings are intentionally *not* auto-upgraded to ERROR in strict mode.
    # Strict mode should still abort if any warnings exist.
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "strict")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines(
            "SUPPRESS_PAT_SUPPORT = maybe",  # WARN (not a recognized boolean literal)
            "NULL:NULL",
        ),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_warn_mode_suite_true_prints_suite_message(monkeypatch):
    # In warn mode, errors do not abort. With suite=True, a slightly different
    # message path is taken.
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "warn")

    uut = FakeDb(signals={"KNOWN"}, tx_signals={"KNOWN"})
    ok = run_preflight(
        _lines("UNKNOWN=1:NULL"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
        suite=True,
    )
    assert ok is True


def test_preflight_resolve_db_pat_support_active_uut_and_pat(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals={"UUT_SIG"}, tx_signals={"UUT_SIG"})
    pat_runtime = FakeDb(signals={"PAT_SIG"}, tx_signals={"PAT_SIG"})

    ok = run_preflight(
        _lines("UUT_SIG=1:PAT_SIG=1|0|0"),
        uut_db=uut,
        pat_db_runtime=pat_runtime,
        pat_db_for_check=pat_runtime,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=True,
    )
    assert ok is True
