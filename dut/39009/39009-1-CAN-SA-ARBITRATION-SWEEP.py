import os


script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
script_dir = os.path.dirname(os.path.abspath(__file__))
datafile = os.path.join(script_dir, TestName + ".pat")


BASE_SA = 0xE0
BASE_OFFSET = 0x00
MIN_OFFSET = 0x00
# IN1..IN5 are binary-weighted (+1,+2,+4,+8,+16), so valid offsets are 0..31.
MAX_OFFSET = 0x1F
CTRL_SA = 0xD1

# CNFG input mapping (per bench wiring):
# CNFG_IN1 = J1-3
# CNFG_IN2 = J1-4
# CNFG_IN3 = J1-5
# CNFG_IN4 = J1-6
# CNFG_IN5 = J1-7
CNFG_RELAYS = ("J1_03", "J1_04", "J1_05", "J1_06", "J1_07")

# Timing tuned from existing 43009 arbitration sweep patterns plus
# 39009 bench setup patterns.
CNFG_APPLY_WAIT_S = "0.30"
SET_ENABLE_WAIT_S = "0.80"
SET_ENABLE_REASSERT_WAIT_S = "0.40"
CLEAR_MULTIPLEX_WAIT_S = "0.10"
INPUT_MODE_CONFIG_WAIT_S = "0.50"
CHECK_STAT_TIMEOUT_S = "1.50"
CHECK_PRESENT_TIMEOUT_S = "1.50"
CHECK_OLD_SA_ABSENT_TIMEOUT_S = "0.30"
CHECK_ARBITRATION_ONLINE_TIMEOUT_S = "3.00"
CHECK_ARBITRATION_OFFLINE_TIMEOUT_S = "1.50"
CLAIM_SPACING_S = "0.05"
CLAIM_SETTLE_WAIT_S = "0.60"
KEEPALIVE_WAIT_S = "0.20"
REBOOT_OFF_WAIT_S = "1.00"
REBOOT_ON_WAIT_S = "2.00"
REBOOT_SETTLE_WAIT_S = "1.00"
TRANSITION_DISABLE_CAN_ID = 0x18FEE627
TRANSITION_DISABLE_PAYLOAD = "5 5 1 9 7 7 0 0"
TRANSITION_DISABLE_BURST_COUNT = 4

ENABLE_RETRY_COUNT = 1
ENABLE_REASSERT_RETRY_COUNT = 1
KEEPALIVE_RETRY_COUNT = 2
CLAIM_BURST_COUNT = 6

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

# 39009 periodic UUT TX IDs (source address is low byte).
PERIODIC_MSG_PREFIXES = [
    ("STAT", 0x18EFD100),
    ("DIGIN", 0x18FF1500),
    ("AD2", 0x18FF1600),
    ("AD3", 0x18FF1700),
    ("AD4", 0x18FF1800),
    ("FREQ1", 0x18FF1A00),
    ("FREQ2", 0x18FF1B00),
]


def fmt_id(can_id: int) -> str:
    return "0x" + f"{can_id:08X}"


def sa_for_offset(offset: int) -> int:
    sa = BASE_SA + int(offset)
    if sa < 0x00 or sa > 0xFF:
        raise ValueError(f"invalid SA for offset {offset}: 0x{sa:02X}")
    return sa


def ctrl1_id_for_dest(dest_sa: int) -> int:
    # 0x18EF<dest><ctrl_src>
    return 0x18EF0000 | ((dest_sa & 0xFF) << 8) | (CTRL_SA & 0xFF)


def claim_id_for_sa(sa: int) -> int:
    # Address Claimed PGN 0xEE00 to global destination:
    # 0x18EEFF<source_sa>
    return 0x18EEFF00 | (sa & 0xFF)


def cmd_default_payload() -> str:
    return "0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00"


def cmd_enable_targets_payload() -> str:
    # 39009 uses Command 0x52 for config bits.
    # Byte2 = 0x54 enables DPLF1/DPLF2/DPLTx and leaves fault-reset low.
    return "0x52 0x54 0x00 0x00 0x00 0x00 0x00 0x00"


def cmd_cfg_32v_m82_payload() -> str:
    # Mirrors INPUT-ADC setup: Command=82, MODE1=0, MODE2=0, Enable_24VDC=0.
    return "0x52 0x00 0x00 0x00 0x00 0x00 0x00 0x00"


