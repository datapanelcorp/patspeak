"""Compatibility wrapper.

Older PATSpeak revisions had a dedicated PCAN module.

The current implementation uses :mod:`python-can` for all interfaces, and
exposes the same `CANThread` symbol from :mod:`patspeak.can`.

This module exists so any legacy imports keep working.
"""

from __future__ import annotations

from .can import CANThread  # noqa: F401
