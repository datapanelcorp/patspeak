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
    severity: str  # "ERROR" | "WARN"
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
) -> bool:
    """Run preflight checks.

    Returns True if the test should continue, False if it should abort.
    """

    mode = _env_mode()
    if mode == "off":
        return True

    issues: List[Issue] = []

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

    step_idx = 0
    for file_line, raw in enumerate(lines, start=1):
        raw = raw.rstrip("\n").rstrip("\r")
        stripped = raw.strip()
        if not stripped or stripped.startswith("#"):
            continue
        if _is_directive(stripped) or _is_control(stripped):
            continue

        # Step line: mimic runtime by stripping spaces.
        step_line = stripped.replace(" ", "")
        parts = step_line.split(":")
        if len(parts) < 2:
            issues.append(
                Issue(
                    severity="ERROR",
                    file_line=file_line,
                    step=step_idx,
                    section="LINE",
                    signal="(line)",
                    reason="Malformed step line (expected 'outs : ins' with ':' separators)",
                    line_text=stripped,
                )
            )
            # Do not increment step_idx for malformed lines.
            continue

        outs = [t for t in parts[0].split(",") if t]
        ins = [t for t in parts[1].split(",") if t]

        # ---- Outputs ----
        for tok in outs:
            sig, val = _split_kv(tok)
            if sig == "NULL":
                continue
            if val is None:
                issues.append(
                    Issue(
                        severity="ERROR",
                        file_line=file_line,
                        step=step_idx,
                        section="OUT",
                        signal=sig,
                        reason="Output is missing '=value' (this would crash at runtime)",
                        line_text=stripped,
                    )
                )
                continue

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
            sig, val = _split_kv(tok)
            if sig == "NULL":
                continue
            if val is None:
                issues.append(
                    Issue(
                        severity="ERROR",
                        file_line=file_line,
                        step=step_idx,
                        section="IN",
                        signal=sig,
                        reason="Input is missing '=...' (this would crash at runtime)",
                        line_text=stripped,
                    )
                )
                continue

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

        # Only count as a step if it looks like a real step line.
        step_idx += 1

    # Print + decide.
    errors = [i for i in issues if i.severity == "ERROR"]
    warnings = [i for i in issues if i.severity == "WARN"]

    if not issues:
        print("Preflight: OK (all referenced signals exist in the configured DBCs)")
        return True

    _print_issues(issues)

    print(
        f"\nPreflight summary: {len(errors)} error(s), {len(warnings)} warning(s). "
        f"Mode={mode!r}."
    )

    if mode == "warn":
        print("Preflight mode is 'warn' -> continuing despite issues.")
        return True

    # mode == "error" or "strict"
    if errors:
        print("Preflight failed due to errors -> aborting.")
        return False

    if mode == "strict" and warnings:
        print("Preflight strict mode: warnings are treated as fatal -> aborting.")
        return False

    # Warnings only in "error" mode.
    print("Preflight completed with warnings -> continuing.")
    return True
