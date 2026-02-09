from __future__ import annotations

import os

import pytest

from patspeak import can_db
from patspeak import preflight


class FakeCanDb:
    """Fake CanDb for suite_preflight tests.

    suite_preflight only needs:
      - iter_signal_names()
      - has_tx_signal(signal)
    """

    created: list[str] = []
    signals_for: dict[str, set[str]] = {}
    tx_for: dict[str, set[str]] = {}
    raise_on_load: set[str] = set()
    raise_on_iter: set[str] = set()

    def __init__(self, *, dbc_filename: str):
        abs_path = os.path.abspath(dbc_filename)
        FakeCanDb.created.append(abs_path)
        base = os.path.basename(abs_path)
        if base in FakeCanDb.raise_on_load:
            raise RuntimeError(f"load failed for {base}")
        self._base = base
        self._signals = set(FakeCanDb.signals_for.get(base, set()))
        self._tx = set(FakeCanDb.tx_for.get(base, set()))

    def iter_signal_names(self):
        # Some tests want to simulate a transient failure (e.g. during the
        # duplicate-signal probe) without breaking the subsequent per-line
        # preflight.
        if self._base in FakeCanDb.raise_on_iter:
            FakeCanDb.raise_on_iter.discard(self._base)
            raise RuntimeError("iter failed")
        return sorted(self._signals)

    def has_tx_signal(self, sig: str) -> bool:
        return sig in self._tx


def _write_pat(path, *, uut_dbc: str | None, suppress_pat: bool = False, body: list[str] | None = None):
    lines: list[str] = []
    if uut_dbc is not None:
        lines.append(f"UUT_DBC = {uut_dbc}\n")
    if suppress_pat:
        lines.append("SUPPRESS_PAT_SUPPORT = True\n")
    lines.extend([(b + "\n") for b in (body or ["NULL:NULL"])])
    lines.append("END\n")
    path.write_text("".join(lines), encoding="utf-8")


@pytest.fixture(autouse=True)
def _reset_fake_can_db(monkeypatch):
    # Ensure a clean slate between tests.
    FakeCanDb.created = []
    FakeCanDb.signals_for = {}
    FakeCanDb.tx_for = {}
    FakeCanDb.raise_on_load = set()
    FakeCanDb.raise_on_iter = set()

    # Patch the class used by suite_preflight's lazy import.
    monkeypatch.setattr(can_db, "CanDb", FakeCanDb)
    yield


def test_suite_preflight_mode_off_and_empty_list(monkeypatch, tmp_path):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "off")
    assert preflight.suite_preflight([], dut_root=str(tmp_path), dbc_root=str(tmp_path)) is True


def test_suite_preflight_missing_test_file_is_hard_fail(monkeypatch, tmp_path):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")
    ok = preflight.suite_preflight(["does_not_exist.pat"], dut_root=str(tmp_path), dbc_root=str(tmp_path))
    assert ok is False


def test_suite_preflight_missing_uut_dbc_directive(monkeypatch, tmp_path):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")
    dbc_root = tmp_path / "dbc"
    dbc_root.mkdir()

    test_path = tmp_path / "t.pat"
    _write_pat(test_path, uut_dbc=None)

    ok = preflight.suite_preflight([str(test_path)], dut_root=str(tmp_path), dbc_root=str(dbc_root))
    assert ok is False


def test_suite_preflight_uut_dbc_missing(monkeypatch, tmp_path):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")
    dbc_root = tmp_path / "dbc"
    dbc_root.mkdir()

    test_path = tmp_path / "t.pat"
    _write_pat(test_path, uut_dbc="uut.dbc")

    ok = preflight.suite_preflight([str(test_path)], dut_root=str(tmp_path), dbc_root=str(dbc_root))
    assert ok is False


def test_suite_preflight_uut_dbc_load_failure(monkeypatch, tmp_path):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")
    dbc_root = tmp_path / "dbc"
    dbc_root.mkdir()

    # Create the file so isfile() passes, but force load failure.
    (dbc_root / "uut.dbc").write_text("x", encoding="utf-8")
    FakeCanDb.raise_on_load.add("uut.dbc")

    test_path = tmp_path / "t.pat"
    _write_pat(test_path, uut_dbc="uut.dbc")

    ok = preflight.suite_preflight([str(test_path)], dut_root=str(tmp_path), dbc_root=str(dbc_root))
    assert ok is False


def test_suite_preflight_pat_suppressed_pat_dbc_optional(monkeypatch, tmp_path):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")
    dbc_root = tmp_path / "dbc"
    dbc_root.mkdir()

    (dbc_root / "uut.dbc").write_text("x", encoding="utf-8")
    (dbc_root / "PAT.dbc").write_text("x", encoding="utf-8")
    # Simulate PAT.dbc load failing; suppressed mode should still continue.
    FakeCanDb.raise_on_load.add("PAT.dbc")

    test_path = tmp_path / "t.pat"
    _write_pat(test_path, uut_dbc="uut.dbc", suppress_pat=True)

    ok = preflight.suite_preflight([str(test_path)], dut_root=str(tmp_path), dbc_root=str(dbc_root))
    assert ok is True


