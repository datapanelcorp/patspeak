import os


script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
script_dir = os.path.dirname(os.path.abspath(__file__))
datafile = os.path.join(script_dir, TestName + ".pat")


UUT_SA = 0xE0
CTRL_SA = 0xD1
CTRL1_ID = 0x0CEF0000 | (UUT_SA << 8) | CTRL_SA
# DM13 sent globally (PDU Specific = 0xFF, Source Address = 0xFF).
DM13_ID = 0x18DFFFFF
STAT_ID = 0x18EFD100 | UUT_SA
DIGIN_ID = 0x18FF1500 | UUT_SA

TRANSITION_DISABLE_CAN_ID = 0x18FEE627
TRANSITION_DISABLE_PAYLOAD = "5 5 1 9 7 7 0 0"
TRANSITION_DISABLE_BURST_COUNT = 4


def fmt_id(can_id: int) -> str:
    return "0x" + f"{can_id:08X}"


def add_transition_disable(out_lines: list[str]) -> None:
    out_lines.append("#disable DPLogic transition behavior")
    for _ in range(TRANSITION_DISABLE_BURST_COUNT):
        out_lines.append(
            "SEND_CAN CH0 "
            + fmt_id(TRANSITION_DISABLE_CAN_ID)
            + " "
            + TRANSITION_DISABLE_PAYLOAD
        )


out_lines: list[str] = []
out_lines.append("#39009-1")
out_lines.append("#Version 0.2")
out_lines.append("#Simple DM13 behavior check: stop TX on DM13, auto-resume after 5s quiet window.")
out_lines.append("UUT_DBC = 39009-561.dbc")
out_lines.append("UUT_DATANAME = " + TestName)
out_lines.append("")

out_lines.append("#-----force known SA (0xE0) and clean reboot-----")
out_lines.append("J0_01_3A_LOAD = 1 : NULL : WAIT = 0.5")
out_lines.append("J4_03 = 1 : NULL : WAIT = 0.2")
out_lines.append("J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0 : NULL : WAIT = 0.30")
out_lines.append("RLY_K1 = 0 : NULL : WAIT = 1.00")
out_lines.append("RLY_K1 = 1 : NULL : WAIT = 2.00")
out_lines.append("RLY_K1 = 0 : NULL : WAIT = 1.00")
add_transition_disable(out_lines)
out_lines.append("")

out_lines.append("#-----bring module online and configure known TX behavior-----")
out_lines.append("SEND_CAN CH0 " + fmt_id(CTRL1_ID) + " 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00")
out_lines.append("SEND_CAN CH0 " + fmt_id(CTRL1_ID) + " 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00")
out_lines.append("NULL : NULL : WAIT = 0.20")

out_lines.append("#configure inputs so DIGIN/AD/FREQ traffic is available")
out_lines.append("SEND_CAN CH0 " + fmt_id(CTRL1_ID) + " 0x52 0x00 0x00 0x00 0x00 0x00 0x00 0x00")
out_lines.append("NULL : NULL : WAIT = 0.50")
out_lines.append("SEND_CAN CH0 " + fmt_id(CTRL1_ID) + " 0x53 0x68 0x11 0x68 0x11 0x66 0x11 0x66")
out_lines.append("NULL : NULL : WAIT = 0.50")
out_lines.append("SEND_CAN CH0 " + fmt_id(CTRL1_ID) + " 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00")
out_lines.append("NULL : NULL : WAIT = 0.10")
out_lines.append("SEND_CAN CH0 " + fmt_id(CTRL1_ID) + " 0x54 0x11 0x66 0x11 0xFF 0xFF 0x00 0x00")
out_lines.append("NULL : NULL : WAIT = 0.50")
out_lines.append("SEND_CAN CH0 " + fmt_id(CTRL1_ID) + " 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00")
out_lines.append("NULL : NULL : WAIT = 0.10")

out_lines.append("#enable periodic broadcasts")
out_lines.append("SEND_CAN CH0 " + fmt_id(CTRL1_ID) + " 0x52 0x54 0x00 0x00 0x00 0x00 0x00 0x00")
out_lines.append("NULL : NULL : WAIT = 0.80")
out_lines.append("SEND_CAN CH0 " + fmt_id(CTRL1_ID) + " 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00")
out_lines.append("NULL : NULL : WAIT = 0.10")

out_lines.append("#set moderate TX period for quick checks (20 * 20 ms = 400 ms)")
out_lines.append("#PGN_CTRL2 (0x5E): STAT, DPL_Tx, spare, DPL_F1, DPL_F2, FAULT")
out_lines.append("SEND_CAN CH0 " + fmt_id(CTRL1_ID) + " 0x5E 0x14 0x14 0x00 0x14 0x14 0x14 0x00")
out_lines.append("NULL : NULL : WAIT = 0.20")
out_lines.append("#PGN_CTRL1 (0x5B): DIGIN, AD2, AD3, AD4, FREQ1, FREQ2")
out_lines.append("SEND_CAN CH0 " + fmt_id(CTRL1_ID) + " 0x5B 0x14 0x14 0x14 0x14 0x14 0x14 0x00")
out_lines.append("NULL : NULL : WAIT = 0.80")
out_lines.append("")

out_lines.append("#baseline traffic present")
out_lines.append("UUT_TXCHECK_ID " + fmt_id(STAT_ID) + " 1.50")
out_lines.append("UUT_TXCHECK_ID " + fmt_id(DIGIN_ID) + " 1.50")
out_lines.append("")

out_lines.append("#DM13 stop broadcast (current data link stop, other links no-action)")
out_lines.append("SEND_CAN CH0 " + fmt_id(DM13_ID) + " 0x3F 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF")
out_lines.append("NULL : NULL : WAIT = 0.10")
out_lines.append("SEND_CAN CH0 " + fmt_id(DM13_ID) + " 0x3F 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF")
out_lines.append("NULL : NULL : WAIT = 0.20")
out_lines.append("")

out_lines.append("#verify TX suppression after DM13")
out_lines.append("UUT_TXCHECK_NOT_ID " + fmt_id(STAT_ID) + " 1.00")
out_lines.append("#still within 5-second quiet window")
out_lines.append("NULL : NULL : WAIT = 2.00")
out_lines.append("UUT_TXCHECK_NOT_ID " + fmt_id(STAT_ID) + " 1.00")
out_lines.append("")

out_lines.append("#after 5 seconds without DM13, UUT should auto-resume broadcasting")
out_lines.append("NULL : NULL : WAIT = 1.20")
out_lines.append("UUT_TXCHECK_ID " + fmt_id(STAT_ID) + " 1.50")
out_lines.append("UUT_TXCHECK_ID " + fmt_id(DIGIN_ID) + " 1.50")
out_lines.append("")

out_lines.append("#-----cleanup-----")
out_lines.append("J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0 : NULL : WAIT = 0.20")
out_lines.append("J4_03 = 0 : NULL : WAIT = 0.20")
out_lines.append("J0_01_3A_LOAD = 0 : NULL : WAIT = 0.50")
out_lines.append("")
out_lines.append("SAVE")
out_lines.append("END")

outstr = "\n".join(out_lines) + "\n"

with open(datafile, "w", encoding="utf-8", newline="\n") as f:
    f.write(outstr)

print(outstr)
print(TestName + ".pat")
