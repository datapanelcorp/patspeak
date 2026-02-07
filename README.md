# PATSpeak

PATSpeak is a collection of scripts for automating the **PAT test fixture** and running scripted verification against a **Unit Under Test (UUT)** over CAN.

This repo contains:

- The PATSpeak runner (`pat.py`)
- A small `.pat` **test language** (text files describing steps)
- Example DUT/UUT test scripts in `dut/`
- DBC files in `dbc/` (UUT-specific DBCs + `PAT.dbc` for the fixture)

> Note on history: the project was updated **08/28/25** to migrate to **python-can + cantools** for CAN + DBC handling (no longer depends on Kvaser `kvadblib` for DBC parsing).

---

## Repository layout

- `pat.py` — main entrypoint (runs a `.pat` test)
- `prerequisite_setup.py` — installs Python dependencies (does **not** install vendor drivers)
- `support/`
  - `globals.py` — parses test header directives, loads DBCs, initializes global state
  - `script.py` — `.pat` parser + step execution engine (pass/fail timing, logging, CSV capture)
  - `can.py` — python-can RX/TX thread (2 channels: UUT + PAT)
  - `can_db.py` — DBC wrapper around `cantools` with extra handling for multiplexing + overlapping signals
- `dbc/` — DBC files (UUT DBCs by part/rev, plus `PAT.dbc`); also includes a Vector DBC format PDF
- `dut/` — runnable `.pat` scripts and optional `.py` generators that emit `.pat` files
- `docs/readme.txt` — legacy quick reference (contents merged into this README)

---

## Setup requirements

### 1) Python dependencies (recommended: venv)
PATSpeak is typically run directly from the repo root (it is not installed as a package).
Using a virtual environment keeps dependencies isolated.

#### Linux (bash/zsh)

```bash
./scripts/setup_venv.sh
source .venv/bin/activate
python pat.py RESET.pat -v
```

#### Windows (PowerShell)

```powershell
.\scripts\setup_venv.ps1
# If activation is blocked:
#   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\.venv\Scripts\Activate.ps1
python pat.py RESET.pat -v
```

#### Dev / test dependencies (optional)

- Linux: `./scripts/setup_venv.sh --dev`
- Windows: `.\scripts\setup_venv.ps1 -Dev`

#### Without activating (either OS)
You can always call the venv Python directly:

- Linux: `./.venv/bin/python pat.py RESET.pat -v`
- Windows: `.\.venv\Scripts\python.exe pat.py RESET.pat -v`

#### Legacy (no venv)
If you intentionally want to install into your current Python environment:

```bash
python prerequisite_setup.py
```

This installs the runtime deps listed in `requirements.txt` (`python-can`, `cantools`, `colorama`, `keyboard`).

### 2) CAN hardware + drivers
Vendor CAN drivers are only required if you're using that vendor's hardware:

- **PCAN hardware on Windows:** install PEAK **PCAN-Basic**
- **Kvaser hardware on Windows:** install **Kvaser CANlib** drivers
- **Linux:** prefer **SocketCAN** (`can0`/`can1`); many adapters (including some Kvaser) work without proprietary user-space libs

### 3) Wiring / channel mapping
PATSpeak expects **two CAN channels**:

- **Channel 0** = UUT CAN
- **Channel 1** = PAT fixture CAN (optional; can be suppressed per-test)

If a test contains `SUPPRESS_PAT_SUPPORT = True`, PATSpeak will run **UUT-only** and will not open channel 1.

---

## Running a test

### Where test files live (important)
PATSpeak assumes test scripts live in `dut/`.

When you run `pat.py`, pass a **test selector** that is relative to `dut/`:

- a single file (with or without `.pat`)
- a subfolder + file (with or without `.pat`)
- a folder name to run **all** `*.pat` tests in that folder (non-recursive)


✅ Works:

```bash
python pat.py "44018-PWM-100-DUTY.pat"
python pat.py "RESET.pat" -v
python pat.py "RESET.pat" -vv
python pat.py "43019-1-SENSOR-POWER.pat" -v

# Run all tests in a subfolder (example: dut/43019/*.pat)
python pat.py 43019
python pat.py 43019 -vv

# Run one test in a subfolder (extension optional)
python pat.py 43019\43019-1-INPUT-420MA
```

