#!/usr/bin/env python3
"""Run all Python generator scripts in a folder.

PATSpeak includes some large DUT test suites that are generated from Python.
This helper runs all ``*.py`` files in a directory (optionally recursive),
which is handy for regenerating ``.pat`` files in bulk.

Default behavior
----------------
- Runs ``*.py`` in alphabetical order in the given folder (non-recursive).
- Skips this runner script, ``__init__.py``, and files starting with '_' by default.
- Stops on first failure (configurable).

Examples
--------
Run all generators in a single DUT folder:

  python dut/build_all.py --dir dut/43019-1

Run all generators in all DUT subfolders:

  python dut/build_all.py --dir dut --recursive
"""

from __future__ import annotations

import argparse
import fnmatch
import subprocess
import sys
from pathlib import Path


def collect_scripts(
    *,
    root: Path,
    recursive: bool,
    pattern: str,
    skip_hidden: bool,
    skip_names: set[str],
) -> list[Path]:
    candidates: list[Path] = []
    if recursive:
        candidates = list(root.rglob("*.py"))
    else:
        candidates = list(root.glob("*.py"))

    filtered: list[Path] = []
    for p in candidates:
        name = p.name
        if name in skip_names:
            continue
        if skip_hidden and (name.startswith("_") or any(part.startswith(".") for part in p.parts)):
            continue
        if not fnmatch.fnmatch(name, pattern):
            continue
        filtered.append(p)

    filtered.sort(key=lambda p: str(p.relative_to(root)).lower())
    return filtered


def main() -> None:
    parser = argparse.ArgumentParser(description="Run all Python files in a folder.")
    parser.add_argument("--dir", default=".", help="Target directory (default: current directory).")
    parser.add_argument("--recursive", action="store_true", help="Recurse into subfolders.")
    parser.add_argument("--pattern", default="*.py", help='Glob pattern to match files (default: "*.py").')
    parser.add_argument("--continue-on-error", action="store_true", help="Continue even if a script fails.")
    parser.add_argument("--python", default=sys.executable, help="Python interpreter to use (default: current).")
    parser.add_argument("--timeout", type=int, default=None, help="Per-script timeout in seconds.")
    parser.add_argument("--no-skip-underscore", action="store_true", help="Do not skip files starting with '_' .")
    parser.add_argument("--dry-run", action="store_true", help="Show what would run without executing.")
    parser.add_argument("--verbose", "-v", action="store_true", help="Print additional details.")
    parser.add_argument("--", dest="args", nargs=argparse.REMAINDER, help="Arguments to pass to each script.")
    args = parser.parse_args()

    target_dir = Path(args.dir).resolve()
    if not target_dir.exists() or not target_dir.is_dir():
        print(f"Error: directory not found: {target_dir}", file=sys.stderr)
        raise SystemExit(2)

    runner_name = Path(__file__).name
    skip_names = {runner_name, "__init__.py", "__main__.py"}
    skip_hidden = not args.no_skip_underscore

    scripts = collect_scripts(
        root=target_dir,
        recursive=bool(args.recursive),
        pattern=str(args.pattern),
        skip_hidden=bool(skip_hidden),
        skip_names=skip_names,
    )

    if args.verbose or args.dry_run:
        print(f"Found {len(scripts)} script(s) in {target_dir}:")
        for s in scripts:
            print("  -", s)

    if args.dry_run:
        return

    failures: list[tuple[Path, int]] = []

    extra_args = (args.args or [])
    if extra_args and extra_args[0] == "--":
        extra_args = extra_args[1:]

    for s in scripts:
        cmd = [args.python, str(s), *extra_args]
        if args.verbose:
            print("\n" + "=" * 80)
            print("Running:", " ".join(cmd))
            print("=" * 80)

        try:
            completed = subprocess.run(cmd, cwd=s.parent, timeout=args.timeout, check=False)
            rc = int(completed.returncode)
        except subprocess.TimeoutExpired:
            rc = 124  # conventional timeout code
            print(f"[TIMEOUT] {s} exceeded {args.timeout}s", file=sys.stderr)

        if rc != 0:
            failures.append((s, rc))
            print(f"[FAIL] {s} (exit {rc})", file=sys.stderr)
            if not args.continue_on_error:
                break
        else:
            if args.verbose:
                print(f"[OK] {s}")

    if failures:
        print("\nSummary of failures:")
        for s, rc in failures:
            print(f" - {s} (exit {rc})")
        raise SystemExit(1)

    if args.verbose:
        print("\nAll scripts completed successfully.")


if __name__ == "__main__":
    main()
