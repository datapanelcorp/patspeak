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

Tip:
  For repeatable installs, prefer:
    python -m pip install -r requirements.txt
  or use the helper scripts in scripts/.
"""

from __future__ import annotations

import subprocess
import sys
from pathlib import Path


def pip_install(*args: str) -> None:
    """Run `pip install ...` using the current interpreter."""

    subprocess.check_call([sys.executable, "-m", "pip", "install", *args])


def main() -> int:
    repo_root = Path(__file__).resolve().parent
    req = repo_root / "requirements.txt"

    try:
        # Keep pip itself current (helps avoid TLS/resolution issues on older machines).
        pip_install("--upgrade", "pip")

        if req.exists():
            print(f"Installing runtime requirements from: {req}")
            pip_install("-r", str(req))
        else:
            # Fallback for unusual checkouts.
            print("requirements.txt not found; installing minimal runtime packages...")
            for pkg in ["python-can", "cantools", "keyboard", "colorama"]:
                pip_install(pkg)

        print(
            "\nDone.\n\n"
            "Driver note:\n"
            "  - If you are using a Kvaser USBCan on Windows, you still need the Kvaser driver/CANlib install.\n"
            "  - If you are using PEAK PCAN hardware on Windows, install PCAN-Basic.\n"
            "  - On Linux, prefer SocketCAN (e.g. can0/can1).\n"
        )
        return 0

    except subprocess.CalledProcessError as e:
        print(f"ERROR: pip install failed (exit {e.returncode}).")
        return e.returncode


if __name__ == "__main__":
    raise SystemExit(main())
