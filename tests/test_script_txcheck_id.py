from __future__ import annotations

import threading
import time

import patspeak.runtime as rt
from patspeak.script import CheckUUTTxNoTrafficById, CheckUUTTxTrafficById


def test_check_uut_tx_traffic_by_id_passes_when_new_frame_arrives():
    target = 0x98FF15D9 & 0x1FFFFFFF
    rt.UUT_TxSeenCountById = {target: 0}

    def _emit_once() -> None:
        time.sleep(0.02)
        rt.UUT_TxSeenCountById[target] = rt.UUT_TxSeenCountById.get(target, 0) + 1

    t = threading.Thread(target=_emit_once, daemon=True)
    t.start()

    ok, delta = CheckUUTTxTrafficById(target, timeout_s=0.25)

    t.join(timeout=0.2)
    assert ok is True
    assert delta >= 1


def test_check_uut_tx_no_traffic_by_id_passes_when_id_is_silent():
    target = 0x98FF16D9 & 0x1FFFFFFF
    rt.UUT_TxSeenCountById = {target: 3}

    ok, delta = CheckUUTTxNoTrafficById(target, timeout_s=0.05)

    assert ok is True
    assert delta == 0


def test_check_uut_tx_no_traffic_by_id_fails_when_new_frame_arrives():
    target = 0x98FF17D9 & 0x1FFFFFFF
    rt.UUT_TxSeenCountById = {target: 1}

    def _emit_once() -> None:
        time.sleep(0.02)
        rt.UUT_TxSeenCountById[target] = rt.UUT_TxSeenCountById.get(target, 0) + 1

    t = threading.Thread(target=_emit_once, daemon=True)
    t.start()

    ok, delta = CheckUUTTxNoTrafficById(target, timeout_s=0.25)

    t.join(timeout=0.2)
    assert ok is False
    assert delta >= 1
