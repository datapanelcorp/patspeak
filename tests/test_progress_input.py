from __future__ import annotations

import builtins

from patspeak import progress


class _FakeTTY:
    def __init__(self) -> None:
        self.writes: list[str] = []

    def isatty(self) -> bool:  # pragma: no cover - tiny helper
        return True

    def write(self, s: str) -> int:  # pragma: no cover - tiny helper
        self.writes.append(str(s))
        return len(str(s))

    def flush(self) -> None:  # pragma: no cover - tiny helper
        return None

    def getvalue(self) -> str:
        return "".join(self.writes)


def test_wrapped_input_sticky_reanchors_cursor_and_pauses_ticker(monkeypatch):
    fake_out = _FakeTTY()
    fake_err = _FakeTTY()

    # Isolate module-global state for this test.
    monkeypatch.setattr(progress, "_STATE", progress._ProgressState())
    monkeypatch.setattr(progress.sys, "stdout", fake_out)
    monkeypatch.setattr(progress.sys, "stderr", fake_err)
    monkeypatch.setattr(progress, "_env_enabled", lambda: True)
    monkeypatch.setattr(progress, "_env_mode", lambda: "sticky")
    monkeypatch.setattr(progress, "_sticky_ansi_supported", lambda: True)
    monkeypatch.setattr(progress, "_term_size", lambda default_cols=120, default_rows=30: (120, 30))

    ticker_starts: list[str] = []
    ticker_stops: list[str] = []
    monkeypatch.setattr(progress, "_start_ticker", lambda: ticker_starts.append("start"))
    monkeypatch.setattr(progress, "_stop_ticker", lambda: ticker_stops.append("stop"))

    old_input = builtins.input
    had_saved_input = hasattr(builtins, "_patspeak_input")
    old_saved_input = getattr(builtins, "_patspeak_input", None)

    prompt_calls: list[str] = []

    try:
        if had_saved_input:
            delattr(builtins, "_patspeak_input")

        def _fake_input(prompt: str = "") -> str:
            prompt_calls.append(prompt)
            return ""

        monkeypatch.setattr(builtins, "input", _fake_input)

        progress.install()
        assert ticker_starts == ["start"]

        target_seq = "\x1b[29;1H"
        before = fake_out.getvalue().count(target_seq)

        # Calls the wrapped input installed by progress.install().
        builtins.input("Press Enter to continue...")

        after = fake_out.getvalue().count(target_seq)
        assert after == before + 1
        assert prompt_calls == ["Press Enter to continue..."]
        assert ticker_stops == ["stop"]
        assert ticker_starts == ["start", "start"]
    finally:
        builtins.input = old_input
        if had_saved_input:
            builtins._patspeak_input = old_saved_input  # type: ignore[attr-defined]
        elif hasattr(builtins, "_patspeak_input"):
            delattr(builtins, "_patspeak_input")