def cmd_cfg_32v_m83_payload() -> str:
    # Hybrid INPUT-ADC + INPUT-COUNT setup:
    # - MODE1A and MODE3A are counter mode (8) for FREQ1/FREQ2 transmission.
    # - Remaining odd inputs stay 0-32VDC mode (6).
    # - Even inputs stay digital positive mode (1).
    return "0x53 0x68 0x11 0x68 0x11 0x66 0x11 0x66"


def cmd_cfg_32v_m84_payload() -> str:
    # Mirrors INPUT-ADC setup with PortMode=6 on MODE9(A,B), MODE8/10(A,B)=1.
    return "0x54 0x11 0x66 0x11 0xFF 0xFF 0x00 0x00"


def add_clear_multiplex(out_lines: list[str], *, sa: int) -> None:
    # Mirrors common 39009 style: send Command=0 after command-mux actions.
    out_lines.append("SEND_CAN CH0 " + fmt_id(ctrl1_id_for_dest(sa)) + " " + cmd_default_payload())
    out_lines.append("NULL : NULL : WAIT = " + CLEAR_MULTIPLEX_WAIT_S)


def add_reboot_cycle(out_lines: list[str]) -> None:
    out_lines.append("RLY_K1 = 0 : NULL : WAIT = " + REBOOT_OFF_WAIT_S)
    out_lines.append("RLY_K1 = 1 : NULL : WAIT = " + REBOOT_ON_WAIT_S)
    out_lines.append("RLY_K1 = 0 : NULL : WAIT = " + REBOOT_SETTLE_WAIT_S)
    # Mirror dut/39009/pat_transition.pat: disable transition logic
    # after each power cycle.
    out_lines.append("#disable DPLogic transition behavior")
    for _ in range(TRANSITION_DISABLE_BURST_COUNT):
        out_lines.append(
            "SEND_CAN CH0 "
            + fmt_id(TRANSITION_DISABLE_CAN_ID)
            + " "
            + TRANSITION_DISABLE_PAYLOAD
        )


def cnfg_assignments_for_offset(offset: int) -> str:
    assigns = []
    for bit, relay in enumerate(CNFG_RELAYS):
        bit_val = 1 if (offset & (1 << bit)) else 0
        assigns.append(f"{relay} = {bit_val}")
    return ", ".join(assigns)


def add_cnfg_sink_setup(out_lines: list[str]) -> None:
    out_lines.append("#-----setup PAT CNFG sink path (ground via 3A load)-----")
    out_lines.append("J0_01_3A_LOAD = 1 : NULL : WAIT = 0.5")
    out_lines.append("J4_03 = 1 : NULL : WAIT = 0.2")
    out_lines.append(cnfg_assignments_for_offset(BASE_OFFSET) + " : NULL : WAIT = 0.2")


def add_cnfg_sink_teardown(out_lines: list[str]) -> None:
    out_lines.append("#-----tear down PAT CNFG sink path-----")
    out_lines.append(cnfg_assignments_for_offset(BASE_OFFSET) + " : NULL : WAIT = 0.2")
    out_lines.append("J4_03 = 0 : NULL : WAIT = 0.2")
    out_lines.append("J0_01_3A_LOAD = 0 : NULL : WAIT = 0.5")


def add_set_cnfg_offset(out_lines: list[str], offset: int) -> None:
    sa = sa_for_offset(offset)
    out_lines.append("#set CNFG offset +" + f"{offset}" + " -> SA 0x" + f"{sa:02X}")
    out_lines.append(cnfg_assignments_for_offset(offset) + " : NULL : WAIT = " + CNFG_APPLY_WAIT_S)


