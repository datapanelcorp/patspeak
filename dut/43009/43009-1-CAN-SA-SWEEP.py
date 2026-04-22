import os


script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
script_dir = os.path.dirname(os.path.abspath(__file__))
datafile = os.path.join(script_dir, TestName + ".pat")


BASE_SA = 0xD9

# Supported 43009 SA window in current firmware.
MIN_SA = 0xD9
MAX_SA = 0xE0
CTRL_SA = 0xD1

# Timeouts/waits tuned to keep the sweep runtime reasonable while still
# allowing 200 ms-cycle messages to be observed reliably.
#
# Match EN_MSG-IDCHECK settle timing for command 0x01 enable writes.
SET_ENABLE_WAIT_S = "1.20"
REQUEST_SETTLE_WAIT_S = "0.30"
CHECK_PRESENT_TIMEOUT_S = "1.20"
CHECK_WBLR_TIMEOUT_S = "1.50"
CHECK_OLD_SA_ABSENT_TIMEOUT_S = "0.30"
SET_SA_TO_REBOOT_WAIT_S = "0.10"
REBOOT_OFF_WAIT_S = "1.00"
REBOOT_ON_WAIT_S = "2.00"
REBOOT_SETTLE_WAIT_S = "1.00"
ENABLE_RETRY_COUNT = 3
HANDSHAKE_RETRY_COUNT = 2
HANDSHAKE_WAIT_S = "0.20"
HANDSHAKE_STAT_TIMEOUT_S = "1.20"

# WBLR (PGN FEAC) is request/response behavior, not a periodic TX frame.
# It can depend on additional harness/bench setup and is not required to prove
# that periodic status message source addresses remap correctly.
INCLUDE_WBLR_IN_SA_SWEEP = False

# J1939 Request PGN FEAC (WheelBrakeLiningRemaining).
PWS_REQUEST_BYTES = "172 254 0 0 0 0 0 0"

# UUT TX message ID prefixes (source address is low byte).
PERIODIC_MSG_PREFIXES = [
    ("STAT", 0x18EFD100, CHECK_PRESENT_TIMEOUT_S),
    ("DIGIN", 0x18FF1500, CHECK_PRESENT_TIMEOUT_S),
    ("AD2", 0x18FF1600, CHECK_PRESENT_TIMEOUT_S),
    ("AD3", 0x18FF1700, CHECK_PRESENT_TIMEOUT_S),
    ("AD4", 0x18FF1800, CHECK_PRESENT_TIMEOUT_S),
    ("DPLF2", 0x18FFFC00, CHECK_PRESENT_TIMEOUT_S),
    ("FAULT", 0x18FFE600, CHECK_PRESENT_TIMEOUT_S),
]


def fmt_id(can_id: int) -> str:
    return "0x" + f"{can_id:08X}"


def ctrl1_id_for_dest(dest_sa: int) -> int:
    # Proprietary A control frame to destination SA from fixed controller SA.
    # 0x18EF<dest><ctrl_src>
    return 0x18EF0000 | ((dest_sa & 0xFF) << 8) | (CTRL_SA & 0xFF)


def req_id_for_dest(dest_sa: int) -> int:
    # J1939 PGN request (0xEA00) to destination SA from fixed controller SA.
    # 0x18EA<dest><ctrl_src>
    return 0x18EA0000 | ((dest_sa & 0xFF) << 8) | (CTRL_SA & 0xFF)


def cmd_set_sa_payload(next_sa: int) -> str:
    # Command 0x11 CAN configuration:
    # Byte1=0x11, Byte2=0x51, Byte3=0x50, Byte4=<new SA>,
    # Byte5=0xFF (ignore bit-rate),
    # Byte6=0xFF, Byte7=0xFF,
    # Byte8 keeps d29/d30 asserted (0x01 each -> 0x05 overall) while
    # leaving CAN_Term/Reboot disabled (we reboot externally via K1).
    # Reboot is done via K1 relay between address transitions.
    b = [
        "0x11",
        "0x51",
        "0x50",
        "0x" + f"{next_sa:02X}",
        "0xFF",
        "0xFF",
        "0xFF",
        "0x05",
    ]
    return " ".join(b)