Note: you *can* include the `dut/` prefix if you want — it will be stripped automatically:

```bash
python pat.py "dut/RESET.pat"
```

Flags:

- `-v` / `--verbose` enables verbose prints (signal enumeration + echoes comment lines)

- `-vv` / `--super-verbose` enables **super verbose** tracing intended for debugging wiring and relay/switching:
  - echoes every `.pat` line as it is consumed (including comments)
  - prints each output assignment as it is applied (e.g. `SET PAT ...`, `SET UUT ...`)
  - prints `DATALOG` capture values at the time they are recorded
  - prints CAN TX frames **only when the payload changes** (avoids 10ms spam while still showing actual switching)

Tip: if you only want the “TX frames on change” trace without full `-vv` output,
you can set an environment variable:

```bash
set PATSPEAK_TRACE_TX=1
python pat.py 43019
```

### Optional bottom-row progress bar (interactive)

When running in a real terminal, PATSpeak can display a 1-line progress bar at
the **bottom row** that updates in-place while the normal log output scrolls.
It shows:

- suite progress (all tests)
- current test step progress
- per-step pass/fail coloring

You can control this with:

- `PATSPEAK_PROGRESS=auto` (default) — enable only when stdout is a TTY
- `PATSPEAK_PROGRESS=on` — force enable
- `PATSPEAK_PROGRESS=off` — disable

### Optional hook scripts for suites

When running a *folder* (suite) of tests, you can place optional `.pat` hook
scripts alongside the other tests to automate common setup/teardown actions
(e.g. cycling a relay like `RESET.pat`).

Hook filenames (case-insensitive):

- `pat_start.pat` — run once, before the first test in the folder
- `pat_transition.pat` — run before **and** after every test
  - consecutive duplicates are automatically skipped, so between two tests you
    only get one transition run
- `pat_end.pat` — run once, after the last test in the folder

Notes:

- Hook scripts are **not** treated as normal tests when you run a folder (they
  won't show up in the discovered test list).
- You *can* still run a hook directly by selecting it explicitly (same as any
  other `.pat` file).
- If a hook file is missing, nothing changes — the suite runs exactly as it did
  before.

### What you’ll be prompted for
If your `.pat` file **does not** include `UUT_DATANAME = ...`, the runner will prompt:

- “Type a name for the test…”

That name becomes the **UnitName** used for log/CSV output.

### Stopping a run early

- **Ctrl+C** requests an immediate shutdown (stops CAN threads + exits cleanly).
  - If something is wedged in a driver call, pressing **Ctrl+C a second time** forces exit.

### Outputs generated
PATSpeak writes outputs into a per-test `results/` subfolder **next to the `.pat` file** (by default):

- Log: `<test_folder>/results/<UnitName>_<TestName>.log`
  - `<TestName>` is the `.pat` filename **stem** (basename without extension) and is made filename-safe.
  - If `UnitName` already matches the test name (common when users set `UUT_DATANAME` to the script name), the filename is de-duplicated to:
    - `<test_folder>/results/<TestName>.log`
  - Example: `dut/43019/43019-1-INPUT-420MA.pat` with `UnitName=SN123` becomes:
    - `dut/43019/results/SN123_43019-1-INPUT-420MA.log`
  - Example (de-dup): `UnitName=43019-1-INPUT-420MA` becomes:
    - `dut/43019/results/43019-1-INPUT-420MA.log`

- CSV: `<test_folder>/results/<UnitName>.csv` (only written when the script runs `SAVE`)

Notes:
- If the test lives at `dut/RESET.pat`, outputs go to `dut/results/`.

---

## The `.pat` test language

A `.pat` file is a newline-delimited script with:

1) **Header directives** (configure DBC, naming, PAT support)
2) **Step lines** in the form:

```
[Output Commands] : [Input Commands] : [Optional Flags]
```

3) **Single-line commands** like `SAVE` and `END`

### File directives

These are parsed once at startup (in `support/globals.py`):

- `UUT_DBC = <filename.dbc>` (**required**)  
  The UUT DBC file (looked up in `dbc/`).

- `UUT_DATANAME = <name>` (optional)  
  If present, becomes the UnitName and avoids the runtime prompt.

