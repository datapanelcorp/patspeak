from __future__ import annotations

import sys
import types

import patspeak.revision as rev


def _clear_cache() -> None:
    # get_revision is cached to avoid spawning `git` repeatedly.
    rev.get_revision.cache_clear()


def test_get_revision_env_override(monkeypatch):
    _clear_cache()
    monkeypatch.setenv("PATSPEAK_REVISION", "0123456789abcdef")

    assert rev.get_revision(short=True) == "0123456"
    _clear_cache()
    assert rev.get_revision(short=False) == "0123456789abcdef"


def test_clean_sha_handles_empty_and_strips():
    assert rev._clean_sha("  ", short=True) == ""
    assert rev._clean_sha("abc\n", short=False) == "abc"
    assert rev._clean_sha("0123456789", short=True) == "0123456"


def test_find_repo_root_walks_up(tmp_path):
    root = tmp_path / "repo"
    nested = root / "a" / "b" / "c"
    nested.mkdir(parents=True)

    # A worktree/submodule can have `.git` as a file, not just a directory.
    (root / ".git").write_text("gitdir: somewhere", encoding="utf-8")

    assert rev._find_repo_root(nested) == root


def test_git_helper_strips_output(monkeypatch, tmp_path):
    def fake_check_output(*args, **kwargs):  # noqa: ANN001,ANN002,ANN003
        return "abc123\n"

    monkeypatch.setattr(rev.subprocess, "check_output", fake_check_output)
    assert rev._git(["rev-parse", "HEAD"], cwd=tmp_path) == "abc123"


def test_get_revision_generated_module(monkeypatch):
    _clear_cache()
    monkeypatch.delenv("PATSPEAK_REVISION", raising=False)

    m = types.ModuleType("patspeak._revision")
    m.GIT_SHA = "deadbeefcafebabe"
    sys.modules["patspeak._revision"] = m

    try:
        assert rev.get_revision(short=True) == "deadbee"
    finally:
        sys.modules.pop("patspeak._revision", None)
        _clear_cache()


def test_get_full_version_combines_base_and_revision(monkeypatch):
    _clear_cache()
    monkeypatch.setenv("PATSPEAK_REVISION", "aaaaaaaa")

    assert rev.get_full_version("1.2.3") == "1.2.3 (aaaaaaa)"


def test_get_revision_git_fallback_path(monkeypatch, tmp_path):
    # Force the fallback path regardless of whether the test runner is itself
    # inside a real git checkout.
    _clear_cache()
    monkeypatch.delenv("PATSPEAK_REVISION", raising=False)
    monkeypatch.setattr(rev, "_find_repo_root", lambda _p: tmp_path)
    monkeypatch.setattr(rev, "_git", lambda _cmd, cwd, timeout_s=1.5: "abcdef012345")

    assert rev.get_revision(short=True) == "abcdef0"
    assert rev.startup_banner(base_version="9.9.9") == "PATSpeak 9.9.9 (abcdef0)"


def test_get_revision_git_failure_returns_none(monkeypatch, tmp_path):
    _clear_cache()
    monkeypatch.delenv("PATSPEAK_REVISION", raising=False)
    monkeypatch.setattr(rev, "_find_repo_root", lambda _p: tmp_path)

    def boom(*args, **kwargs):  # noqa: ANN001,ANN002,ANN003
        raise RuntimeError("nope")

    monkeypatch.setattr(rev, "_git", boom)

    assert rev.get_revision(short=True) is None


def test_startup_banner_can_be_disabled(monkeypatch):
    _clear_cache()
    monkeypatch.setenv("PATSPEAK_BANNER", "0")
    monkeypatch.setenv("PATSPEAK_REVISION", "bbbbbbbb")

    assert rev.startup_banner(base_version="0.0.0") == ""