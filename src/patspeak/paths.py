"""Filesystem path discovery.

PATSpeak is typically used as a *workspace*:

- dbc/ contains DBC files
- dut/ contains test suites (.pat)

When installed in a virtualenv, the Python package lives in site-packages
(or in `src/` for editable installs), so using ``__file__`` to locate ``dbc/``
would be wrong.

This module discovers a "home" directory at runtime so the CLI works when:

- you run `pat` from the repo/workspace root
- you run `pat` from a subfolder inside the workspace
- you run `pat` from anywhere but set `PATSPEAK_HOME`

Environment overrides:
- PATSPEAK_HOME: workspace root
- PATSPEAK_DUT_DIR: path to the dut/ directory
- PATSPEAK_DBC_DIR: path to the dbc/ directory
"""

from __future__ import annotations

import os
from dataclasses import dataclass
from pathlib import Path


@dataclass(frozen=True)
class Paths:
    home: Path
    dut: Path
    dbc: Path


def _resolve_env_dir(var: str) -> Path | None:
    raw = os.environ.get(var)
    if not raw:
        return None
    p = Path(raw).expanduser().resolve()
    return p


def find_home(start: Path | None = None) -> Path:
    """Best-effort workspace root discovery."""

    # 1) Explicit override wins.
    home_env = _resolve_env_dir("PATSPEAK_HOME")
    if home_env is not None:
        return home_env

    # 2) Walk up from CWD looking for (dut/ and dbc/).
    start = (start or Path.cwd()).resolve()
    for p in [start, *start.parents]:
        if (p / "dut").is_dir() and (p / "dbc").is_dir():
            return p

    # 3) Editable installs: fall back to this file's ancestors.
    here = Path(__file__).resolve()
    for p in [here.parent, *here.parents]:
        if (p / "dut").is_dir() and (p / "dbc").is_dir():
            return p

    # 4) Give up. (The caller will still try to operate relative to CWD.)
    return start


def get_paths(start: Path | None = None) -> Paths:
    """Return resolved Paths for the current run."""

    home = find_home(start)

    dut_env = _resolve_env_dir("PATSPEAK_DUT_DIR")
    dbc_env = _resolve_env_dir("PATSPEAK_DBC_DIR")

    dut = dut_env if dut_env is not None else (home / "dut")
    dbc = dbc_env if dbc_env is not None else (home / "dbc")

    return Paths(home=home, dut=dut, dbc=dbc)
