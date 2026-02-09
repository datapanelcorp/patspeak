"""pytest configuration for PATSpeak.

The project uses a `src/` layout, so when running tests directly from a fresh
checkout/zip (without `pip install -e .`), we add `src/` to `sys.path`.

We also default console colors off so output comparisons stay deterministic.
"""

from __future__ import annotations

import os
import sys
from pathlib import Path


def pytest_sessionstart(session):  # noqa: ARG001
    repo_root = Path(__file__).resolve().parents[1]
    src = repo_root / "src"

    # Insert at the front so local modules win over any globally-installed ones.
    sys.path.insert(0, str(src))

    # Keep console helpers deterministic unless a test explicitly overrides.
    os.environ.setdefault("PATSPEAK_COLOR", "never")
