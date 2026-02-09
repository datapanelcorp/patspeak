from __future__ import annotations

import os
from pathlib import Path

import pytest

import patspeak.cli as pat


def _write(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text, encoding="utf-8")


def test_normalize_selector_strips_dut_prefix_and_normalizes_separators(monkeypatch):
    # Use platform-agnostic assertions: result uses os.sep.
    sel = pat._normalize_selector("dut\\43019/43019-1-INPUT-420MA.pat")
    assert sel.endswith(os.path.join("43019", "43019-1-INPUT-420MA.pat"))


def test_discover_tests_file_and_directory(monkeypatch, tmp_path):
    # Build a fake repo layout:
    #   <tmp>/dut/RESET.pat
    #   <tmp>/dut/43019/a.pat
    #   <tmp>/dut/43019/b.PAT
    #   <tmp>/dut/43019/pat_start.pat        (suite hook)
    #   <tmp>/dut/43019/pat_transition.pat   (suite hook)
    #   <tmp>/dut/43019/pat_end.pat          (suite hook)
    dut_root = tmp_path / "dut"
    _write(dut_root / "RESET.pat", "UUT_DBC = foo.dbc\nEND\n")

    _write(dut_root / "43019" / "b.PAT", "UUT_DBC = foo.dbc\nEND\n")
    _write(dut_root / "43019" / "a.pat", "UUT_DBC = foo.dbc\nEND\n")
    _write(dut_root / "43019" / "pat_start.pat", "UUT_DBC = foo.dbc\nEND\n")
    _write(dut_root / "43019" / "pat_transition.pat", "UUT_DBC = foo.dbc\nEND\n")
    _write(dut_root / "43019" / "pat_end.pat", "UUT_DBC = foo.dbc\nEND\n")

    monkeypatch.setattr(pat, "_dut_root", lambda: str(dut_root))

    # File selector.
    assert pat.discover_tests("RESET.pat") == ["RESET.pat"]
    assert pat.discover_tests("dut/RESET.pat") == ["RESET.pat"]

    # Without extension.
    assert pat.discover_tests("RESET") == ["RESET.pat"]

    # Directory selector: should return all .pat files in that folder,
    # sorted case-insensitively, excluding reserved hook scripts.
    out = pat.discover_tests("43019")
    assert out == [os.path.join("43019", "a.pat"), os.path.join("43019", "b.PAT")]

    # But hook files are still runnable when explicitly selected.
    assert pat.discover_tests(os.path.join("43019", "pat_transition.pat")) == [
        os.path.join("43019", "pat_transition.pat")
    ]


@pytest.mark.parametrize(
    "line, expected",
    [
        ("SUPPRESS_PAT_SUPPORT = True", False),
        ("SUPPRESS_PAT_SUPPORT = 1", False),
        ("SUPPRESS_PAT_SUPPORT = yes", False),
        ("SUPPRESS_PAT_SUPPORT = on", False),
        ("SUPPRESS_PAT_SUPPORT = False", True),
        ("#SUPPRESS_PAT_SUPPORT = True", True),
        ("", True),
    ],
)
def test_test_uses_pat_support(monkeypatch, tmp_path, line: str, expected: bool):
    dut_root = tmp_path / "dut"
    content = "UUT_DBC = foo.dbc\n"
    if line:
        content += line + "\n"
    content += "END\n"

    p = dut_root / "X.pat"
    _write(p, content)

    monkeypatch.setattr(pat, "_dut_root", lambda: str(dut_root))

    assert pat.test_uses_pat_support("X.pat") is expected


def test_test_uses_pat_support_unreadable_file_defaults_true(monkeypatch, tmp_path):
    dut_root = tmp_path / "dut"
    p = dut_root / "X.pat"
    _write(p, "UUT_DBC = foo.dbc\nEND\n")
    # Remove permissions so open() fails on Unix.
    p.chmod(0)

    monkeypatch.setattr(pat, "_dut_root", lambda: str(dut_root))

    try:
        assert pat.test_uses_pat_support("X.pat") is True
    finally:
        # Restore permissions so tmp cleanup can remove the file.
        p.chmod(0o600)
