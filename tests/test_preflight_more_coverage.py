from __future__ import annotations

from dataclasses import dataclass

import pytest

from patspeak import preflight


class FakeDb:
    """Minimal stand-in for patspeak.can_db.CanDb used by preflight."""

    def __init__(self, signals: set[str], tx_signals: set[str] | None = None, *, raise_iter: bool = False):
        self._signals = set(signals)
        self._tx_signals = set(tx_signals or set())
        self._raise_iter = raise_iter

    def iter_signal_names(self):
        if self._raise_iter:
            raise RuntimeError("iter failed")
        return sorted(self._signals)

    def has_tx_signal(self, sig: str) -> bool:
        return sig in self._tx_signals


def _lines(*body: str) -> list[str]:
    return [
        "UUT_DBC = uut.dbc\n",
        *[b + "\n" for b in body],
        "END\n",
    ]


def test_env_mode_parsing(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "TRUE")
    assert preflight._env_mode() == "error"  # boolean-ish values map to default

    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "weird")
    assert preflight._env_mode() == "error"

    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "warn")
    assert preflight._env_mode() == "warn"


def test_split_kv_and_closest_exception(monkeypatch):
    assert preflight._split_kv("NULL") == ("NULL", None)
    assert preflight._split_kv("A=1") == ("A", "1")

    # Force difflib.get_close_matches to throw.
    monkeypatch.setattr(preflight.difflib, "get_close_matches", lambda *a, **k: (_ for _ in ()).throw(RuntimeError()))
    assert preflight._closest("X", ["Y"]) == []


def test_print_issues_empty_and_truncation(monkeypatch, capsys):
    preflight._print_issues([])

    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MAX_ISSUES", "2")
    issues = [
        preflight.Issue("WARN", 1, None, "LINE", "S", "r", "l"),
        preflight.Issue("WARN", 2, None, "LINE", "S", "r", "l"),
        preflight.Issue("WARN", 3, None, "LINE", "S", "r", "l"),
    ]
    preflight._print_issues(issues)
    out = capsys.readouterr().out
    assert "more issue" in out