def test_suite_preflight_pat_enabled_missing_pat_dbc(monkeypatch, tmp_path):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")
    dbc_root = tmp_path / "dbc"
    dbc_root.mkdir()
    (dbc_root / "uut.dbc").write_text("x", encoding="utf-8")

    test_path = tmp_path / "t.pat"
    _write_pat(test_path, uut_dbc="uut.dbc")

    ok = preflight.suite_preflight([str(test_path)], dut_root=str(tmp_path), dbc_root=str(dbc_root))
    assert ok is False


def test_suite_preflight_pat_enabled_pat_dbc_load_failure(monkeypatch, tmp_path):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")
    dbc_root = tmp_path / "dbc"
    dbc_root.mkdir()
    (dbc_root / "uut.dbc").write_text("x", encoding="utf-8")
    (dbc_root / "PAT.dbc").write_text("x", encoding="utf-8")
    FakeCanDb.raise_on_load.add("PAT.dbc")

    test_path = tmp_path / "t.pat"
    _write_pat(test_path, uut_dbc="uut.dbc")

    ok = preflight.suite_preflight([str(test_path)], dut_root=str(tmp_path), dbc_root=str(dbc_root))
    assert ok is False


def test_suite_preflight_duplicate_signal_detection(monkeypatch, tmp_path):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")
    dbc_root = tmp_path / "dbc"
    dbc_root.mkdir()
    (dbc_root / "uut.dbc").write_text("x", encoding="utf-8")
    (dbc_root / "PAT.dbc").write_text("x", encoding="utf-8")

    FakeCanDb.signals_for["uut.dbc"] = {"DUP"}
    FakeCanDb.signals_for["PAT.dbc"] = {"DUP"}

    test_path = tmp_path / "t.pat"
    _write_pat(test_path, uut_dbc="uut.dbc")

    ok = preflight.suite_preflight([str(test_path)], dut_root=str(tmp_path), dbc_root=str(dbc_root))
    assert ok is False


def test_suite_preflight_duplicate_detection_exception_path(monkeypatch, tmp_path):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")
    dbc_root = tmp_path / "dbc"
    dbc_root.mkdir()
    (dbc_root / "uut.dbc").write_text("x", encoding="utf-8")
    (dbc_root / "PAT.dbc").write_text("x", encoding="utf-8")

    FakeCanDb.raise_on_iter.add("PAT.dbc")

    test_path = tmp_path / "t.pat"
    _write_pat(test_path, uut_dbc="uut.dbc")

    # With iterator failures, dupes are treated as unknown and the run proceeds to run_preflight.
    ok = preflight.suite_preflight([str(test_path)], dut_root=str(tmp_path), dbc_root=str(dbc_root))
    assert ok is True


def test_suite_preflight_dbc_cache_hit(monkeypatch, tmp_path):
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")
    dbc_root = tmp_path / "dbc"
    dbc_root.mkdir()
    (dbc_root / "uut.dbc").write_text("x", encoding="utf-8")
    # Suppress PAT so PAT.dbc isn't required.
    (dbc_root / "PAT.dbc").write_text("x", encoding="utf-8")

    t1 = tmp_path / "t1.pat"
    t2 = tmp_path / "t2.pat"
    _write_pat(t1, uut_dbc="uut.dbc", suppress_pat=True)
    _write_pat(t2, uut_dbc="uut.dbc", suppress_pat=True)

    ok = preflight.suite_preflight([str(t1), str(t2)], dut_root=str(tmp_path), dbc_root=str(dbc_root))
    assert ok is True

    # Only one load for the shared UUT DBC thanks to caching.
    loads = [p for p in FakeCanDb.created if p.endswith(os.sep + "uut.dbc")]
    assert len(loads) == 1


def test_suite_preflight_non_hard_fail_returns_false(monkeypatch, tmp_path):
    # Mode error: step issues (errors) make suite_ok false, but not hard_fail.
    monkeypatch.setenv("PATSPEAK_PREFLIGHT_MODE", "error")
    dbc_root = tmp_path / "dbc"
    dbc_root.mkdir()
    (dbc_root / "uut.dbc").write_text("x", encoding="utf-8")
    (dbc_root / "PAT.dbc").write_text("x", encoding="utf-8")

    # UUT has no signals, but the script references one -> run_preflight will return False due to errors.
    test_path = tmp_path / "t.pat"
    _write_pat(test_path, uut_dbc="uut.dbc", body=["NULL:UNKNOWN=1|0|0"])

    ok = preflight.suite_preflight([str(test_path)], dut_root=str(tmp_path), dbc_root=str(dbc_root))
    assert ok is False
