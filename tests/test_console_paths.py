from __future__ import annotations

import os

import pytest

from patspeak import console


def test_safe_filename_component_strips_separators_and_forbidden_chars():
    # Includes path separators and Windows-forbidden characters.
    raw = r"..\\dut/43019:1?*<>|\".pat"
    out = console._safe_filename_component(raw, default="x")

    # Should not contain any directory separators.
    assert "/" not in out
    assert "\\" not in out

    # Should not contain characters that are forbidden on Windows.
    for ch in '<>:"/\\|?*':
        assert ch not in out

    # Should not be empty.
    assert out


@pytest.mark.parametrize(
    "test_file, expected",
    [
        ("RESET.pat", "RESET"),
        ("43019/43019-1-INPUT-420MA.pat", "43019-1-INPUT-420MA"),
        # Cross-platform note:
        #   - On Windows, backslashes are path separators -> basename is "foo.pat".
        #   - On POSIX, backslashes are regular characters -> basename is the full string,
        #     and the sanitizer turns backslashes into "_".
        (r"C:\\dut\\43019\\foo.pat", "foo" if os.name == "nt" else "C_dut_43019_foo"),
    ],
)
def test_safe_test_id_uses_basename_stem(test_file: str, expected: str):
    assert console.safe_test_id(test_file) == expected


def test_make_log_path_dedups_unit_name_matching_test_name(tmp_path):
    log_dir = tmp_path

    # UnitName matches test stem -> should not duplicate.
    p = console.make_log_path(str(log_dir), unit_name="RESET", test_file="dut/RESET.pat")
    assert os.path.basename(p) == "RESET.log"

    # When different -> should prefix with UnitName.
    p2 = console.make_log_path(str(log_dir), unit_name="SN123", test_file="dut/RESET.pat")
    assert os.path.basename(p2) == "SN123_RESET.log"


def test_make_log_path_appends_run_stamp(tmp_path):
    p = console.make_log_path(
        str(tmp_path), unit_name="SN123", test_file="dut/RESET.pat", run_stamp="20260206-201122-123"
    )
    assert os.path.basename(p) == "SN123_RESET_20260206-201122-123.log"


def test_make_csv_path_defaults_and_run_stamp(tmp_path):
    p = console.make_csv_path(str(tmp_path), unit_name="", run_stamp=None)
    assert os.path.basename(p) == "untitled.csv"

    p2 = console.make_csv_path(str(tmp_path), unit_name="SN123", run_stamp="abc")
    assert os.path.basename(p2) == "SN123_abc.csv"


def test_colorize_status_line_respects_force_mode(monkeypatch):
    # Force colors on even when not a TTY.
    monkeypatch.setenv("PATSPEAK_COLOR", "always")

    # Reset module cache.
    monkeypatch.setattr(console, "_COLOR_ENABLED", None)

    line = "00001 PASS: Signal 1"
    out = console.colorize_status_line(line)

    # In forced mode, should include ANSI escapes.
    assert "\x1b[" in out
    assert out != line
    # The literal text is still present (wrapped in escapes) and should appear once.
    assert out.count("PASS:") == 1
