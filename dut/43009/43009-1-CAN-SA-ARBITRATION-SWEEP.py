import os


script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
script_dir = os.path.dirname(os.path.abspath(__file__))
datafile = os.path.join(script_dir, TestName + ".pat")


BASE_SA = 0xD9
MIN_SA = 0xD9
MAX_SA = 0xE0
CTRL_SA = 0xD1

# Timing tuned from existing 43009 SA/message-enable patterns.
SET_SA_WAIT_S = "0.10"
SET_DISABLE_WAIT_S = "0.80"
SET_ENABLE_WAIT_S = "0.80"
SET_ENABLE_REASSERT_WAIT_S = "0.40"
CHECK_STAT_TIMEOUT_S = "1.50"
CHECK_PRESENT_TIMEOUT_S = "1.50"
CHECK_ABSENT_TIMEOUT_S = "1.50"
CHECK_ARBITRATION_ONLINE_TIMEOUT_S = "3.00"
CHECK_ARBITRATION_OFFLINE_TIMEOUT_S = "1.50"
CHECK_OLD_SA_ABSENT_TIMEOUT_S = "0.30"
CLAIM_SPACING_S = "0.05"
CLAIM_SETTLE_WAIT_S = "0.60"
KEEPALIVE_WAIT_S = "0.20"
RECOVERY_SETTLE_WAIT_S = "0.20"
REBOOT_OFF_WAIT_S = "1.00"
REBOOT_ON_WAIT_S = "2.00"
REBOOT_SETTLE_WAIT_S = "1.00"

DISABLE_RETRY_COUNT = 1
ENABLE_RETRY_COUNT = 1
ENABLE_REASSERT_RETRY_COUNT = 1
SET_SA_RETRY_COUNT = 2
CLAIM_BURST_COUNT = 6
RECOVERY_SWEEP_RETRY_COUNT = 2
KEEPALIVE_RETRY_COUNT = 2

# J1939 NAME arbitration vectors under test.
# - LOSING name: very large numeric value (should lose arbitration)
# - WINNING name: very small numeric value (should win arbitration)
LOSING_NAME_BYTES = "0xFE 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF"
WINNING_NAME_BYTES = "0x01 0x00 0x00 0x00 0x00 0x00 0x00 0x00"

# Spec expectation for same-SA address-claim contention:
# - losing NAME: UUT stays online
# - winning NAME: UUT goes offline
LOSING_EXPECT_ONLINE = True
WINNING_EXPECT_ONLINE = False

PERIODIC_MSG_PREFIXES = [
    ("STAT", 0x18EFD100),
    ("DIGIN", 0x18FF1500),
    ("AD2", 0x18FF1600),
    ("AD3", 0x18FF1700),
    ("AD4", 0x18FF1800),
    ("DPLF2", 0x18FFFC00),
    ("FAULT", 0x18FFE600),
]


def add_reboot_cycle(out_lines: list[str]) -> None:
    out_lines.append("RLY_K1 = 0 : NULL : WAIT = " + REBOOT_OFF_WAIT_S)
    out_lines.append("RLY_K1 = 1 : NULL : WAIT = " + REBOOT_ON_WAIT_S)
    out_lines.append("RLY_K1 = 0 : NULL : WAIT = " + REBOOT_SETTLE_WAIT_S)


def fmt_id(can_id: int) -> str:
    return "0x" + f"{can_id:08X}"


def ctrl1_id_for_dest(dest_sa: int) -> int:
    # 0x18EF<dest><ctrl_src>
    return 0x18EF0000 | ((dest_sa & 0xFF) << 8) | (CTRL_SA & 0xFF)


def claim_id_for_sa(sa: int) -> int:
    # Address Claimed PGN 0xEE00 to global destination:
    # 0x18EEFF<source_sa>
    return 0x18EEFF00 | (sa & 0xFF)


def cmd_set_sa_payload(next_sa: int) -> str:
    # Command 0x11 CAN config with reserved bytes left at 0xFF and d29/d30 set.
    return " ".join(
        [
            "0x11",
            "0x51",
            "0x50",
            "0x" + f"{next_sa:02X}",
            "0xFF",
            "0xFF",
            "0xFF",
            "0x05",
        ]
    )


def cmd_default_payload() -> str:
    return "0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00"


def cmd_disable_targets_payload() -> str:
    # Mirrors EN_MSG-IDCHECK style: Command=1 with all target message enables off.
    return "0x01 0x00 0x00 0x00 0x00 0x00 0x00 0x00"


def cmd_enable_targets_payload() -> str:
    # Exact DBC encoding of Command=1 with DIGIN/AD2/AD3/AD4/DPLF2/FAULT enabled.
    return "0x01 0x54 0x01 0x05 0x00 0x00 0x00 0x00"


