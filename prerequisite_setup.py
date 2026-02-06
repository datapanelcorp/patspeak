"""Install Python prerequisites for PATSpeak.

This script intentionally **does not** install vendor CAN drivers.

Why?
  - PATSpeak can run with different CAN interfaces (PCAN, Kvaser, SocketCAN, ...)
  - Installing Kvaser software when you're using a different interface is
    unnecessary and confusing.

What you still may need:
  - PCAN hardware: install PEAK "PCAN-Basic" (vendor driver)
  - Kvaser hardware on Windows: install Kvaser CANlib drivers
  - Linux SocketCAN: no vendor user-space libs required (drivers are usually in-kernel)
"""

import subprocess
import sys


def install(package: str) -> None:
    """Install a package using pip."""

    try:
        subprocess.check_call([sys.executable, "-m", "pip", "install", package])
        print(f"Successfully installed {package}")
    except subprocess.CalledProcessError:
        print(f"Failed to install {package}")


# Core Python deps:
#  - python-can: CAN interface layer
#  - cantools: DBC parsing/encoding/decoding (replaces kvadblib)
#  - keyboard: existing UI behavior (optional; kept for compatibility)
packages = ["python-can", "cantools", "keyboard"]

for package in packages:
    install(package)

print(
    "\nDone.\n\n"
    "Driver note:\n"
    "  - If you are using a Kvaser USBCan on Windows, you still need the Kvaser driver/CANlib install.\n"
    "  - If you are using PEAK PCAN hardware on Windows, install PCAN-Basic.\n"
    "  - On Linux, prefer SocketCAN (e.g. can0/can1).\n"
)
