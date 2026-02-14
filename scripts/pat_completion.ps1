<#
.SYNOPSIS
  PowerShell tab completion for PATSpeak test selectors.

.DESCRIPTION
  Registers argument completion for the `pat` and `patspeak` commands.
  Completions include:
    - suite folders under `dut/`
    - `.pat` files (inserted without the `.pat` extension by default)

  DUT root resolution follows PATSpeak path behavior:
    1) PATSPEAK_DUT_DIR
    2) PATSPEAK_HOME\dut
    3) nearest parent of current directory containing both `dut/` and `dbc/`
    4) repo-local `dut/` next to this script

.EXAMPLE
  . .\scripts\pat_completion.ps1
  Register-PatCompletion

.EXAMPLE
  pat 43019-1\43019-1-INPUT-4<Tab>
#>

Set-StrictMode -Version Latest

function Get-PatSpeakDutRoot {
  [CmdletBinding()]
  param()

  if ($env:PATSPEAK_DUT_DIR) {
    try {
      $dut = Resolve-Path -LiteralPath $env:PATSPEAK_DUT_DIR -ErrorAction Stop
      if (Test-Path -LiteralPath $dut -PathType Container) {
        return $dut.ProviderPath
      }
    } catch {
    }
  }

  if ($env:PATSPEAK_HOME) {
    try {
      $home = Resolve-Path -LiteralPath $env:PATSPEAK_HOME -ErrorAction Stop
      $cand = Join-Path $home.ProviderPath "dut"
      if (Test-Path -LiteralPath $cand -PathType Container) {
        return (Resolve-Path -LiteralPath $cand -ErrorAction Stop).ProviderPath
      }
    } catch {
    }
  }

  try {
    $p = (Get-Location).ProviderPath
    while ($true) {
      $dut = Join-Path $p "dut"
      $dbc = Join-Path $p "dbc"
      if (
        (Test-Path -LiteralPath $dut -PathType Container) -and
        (Test-Path -LiteralPath $dbc -PathType Container)
      ) {
        return (Resolve-Path -LiteralPath $dut -ErrorAction Stop).ProviderPath
      }

      $parentObj = Split-Path -Path $p -Parent
      if (-not $parentObj -or ($parentObj -eq $p)) {
        break
      }
      $p = $parentObj
    }
  } catch {
  }

  try {
    if ($PSScriptRoot) {
      $repoRoot = Resolve-Path -LiteralPath (Join-Path $PSScriptRoot "..") -ErrorAction Stop
      $cand = Join-Path $repoRoot.ProviderPath "dut"
      if (Test-Path -LiteralPath $cand -PathType Container) {
        return (Resolve-Path -LiteralPath $cand -ErrorAction Stop).ProviderPath
      }
    }
  } catch {
  }

  return $null
}

function Get-PatCompletionItems {
  [CmdletBinding()]
  param(
    [string]$WordToComplete
  )

  $dutRoot = Get-PatSpeakDutRoot
  if (-not $dutRoot) {
    return
  }

  $typed = ""
  if ($null -ne $WordToComplete) {
    $typed = [string]$WordToComplete
  }

  $normalized = $typed -replace "/", "\"
  $normalized = $normalized -replace "^[.\\]+", ""
  if ($normalized -match "^(?i)dut\\") {
    $normalized = $normalized.Substring(4)
  }

  $parentRel = ""
  $leafPrefix = $normalized
  $lastSep = $normalized.LastIndexOf("\")
  if ($lastSep -ge 0) {
    $parentRel = $normalized.Substring(0, $lastSep)
    $leafPrefix = $normalized.Substring($lastSep + 1)
  }

  $searchDir = $dutRoot
  if ($parentRel) {
    $searchDir = Join-Path $dutRoot $parentRel
  }

  if (-not (Test-Path -LiteralPath $searchDir -PathType Container)) {
    return
  }

  $emitPatExt = ($leafPrefix -like "*.pat*")
  $seen = New-Object "System.Collections.Generic.HashSet[string]" ([System.StringComparer]::OrdinalIgnoreCase)

  Get-ChildItem -LiteralPath $searchDir -ErrorAction SilentlyContinue |
    Sort-Object Name |
    ForEach-Object {
      $entry = $_
      $name = [string]$entry.Name
      if (-not $name) {
        return
      }

      if ($entry.PSIsContainer) {
        if ($leafPrefix -and ($name -notlike "$leafPrefix*")) {
          return
        }

        $rel = if ($parentRel) { "$parentRel\$name" } else { $name }
        if ($seen.Add($rel)) {
          [System.Management.Automation.CompletionResult]::new(
            $rel,
            $rel,
            [System.Management.Automation.CompletionResultType]::ProviderContainer,
            "suite folder"
          )
        }
        return
      }

      if (-not $name.ToLowerInvariant().EndsWith(".pat")) {
        return
      }

      $stem = [System.IO.Path]::GetFileNameWithoutExtension($name)
      if ($leafPrefix -and ($name -notlike "$leafPrefix*") -and ($stem -notlike "$leafPrefix*")) {
        return
      }

      $fileRel = if ($parentRel) { "$parentRel\$name" } else { $name }
      if ($emitPatExt) {
        $completion = $fileRel
      } else {
        $selectorRel = if ($parentRel) { "$parentRel\$stem" } else { $stem }
        $completion = $selectorRel
      }

      if ($seen.Add($completion)) {
        [System.Management.Automation.CompletionResult]::new(
          $completion,
          $completion,
          [System.Management.Automation.CompletionResultType]::ParameterValue,
          "test file: $fileRel"
        )
      }
    }
}

function Register-PatCompletion {
  [CmdletBinding()]
  param()

  if (Get-Variable -Name "__pat_completion_registered" -Scope Script -ErrorAction SilentlyContinue) {
    return
  }

  $scriptBlockCmdlet = {
    param(
      [string]$commandName,
      [string]$parameterName,
      [string]$wordToComplete,
      [System.Management.Automation.Language.CommandAst]$commandAst,
      [System.Collections.IDictionary]$fakeBoundParameters
    )

    $null = $commandName
    $null = $parameterName
    $null = $commandAst
    $null = $fakeBoundParameters

    Get-PatCompletionItems -WordToComplete $wordToComplete
  }

  $scriptBlockNative = {
    param(
      [string]$wordToComplete,
      [System.Management.Automation.Language.CommandAst]$commandAst,
      [int]$cursorPosition
    )

    $null = $commandAst
    $null = $cursorPosition

    Get-PatCompletionItems -WordToComplete $wordToComplete
  }

  $rac = Get-Command Register-ArgumentCompleter -ErrorAction Stop
  $commandNames = @("pat", "pat.exe", "patspeak", "patspeak.exe")
  if ($rac.Parameters.ContainsKey("Native")) {
    Register-ArgumentCompleter -Native -CommandName $commandNames -ScriptBlock $scriptBlockNative
  } else {
    Register-ArgumentCompleter -CommandName $commandNames -ScriptBlock $scriptBlockCmdlet
  }

  Set-Variable -Name "__pat_completion_registered" -Scope Script -Value $true
}
