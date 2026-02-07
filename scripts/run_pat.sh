#!/usr/bin/env bash
# Run PATSpeak using the repo-local virtual environment (without activating).

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VENV_DIR="${VENV_DIR:-$ROOT/.venv}"
VENV_PY="$VENV_DIR/bin/python"

if [[ ! -x "$VENV_PY" ]]; then
  echo "ERROR: venv not found at: $VENV_DIR" >&2
  echo "Run: ./scripts/setup_venv.sh" >&2
  exit 1
fi

exec "$VENV_PY" "$ROOT/pat.py" "$@"
