"""PATSpeak preflight checks.

Goal
----
Before starting CAN traffic, parse the .pat script and verify that every
signal referenced by the test exists in the relevant DBC(s).

This catches common mistakes early:
  - typos in signal names (e.g. Port2B vs Port_2B)
  - scripts that reference PAT-only signals when PAT support is suppressed
  - output signals that exist in the DBC but are not part of any CTRL/TX
    message (meaning set_tx_signal() will be a no-op)

Environment controls
--------------------
PATSPEAK_PREFLIGHT_MODE:
  - "off"   : disable preflight completely
  - "warn"  : print issues but continue
  - "error" : (default) abort on errors, continue on warnings
  - "strict": abort on errors *and* warnings
"""

from __future__ import annotations

from dataclasses import dataclass
import difflib
import os
from typing import Any, Iterable, List, Optional, Sequence, Set, Tuple


@dataclass
class Issue:
    # NOTE: "FATAL" means the script would crash or hang at runtime.
    # Preflight will abort even in "warn" mode if any FATAL issues exist.
    severity: str  # "FATAL" | "ERROR" | "WARN"
    file_line: int
    step: Optional[int]  # only populated for step lines
    section: str  # "OUT" | "IN" | "LINE"
    signal: str
    reason: str
    line_text: str
    hint: Optional[str] = None


def _env_mode() -> str:
    mode = os.environ.get("PATSPEAK_PREFLIGHT_MODE", "error").strip().lower()
    if mode in {"0", "false", "no", "off", "disable", "disabled"}:
        return "off"
    if mode in {"1", "true", "yes", "on", "enable", "enabled"}:
        return "error"
    if mode not in {"off", "warn", "error", "strict"}:
        # Be forgiving: unknown values fall back to "error".
        return "error"
    return mode


def _split_kv(token: str) -> Tuple[str, Optional[str]]:
    """Split a token like 'Signal=123' into ('Signal','123').

    Tokens may legally be just 'NULL' in PATSpeak.
    """

    if "=" not in token:
        return token, None
    left, right = token.split("=", 1)
    return left, right


def _is_directive(line: str) -> bool:
    return line.startswith("UUT_DBC") or line.startswith("UUT_DATANAME") or line.startswith(
        "SUPPRESS_PAT_SUPPORT"
    )


def _is_control(line: str) -> bool:
    return line == "END" or line == "SAVE" or line.startswith("PAUSE")


def _is_pat_command(line: str) -> bool:
    """Return True if *line* is an external-script PAT step.

    We intentionally require a delimiter after the keyword so we don't
    misclassify normal signal names like "PAT_ONLY".
    """

    return line.startswith("PAT-") or line.startswith("PAT ")


def _is_uut_txcheck_command(line: str) -> bool:
    """Return True if *line* is a UUT TX traffic check step.

    Accepted forms:
      - UUT_TXCHECK
      - UUT_TXCHECK-2.0
      - UUT_TXCHECK=2.0
    """

    return line.startswith("UUT_TXCHECK")


def _closest(signal: str, universe: Sequence[str], n: int = 3) -> List[str]:
    try:
        return difflib.get_close_matches(signal, universe, n=n, cutoff=0.6)
    except Exception:
        return []


def _format_step(step: Optional[int]) -> str:
    if step is None:
        return ""
    return f"step {str(step).zfill(5)}"


def _print_issues(issues: List[Issue]) -> None:
    if not issues:
        return

    # Keep output readable.
    max_show = int(os.environ.get("PATSPEAK_PREFLIGHT_MAX_ISSUES", "200"))
    shown = issues[:max_show]

    print("\n=== Preflight issues ===")
    for iss in shown:
        loc = f"line {iss.file_line}"
        step = _format_step(iss.step)
        if step:
            loc = f"{loc}, {step}"
        print(f"{iss.severity}: {loc}: [{iss.section}] {iss.signal}: {iss.reason}")
        print(f"  {iss.line_text}")
        if iss.hint:
            print(f"  hint: {iss.hint}")

    if len(issues) > max_show:
        print(f"... {len(issues) - max_show} more issue(s) not shown (adjust PATSPEAK_PREFLIGHT_MAX_ISSUES)")


