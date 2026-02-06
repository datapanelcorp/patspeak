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

### 1) Python dependencies
Run:

```bash
python prerequisite_setup.py
```

This installs:

- `python-can` (CAN interface layer)
- `cantools` (DBC parsing/encoding/decoding)
- `keyboard` (legacy dependency; not required for core execution today)

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

When you run `pat.py`, pass the **file name** (not a path). The runner automatically looks in `dut/`.

✅ Works:

```bash
python pat.py "44018-PWM-100-DUTY.pat"
python pat.py "RESET.pat" -v
python pat.py "43019-1-SENSOR-POWER.pat" -v
```

🚫 Does **not** work (it will look for `dut/dut/...`):

```bash
python pat.py "dut/RESET.pat"
```

Flags:

- `-v` enables verbose prints (signal enumeration + echoes comment lines)

### What you’ll be prompted for
If your `.pat` file **does not** include `UUT_DATANAME = ...`, the runner will prompt:

- “Type a name for the test…”

That name becomes the **UnitName** used for log/CSV output.

### Outputs generated
PATSpeak writes into `dut/` (by default):

- Log: `dut/<UnitName>_<TestFile>.log`  
  (note: `<TestFile>` includes the `.pat` extension, so logs often look like `MyUnit_RESET.pat.log`)

- CSV: `dut/<UnitName>.csv` (only written when the script runs `SAVE`)

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
  Ends the test, writes the `.log`, and exits.

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

---