- `SUPPRESS_PAT_SUPPORT = True|False` (optional; default `False`)  
  If `True`, PATSpeak:
  - does **not** open CAN channel 1
  - does **not** load `PAT.dbc`
  - runs in “UUT-only” mode

> If `UUT_DBC` is missing, PATSpeak exits with:  
> “No DBC file specified…”

### Comments and blank lines

- Lines starting with `#` are comments.
- Blank lines are ignored.
- In verbose mode (`-v`), comment lines are echoed to the console.

### Step line grammar

A step line has **2 or 3 sections**, separated by colons `:`:

```
<outputs> : <inputs>
<outputs> : <inputs> : <flags>
```

Within `<outputs>` and `<inputs>` you can specify multiple comma-separated items.

#### Outputs
Outputs set **TX signal values**. TX frames are transmitted continuously (about every **10 ms**) by the CAN thread.

Supported output forms:

- `SignalName = <number>`  
  Sets a numeric value (float is accepted; encoding depends on the DBC).

- `SignalName = DATALOG`  
  Logs the current configured TX value of `SignalName` into the results (rare; mostly used for debugging).

- `NULL`  
  No output changes in this step.

> Output resolution: a signal is considered an “output” only if it appears in a DBC message whose **sender list includes `CTRL`**.  
> (PATSpeak transmits all messages sent by `CTRL`.)

#### Inputs
Inputs define what must be observed in the live feedback dictionaries (`UUT_Fdbk` and optionally `PAT_Fdbk`).

Supported input forms:

- `SignalName = <value> | <tolerance> | <time_seconds>`

  Example:
  ```
  NULL : MeterVolts = 14.5 | 0.5 | 0.5
  ```

  Meaning: `MeterVolts` must stay within `14.5 ± 0.5` continuously for `0.5s`.

- `SignalName = DATALOG`  
  Records the current feedback value without any pass/fail criteria (step completes immediately).

- `NULL`  
  No input checks in this step.

#### Optional flags
Flags are comma-separated `KEY=VALUE` pairs in the 3rd colon section.

Supported flags:

- `TIMEOUT = <seconds>`  
  Overrides the default timeout (default is **5s**).  
  If the input criteria is not met before the timeout, the step logs a **FAIL** and advances.

- `WAIT = <seconds>`  
  Waits that many seconds **before** evaluating inputs.  
  ⚠️ Implementation detail: `WAIT` forces the step timeout to `0` unless you place `TIMEOUT` *after* `WAIT` in the flag list.  
  In practice it’s usually clearer to split wait + check into two steps.

- `MESSAGE = <text>`  
  Displays a message and pauses until the user presses Enter.

- `HOLD = 1`  
  “Breakpoint” / infinite hold (the step will not advance). Use ESC to abort the run.

- `TAG = <label>`  
  Sets `DataLogTag`, which is appended to internal result keys (useful when you want the same signal logged under multiple operating points).

> Parsing gotcha: for normal step lines, PATSpeak removes **all spaces** before parsing.  
> That means `MESSAGE = "Check that LED is on"` becomes `MESSAGE="CheckthatLEDison"`.  
> If you want a prompt that preserves spaces, use `PAUSE-...` (below).

### Single-line commands

- `SAVE`  
  Writes collected step data to `dut/<UnitName>.csv` (append mode) and clears the in-memory buffer.

- `END` (**required**)  
  Ends the current test and writes the `.log`.

  - If you started PATSpeak with a **single** test file, the program ends after `END`.
  - If you started PATSpeak with a **folder selector**, PATSpeak continues on to the next `.pat` in that folder.

  ⚠️ If a script reaches EOF without an `END`, the runner will effectively idle forever (it keeps reading empty lines).

- `PAUSE-<prompt text>`  
  Prompts the operator and waits for Enter. This is handled before whitespace stripping, so it supports spaces naturally.

  Example:
  ```
  PAUSE-VERIFY MAIN SUPPLY IS SET TO 14.5
  ```

### Examples

Check that the main power supply is 14.5V ± 0.5V for 500 ms:

```pat
J0_10_MAIN_SUPPLY = 1, J0_08_METER_LOAD = 1 : MeterVolts = 14.5 | 0.5 | 0.5
```

Turn on a PAT pin and wait 2 seconds:

```pat
J1_08 = 1 : NULL : WAIT = 2
```

