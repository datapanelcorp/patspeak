"""Build/revision helpers.

PATSpeak has a human-facing *version* (e.g. "0.2.0") and—optionally—a more
precise *revision* derived from the git commit hash.

Why both?
  - Versions are stable release identifiers.
  - Revisions are great for "which exact build is this?" debugging.

This module is designed to be:
  - safe when git is not installed
  - safe when running from a source zip (no .git/)
  - deterministic when CI provides a commit SHA via environment variables
"""

from __future__ import annotations

import os
import subprocess
from functools import lru_cache
from pathlib import Path


# Environment variables we accept as an explicit revision override.
# These are project-specific and should beat everything else.
_REV_ENV_CANDIDATES = (
    "PATSPEAK_REVISION",
    "PATSPEAK_GIT_SHA",
)

# CI-provided SHAs (fallback only).
# These should NOT preempt the generated module or git fallback.
_CI_REV_ENV_CANDIDATES = (
    "GIT_COMMIT",
    "GITHUB_SHA",
    "CI_COMMIT_SHA",
    "BUILD_VCS_NUMBER",
)


def _clean_sha(value: str, *, short: bool) -> str:
    v = (value or "").strip()
    if not v:
        return ""
    # Accept full 40-char SHA or short.
    # If CI gives us something longer (or includes refs), take the first token.
    v = v.split()[0]
    return v[:7] if short and len(v) >= 7 else v


def _find_repo_root(start: Path) -> Path | None:
    """Walk upward from *start* to find a git worktree root.

    We treat either a `.git/` directory or a `.git` file (worktrees/submodules)
    as "in git".
    """

    try:
        start = start.resolve()
    except Exception:
        return None

    for p in (start, *start.parents):
        git_marker = p / ".git"
        if git_marker.exists():
            return p
    return None


def _git(cmd: list[str], *, cwd: Path, timeout_s: float = 1.5) -> str:
    """Run a git command and return stdout (stripped).

    Raises on failure.
    """

    out = subprocess.check_output(
        ["git", "-C", str(cwd), *cmd],
        stderr=subprocess.DEVNULL,
        text=True,
        timeout=timeout_s,
    )
    return (out or "").strip()


@lru_cache(maxsize=1)
def get_revision(*, short: bool = True) -> str | None:
    """Return a git-derived revision string (commit hash), if available.

    Resolution order:
      1) Explicit env override (PATSPEAK_REVISION, PATSPEAK_GIT_SHA)
      2) A generated module: ``patspeak._revision`` containing ``GIT_SHA``
      3) If we're inside a git worktree and git is installed: ``git rev-parse``
      4) CI env fallback (GITHUB_SHA, CI_COMMIT_SHA, ...) when not in git

    Returns:
      - a string commit hash (shortened by default)
      - None if no revision can be determined
    """

    # 1) Explicit env override (project-specific knobs).
    for key in _REV_ENV_CANDIDATES:
        v = os.environ.get(key)
        if v:
            cleaned = _clean_sha(v, short=short)
            return cleaned or None

    # 2) Build-time generated module (optional).
    try:
        from ._revision import GIT_SHA  # type: ignore

        cleaned = _clean_sha(str(GIT_SHA), short=short)
        return cleaned or None
    except Exception:
        pass

    # 3) Live git lookup (best-effort).
    root = _find_repo_root(Path(__file__).parent)
    if root:
        try:
            sha = _git(["rev-parse", "HEAD"], cwd=root)
            sha = _clean_sha(sha, short=short)
            return sha or None
        except Exception:
            # Important for determinism in tests: if we're "in git" but git fails,
            # do not fall back to CI env vars.
            return None

    # 4) CI env fallback (only when not in a git worktree).
    for key in _CI_REV_ENV_CANDIDATES:
        v = os.environ.get(key)
        if v:
            cleaned = _clean_sha(v, short=short)
            return cleaned or None

    return None


def get_full_version(base_version: str, *, short: bool = True) -> str:
    """Combine a semantic version with a git revision (if available).

    Example:
      - "0.2.0" + "a1b2c3d" -> "0.2.0 (a1b2c3d)"
      - "0.2.0" + None      -> "0.2.0"
    """

    v = str(base_version or "").strip() or "0.0.0"
    rev = get_revision(short=short)
    return f"{v} ({rev})" if rev else v


def startup_banner(*, base_version: str) -> str:
    """Return the one-line startup banner shown by the CLI."""

    # Allow fully disabling the banner for scripts/automation.
    if os.environ.get("PATSPEAK_BANNER", "1").strip().lower() in {"0", "false", "no", "off"}:
        return ""

    return f"PATSpeak {get_full_version(base_version)}"
