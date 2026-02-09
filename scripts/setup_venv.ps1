<#
.SYNOPSIS
  Create a local virtual environment and install PATSpeak.

.EXAMPLE
  # Runtime deps only
  .\scripts\setup_venv.ps1

.EXAMPLE
  # Runtime + dev/test deps (pytest)
  .\scripts\setup_venv.ps1 -Dev

.NOTES
  This script does NOT require you to activate the venv, but it prints the
  activate command as a convenience.

  If activation is blocked by execution policy, run:
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
#>

[CmdletBinding()]
param(
  [switch]$Dev,
  [string]$VenvDir = ".venv",
  [string]$Python = ""
)

$ErrorActionPreference = "Stop"

function Resolve-PythonExecutable {
  param([string]$Preferred)

  if ($Preferred) {
    return $Preferred
  }

  # Prefer python.exe if present.
  $py = Get-Command python -ErrorAction SilentlyContinue
  if ($py) {
    return "python"
  }

  # Fall back to the Windows Python launcher.
  $launcher = Get-Command py -ErrorAction SilentlyContinue
  if ($launcher) {
    # Prefer Python 3.
    return "py -3"
  }

  throw "Python was not found on PATH. Install Python 3 and try again."
}

# Resolve repo root (parent of this script directory)
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Resolve-Path (Join-Path $ScriptDir "..")
Set-Location $RepoRoot

$PyCmd = Resolve-PythonExecutable -Preferred $Python

Write-Host "Repo root : $RepoRoot"
Write-Host "Venv path : $VenvDir"
Write-Host "Python    : $PyCmd"

# Create venv if missing
if (-not (Test-Path $VenvDir)) {
  Write-Host "Creating venv..."
  if ($PyCmd -like "py *") {
    & py -3 -m venv $VenvDir
  } else {
    & $PyCmd -m venv $VenvDir
  }
}

$VenvPython = Join-Path $VenvDir "Scripts\python.exe"
if (-not (Test-Path $VenvPython)) {
  throw "Expected venv Python at: $VenvPython"
}

Write-Host "Upgrading pip..."
& $VenvPython -m pip install --upgrade pip

# Install PATSpeak itself (editable) so the `pat` console command exists.
Write-Host "Installing PATSpeak (editable)..."
if ($Dev) {
  & $VenvPython -m pip install -e ".[dev]"
} else {
  & $VenvPython -m pip install -e .
}

Write-Host ""
Write-Host "Done."
Write-Host ""
Write-Host "Activate (recommended):"
Write-Host "  & `"$VenvDir\Scripts\Activate.ps1`""
Write-Host ""
Write-Host "Run PATSpeak:"
Write-Host "  pat 43019-1"
Write-Host "  pat RESET.pat -v"
Write-Host ""
Write-Host "Or without activating:"
Write-Host "  & `"$VenvDir\Scripts\pat.exe`" 43019-1"
Write-Host ""
Write-Host "If activation is blocked, run (PowerShell):"
Write-Host "  Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass"