Turn off outputs and wait 300 ms:

```pat
J0_08_METER_LOAD = 0, J0_09_TEST_SUPPLY = 0, PwrRemote = 0, PwrSetVoltage = 0, PwrSetCurrent = 0 : NULL : WAIT = 0.300
```

Wait for voltmeter to read 1.0V ± 0.5V for 500 ms:

```pat
NULL : MeterVolts = 1.0 | 0.5 | 0.5
```

---

## How `.pat` steps execute

This section is based on the actual runner implementation in `support/script.py` and the CAN loop in `support/can.py`.

### Runtime loop
- The main loop calls `ProcessScript()` about every ~10 ms.
- Two CAN threads run in parallel:
  - **RX**: decode all received frames and update feedback dicts
  - **TX**: every ~10 ms, encode all CTRL messages and send them

### Pass/fail timing model
For an input like `Signal = V | Tol | Time`:

- If the feedback value stays inside tolerance, `PassTime` accumulates.
- If it ever goes outside tolerance, `PassTime` resets to 0.
- The step passes once `PassTime >= Time`.
- If `TIMEOUT` is active and `StepTime >= TIMEOUT`, the step fails and advances.

### Multiplexed UUT commands (important)
Many UUT DBCs use a multiplexed “Command” pattern (set `Command=<id>`, set params, then clear with `Command=0`).

cantools normally refuses to encode undefined mux ids (like `0`), but PATSpeak’s `support/can_db.py` emulates the legacy behavior:

- It encodes a valid mux frame and then patches the mux bits so `Command=0` still goes out on the wire.

You can force transmitting *all* mux variants each TX cycle with:

```bash
set PATSPEAK_SEND_ALL_MUX=1
```

(or `export` on Linux/macOS).

### Overlapping signals in DBCs
Some DBCs include overlapping signals. PATSpeak defaults to permissive parsing (`strict=False`) and uses a fallback bit-level decoder for overlap-heavy messages.

To force strict DBC parsing:

```bash
set PATSPEAK_DBC_STRICT=1
```

---

## DUT test suite overview (`dut/*.pat`)

This repo includes example `.pat` scripts for multiple products. Most of the larger scripts are **generated** from the corresponding `.py` file in the same folder.

### Included scripts

- **34044**
  - `34044-5-DIGITAL-NORMAL.pat` (generated by `34044-5-DIGITAL-NORMAL.py`) — large digital test sequence

- **43019**
  - `RESET.pat` (generated by `RESET.py`) — quick reset/fixture cleanup
  - `43019-1-INPUT-ALL.pat` (generated) — broad input sweep
  - `43019-1-INPUT-GLOBAL.pat` (generated) — global input tests
  - `43019-1-INPUT-FREQ.pat` / `-COUNT.pat` / `-ENCODER.pat` / `-420MA.pat` — focused input modes (generated)
  - `43019-1-INPUT-RATIO-12.pat` / `-14_5.pat` — ratio tests that use `PAUSE-...` for operator verification
    - These are generated by editing `MaxVolts` in `43019-1-INPUT-RATIO.py`

  - `43019-1-SENSOR-POWER.pat` / `-SENSOR-POWER-XTRA.pat` — sensor power tests (generated)

- **44018**
  - `44018-PWM-FULL.pat` / `44018-PWM-ABBREVIATED.pat` / `44018-PWM-100-DUTY.pat` — PWM output tests using `44018-PAT.dbc`
  - `44018_CAN_OUTPUT.pat` — UUT-only CAN output test (`SUPPRESS_PAT_SUPPORT = True`) with operator prompts via `MESSAGE=...`

---

## Development workflow options

### Option A: author `.pat` directly
Best for small scripts or quick debug.

1) Copy an existing `.pat` in `dut/`
2) Update:
   - `UUT_DBC = ...`
   - optional `UUT_DATANAME = ...`
3) Add steps
4) Ensure the script ends with:

```pat
SAVE
END
```

### Option B: generate `.pat` from Python
Best for large sweeps and parameterized test generation.

Many tests in this repo have a `dut/<name>.py` generator that emits `dut/<name>.pat`.

To regenerate **one** test (recommended pattern):

```bash
cd dut
python 43019-1-INPUT-ALL.py
cd ..
```

