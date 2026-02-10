from __future__ import annotations


import sys

import patspeak.revision as rev


def _clear_cache() -> None:
    rev.get_revision.cache_clear()


def test_find_repo_root_returns_none_when_resolve_raises():
    class BadPath:
        def resolve(self):  # noqa: ANN001
            raise RuntimeError("boom")

    assert rev._find_repo_root(BadPath()) is None


def test_find_repo_root_returns_none_when_no_git_marker(tmp_path):
    _clear_cache()
    nested = tmp_path / "a" / "b" / "c"
    nested.mkdir(parents=True)

    # No `.git` anywhere above this temp path.
    assert rev._find_repo_root(nested) is None


def test_get_revision_returns_none_when_no_sources(monkeypatch):
    """Cover the final `return None` path when no env/module/git/CI SHA is available."""

    _clear_cache()

    # Ensure we don't pick up a build-time module.
    sys.modules.pop("patspeak._revision", None)

    # Ensure we're treated as "not in a git checkout".
    monkeypatch.setattr(rev, "_find_repo_root", lambda _p: None)

    # Clear any env vars that could supply a SHA.
    for key in rev._REV_ENV_CANDIDATES + rev._CI_REV_ENV_CANDIDATES:  # type: ignore[attr-defined]
        monkeypatch.delenv(key, raising=False)

    assert rev.get_revision(short=True) is None