def cmd_enable_targets_payload() -> str:
    # Command 0x01 module configuration (mirror EN_MSG-IDCHECK behavior):
    #   Enable_DIGIN=1, Enable_AD2=1, Enable_AD3=1, Enable_AD4=1,
    #   Enable_DPLF2=1, Enable_FAULT=1.
    #
    # Byte breakdown:
    #   Byte1=0x01
    #   Byte2=0x54 (Enable_DIGIN/AD2/AD3 = 1)
    #   Byte3=0x01 (Enable_AD4 = 1)
    #   Byte4=0x15 (Enable_DPLF2/FAULT = 1, SendRatioVolts = 1)
    b = [
        "0x01",
        "0x54",
        "0x01",
        "0x15",
        "0x01",
        "0x00",
        "0x00",
        "0x00",
    ]
    return " ".join(b)


def cmd_default_payload() -> str:
    # Default command (0x00). Used as a lightweight handshake after reboot to
    # establish ControllerAddress at the current SA before sending config writes.
    return "0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00"


def add_reboot_cycle(out_lines: list[str]) -> None:
    out_lines.append("RLY_K1 = 0 : NULL : WAIT = " + REBOOT_OFF_WAIT_S)
    out_lines.append("RLY_K1 = 1 : NULL : WAIT = " + REBOOT_ON_WAIT_S)
    out_lines.append("RLY_K1 = 0 : NULL : WAIT = " + REBOOT_SETTLE_WAIT_S)


def add_verify_sa_block(out_lines: list[str], current_sa: int, previous_sa: int | None) -> None:
    out_lines.append("#verify UUT TX IDs for SA " + f"0x{current_sa:02X}")

    # Fresh boot after EEPROM reset can leave all non-STAT TX disabled and
    # controller ownership unset. Prime CTRL1 path first.
    for _ in range(HANDSHAKE_RETRY_COUNT):
        out_lines.append(
            "SEND_CAN CH0 "
            + fmt_id(ctrl1_id_for_dest(current_sa))
            + " "
            + cmd_default_payload()
        )
    out_lines.append("NULL : NULL : WAIT = " + HANDSHAKE_WAIT_S)
    out_lines.append("UUT_TXCHECK_ID " + fmt_id(0x18EFD100 | (current_sa & 0xFF)) + " " + HANDSHAKE_STAT_TIMEOUT_S)

    # Always use explicit raw CTRL1 writes from source 0xD1.
    # Avoid mixed symbolic/raw command sources, which can make the UUT lock onto
    # a different controller source after reboot and ignore subsequent writes.
    for _ in range(ENABLE_RETRY_COUNT):
        out_lines.append(
            "SEND_CAN CH0 "
            + fmt_id(ctrl1_id_for_dest(current_sa))
            + " "
            + cmd_enable_targets_payload()
        )
    out_lines.append("NULL : NULL : WAIT = " + SET_ENABLE_WAIT_S)

    if INCLUDE_WBLR_IN_SA_SWEEP:
        # Trigger FEAC response for WBLR verification.
        # Send both global and direct requests from SA 0xD1.
        # Firmware accepts either PDUSpecific == NodeAddress or == 0xFF.
        out_lines.append("SEND_CAN CH0 " + fmt_id(req_id_for_dest(0xFF)) + " " + PWS_REQUEST_BYTES)
        out_lines.append("SEND_CAN CH0 " + fmt_id(req_id_for_dest(current_sa)) + " " + PWS_REQUEST_BYTES)
        out_lines.append("SEND_CAN CH0 " + fmt_id(req_id_for_dest(current_sa)) + " " + PWS_REQUEST_BYTES)
        out_lines.append("NULL : NULL : WAIT = " + REQUEST_SETTLE_WAIT_S)

    # Expected IDs at the configured SA.
    for _name, prefix, timeout_s in PERIODIC_MSG_PREFIXES:
        expect_id = prefix | (current_sa & 0xFF)
        out_lines.append("UUT_TXCHECK_ID " + fmt_id(expect_id) + " " + timeout_s)

    if INCLUDE_WBLR_IN_SA_SWEEP:
        wblr_id = 0x1CFEAC00 | (current_sa & 0xFF)
        out_lines.append("UUT_TXCHECK_ID " + fmt_id(wblr_id) + " " + CHECK_WBLR_TIMEOUT_S)

    # Previous SA should no longer be present after transition.
    if previous_sa is not None and previous_sa != current_sa:
        out_lines.append("#ensure previous SA " + f"0x{previous_sa:02X}" + " is no longer used")
        for _name, prefix, _timeout_s in PERIODIC_MSG_PREFIXES:
            old_id = prefix | (previous_sa & 0xFF)
            out_lines.append(
                "UUT_TXCHECK_NOT_ID " + fmt_id(old_id) + " " + CHECK_OLD_SA_ABSENT_TIMEOUT_S
            )
        if INCLUDE_WBLR_IN_SA_SWEEP:
            old_wblr_id = 0x1CFEAC00 | (previous_sa & 0xFF)
            out_lines.append(
                "UUT_TXCHECK_NOT_ID "
                + fmt_id(old_wblr_id)
                + " "
                + CHECK_OLD_SA_ABSENT_TIMEOUT_S
            )


