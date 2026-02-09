#!/usr/bin/env bash
# Create a local virtual environment and install PATSpeak.
#
# Usage:
#   ./scripts/setup_venv.sh           # runtime deps only
#   ./scripts/setup_venv.sh --dev     # runtime + dev/test deps
#   ./scripts/setup_venv.sh --python /path/to/python3
#
# Notes:
#   - This script does NOT require you to "activate" the venv.
#   - After setup, you can run PATSpeak with either:
#       source .venv/bin/activate && pat 43019-1
#     or without activating:
#       ./.venv/bin/pat 43019-1

set -euo pipefail

usage() {
  cat <<USAGE
PATSpeak venv setup

Usage:
  ./scripts/setup_venv.sh [--dev] [--python <python_exe>] [--venv <path>]

Options:
  --dev              Install dev/test dependencies (pytest)
  --python <exe>     Python executable to use (default: python3 then python)
  --venv <path>      Venv folder (default: .venv)
  -h, --help         Show this help
USAGE
}

DEV=0
PYTHON=""
VENV_DIR=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dev)
      DEV=1
      shift
      ;;
    --python)
      PYTHON="${2:-}"
      shift 2
      ;;
    --venv)
      VENV_DIR="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      echo
      usage >&2
      exit 2
      ;;
  esac
done

# Resolve repo root (parent of this script directory)
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ -z "$VENV_DIR" ]]; then
  VENV_DIR="$ROOT/.venv"
fi

if [[ -z "$PYTHON" ]]; then
  if command -v python3 >/dev/null 2>&1; then
    PYTHON=python3
  elif command -v python >/dev/null 2>&1; then
    PYTHON=python
  else
    echo "ERROR: Python was not found on PATH. Install Python 3 and try again." >&2
    exit 1
  fi
fi

echo "Repo root  : $ROOT"
echo "Venv path  : $VENV_DIR"
echo "Python exe : $PYTHON"

# Create venv if missing
if [[ ! -d "$VENV_DIR" ]]; then
  "$PYTHON" -m venv "$VENV_DIR"
fi

VENV_PY="$VENV_DIR/bin/python"
if [[ ! -x "$VENV_PY" ]]; then
  echo "ERROR: Expected venv Python at: $VENV_PY" >&2
  echo "If you are on Windows, use scripts/setup_venv.ps1 instead." >&2
  exit 1
fi

"$VENV_PY" -m pip install --upgrade pip

# Install PATSpeak itself (editable) so the `pat` command exists.
(
  cd "$ROOT"
  if [[ $DEV -eq 1 ]]; then
    "$VENV_PY" -m pip install -e ".[dev]"
  else
    "$VENV_PY" -m pip install -e .
  fi
)

cat <<NEXT

Done.

Activate (recommended):
  source "$VENV_DIR/bin/activate"

Run PATSpeak:
  pat 43019-1
  pat RESET.pat -v

Or without activating:
  "$VENV_DIR/bin/pat" 43019-1
NEXT
