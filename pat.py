"""Compatibility entrypoint.

The canonical CLI is now installed as a console script:

  pat <selector>

This file is kept so older workflows that run:

  python pat.py <selector>

continue to work.
"""

from __future__ import annotations

from patspeak.cli import main


if __name__ == "__main__":
    raise SystemExit(main())
