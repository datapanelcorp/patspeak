"""pytest configuration for PATSpeak.

This repository is typically run directly from the repo root (it is not an
installed package). The runtime code imports modules like `support.script`
assuming the repo root is on `sys.path`.

These tests mirror that behavior by adding the repo root to `sys.path`.
"""

from __future__ import annotations

import os
import sys
from pathlib import Path


def pytest_sessionstart(session):  # noqa: ARG001
    repo_root = Path(__file__).resolve().parents[1]
    # Insert at the front so local modules win over any globally-installed ones.
    sys.path.insert(0, str(repo_root))

    # Keep console helpers deterministic unless a test explicitly overrides.
    os.environ.setdefault("PATSPEAK_COLOR", "never")
