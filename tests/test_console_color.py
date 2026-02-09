from __future__ import annotations

import sys
from types import SimpleNamespace

import pytest

from patspeak import console


class _FakeStdout:
    def __init__(self, is_tty: bool):
        self._is_tty = is_tty

    def isatty(self) -> bool:  # pragma: no cover - tiny helper
        return self._is_tty


def _reset_color_cache(monkeypatch) -> None:
    monkeypatch.setattr(console, "_COLOR_ENABLED", None)


def test_color_enabled_uses_cached_value(monkeypatch):
    monkeypatch.setattr(console, "_COLOR_ENABLED", True)
    assert console.color_enabled() is True


def test_color_enabled_respects_no_color(monkeypatch):
    _reset_color_cache(monkeypatch)
    monkeypatch.setenv("NO_COLOR", "1")
    assert console.color_enabled() is False


def test_color_enabled_never_mode(monkeypatch):
    _reset_color_cache(monkeypatch)
    monkeypatch.delenv("NO_COLOR", raising=False)
    monkeypatch.setenv("PATSPEAK_COLOR", "never")
    assert console.color_enabled() is False


def test_color_enabled_auto_disables_when_not_tty(monkeypatch):
    _reset_color_cache(monkeypatch)
    monkeypatch.delenv("NO_COLOR", raising=False)
    monkeypatch.setenv("PATSPEAK_COLOR", "auto")
    monkeypatch.setattr(console.sys, "stdout", _FakeStdout(is_tty=False))
    assert console.color_enabled() is False


def test_color_enabled_force_allows_when_not_tty(monkeypatch):
    _reset_color_cache(monkeypatch)
    monkeypatch.delenv("NO_COLOR", raising=False)
    monkeypatch.setenv("PATSPEAK_COLOR", "always")
    monkeypatch.setattr(console.sys, "stdout", _FakeStdout(is_tty=False))
    assert console.color_enabled() is True


def test_color_enabled_windows_disable_when_ansi_unavailable_and_not_forced(monkeypatch):
    _reset_color_cache(monkeypatch)
    monkeypatch.delenv("NO_COLOR", raising=False)
    monkeypatch.setenv("PATSPEAK_COLOR", "auto")
    monkeypatch.setattr(console.sys, "stdout", _FakeStdout(is_tty=True))

    # Simulate Windows and a failure to enable ANSI.
    monkeypatch.setattr(console.os, "name", "nt", raising=False)
    monkeypatch.setattr(console, "_enable_windows_ansi", lambda: False)

    assert console.color_enabled() is False


def test_style_returns_text_when_disabled(monkeypatch):
    _reset_color_cache(monkeypatch)
    monkeypatch.setenv("PATSPEAK_COLOR", "never")
    assert console.style("hello", fg="red", bold=True) == "hello"


def test_style_returns_text_when_no_codes(monkeypatch):
    _reset_color_cache(monkeypatch)
    monkeypatch.setenv("PATSPEAK_COLOR", "always")
    monkeypatch.setattr(console.sys, "stdout", _FakeStdout(is_tty=True))
    # No bold/dim/fg -> codes empty -> unchanged
    assert console.style("hello") == "hello"


def test_style_wraps_escapes(monkeypatch):
    _reset_color_cache(monkeypatch)
    monkeypatch.setenv("PATSPEAK_COLOR", "always")
    monkeypatch.setattr(console.sys, "stdout", _FakeStdout(is_tty=True))
    out = console.style("hello", fg="green", bold=True, dim=True)
    assert out.startswith("\x1b[")
    assert out.endswith("\x1b[0m")
    assert "hello" in out


def test_colorize_status_line_disabled_returns_original(monkeypatch):
    _reset_color_cache(monkeypatch)
    monkeypatch.setenv("PATSPEAK_COLOR", "never")
    s = "00001 PASS: Something"
    assert console.colorize_status_line(s) == s


@pytest.mark.parametrize(
    "line, token",
    [
        ("00001 PASS: ok", "PASS:"),
        ("00002 FAIL: bad", "FAIL:"),
        ("00003 TEST: t", "TEST:"),
    ],
)
def test_colorize_status_line_keywords(monkeypatch, line: str, token: str):
    _reset_color_cache(monkeypatch)
    monkeypatch.setenv("PATSPEAK_COLOR", "always")
    monkeypatch.setattr(console.sys, "stdout", _FakeStdout(is_tty=True))

    out = console.colorize_status_line(line)
    assert "\x1b[" in out
    assert token in out


def test_colorize_status_line_unknown_token_unchanged(monkeypatch):
    _reset_color_cache(monkeypatch)
    monkeypatch.setenv("PATSPEAK_COLOR", "always")
    monkeypatch.setattr(console.sys, "stdout", _FakeStdout(is_tty=True))
    line = "00004 INFO: nothing"
    assert console.colorize_status_line(line) == line


def test_enable_windows_ansi_paths(monkeypatch):
    # Force the Windows code path regardless of host OS.
    monkeypatch.setattr(console.os, "name", "nt", raising=False)

    # --- ctypes success path ---
    class _Kernel32:
        def GetStdHandle(self, _h):
            return 1

        def GetConsoleMode(self, _handle, _mode_ptr):
            # Pretend we successfully got a mode.
            _mode_ptr._obj.value = 0
            return 1

        def SetConsoleMode(self, _handle, _new_mode):
            return 1

    class _FakeCtypes:
        windll = SimpleNamespace(kernel32=_Kernel32())

        class c_uint:
            def __init__(self):
                self.value = 0

        @staticmethod
        def byref(obj):
            return SimpleNamespace(_obj=obj)

    monkeypatch.setitem(sys.modules, "ctypes", _FakeCtypes)
    assert console._enable_windows_ansi() is True

    # --- ctypes fails, colorama succeeds ---
    class _BadCtypes:
        def __getattr__(self, _name):
            raise RuntimeError("boom")

    class _FakeColorama:
        called = False

        @staticmethod
        def just_fix_windows_console():
            _FakeColorama.called = True

    monkeypatch.setitem(sys.modules, "ctypes", _BadCtypes())
    monkeypatch.setitem(sys.modules, "colorama", _FakeColorama)
    assert console._enable_windows_ansi() is True
    assert _FakeColorama.called is True

    # --- both ctypes + colorama fail ---
    monkeypatch.setitem(sys.modules, "ctypes", _BadCtypes())
    # Force import to succeed but the call to fail (AttributeError), which is caught.
    monkeypatch.setitem(sys.modules, "colorama", None)
    assert console._enable_windows_ansi() is False


def test_enable_windows_ansi_non_windows_is_noop(monkeypatch):
    # On non-Windows platforms the helper is an immediate no-op success.
    monkeypatch.setattr(console.os, "name", "posix", raising=False)
    assert console._enable_windows_ansi() is True
