from __future__ import annotations

from pathlib import Path

from support.script import SaveData
import support.globals as globals


def test_save_data_writes_csv_and_clears_buffers(tmp_path):
    # Configure globals the way the runner does.
    globals.LogPath = str(tmp_path)
    globals.UnitName = "SN123"
    globals.RunStamp = "stamp"
    globals.FailCount = 0

    globals.AllCollectedData = "Step,Value\n1,42\n"
    globals.UUT_Results = {
        "00001-SigA-": 123,
        "00002-SigB-tag": 456,
    }

    SaveData()

    # File should have been created in LogPath.
    csv_path = Path(globals.LogPath) / f"{globals.UnitName}_{globals.RunStamp}.csv"
    assert csv_path.exists()
    assert csv_path.read_text(encoding="utf-8") == "Step,Value\n1,42\n"

    # Buffers should be reset.
    assert globals.AllCollectedData == ""
    assert globals.UUT_Results == {}