def run_preflight(
    lines: Sequence[str],
    *,
    uut_db: Any,
    pat_db_runtime: Optional[Any],
    pat_db_for_check: Optional[Any],
    uut_dbc_name: str,
    pat_dbc_name: str,
    pat_support_active: bool,
    suite: bool = False,
) -> bool:
    """Run preflight checks.

    Returns True if the test should continue, False if it should abort.
    """

    mode = _env_mode()
    if mode == "off":
        return True

    issues: List[Issue] = []

    # -----------------
    # Basic script sanity
    # -----------------
    # Missing END causes the runner to loop forever at EOF.
    end_any = False
    end_exact = False
    for raw in lines:
        s = raw.strip()
        if not s or s.startswith("#"):
            continue
        if s.upper() == "END":
            end_any = True
        if s == "END":
            end_exact = True
    if not end_any:
        issues.append(
            Issue(
                severity="FATAL",
                file_line=1,
                step=None,
                section="LINE",
                signal="END",
                reason="Missing END line (runner will never finish at EOF)",
                line_text="(file)",
                hint="Add a final line containing exactly: END",
            )
        )
    elif not end_exact:
        issues.append(
            Issue(
                severity="FATAL",
                file_line=1,
                step=None,
                section="LINE",
                signal="END",
                reason="END must be uppercase exactly (runner checks for 'END')",
                line_text="(file)",
                hint="Change 'end' / 'End' to 'END'.",
            )
        )

    # Build signal universes.
    uut_signals: Set[str] = set(uut_db.iter_signal_names())
    pat_signals: Set[str] = set(pat_db_for_check.iter_signal_names()) if pat_db_for_check is not None else set()

    # For suggestions.
    universe = sorted(uut_signals | pat_signals)

    # Convenience function for membership resolution.
    def resolve_db(sig: str) -> Tuple[Optional[str], Optional[Any]]:
        """Return (dbc_name, db) where the signal lives for this run."""

        in_uut = sig in uut_signals
        in_pat = sig in pat_signals

        if pat_support_active:
            # In PAT-enabled runs, duplicates are already blocked earlier.
            if in_uut:
                return uut_dbc_name, uut_db
            if in_pat and pat_db_runtime is not None:
                return pat_dbc_name, pat_db_runtime
            # If PAT runtime DB isn't loaded but pat_signals says it exists,
            # still return PAT for messaging.
            if in_pat:
                return pat_dbc_name, pat_db_runtime
            return None, None
        else:
            # PAT suppressed: treat UUT as the only usable DB.
            if in_uut:
                return uut_dbc_name, uut_db
            if in_pat:
                return pat_dbc_name, None
            return None, None

    def _boolish(val: str) -> bool:
        v = (val or "").strip().strip('"').strip("'").lower()
        return v in {"1", "true", "yes", "on", "0", "false", "no", "off"}

    step_idx = 0
    for file_line, raw in enumerate(lines, start=1):
        raw = raw.rstrip("\n").rstrip("\r")
        stripped = raw.strip()
        if not stripped or stripped.startswith("#"):
            continue

        # The runner uses exact-case keywords. Catch common capitalization mistakes
        # early so they don't show up as confusing "malformed step line" errors.
        upper = stripped.upper()

        if upper in {"END", "SAVE"} and stripped not in {"END", "SAVE"}:
            issues.append(
                Issue(
                    severity="FATAL",
                    file_line=file_line,
                    step=None,
                    section="LINE",
                    signal=stripped,
                    reason="Control keyword must be uppercase exactly",
                    line_text=stripped,
                    hint="Use END or SAVE in uppercase.",
                )
            )
            continue

        if upper.startswith("PAUSE") and not stripped.startswith("PAUSE"):
            issues.append(
                Issue(
                    severity="FATAL",
                    file_line=file_line,
                    step=None,
                    section="LINE",
                    signal=stripped.split("-", 1)[0],
                    reason="PAUSE must be uppercase exactly",
                    line_text=stripped,
                    hint="Example: PAUSE-Press Enter to continue",
                )
            )
            continue

        # External script step: PAT <script> [args...] or PAT-<script> ...
        # The runtime checks these case-sensitively before parsing ':' steps,
        # so wrong-case usage would fall through and crash as a malformed step.
        if (upper.startswith("PAT-") or upper.startswith("PAT ")) and not _is_pat_command(stripped):
            issues.append(
                Issue(
                    severity="FATAL",
                    file_line=file_line,
                    step=None,
                    section="LINE",
                    signal=stripped.split("-", 1)[0].split(" ", 1)[0],
                    reason="PAT must be uppercase exactly",
                    line_text=stripped,
                    hint="Example: PAT my_script.py --arg 1",
                )
            )
            continue

        # UUT_TXCHECK is also checked case-sensitively before ':' parsing.
        if upper.startswith("UUT_TXCHECK") and not stripped.startswith("UUT_TXCHECK"):
            issues.append(
                Issue(
                    severity="FATAL",
                    file_line=file_line,
                    step=None,
                    section="LINE",
                    signal=stripped.split("-", 1)[0].split("=", 1)[0],
                    reason="UUT_TXCHECK must be uppercase exactly",
                    line_text=stripped,
                    hint="Example: UUT_TXCHECK-2.0",
                )
            )
            continue

        if upper.startswith("UUT_DBC") and not stripped.startswith("UUT_DBC"):
            issues.append(
                Issue(
                    severity="FATAL",
                    file_line=file_line,
                    step=None,
                    section="LINE",
                    signal=stripped.split("=", 1)[0].strip(),
                    reason="UUT_DBC must be uppercase exactly (runner won't detect it otherwise)",
                    line_text=stripped,
                    hint="Use: UUT_DBC = filename.dbc",
                )
            )
            continue

        if upper.startswith("UUT_DATANAME") and not stripped.startswith("UUT_DATANAME"):
            issues.append(
                Issue(
                    severity="FATAL",
                    file_line=file_line,
                    step=None,
                    section="LINE",
                    signal=stripped.split("=", 1)[0].strip(),
                    reason="UUT_DATANAME must be uppercase exactly (runner won't detect it otherwise)",
                    line_text=stripped,
                    hint="Use: UUT_DATANAME = SomeName",
                )
            )
            continue

        if upper.startswith("SUPPRESS_PAT_SUPPORT") and not stripped.startswith("SUPPRESS_PAT_SUPPORT"):
            issues.append(
                Issue(
                    severity="FATAL",
                    file_line=file_line,
                    step=None,
                    section="LINE",
                    signal=stripped.split("=", 1)[0].strip(),
                    reason="SUPPRESS_PAT_SUPPORT must be uppercase exactly (runner won't detect it otherwise)",
                    line_text=stripped,
                    hint="Use: SUPPRESS_PAT_SUPPORT = True",
                )
            )
            continue

        # -----------------
        # Directives / controls syntax
        # -----------------
        if _is_directive(stripped):
            if "=" not in stripped:
                issues.append(
                    Issue(
                        severity="FATAL",
                        file_line=file_line,
                        step=None,
                        section="LINE",
                        signal=stripped.split()[0],
                        reason="Directive is missing '=' (this would crash during initialization)",
                        line_text=stripped,
                        hint="Use 'NAME = value' (spaces optional).",
                    )
                )
                continue
            key, val = stripped.split("=", 1)
            key = key.strip()
            val = val.strip().strip('"').strip("'")
            if not val:
                issues.append(
                    Issue(
                        severity="FATAL",
                        file_line=file_line,
                        step=None,
                        section="LINE",
                        signal=key,
                        reason="Directive value is empty (this would crash during initialization)",
                        line_text=stripped,
                    )
                )
                continue
            if "#" in val:
                issues.append(
                    Issue(
                        severity="WARN" if mode != "strict" else "ERROR",
                        file_line=file_line,
                        step=None,
                        section="LINE",
                        signal=key,
                        reason="Inline comments are not supported on directive lines; value includes '#'.",
                        line_text=stripped,
                        hint="Put comments on their own line starting with '#'.",
                    )
                )

            if key == "UUT_DBC" and not val.lower().endswith(".dbc"):
                issues.append(
                    Issue(
                        severity="WARN" if mode != "strict" else "ERROR",
                        file_line=file_line,
                        step=None,
                        section="LINE",
                        signal=key,
                        reason="UUT_DBC value does not end with '.dbc'",
                        line_text=stripped,
                    )
                )
            if key.startswith("SUPPRESS_PAT_SUPPORT") and not _boolish(val):
                issues.append(
                    Issue(
                        severity="WARN",
                        file_line=file_line,
                        step=None,
                        section="LINE",
                        signal=key,
                        reason="SUPPRESS_PAT_SUPPORT value is not a recognized boolean literal",
                        line_text=stripped,
                        hint="Use True/False (or 1/0).",
                    )
                )
            continue

        if _is_control(stripped):
            if stripped.startswith("PAUSE"):
                if "-" not in stripped:
                    issues.append(
                        Issue(
                            severity="FATAL",
                            file_line=file_line,
                            step=None,
                            section="LINE",
                            signal="PAUSE",
                            reason="PAUSE is missing '-' prompt separator (this would crash at runtime)",
                            line_text=stripped,
                            hint="Example: PAUSE-Press Enter to continue",
                        )
                    )
                else:
                    prompt = stripped.split("-", 1)[1].strip()
                    if not prompt:
                        issues.append(
                            Issue(
                                severity="FATAL",
                                file_line=file_line,
                                step=None,
                                section="LINE",
                                signal="PAUSE",
                                reason="PAUSE prompt is empty (this would crash at runtime)",
                                line_text=stripped,
                                hint="Example: PAUSE-Press Enter to continue",
                            )
                        )
            elif stripped.upper() in {"END", "SAVE"} and stripped not in {"END", "SAVE"}:
                # Runner checks exact case for these.
                issues.append(
                    Issue(
                        severity="FATAL",
                        file_line=file_line,
                        step=None,
                        section="LINE",
                        signal=stripped,
                        reason="Control keyword must be uppercase exactly",
                        line_text=stripped,
                        hint="Use END or SAVE in uppercase.",
                    )
                )
            continue

        # -----------------
        # PAT external-script step (no ':' grammar)
        # -----------------
        if _is_pat_command(stripped):
            # Validate that a script token exists. The runtime will treat a
            # missing token as a FAIL step (not a crash), but it's almost
            # certainly a test authoring error.
            rest = ""
            if stripped.startswith("PAT-"):
                rest = stripped.split("-", 1)[1].strip()
            elif stripped.startswith("PAT "):
                rest = stripped[len("PAT ") :].strip()

            if not rest:
                issues.append(
                    Issue(
                        severity="ERROR",
                        file_line=file_line,
                        step=step_idx,
                        section="LINE",
                        signal="PAT",
                        reason="PAT is missing a script name",
                        line_text=stripped,
                        hint="Example: PAT dp800_sweep_ch2.py --channel 2",
                    )
                )

            # Count this as a step line and move on.
            step_idx += 1
            continue

        # -----------------
        # UUT TX traffic check step (no ':' grammar)
        # -----------------
        if _is_uut_txcheck_command(stripped):
            # Optional syntax: UUT_TXCHECK-<timeout_s> or UUT_TXCHECK=<timeout_s>
            rest = stripped[len("UUT_TXCHECK") :].strip()
            if rest:
                if rest[0] not in {"-", "="}:
                    issues.append(
                        Issue(
                            severity="WARN" if mode != "strict" else "ERROR",
                            file_line=file_line,
                            step=step_idx,
                            section="LINE",
                            signal="UUT_TXCHECK",
                            reason="Unexpected UUT_TXCHECK syntax (expected '-' or '=' timeout separator)",
                            line_text=stripped,
                            hint="Example: UUT_TXCHECK-2.0",
                        )
                    )
                else:
                    val = rest[1:].strip()
                    if val:
                        try:
                            float(val)
                        except Exception:
                            issues.append(
                                Issue(
                                    severity="ERROR" if mode != "warn" else "WARN",
                                    file_line=file_line,
                                    step=step_idx,
                                    section="LINE",
                                    signal="UUT_TXCHECK",
                                    reason="Timeout value is not a valid number",
                                    line_text=stripped,
                                    hint="Example: UUT_TXCHECK-2.0",
                                )
                            )

            # Count this as a step line and move on.
            step_idx += 1
            continue

        # -----------------
        # Step line syntax
        # -----------------
        if "\t" in raw:
            issues.append(
                Issue(
                    severity="WARN" if mode != "strict" else "ERROR",
                    file_line=file_line,
                    step=step_idx,
                    section="LINE",
                    signal="(whitespace)",
                    reason="Tab character found; runtime only strips spaces and this may break parsing",
                    line_text=stripped,
                    hint="Replace tabs with spaces.",
                )
            )

        if "#" in stripped:
            issues.append(
                Issue(
                    severity="WARN" if mode != "strict" else "ERROR",
                    file_line=file_line,
                    step=step_idx,
                    section="LINE",
                    signal="(comment)",
                    reason="Inline comments are not supported; '#' will be parsed as part of the step",
                    line_text=stripped,
                    hint="Put comments on their own line starting with '#'.",
                )
            )

        # Mimic runtime: it strips ONLY space characters, not all whitespace.
        step_line = stripped.replace(" ", "")
        parts = step_line.split(":")
        if len(parts) < 2:
            issues.append(
                Issue(
                    severity="FATAL",
                    file_line=file_line,
                    step=step_idx,
                    section="LINE",
                    signal="(line)",
                    reason="Malformed step line (expected 'outs:ins[:flags]') (this would crash at runtime)",
                    line_text=stripped,
                )
            )
            # Do not increment step_idx for malformed lines.
            continue

        if len(parts) > 3:
            issues.append(
                Issue(
                    severity="ERROR",
                    file_line=file_line,
                    step=step_idx,
                    section="LINE",
                    signal="(line)",
                    reason="Too many ':' sections (runner only supports 'outs:ins' or 'outs:ins:flags')",
                    line_text=stripped,
                    hint="Remove extra ':' characters (e.g. in MESSAGE text).",
                )
            )

        outs_raw = parts[0]
        ins_raw = parts[1] if len(parts) >= 2 else ""
        flags_raw = parts[2] if len(parts) >= 3 else None

        # Runtime does Outs = IO[0].split(',') and Ins = IO[1].split(',') WITHOUT filtering.
        outs = outs_raw.split(",")
        ins = ins_raw.split(",")
        flags = flags_raw.split(",") if flags_raw is not None else []

        if len(outs) == 1 and outs[0] == "":
            issues.append(
                Issue(
                    severity="FATAL",
                    file_line=file_line,
                    step=step_idx,
                    section="OUT",
                    signal="(empty)",
                    reason="OUT section is empty (this would crash at runtime)",
                    line_text=stripped,
                    hint="Use 'NULL' if you have no outputs.",
                )
            )
        if len(ins) == 1 and ins[0] == "":
            issues.append(
                Issue(
                    severity="FATAL",
                    file_line=file_line,
                    step=step_idx,
                    section="IN",
                    signal="(empty)",
                    reason="IN section is empty (this would crash at runtime)",
                    line_text=stripped,
                    hint="Use 'NULL' if you have no inputs.",
                )
            )

        # ---- Outputs ----
        for tok in outs:
            if tok == "":
                issues.append(
                    Issue(
                        severity="FATAL",
                        file_line=file_line,
                        step=step_idx,
                        section="OUT",
                        signal="(empty token)",
                        reason="Empty output token (trailing/double comma) (this would crash at runtime)",
                        line_text=stripped,
                        hint="Remove trailing commas or add 'NULL'.",
                    )
                )
                continue

            if tok.count("=") > 1:
                issues.append(
                    Issue(
                        severity="WARN" if mode != "strict" else "ERROR",
                        file_line=file_line,
                        step=step_idx,
                        section="OUT",
                        signal=tok.split("=", 1)[0],
                        reason="Output token contains multiple '='; runner uses the first value only",
                        line_text=stripped,
                    )
                )

            sig, val = _split_kv(tok)
            if sig == "NULL":
                continue
            if val is None:
                issues.append(
                    Issue(
                        severity="FATAL",
                        file_line=file_line,
                        step=step_idx,
                        section="OUT",
                        signal=sig,
                        reason="Output is missing '=value' (this would crash at runtime)",
                        line_text=stripped,
                    )
                )
                continue

            if val == "":
                issues.append(
                    Issue(
                        severity="ERROR",
                        file_line=file_line,
                        step=step_idx,
                        section="OUT",
                        signal=sig,
                        reason="Output has an empty value; runner will ignore it",
                        line_text=stripped,
                        hint="Use a numeric value (e.g. 1) or DATALOG.",
                    )
                )
                # Still allow existence checks below.

            # Output values must be numeric or DATALOG. Non-numeric outputs don't crash
            # but become a no-op in the runner.
            if val and val != "DATALOG":
                try:
                    float(val)
                except Exception:
                    issues.append(
                        Issue(
                            severity="WARN" if mode != "strict" else "ERROR",
                            file_line=file_line,
                            step=step_idx,
                            section="OUT",
                            signal=sig,
                            reason="Output value is not numeric (and not DATALOG); runner will ignore it",
                            line_text=stripped,
                            hint="Use a numeric value, or exactly: DATALOG",
                        )
                    )

            dbc_name, db = resolve_db(sig)
            if dbc_name is None:
                hint = None
                close = _closest(sig, universe)
                if close:
                    hint = "Did you mean: " + ", ".join(close)
                issues.append(
                    Issue(
                        severity="ERROR",
                        file_line=file_line,
                        step=step_idx,
                        section="OUT",
                        signal=sig,
                        reason=f"Signal not found in {uut_dbc_name} or {pat_dbc_name}",
                        line_text=stripped,
                        hint=hint,
                    )
                )
                continue

            if not pat_support_active and dbc_name == pat_dbc_name:
                issues.append(
                    Issue(
                        severity="ERROR",
                        file_line=file_line,
                        step=step_idx,
                        section="OUT",
                        signal=sig,
                        reason=f"Signal exists in {pat_dbc_name} but PAT support is suppressed",
                        line_text=stripped,
                        hint="Remove 'SUPPRESS_PAT_SUPPORT = True' or remove PAT-only signals from the test.",
                    )
                )
                continue

            # If we can resolve a DB object, check TX-settable capability.
            if db is not None:
                is_tx = bool(getattr(db, "has_tx_signal", lambda _s: False)(sig))
                if not is_tx:
                    sev = "WARN" if mode != "strict" else "ERROR"
                    issues.append(
                        Issue(
                            severity=sev,
                            file_line=file_line,
                            step=step_idx,
                            section="OUT",
                            signal=sig,
                            reason=(
                                f"Signal is defined in {dbc_name} but is not in any TX/CTRL message; "
                                "set_tx_signal() will be a no-op"
                            ),
                            line_text=stripped,
                            hint=(
                                "If this is intended to be set by PATSpeak, ensure the parent message sender is 'CTRL' "
                                "in the DBC, or update the test to write a signal that *is* in a CTRL message."
                            ),
                        )
                    )

        # ---- Inputs ----
        for tok in ins:
            if tok == "":
                issues.append(
                    Issue(
                        severity="FATAL",
                        file_line=file_line,
                        step=step_idx,
                        section="IN",
                        signal="(empty token)",
                        reason="Empty input token (trailing/double comma) (this would crash at runtime)",
                        line_text=stripped,
                        hint="Remove trailing commas or add 'NULL'.",
                    )
                )
                continue

            if tok.count("=") > 1:
                issues.append(
                    Issue(
                        severity="WARN" if mode != "strict" else "ERROR",
                        file_line=file_line,
                        step=step_idx,
                        section="IN",
                        signal=tok.split("=", 1)[0],
                        reason="Input token contains multiple '='; runner uses the first value only",
                        line_text=stripped,
                    )
                )

            sig, val = _split_kv(tok)
            if sig == "NULL":
                continue
            if val is None:
                issues.append(
                    Issue(
                        severity="FATAL",
                        file_line=file_line,
                        step=step_idx,
                        section="IN",
                        signal=sig,
                        reason="Input is missing '=...' (this would crash at runtime)",
                        line_text=stripped,
                    )
                )
                continue

            if val == "":
                issues.append(
                    Issue(
                        severity="FATAL",
                        file_line=file_line,
                        step=step_idx,
                        section="IN",
                        signal=sig,
                        reason="Input has an empty value (this would crash at runtime)",
                        line_text=stripped,
                        hint="Use DATALOG or 'value|tol|time'.",
                    )
                )
                continue

            # Input values must be either DATALOG or value|tol|time.
            if val != "DATALOG":
                parts_v = val.split("|")
                if len(parts_v) != 3:
                    issues.append(
                        Issue(
                            severity="FATAL",
                            file_line=file_line,
                            step=step_idx,
                            section="IN",
                            signal=sig,
                            reason="Input must be 'DATALOG' or 'value|tol|time' (this would crash at runtime)",
                            line_text=stripped,
                            hint="Example: Port_1A=5.0|0.155|0.1",
                        )
                    )
                else:
                    try:
                        float(parts_v[0])
                        float(parts_v[1])
                        float(parts_v[2])
                    except Exception:
                        issues.append(
                            Issue(
                                severity="FATAL",
                                file_line=file_line,
                                step=step_idx,
                                section="IN",
                                signal=sig,
                                reason="Input value|tol|time parts must be numeric (this would crash at runtime)",
                                line_text=stripped,
                                hint="Example: Port_1A=5.0|0.155|0.1",
                            )
                        )

            dbc_name, db = resolve_db(sig)
            if dbc_name is None:
                hint = None
                close = _closest(sig, universe)
                if close:
                    hint = "Did you mean: " + ", ".join(close)
                issues.append(
                    Issue(
                        severity="ERROR",
                        file_line=file_line,
                        step=step_idx,
                        section="IN",
                        signal=sig,
                        reason=f"Signal not found in {uut_dbc_name} or {pat_dbc_name}",
                        line_text=stripped,
                        hint=hint,
                    )
                )
                continue

            if not pat_support_active and dbc_name == pat_dbc_name:
                issues.append(
                    Issue(
                        severity="ERROR",
                        file_line=file_line,
                        step=step_idx,
                        section="IN",
                        signal=sig,
                        reason=f"Signal exists in {pat_dbc_name} but PAT support is suppressed",
                        line_text=stripped,
                        hint="Remove 'SUPPRESS_PAT_SUPPORT = True' or remove PAT-only signals from the test.",
                    )
                )
                continue

        # ---- Flags (3rd section) ----
        if flags_raw is not None:
            if flags_raw == "":
                issues.append(
                    Issue(
                        severity="WARN" if mode != "strict" else "ERROR",
                        file_line=file_line,
                        step=step_idx,
                        section="LINE",
                        signal="(flags)",
                        reason="Empty flags section (trailing ':') has no effect",
                        line_text=stripped,
                    )
                )

            for ftok in flags:
                if ftok == "":
                    issues.append(
                        Issue(
                            severity="WARN" if mode != "strict" else "ERROR",
                            file_line=file_line,
                            step=step_idx,
                            section="LINE",
                            signal="(flags)",
                            reason="Empty flag token (trailing/double comma) will be ignored",
                            line_text=stripped,
                        )
                    )
                    continue

                key, fval = _split_kv(ftok)
                key_up = key.upper()
                known = {"TIMEOUT", "HOLD", "WAIT", "MESSAGE", "TAG"}

                if key_up in known:
                    if fval is None:
                        issues.append(
                            Issue(
                                severity="FATAL",
                                file_line=file_line,
                                step=step_idx,
                                section="LINE",
                                signal=key,
                                reason="Flag is missing '=value' (this would crash at runtime)",
                                line_text=stripped,
                            )
                        )
                        continue
                    if fval == "":
                        issues.append(
                            Issue(
                                severity="FATAL",
                                file_line=file_line,
                                step=step_idx,
                                section="LINE",
                                signal=key,
                                reason="Flag has an empty value (this would crash at runtime)",
                                line_text=stripped,
                            )
                        )
                        continue

                    if key_up in {"TIMEOUT", "HOLD", "WAIT"}:
                        try:
                            float(fval)
                        except Exception:
                            issues.append(
                                Issue(
                                    severity="FATAL",
                                    file_line=file_line,
                                    step=step_idx,
                                    section="LINE",
                                    signal=key,
                                    reason="Flag value must be numeric (this would crash at runtime)",
                                    line_text=stripped,
                                    hint=f"Example: {key_up}=0.5",
                                )
                            )
                else:
                    # Unknown flags are ignored by runtime, but it's usually a typo.
                    issues.append(
                        Issue(
                            severity="WARN" if mode != "strict" else "ERROR",
                            file_line=file_line,
                            step=step_idx,
                            section="LINE",
                            signal=key,
                            reason="Unknown flag (runner will ignore it)",
                            line_text=stripped,
                        )
                    )

        # Count this as a step line (even if it has issues).
        step_idx += 1

    # Print + decide.
    fatals = [i for i in issues if i.severity == "FATAL"]
    errors = [i for i in issues if i.severity == "ERROR"]
    warnings = [i for i in issues if i.severity == "WARN"]

    if not issues:
        print("Preflight: OK (all referenced signals exist in the configured DBCs)")
        return True

    _print_issues(issues)

    print(
        f"\nPreflight summary: {len(fatals)} fatal, {len(errors)} error(s), {len(warnings)} warning(s). "
        f"Mode={mode!r}."
    )

    # Fatal issues mean the runner would crash/hang; do not continue.
    if fatals:
        if suite:
            print("Preflight failed due to fatal syntax/config issues -> this test would crash/hang.")
        else:
            print("Preflight failed due to fatal syntax/config issues -> aborting.")
        return False
    if mode == "warn":
        if suite:
            print("Preflight mode is 'warn' -> continuing despite issues (suite preflight).")
        else:
            print("Preflight mode is 'warn' -> continuing despite issues.")
        return True

    # mode == "error" or "strict"
    if errors:
        if suite:
            print("Preflight failed due to errors -> this test would abort.")
        else:
            print("Preflight failed due to errors -> aborting.")
        return False

    if mode == "strict" and warnings:
        if suite:
            print("Preflight strict mode: warnings are treated as fatal -> this test would abort.")
        else:
            print("Preflight strict mode: warnings are treated as fatal -> aborting.")
        return False

    # Warnings only in "error" mode.
    if suite:
        print("Preflight completed with warnings -> continuing (suite preflight).")
    else:
        print("Preflight completed with warnings -> continuing.")
    return True


