#!/usr/bin/env bash
# Run PATSpeak using the repo-local virtual environment (without activating).

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VENV_DIR="${VENV_DIR:-$ROOT/.venv}"
VENV_PY="$VENV_DIR/bin/python"
PAT_EXE="$VENV_DIR/bin/pat"

if [[ ! -x "$VENV_PY" ]]; then
  echo "ERROR: venv not found at: $VENV_DIR" >&2
  echo "Run: ./scripts/setup_venv.sh" >&2
  exit 1
fi

# Prefer the console-script entrypoint if it exists (installed by setup_venv).
if [[ -x "$PAT_EXE" ]]; then
  exec "$PAT_EXE" "$@"
fi

# Fallback: run the repo entrypoint directly.
exec "$VENV_PY" "$ROOT/pat.py" "$@"