To regenerate **all** generators in `dut/` from the repo root:

```bash
python dut/build_all.py --dir dut
```

Notes:
- `dut/build_all.py` runs `*.py` scripts in alphabetical order (non-recursive by default).
- The `dut/arch/` folder contains archived scripts that won’t be run unless you use `--recursive`.

### Option C: run sequences with a batch file (Windows)
The repo includes `43019-1-test.bat` showing a common pattern:

- run `RESET.pat`
- run a specific functional test
- repeat

---

## CAN backend configuration

PATSpeak uses python-can and can either auto-detect hardware or be forced via environment variables.

Environment overrides:

- `PATSPEAK_CAN_INTERFACE`: `auto|pcan|kvaser|socketcan`
- `PATSPEAK_CAN_CH0`: channel 0 (UUT), e.g. `PCAN_USBBUS1`, `0`, `can0`
- `PATSPEAK_CAN_CH1`: channel 1 (PAT), e.g. `PCAN_USBBUS2`, `1`, `can1`
- `PATSPEAK_CAN_BITRATE`: default `250000`

Examples:

**Windows + PCAN**
```bash
set PATSPEAK_CAN_INTERFACE=pcan
set PATSPEAK_CAN_CH0=PCAN_USBBUS1
set PATSPEAK_CAN_CH1=PCAN_USBBUS2
set PATSPEAK_CAN_BITRATE=250000
```

**Windows + Kvaser**
```bash
set PATSPEAK_CAN_INTERFACE=kvaser
set PATSPEAK_CAN_CH0=0
set PATSPEAK_CAN_CH1=1
```

**Linux + SocketCAN**
```bash
export PATSPEAK_CAN_INTERFACE=socketcan
export PATSPEAK_CAN_CH0=can0
export PATSPEAK_CAN_CH1=can1
```

---


## Troubleshooting / gotchas

### Preflight: validate signal names against the DBCs
Before starting CAN I/O, PATSpeak scans the `.pat` script and verifies that every
signal referenced by the test exists in the configured DBC(s):

- the UUT DBC named by `UUT_DBC = ...`
- `dbc/PAT.dbc` (PAT support signals)

This is meant to catch typos and DBC/test drift early (rather than discovering it
mid-test with “signal not found!”).

When you run a *folder* selector (e.g. `python pat.py 43019`), PATSpeak will **preflight the entire suite**:
it scans every `.pat` in that folder first and prints **all** issues before starting execution.

You can control preflight behavior with an environment variable:

- `PATSPEAK_PREFLIGHT_MODE`
  - `off`: disable preflight
  - `warn`: print issues but continue
  - `error` (default): abort on errors, continue on warnings
  - `strict`: abort on errors and warnings

Optional:

- `PATSPEAK_PREFLIGHT_MAX_ISSUES` (default `200`): cap how many issues are printed

### “signal not found!”
- The signal may not exist in the chosen UUT DBC (or in `PAT.dbc`)
- For outputs: the signal must be in a message sent by `CTRL` in the DBC
- If PAT support is enabled, PATSpeak will abort if **any signal name is duplicated** across the UUT DBC and `PAT.dbc`

### Test hangs forever
Common causes:

- Missing `END`
- A step uses `WAIT=...` (which typically disables timeout) and the input criteria never becomes true
- A step uses `HOLD=1` (intentional infinite pause)

### CAN interface not detected / can’t open channel
- Install the correct vendor driver (PCAN-Basic / Kvaser CANlib)
- Or force configuration via `PATSPEAK_CAN_INTERFACE` and `PATSPEAK_CAN_CH0/CH1`
- On Linux, check SocketCAN is up: `ip link show can0`

### Platform note (Windows vs Linux)
`pat.py` currently imports `msvcrt` to detect the ESC key in the terminal, which is Windows-only.
If you want to run on Linux, you may need to adjust that section (or remove ESC handling).

### Colored PASS/FAIL output
PATSpeak will colorize terminal output similar to pytest:

- **PASS** in green
- **FAIL** in red
- **TEST** in cyan

Color is automatically disabled when output is not a TTY, or when `NO_COLOR` is set.

Optional override:

- `PATSPEAK_COLOR=always` (force color)
- `PATSPEAK_COLOR=never` (disable color)

---
