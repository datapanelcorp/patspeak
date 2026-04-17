from __future__ import annotations

import patspeak.can as can_mod


def _clear_can_env(monkeypatch) -> None:
    monkeypatch.delenv("PATSPEAK_CAN_INTERFACE", raising=False)
    monkeypatch.delenv("PATSPEAK_CAN_CH0", raising=False)
    monkeypatch.delenv("PATSPEAK_CAN_CH1", raising=False)
    monkeypatch.delenv("PATSPEAK_CAN_BITRATE", raising=False)


def _reset_runtime(monkeypatch, *, need_pat_channel: bool) -> None:
    monkeypatch.setattr(can_mod.rt, "CAN_INTERFACE", "auto", raising=False)
    monkeypatch.setattr(can_mod.rt, "CAN_CHANNELS", None, raising=False)
    monkeypatch.setattr(can_mod.rt, "CAN_BITRATE", 250000, raising=False)
    monkeypatch.setattr(
        can_mod.rt,
        "SuppressPatSupport",
        "False" if need_pat_channel else "True",
        raising=False,
    )
    monkeypatch.setattr(can_mod.rt, "FORCE_SUPPRESS_PAT_SUPPORT", False, raising=False)
    monkeypatch.setattr(can_mod.rt, "PAT_Fdbk", {}, raising=False)
    monkeypatch.setattr(can_mod.rt, "pat_db", object(), raising=False)


def test_windows_auto_prefers_kvaser_for_pat_dual_channel(monkeypatch):
    _clear_can_env(monkeypatch)
    _reset_runtime(monkeypatch, need_pat_channel=True)
    monkeypatch.setattr(can_mod.os, "name", "nt", raising=False)
    monkeypatch.setattr(can_mod, "can", object(), raising=False)

    openable = {
        ("kvaser", 0): True,
        ("kvaser", 1): True,
        ("pcan", "PCAN_USBBUS1"): True,
        ("pcan", "PCAN_USBBUS2"): False,
        ("socketcan", "can0"): False,
        ("socketcan", "can1"): False,
    }

    monkeypatch.setattr(
        can_mod,
        "_try_open",
        lambda interface, channel, bitrate: openable.get((interface, channel), False),
    )

    can_mod.autodetect_can_backend()

    assert can_mod.rt.CAN_INTERFACE == "kvaser"
    assert can_mod.rt.CAN_CHANNELS == [0, 1]
    assert can_mod.rt.SuppressPatSupport == "False"


def test_windows_auto_prefers_kvaser_when_pat_is_suppressed(monkeypatch):
    _clear_can_env(monkeypatch)
    _reset_runtime(monkeypatch, need_pat_channel=False)
    monkeypatch.setattr(can_mod.os, "name", "nt", raising=False)
    monkeypatch.setattr(can_mod, "can", object(), raising=False)

    openable = {
        ("kvaser", 0): True,
        ("pcan", "PCAN_USBBUS1"): True,
    }

    monkeypatch.setattr(
        can_mod,
        "_try_open",
        lambda interface, channel, bitrate: openable.get((interface, channel), False),
    )

    can_mod.autodetect_can_backend()

    assert can_mod.rt.CAN_INTERFACE == "kvaser"
    assert can_mod.rt.CAN_CHANNELS == [0]
