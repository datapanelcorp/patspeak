<#{
.SYNOPSIS
  Run PATSpeak using the repo-local virtual environment (without activating).

.EXAMPLE
  .\scripts\run_pat.ps1 RESET.pat -v
#}

[CmdletBinding()]
param(
  [Parameter(ValueFromRemainingArguments = $true)]
  [string[]]$Args
)

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Resolve-Path (Join-Path $ScriptDir "..")

$VenvDir = $env:VENV_DIR
if (-not $VenvDir) {
  $VenvDir = Join-Path $RepoRoot ".venv"
}

$VenvPython = Join-Path $VenvDir "Scripts\python.exe"
if (-not (Test-Path $VenvPython)) {
  Write-Error "venv not found at: $VenvDir`nRun: .\scripts\setup_venv.ps1"
  exit 1
}

& $VenvPython (Join-Path $RepoRoot "pat.py") @Args
exit $LASTEXITCODE