def add_force_base_sweep(out_lines: list[str]) -> None:
    out_lines.append("#force base SA from unknown/previous state by sweeping destination SA range")
    for _ in range(RECOVERY_SWEEP_RETRY_COUNT):
        for candidate_sa in range(MIN_SA, MAX_SA + 1):
            out_lines.append(
                "SEND_CAN CH0 "
                + fmt_id(ctrl1_id_for_dest(candidate_sa))
                + " "
                + cmd_set_sa_payload(BASE_SA)
            )
    out_lines.append("NULL : NULL : WAIT = " + RECOVERY_SETTLE_WAIT_S)
    add_reboot_cycle(out_lines)


def add_enable_and_verify_block(
    out_lines: list[str],
    *,
    current_sa: int,
    previous_sa: int | None,
    verify_all_ids: bool,
) -> None:
    if verify_all_ids:
        out_lines.append("#bring online + verify all periodic IDs at SA " + f"0x{current_sa:02X}")
    else:
        out_lines.append("#bring online + verify STAT only at SA " + f"0x{current_sa:02X}")

    out_lines.append("#EN_MSG-IDCHECK style enable path: CMD1 disable-all then CMD1 enable-targets")
    for _ in range(DISABLE_RETRY_COUNT):
        out_lines.append(
            "SEND_CAN CH0 "
            + fmt_id(ctrl1_id_for_dest(current_sa))
            + " "
            + cmd_disable_targets_payload()
        )
    out_lines.append("NULL : NULL : WAIT = " + SET_DISABLE_WAIT_S)

    for _ in range(ENABLE_RETRY_COUNT):
        out_lines.append(
            "SEND_CAN CH0 "
            + fmt_id(ctrl1_id_for_dest(current_sa))
            + " "
            + cmd_enable_targets_payload()
        )
    out_lines.append("NULL : NULL : WAIT = " + SET_ENABLE_WAIT_S)

    # Always gate on STAT first.
    stat_prefix = PERIODIC_MSG_PREFIXES[0][1]
    out_lines.append(
        "UUT_TXCHECK_ID "
        + fmt_id(stat_prefix | (current_sa & 0xFF))
        + " "
        + CHECK_STAT_TIMEOUT_S
    )

    if verify_all_ids:
        # Re-assert enable state after STAT gate before checking optional periodic IDs.
        for _ in range(ENABLE_REASSERT_RETRY_COUNT):
            out_lines.append(
                "SEND_CAN CH0 "
                + fmt_id(ctrl1_id_for_dest(current_sa))
                + " "
                + cmd_enable_targets_payload()
            )
        out_lines.append("NULL : NULL : WAIT = " + SET_ENABLE_REASSERT_WAIT_S)

        for _name, prefix in PERIODIC_MSG_PREFIXES[1:]:
            out_lines.append(
                "UUT_TXCHECK_ID "
                + fmt_id(prefix | (current_sa & 0xFF))
                + " "
                + CHECK_PRESENT_TIMEOUT_S
            )

    if verify_all_ids and previous_sa is not None and previous_sa != current_sa:
        out_lines.append("#confirm previous SA is not still in use")
        for _name, prefix in PERIODIC_MSG_PREFIXES:
            out_lines.append(
                "UUT_TXCHECK_NOT_ID "
                + fmt_id(prefix | (previous_sa & 0xFF))
                + " "
                + CHECK_OLD_SA_ABSENT_TIMEOUT_S
            )


def add_claim_burst(out_lines: list[str], sa: int, payload: str) -> None:
    claim_id = claim_id_for_sa(sa)
    for _ in range(CLAIM_BURST_COUNT):
        out_lines.append("SEND_CAN CH0 " + fmt_id(claim_id) + " " + payload)
        out_lines.append("NULL : NULL : WAIT = " + CLAIM_SPACING_S)
    out_lines.append("NULL : NULL : WAIT = " + CLAIM_SETTLE_WAIT_S)


def add_expect_stat_state(out_lines: list[str], *, sa: int, should_be_online: bool) -> None:
    stat_id = 0x18EFD100 | (sa & 0xFF)
    if should_be_online:
        out_lines.append(
            "UUT_TXCHECK_ID " + fmt_id(stat_id) + " " + CHECK_ARBITRATION_ONLINE_TIMEOUT_S
        )
    else:
        out_lines.append(
            "UUT_TXCHECK_NOT_ID " + fmt_id(stat_id) + " " + CHECK_ARBITRATION_OFFLINE_TIMEOUT_S
        )


def add_refresh_controller_lease(out_lines: list[str], *, sa: int) -> None:
    out_lines.append("#refresh controller lease before arbitration assertion")
    for _ in range(KEEPALIVE_RETRY_COUNT):
        out_lines.append(
            "SEND_CAN CH0 "
            + fmt_id(ctrl1_id_for_dest(sa))
            + " "
            + cmd_default_payload()
        )
    out_lines.append("NULL : NULL : WAIT = " + KEEPALIVE_WAIT_S)
    out_lines.append(
        "UUT_TXCHECK_ID "
        + fmt_id(0x18EFD100 | (sa & 0xFF))
        + " "
        + CHECK_STAT_TIMEOUT_S
    )