def add_configure_inputs_for_ad34(out_lines: list[str], *, sa: int) -> None:
    out_lines.append("#configure input modes so AD3/AD4/FREQ1/FREQ2 transmit")
    out_lines.append(
        "SEND_CAN CH0 " + fmt_id(ctrl1_id_for_dest(sa)) + " " + cmd_cfg_32v_m82_payload()
    )
    out_lines.append("NULL : NULL : WAIT = " + INPUT_MODE_CONFIG_WAIT_S)
    out_lines.append(
        "SEND_CAN CH0 " + fmt_id(ctrl1_id_for_dest(sa)) + " " + cmd_cfg_32v_m83_payload()
    )
    out_lines.append("NULL : NULL : WAIT = " + INPUT_MODE_CONFIG_WAIT_S)
    add_clear_multiplex(out_lines, sa=sa)
    out_lines.append(
        "SEND_CAN CH0 " + fmt_id(ctrl1_id_for_dest(sa)) + " " + cmd_cfg_32v_m84_payload()
    )
    out_lines.append("NULL : NULL : WAIT = " + INPUT_MODE_CONFIG_WAIT_S)
    add_clear_multiplex(out_lines, sa=sa)


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

    # Establish controller lease first.
    for _ in range(KEEPALIVE_RETRY_COUNT):
        out_lines.append(
            "SEND_CAN CH0 "
            + fmt_id(ctrl1_id_for_dest(current_sa))
            + " "
            + cmd_default_payload()
        )
    out_lines.append("NULL : NULL : WAIT = " + KEEPALIVE_WAIT_S)

    # Restore 0-32V input mode when validating full periodic traffic so
    # AD3/AD4 are produced.
    if verify_all_ids:
        add_configure_inputs_for_ad34(out_lines, sa=current_sa)

    # Enable telemetry path (39009 Command 0x52).
    for _ in range(ENABLE_RETRY_COUNT):
        out_lines.append(
            "SEND_CAN CH0 "
            + fmt_id(ctrl1_id_for_dest(current_sa))
            + " "
            + cmd_enable_targets_payload()
        )
    out_lines.append("NULL : NULL : WAIT = " + SET_ENABLE_WAIT_S)
    add_clear_multiplex(out_lines, sa=current_sa)

    # Always gate on STAT first.
    stat_prefix = PERIODIC_MSG_PREFIXES[0][1]
    out_lines.append(
        "UUT_TXCHECK_ID "
        + fmt_id(stat_prefix | (current_sa & 0xFF))
        + " "
        + CHECK_STAT_TIMEOUT_S
    )

    if verify_all_ids:
        # Re-assert enable state before checking optional periodic IDs.
        for _ in range(ENABLE_REASSERT_RETRY_COUNT):
            out_lines.append(
                "SEND_CAN CH0 "
                + fmt_id(ctrl1_id_for_dest(current_sa))
                + " "
                + cmd_enable_targets_payload()
            )
        out_lines.append("NULL : NULL : WAIT = " + SET_ENABLE_REASSERT_WAIT_S)
        add_clear_multiplex(out_lines, sa=current_sa)

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
out_lines.append("#39009-1")
out_lines.append("#Version 0.1")
out_lines.append(
    "#J1939 SA arbitration sweep using CNFG input binary offset (base SA 0xE0) + independent claim checks"
)
out_lines.append("UUT_DBC = 39009-561.dbc")
out_lines.append("UUT_DATANAME = " + TestName)
out_lines.append("")

add_cnfg_sink_setup(out_lines)
out_lines.append("")

out_lines.append("#force base SA by clearing CNFG offset, then reboot")
add_set_cnfg_offset(out_lines, BASE_OFFSET)
add_reboot_cycle(out_lines)
out_lines.append("")

out_lines.append("#startup warmup at base SA (STAT only)")
add_enable_and_verify_stat_only(out_lines, current_sa=BASE_SA)
out_lines.append("")

current_offset = BASE_OFFSET
current_sa = sa_for_offset(current_offset)

out_lines.append("#baseline at base SA (STAT only; full-ID verification happens after SA transitions)")
add_enable_and_verify_stat_only(out_lines, current_sa=current_sa)
add_arbitration_block(out_lines, current_sa)
out_lines.append("")

for next_offset in range(MIN_OFFSET, MAX_OFFSET + 1):
    if next_offset == current_offset:
        continue

    next_sa = sa_for_offset(next_offset)
    out_lines.append(
        "#set SA 0x"
        + f"{current_sa:02X}"
        + " -> 0x"
        + f"{next_sa:02X}"
        + " using CNFG offset"
    )
    add_set_cnfg_offset(out_lines, next_offset)
    add_reboot_cycle(out_lines)
    add_enable_and_verify_full_ids(out_lines, current_sa=next_sa, previous_sa=current_sa)
    add_arbitration_block(out_lines, next_sa)
    out_lines.append("")
    current_offset = next_offset
    current_sa = next_sa

if current_offset != BASE_OFFSET:
    out_lines.append("#final return to base SA via CNFG offset 0")
    add_set_cnfg_offset(out_lines, BASE_OFFSET)
    add_reboot_cycle(out_lines)
    add_enable_and_verify_full_ids(out_lines, current_sa=BASE_SA, previous_sa=current_sa)
    out_lines.append("")

add_cnfg_sink_teardown(out_lines)
out_lines.append("")

out_lines.append("SAVE")
out_lines.append("END")

outstr = "\n".join(out_lines) + "\n"

with open(datafile, "w", encoding="utf-8", newline="\n") as f:
    f.write(outstr)

print(outstr)
print(TestName + ".pat")