out_lines: list[str] = []
out_lines.append("#43009-1")
out_lines.append("#Version 0.4")
out_lines.append("#Set/source-address sweep using CTRL1 command 0x11 and verify all UUT TX IDs")
out_lines.append("UUT_DBC = 43009-560.dbc")
out_lines.append("UUT_DATANAME = " + TestName)
out_lines.append("")
out_lines.append("#Base SA requirement: 0xD9")
out_lines.append(
    "#Sweep valid SA range: 0x"
    + f"{MIN_SA:02X}"
    + "..0x"
    + f"{MAX_SA:02X}"
    + " inclusive, then return to base"
)
out_lines.append("")

# Start from a clean boot at whatever address is currently stored.
out_lines.append("#cycle IGN to clean slate")
add_reboot_cycle(out_lines)
out_lines.append("")

current_sa = BASE_SA

# Verify base SA once up front.
out_lines.append("#-----baseline verify at base SA-----")
add_verify_sa_block(out_lines, current_sa=current_sa, previous_sa=None)
out_lines.append("")

# Verify every valid SA in-range.
all_sas = [sa for sa in range(MIN_SA, MAX_SA + 1)]
for next_sa in all_sas:
    if next_sa == current_sa:
        # Already verified base at startup; skip no-op set.
        continue

    out_lines.append("#-----set SA " + f"0x{current_sa:02X}" + " -> " + f"0x{next_sa:02X}" + "-----")
    out_lines.append(
        "SEND_CAN CH0 "
        + fmt_id(ctrl1_id_for_dest(current_sa))
        + " "
        + cmd_set_sa_payload(next_sa)
    )
    out_lines.append(
        "SEND_CAN CH0 "
        + fmt_id(ctrl1_id_for_dest(current_sa))
        + " "
        + cmd_set_sa_payload(next_sa)
    )
    out_lines.append("NULL : NULL : WAIT = " + SET_SA_TO_REBOOT_WAIT_S)
    add_reboot_cycle(out_lines)
    add_verify_sa_block(out_lines, current_sa=next_sa, previous_sa=current_sa)
    out_lines.append("")
    current_sa = next_sa

# Return to base SA at end.
if current_sa != BASE_SA:
    out_lines.append("#-----return to base SA-----")
    out_lines.append(
        "SEND_CAN CH0 "
        + fmt_id(ctrl1_id_for_dest(current_sa))
        + " "
        + cmd_set_sa_payload(BASE_SA)
    )
    out_lines.append(
        "SEND_CAN CH0 "
        + fmt_id(ctrl1_id_for_dest(current_sa))
        + " "
        + cmd_set_sa_payload(BASE_SA)
    )
    out_lines.append("NULL : NULL : WAIT = " + SET_SA_TO_REBOOT_WAIT_S)
    add_reboot_cycle(out_lines)
    add_verify_sa_block(out_lines, current_sa=BASE_SA, previous_sa=current_sa)
    out_lines.append("")

out_lines.append("SAVE")
out_lines.append("END")

outstr = "\n".join(out_lines) + "\n"

with open(datafile, "w", encoding="utf-8", newline="\n") as f:
    f.write(outstr)

print(outstr)
print(TestName + ".pat")
