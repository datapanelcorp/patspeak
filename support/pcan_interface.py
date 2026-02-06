"""Backward compatible wrapper.

Historically PATSpeak selected between:
  - support.pcan_interface (python-can for PCAN hardware)
  - support.can (Kvaser canlib/kvadblib)

The project now uses a single python-can implementation for *all* interfaces
and no longer needs Kvaser libraries for DBC work.

This file remains so older scripts/imports keep working.
"""

from support.can import CANThread  # noqa: F401