def test_run_preflight_ok_script_returns_true(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")

    uut = FakeDb(signals={"OUT", "IN"}, tx_signals={"OUT"})
    ok = preflight.run_preflight(
        _lines("OUT=1:IN=1|0|0"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is True


def test_run_preflight_warnings_only_in_error_mode_continue_with_suite_message(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")
    uut = FakeDb(signals={"OUT_NOT_TX"}, tx_signals=set())
    ok = preflight.run_preflight(
        _lines("OUT_NOT_TX=1:NULL"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
        suite=True,
    )
    assert ok is True


def test_run_preflight_warn_mode_continues_even_with_errors(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "warn")
    uut = FakeDb(signals={"KNOWN"}, tx_signals={"KNOWN"})
    ok = preflight.run_preflight(
        _lines("KNOWN=1:UNKNOWN=1|0|0"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is True


def test_run_preflight_error_mode_errors_abort_suite_msg(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")
    uut = FakeDb(signals={"KNOWN"}, tx_signals={"KNOWN"})
    ok = preflight.run_preflight(
        _lines("NULL:UNKNOWN=1|0|0"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
        suite=True,
    )
    assert ok is False


def test_run_preflight_strict_mode_treats_warnings_as_fatal(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "strict")
    uut = FakeDb(signals={"OUT_NOT_TX"}, tx_signals=set())
    ok = preflight.run_preflight(
        _lines("OUT_NOT_TX=1:NULL"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
        suite=True,
    )
    assert ok is False


def test_run_preflight_fatal_suite_message(monkeypatch):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")
    uut = FakeDb(signals={"A"}, tx_signals={"A"})

    # Malformed step line triggers a FATAL.
    lines = ["UUT_DBC = uut.dbc\n", "A=1\n", "END\n"]
    ok = preflight.run_preflight(
        lines,
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=None,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
        suite=True,
    )
    assert ok is False


def test_run_preflight_resolve_db_pat_support_active_runtime_missing(monkeypatch):
    """Cover the edge case where pat_support_active is True but runtime DB isn't loaded."""

    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")
    uut = FakeDb(signals=set(), tx_signals=set())
    pat_for_check = FakeDb(signals={"PAT_SIG"}, tx_signals={"PAT_SIG"})

    ok = preflight.run_preflight(
        _lines("PAT_SIG=1:PAT_SIG=1|0|0"),
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=pat_for_check,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=True,
    )
    assert ok is True


def test_run_preflight_exercises_many_syntax_branches(monkeypatch):
    """Single run that hits a broad set of parsing branches."""

    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")
    uut = FakeDb(signals={"KNOWN", "OUT_NOT_TX"}, tx_signals={"KNOWN"})
    pat = FakeDb(signals={"PAT_ONLY"}, tx_signals={"PAT_ONLY"})

    lines = [
        # directive case / syntax
        "uut_dbc = uut.dbc\n",  # wrong case -> FATAL
        "UUT_DBC uut.dbc\n",  # missing '=' -> FATAL
        "UUT_DBC = \n",  # empty value -> FATAL
        "UUT_DBC = uut.txt\n",  # warn about extension
        "UUT_DBC = uut.dbc#comment\n",  # inline comment warn
        "SUPPRESS_PAT_SUPPORT = maybe\n",  # boolish warn

        # control keywords
        "pause-Hi\n",  # wrong case -> FATAL
        "PAUSE\n",  # missing '-' -> FATAL
        "PAUSE-\n",  # empty prompt -> FATAL

        # step line issues
        "KNOWN=1\t:NULL\n",  # tab warn
        "KNOWN=1:NULL#inline\n",  # inline comment warn
        "KNOWN=1\n",  # malformed step line -> FATAL
        "NULL:NULL:FLAG:EXTRA\n",  # too many ':' sections -> ERROR
        ":NULL\n",  # empty outs -> FATAL
        "NULL:\n",  # empty ins -> FATAL
        "KNOWN=1,,OUT_NOT_TX=1:NULL\n",  # empty out token -> FATAL
        "KNOWN=1=2:NULL\n",  # multiple '=' -> WARN
        "KNOWN:NULL\n",  # missing '=value' -> FATAL
        "KNOWN=:NULL\n",  # empty out value -> ERROR
        "KNOWN=hi:NULL\n",  # non-numeric out -> WARN
        "UNKN=1:NULL\n",  # unknown out signal -> ERROR (+hint)
        "PAT_ONLY=1:NULL\n",  # pat suppressed error

        # input issues
        "NULL:,,KNOWN=1|0|0\n",  # empty input token -> FATAL
        "NULL:KNOWN=1|0|0=extra\n",  # multiple '=' -> WARN
        "NULL:KNOWN\n",  # missing '=...' -> FATAL
        "NULL:KNOWN=\n",  # empty input value -> FATAL
        "NULL:KNOWN=1|0\n",  # wrong format -> FATAL
        "NULL:KNOWN=1|bad|0\n",  # non-numeric parts -> FATAL
        "NULL:UNKN=1|0|0\n",  # unknown input signal -> ERROR (+hint)
        "NULL:PAT_ONLY=1|0|0\n",  # pat suppressed input

        # flags issues
        "NULL:NULL:\n",  # empty flags section -> WARN
        "NULL:NULL:,\n",  # empty flag token -> WARN
        "NULL:NULL:TIMEOUT\n",  # missing flag value -> FATAL
        "NULL:NULL:TIMEOUT=\n",  # empty flag value -> FATAL
        "NULL:NULL:TIMEOUT=abc\n",  # non-numeric flag -> FATAL
        "NULL:NULL:BOGUS=1\n",  # unknown flag -> WARN

        "END\n",
    ]

    ok = preflight.run_preflight(
        lines,
        uut_db=uut,
        pat_db_runtime=None,
        pat_db_for_check=pat,
        uut_dbc_name="uut.dbc",
        pat_dbc_name="PAT.dbc",
        pat_support_active=False,
    )
    assert ok is False
