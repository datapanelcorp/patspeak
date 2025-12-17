
#!/usr/bin/env python3
"""
Run all Python files in a folder.

Default behavior:
- Runs *.py in alphabetical order in the given folder (non-recursive).
- Skips this runner script, __init__.py, and files starting with '_' by default.
- Stops on first failure (configurable).

Usage:
  python run_all.py --dir ./scripts --recursive --pattern "*.py" --continue-on-error -- args_go_here
"""
import argparse
import fnmatch
import os
import subprocess
import sys
from pathlib import Path

def collect_scripts(root: Path, recursive: bool, pattern: str, skip_hidden: bool, skip_names: set) -> list[Path]:
    candidates: list[Path] = []
    if recursive:
        for p in root.rglob("*.py"):
            candidates.append(p)
    else:
        candidates = [p for p in root.glob("*.py")]

    # Filter by pattern and rules
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

    # Sort deterministically: by relative path, then name
    filtered.sort(key=lambda p: str(p.relative_to(root)).lower())
    return filtered

def main():
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
        sys.exit(2)

    # Build skip set
    runner_name = Path(__file__).name
    skip_names = {runner_name, "__init__.py", "__main__.py"}
    skip_hidden = not args.no_skip_underscore

    scripts = collect_scripts(
        root=target_dir,
        recursive=args.recursive,
        pattern=args.pattern,
        skip_hidden=skip_hidden,
        skip_names=skip_names,
    )

    if args.verbose or args.dry_run:
        print(f"Found {len(scripts)} script(s) in {target_dir}:")
        for s in scripts:
            print("  -", s)

    if args.dry_run:
        return

    failures = []
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
            completed = subprocess.run(
                cmd,
                cwd=s.parent,
                timeout=args.timeout,
                check=False
            )
            rc = completed.returncode
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
        sys.exit(1)
    else:
        if args.verbose:
            print("\nAll scripts completed successfully.")

if __name__ == "__main__":
    main()