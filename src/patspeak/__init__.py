"""PATSpeak package.

PATSpeak is a small CAN-based test runner for `.pat` scripts.

The public entrypoint is the `pat` console command (see :mod:`patspeak.cli`).
"""

from __future__ import annotations

__all__ = [
    "__version__",
    "get_revision",
    "get_full_version",
]

# NOTE:
# Keep the human-facing package version in one obvious place.
# The git revision (commit hash) is resolved dynamically at runtime.
__version__ = "0.2.0"


# Convenience re-exports.
from .revision import get_full_version, get_revision  # noqa: E402