def suite_preflight(
    test_refs: Sequence[str],
    *,
    dut_root: str,
    dbc_root: str,
) -> bool:
    """Run preflight across a suite of tests and show *all* issues up front.

    This is intended for folder runs (many .pat files). We preflight every test
    first, print all issues, and only then decide whether the run should start.

    Returns True if the suite should continue, False if it should abort.

    Decision policy is governed by PATSPEAK_PREFLIGHT_MODE (same as run_preflight).
    """

    mode = _env_mode()
    if mode == "off":
        return True

    if not test_refs:
        return True

    # Lazy import to keep this module lightweight for single-test paths.
    from .can_db import CanDb

    print("\n" + "=" * 80)
    print(f"Suite preflight: {len(test_refs)} test(s)  (Mode={mode!r})")
    print("=" * 80)

    # Simple DBC cache to avoid re-loading the same file repeatedly.
    dbc_cache: dict[str, Any] = {}

    def load_dbc(abs_path: str) -> Any:
        abs_path = os.path.abspath(abs_path)
        if abs_path in dbc_cache:
            return dbc_cache[abs_path]
        db = CanDb(dbc_filename=abs_path)
        dbc_cache[abs_path] = db
        return db

    pat_dbc_name = "PAT.dbc"
    pat_abs = os.path.join(os.path.abspath(dbc_root), pat_dbc_name)

    suite_ok = True
    hard_fail = False

    for idx, test_ref in enumerate(test_refs, start=1):
        print("\n" + "-" * 80)
        print(f"[{idx}/{len(test_refs)}] Preflight: {test_ref}")
        print("-" * 80)

        # Resolve test path.
        test_path = test_ref if os.path.isabs(test_ref) else os.path.join(os.path.abspath(dut_root), test_ref)

        try:
            with open(test_path, "r", encoding="utf-8", errors="replace") as f:
                lines = f.readlines()
        except Exception as e:
            print(f"ERROR: Could not read test file: {test_path}")
            print(f"  {e}")
            suite_ok = False
            hard_fail = True
            continue

        # Parse directives.
        uut_dbc_name: Optional[str] = None
        suppress_pat = False

        for raw in lines:
            line = raw.strip()
            if not line or line.startswith("#"):
                continue
            up = line.upper()
            if up.startswith("UUT_DBC"):
                if "=" not in line:
                    continue
                uut_dbc_name = line.split("=", 1)[1].strip().strip('"').strip("'")
                continue
            if up.startswith("SUPPRESS_PAT_SUPPORT"):
                if "=" not in line:
                    continue
                val = line.split("=", 1)[1].strip().strip('"').strip("'").lower()
                suppress_pat = val in {"1", "true", "yes", "on"}
                continue

        if not uut_dbc_name:
            print("ERROR: No DBC file specified in script.")
            print("  Add:  UUT_DBC = filename.dbc")
            suite_ok = False
            hard_fail = True
            continue

        uut_abs = os.path.join(os.path.abspath(dbc_root), uut_dbc_name)
        if not os.path.isfile(uut_abs):
            print(f"ERROR: UUT DBC file not found: {uut_abs}")
            suite_ok = False
            hard_fail = True
            continue

        # Load DBCs.
        try:
            uut_db = load_dbc(uut_abs)
        except Exception as e:
            print(f"ERROR: Failed to load UUT DBC: {uut_dbc_name}")
            print(f"  {e}")
            suite_ok = False
            hard_fail = True
            continue

        pat_db_runtime = None
        pat_db_for_check = None

        if suppress_pat:
            # PAT suppressed: runtime DB is None.
            # For preflight messaging only, we *try* to load PAT.dbc.
            if os.path.isfile(pat_abs):
                try:
                    pat_db_for_check = load_dbc(pat_abs)
                except Exception:
                    pat_db_for_check = None
        else:
            # PAT enabled: PAT.dbc must be loadable.
            if not os.path.isfile(pat_abs):
                print(f"ERROR: PAT support enabled but {pat_dbc_name} not found: {pat_abs}")
                suite_ok = False
                hard_fail = True
                continue
            try:
                pat_db_runtime = load_dbc(pat_abs)
                pat_db_for_check = pat_db_runtime
            except Exception as e:
                print(f"ERROR: Failed to load {pat_dbc_name} (PAT support is enabled)")
                print(f"  {e}")
                suite_ok = False
                hard_fail = True
                continue

            # Duplicate signals are fatal when PAT support is active.
            try:
                pat_signals = set(pat_db_runtime.iter_signal_names())
                uut_signals = set(uut_db.iter_signal_names())
                dupes = sorted(pat_signals.intersection(uut_signals))
            except Exception:
                dupes = []

            if dupes:
                show = ", ".join(dupes[:10])
                more = "" if len(dupes) <= 10 else f" (+{len(dupes) - 10} more)"
                print("ERROR: Duplicate signal(s) found in both UUT and PAT DBCs. This run would abort.")
                print(f"  Examples: {show}{more}")
                suite_ok = False
                hard_fail = True
                # Skip deeper per-line checks; fix duplicates first.
                continue

        pat_support_active = (not suppress_pat) and (pat_db_runtime is not None)
        ok = run_preflight(
            lines,
            uut_db=uut_db,
            pat_db_runtime=pat_db_runtime,
            pat_db_for_check=pat_db_for_check,
            uut_dbc_name=uut_dbc_name,
            pat_dbc_name=pat_dbc_name,
            pat_support_active=pat_support_active,
            suite=True,
        )
        if not ok:
            suite_ok = False
            # In warn mode, run_preflight() only returns False when there are
            # FATAL issues (runner would crash/hang). Treat that as a hard fail
            # regardless of mode.
            if mode == "warn":
                hard_fail = True

    print("\n" + "=" * 80)
    if suite_ok:
        print("Suite preflight: OK -> starting execution")
        print("=" * 80)
        return True

    print("Suite preflight: FAILED -> fix the issues above before running")
    print("=" * 80)

    # Some issues are not 'preflight-mode controllable' (e.g. missing files/DBCs).
    # If we hit those, we cannot continue even in warn mode.
    if hard_fail:
        print("Suite preflight detected configuration errors that prevent running -> aborting.")
        return False

    # In warn mode, suite_preflight is informational only for signal/step issues.
    if mode == "warn":
        print("Preflight mode is 'warn' -> continuing despite suite issues.")
        return True

    return False
