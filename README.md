# PATSpeak

PATSpeak is a **CAN-based test runner** for a simple text test language (`.pat`).

You point it at a single `.pat` file or a **folder of tests** under `dut/`, and it:

- loads the requested DBC(s) from `dbc/`
- starts CAN RX/TX threads (via `python-can`)
- steps through your `.pat` lines, logging **PASS / FAIL / TEST** output
- writes results into a per-test `results/` folder

The repo is intended to be operator-friendly: after setup, an operator can run a suite like:

```bash
pat 43019-1
```

…where `43019-1` is a folder under `dut/`.

---

## Quickstart on Windows (recommended)

### 0) Install prerequisites

1) **Install Python 3.10+** (from python.org). During install, check:

- ✅ “Add Python to PATH”

2) **Install your CAN vendor drivers** (PATSpeak does *not* install these):

- PEAK PCAN: install **PCAN-Basic**
- Kvaser on Windows: install **Kvaser CANlib**

### 1) Create the local venv + install PATSpeak

From **PowerShell**, in the repo root:

```powershell
# If scripts are blocked in this shell session:
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

.\scripts\setup_venv.ps1
```

That script will:

- create `.venv/`
- install PATSpeak (and its dependencies) into the venv
- make the **`pat` command** available inside the venv

### 2) Activate the venv

```powershell
& .\.venv\Scripts\Activate.ps1
```

### 3) Run a test

Run a whole folder (non-recursive):

```powershell
pat 43019-1
```

Run a single file:

```powershell
pat RESET.pat -v
```

### No activation option

If you don’t want to activate the venv:

```powershell
.\scripts\run_pat.ps1 43019-1
# or directly:
& .\.venv\Scripts\pat.exe 43019-1
```

---

## Workspace discovery (running from anywhere)

By default, PATSpeak looks for a workspace containing both `dbc/` and `dut/` by walking up from the current directory.

If you want to run `pat` from *any* folder, set:

- `PATSPEAK_HOME` = the workspace root (the folder that contains `dbc/` and `dut/`)

Example (PowerShell):

```powershell
setx PATSPEAK_HOME "C:\path\to\patspeak"
```

---

## Repo layout

```
pyproject.toml          # package + dependencies + console script (pat)
pat.py                  # compatibility shim (python pat.py ...) — optional

src/patspeak/           # the actual Python package

dbc/                    # DBC files
  PAT.dbc
  ...

dut/                    # DUT test suites (.pat) and optional generators (.py)
  43019-1/
  RESET.pat

scripts/                # setup helpers + convenience runners
extras/legacy_ui/       # old pygame UI code (not used on Windows)

tests/                  # pytest unit tests
```

---

## CLI usage

PATSpeak takes a single **selector** argument. The selector is interpreted relative to `dut/`.

Examples:

```bash
# A single file
pat "RESET.pat"

# A folder of tests (runs all *.pat in that folder, non-recursive)
pat 43019-1

# A specific file inside a folder (extension optional)
pat 43019-1\43019-1-INPUT-420MA
pat "43019-1\43019-1-INPUT-420MA.pat"
```

### Verbosity

- `-v` / `--verbose`: echo comments and show signal setup
- `-vv` / `--super-verbose`: trace TX diffs and echo consumed `.pat` lines

---

## Outputs generated

By default, PATSpeak writes outputs into a per-test `results/` subfolder **next to the `.pat` file**:

```
dut/<suite>/results/
```

### Log file

Log filename format:

```
<test_folder>/results/<UnitName>_<TestName>_<RunStamp>.log
```

Where:

- `<TestName>` is the `.pat` filename **stem** (basename without extension)
- `<RunStamp>` is a timestamp (millisecond precision) so reruns don’t overwrite
- If `UnitName` already matches the test name, the filename de-dupes to:
  - `<test_folder>/results/<TestName>_<RunStamp>.log`

### CSV file

CSV is written **only when the script runs `SAVE`**:

```
<test_folder>/results/<UnitName>_<RunStamp>.csv
```

Multiple `SAVE` commands within a run append to the same CSV.

---

## The `.pat` test language (overview)

