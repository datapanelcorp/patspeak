from __future__ import annotations

from pathlib import Path

from patspeak.script import SaveData
import patspeak.runtime as rt


def test_save_data_writes_csv_and_clears_buffers(tmp_path):
    # Configure globals the way the runner does.
    rt.LogPath = str(tmp_path)
    rt.UnitName = "SN123"
    rt.RunStamp = "stamp"
    rt.FailCount = 0

    rt.AllCollectedData = "Step,Value\n1,42\n"
    rt.UUT_Results = {
        "00001-SigA-": 123,
        "00002-SigB-tag": 456,
    }

    SaveData()

    # File should have been created in LogPath.
    csv_path = Path(rt.LogPath) / f"{rt.UnitName}_{rt.RunStamp}.csv"
    assert csv_path.exists()
    assert csv_path.read_text(encoding="utf-8") == "Step,Value\n1,42\n"

    # Buffers should be reset.
    assert rt.AllCollectedData == ""
    assert rt.UUT_Results == {}
