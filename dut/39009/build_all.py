#!/usr/bin/env python3
"""Compatibility wrapper.

The original repo had a copy of the generic generator-runner script in this
folder. It has been centralized to ``dut/build_all.py``.

This wrapper exists so older docs / bookmarks still work:

  python dut/43019-1/build_all.py --dir dut/43019-1
"""

from __future__ import annotations

import runpy
from pathlib import Path


def main() -> None:
    root_script = Path(__file__).resolve().parents[1] / "build_all.py"
    runpy.run_path(str(root_script), run_name="__main__")


if __name__ == "__main__":
    main()