def add_arbitration_block(out_lines: list[str], sa: int) -> None:
    out_lines.append(
        "#runtime arbitration at SA "
        + f"0x{sa:02X}"
        + " (STAT-only assertions; independent claim checks)"
    )

    add_refresh_controller_lease(out_lines, sa=sa)

    out_lines.append(
        "#losing-name claim ("
        + LOSING_NAME_BYTES
        + ") expected "
        + ("online" if LOSING_EXPECT_ONLINE else "offline")
    )
    add_claim_burst(out_lines, sa, LOSING_NAME_BYTES)
    add_expect_stat_state(out_lines, sa=sa, should_be_online=LOSING_EXPECT_ONLINE)

    out_lines.append("#recover to known-online before winning-name claim")
    add_reboot_cycle(out_lines)
    add_enable_and_verify_stat_only(out_lines, current_sa=sa)

    out_lines.append(
        "#winning-name claim ("
        + WINNING_NAME_BYTES
        + ") expected "
        + ("online" if WINNING_EXPECT_ONLINE else "offline")
    )
    add_claim_burst(out_lines, sa, WINNING_NAME_BYTES)
    add_expect_stat_state(out_lines, sa=sa, should_be_online=WINNING_EXPECT_ONLINE)

    out_lines.append("#recover for next transition (STAT only)")
    add_reboot_cycle(out_lines)
    add_enable_and_verify_stat_only(out_lines, current_sa=sa)


def add_enable_and_verify_full_ids(
    out_lines: list[str],
    *,
    current_sa: int,
    previous_sa: int | None,
) -> None:
    add_enable_and_verify_block(
        out_lines,
        current_sa=current_sa,
        previous_sa=previous_sa,
        verify_all_ids=True,
    )


def add_enable_and_verify_stat_only(out_lines: list[str], *, current_sa: int) -> None:
    add_enable_and_verify_block(
        out_lines,
        current_sa=current_sa,
        previous_sa=None,
        verify_all_ids=False,
    )


out_lines: list[str] = []
out_lines.append("#43009-1")
out_lines.append("#Version 0.9")
out_lines.append(
    "#J1939 SA arbitration sweep (EN_MSG-IDCHECK-style CMD1 enable path + independent claim checks)"
)
out_lines.append("UUT_DBC = 43009-560.dbc")
out_lines.append("UUT_DATANAME = " + TestName)
out_lines.append("")
out_lines.append("#Clean boot")
add_reboot_cycle(out_lines)
out_lines.append("")

out_lines.append("#initial base recovery sweep")
add_force_base_sweep(out_lines)
out_lines.append("")

out_lines.append("#startup warmup at base SA (STAT only)")
add_enable_and_verify_stat_only(out_lines, current_sa=BASE_SA)
out_lines.append("")

current_sa = BASE_SA
out_lines.append("#baseline at base SA (STAT only; full-ID verification happens after SA transitions)")
add_enable_and_verify_stat_only(out_lines, current_sa=current_sa)
add_arbitration_block(out_lines, current_sa)
out_lines.append("")

for next_sa in range(MIN_SA, MAX_SA + 1):
    if next_sa == current_sa:
        continue

    out_lines.append("#set SA " + f"0x{current_sa:02X}" + " -> " + f"0x{next_sa:02X}")
    for _ in range(SET_SA_RETRY_COUNT):
        out_lines.append(
            "SEND_CAN CH0 "
            + fmt_id(ctrl1_id_for_dest(current_sa))
            + " "
            + cmd_set_sa_payload(next_sa)
        )
    out_lines.append("NULL : NULL : WAIT = " + SET_SA_WAIT_S)
    add_reboot_cycle(out_lines)
    add_enable_and_verify_full_ids(out_lines, current_sa=next_sa, previous_sa=current_sa)
    add_arbitration_block(out_lines, next_sa)
    out_lines.append("")
    current_sa = next_sa

if current_sa != BASE_SA:
    out_lines.append("#final return to base SA")
    for _ in range(SET_SA_RETRY_COUNT):
        out_lines.append(
            "SEND_CAN CH0 "
            + fmt_id(ctrl1_id_for_dest(current_sa))
            + " "
            + cmd_set_sa_payload(BASE_SA)
        )
    out_lines.append("NULL : NULL : WAIT = " + SET_SA_WAIT_S)
    add_reboot_cycle(out_lines)
    add_enable_and_verify_full_ids(out_lines, current_sa=BASE_SA, previous_sa=current_sa)
    out_lines.append("")

out_lines.append("#final base sweep recovery to guarantee end-state")
add_force_base_sweep(out_lines)
out_lines.append("#final base verify")
add_enable_and_verify_full_ids(out_lines, current_sa=BASE_SA, previous_sa=None)
out_lines.append("")

out_lines.append("SAVE")
out_lines.append("END")

outstr = "\n".join(out_lines) + "\n"

with open(datafile, "w", encoding="utf-8", newline="\n") as f:
    f.write(outstr)

print(outstr)
print(TestName + ".pat")
