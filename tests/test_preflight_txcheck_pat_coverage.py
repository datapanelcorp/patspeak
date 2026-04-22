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


def test_preflight_allows_uut_txcheck_id_with_optional_timeout(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("UUT_TXCHECK_ID 0x98FF15D9 2.0"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is True


def test_preflight_allows_uut_txcheck_not_id_without_timeout(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("UUT_TXCHECK_NOT_ID 2566854105"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is True


def test_preflight_uut_txcheck_id_errors_on_missing_id(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("UUT_TXCHECK_ID"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_uut_txcheck_id_errors_on_bad_id(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("UUT_TXCHECK_ID not_a_number 1.0"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_uut_txcheck_not_id_errors_on_bad_timeout(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("UUT_TXCHECK_NOT_ID 0x98FF15D9 nope"),
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
            "uut_txcheck_id 0x98FF15D9 1.0",
            "uut_txcheck_not_id 0x98FF15D9 1.0",
        ),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_allows_send_can_step_hex_id_and_decimal_bytes(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("SEND_CAN CH0 0x18FED927 5 5 1 9 7 7 0 0"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is True


def test_preflight_allows_send_can_step_hex_bytes(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("SEND_CAN CH0 0x123 0x05 0x00 0xFF"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is True


def test_preflight_send_can_wrong_case_keyword_is_fatal(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("send_can CH0 0x123 1 2 3"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_send_can_error_on_bad_id(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("SEND_CAN CH0 not_a_number 1 2 3"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_send_can_error_on_bad_byte(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("SEND_CAN CH0 0x123 1 GG 3"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_send_can_error_on_too_many_bytes(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("SEND_CAN CH0 0x123 1 2 3 4 5 6 7 8 9"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_send_can_ch1_requires_pat_support(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())

    # With PAT support suppressed, CH1 should be rejected.
    ok = run_preflight(
        _lines("SEND_CAN CH1 0x123 1 2 3"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False

    # With PAT support active, CH1 should be allowed.
    pat_runtime = FakeDb(signals=set(), tx_signals=set())
    ok2 = run_preflight(
        _lines("SEND_CAN CH1 0x123 1 2 3"),
        uut_db=uut,
        pat_db_runtime=pat_runtime,
        pat_db_for_check=pat_runtime,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=True,
    )
    assert ok2 is True


def test_preflight_send_can_missing_required_fields(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("SEND_CAN"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_send_can_error_on_invalid_channel(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("SEND_CAN CH2 0x123 1"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_send_can_error_on_id_out_of_range(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("SEND_CAN CH0 0x20000000 1"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_send_can_error_on_byte_out_of_range(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines("SEND_CAN CH0 0x123 300"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False


def test_preflight_wrong_case_uut_data_directives_are_fatal(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines(
            "uut_dataname = Unit01",
            "suppress_pat_support = True",
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


def test_preflight_strict_mode_warn_only_aborts_suite_message(monkeypatch):
    # Keep this to warning-only (not errors) so strict-mode warning branch is exercised.
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "strict")

    uut = FakeDb(signals=set(), tx_signals=set())
    ok = run_preflight(
        _lines(
            "SUPPRESS_PAT_SUPPORT = maybe",  # WARN in all modes
            "NULL:NULL",
        ),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
        suite=True,
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