A `.pat` file is a newline-delimited script with:

1) **Header directives** (configure DBC, naming, PAT support)
2) **Step lines** in the form:

```text
[Output Commands] : [Input Commands] : [Optional Flags]
```

3) **Single-line commands** like `SAVE` and `END`

### File directives

Parsed once at startup:

- `UUT_DBC = <filename.dbc>` (**required**)
  - loaded from `dbc/`

- `UUT_DATANAME = <name>` (optional)
  - if present, becomes the `UnitName` and avoids the runtime prompt

- `SUPPRESS_PAT_SUPPORT = True|False` (optional; default `False`)
  - if truthy, PATSpeak runs in “UUT-only” mode
  - accepted truthy spellings: `True`, `true`, `1`, `yes`, `on`

### Comments and blank lines

- Lines starting with `#` are comments.
- Blank lines are ignored.
- In verbose mode (`-v`), comment lines are echoed.

### Step line grammar

A step line has **2 or 3 sections**, separated by colons `:`:

```text
<outputs> : <inputs>
<outputs> : <inputs> : <flags>
```

Within `<outputs>` and `<inputs>` you can specify multiple comma-separated items.

#### Outputs

Outputs set **TX signal values**.

Supported output forms:

- `SignalName = <number>`
- `SignalName = DATALOG` (log the current configured TX value)
- `NULL` (no output changes)

Output resolution: a signal is considered an “output” only if it appears in a DBC message whose **sender list includes `CTRL`**.

#### Inputs

Inputs define what must be observed in the feedback dictionaries.

Supported input forms:

- `SignalName = <value> | <tolerance> | <time_seconds>`

  Example:

  ```pat
  NULL : MeterVolts = 14.5 | 0.5 | 0.5
  ```

  Meaning: `MeterVolts` must stay within `14.5 ± 0.5` continuously for `0.5s`.

- `SignalName = DATALOG` (record current feedback value; step completes immediately)
- `NULL`

#### Optional flags

Flags are comma-separated `KEY=VALUE` pairs in the 3rd colon section.

Supported flags:

- `TIMEOUT = <seconds>` (default is **5s**)
- `WAIT = <seconds>` wait before evaluating inputs
- `MESSAGE = <text>` pause for operator (note: normal step lines strip spaces)
- `HOLD = 1` infinite hold / breakpoint (use **Ctrl+C** to abort)
- `TAG = <label>` sets `DataLogTag` (used in internal result keys)

Parsing gotcha: for normal step lines, PATSpeak removes **all spaces** before parsing.
If you want a prompt that preserves spaces, use `PAUSE-...`.

### Single-line commands

- `SAVE` write collected data to CSV (append mode)
- `END` (**required**) ends the current test and writes the `.log`
- `PAUSE-<prompt text>` prompts the operator and waits for Enter (spaces preserved)

> Important: `END` and `SAVE` must be **uppercase exactly**. Preflight will flag other casing as fatal.

---

## Optional suite hooks

If you place any of these files **next to your tests**, PATSpeak will run them automatically:

- `pat_start.pat` (once, before first test in that folder)
- `pat_transition.pat` (before and after each test; consecutive duplicates skipped)
- `pat_end.pat` (once, after last test in that folder)

Hook scripts are ignored during folder discovery (they won’t appear as “tests”), but can still be run explicitly.

---

## CAN backend configuration

PATSpeak uses `python-can` and can auto-detect hardware or be forced via environment variables.

Environment overrides:

- `PATSPEAK_CAN_INTERFACE`: `auto|pcan|kvaser|socketcan`
- `PATSPEAK_CAN_CH0`: channel 0 (UUT), e.g. `PCAN_USBBUS1`, `0`, `can0`
- `PATSPEAK_CAN_CH1`: channel 1 (PAT), e.g. `PCAN_USBBUS2`, `1`, `can1`
- `PATSPEAK_CAN_BITRATE`: default `250000`

---

## Development / testing

Install dev tools:

```powershell
.\scripts\setup_venv.ps1 -Dev
& .\.venv\Scripts\Activate.ps1
```

Run tests:

```bash
pytest
```
