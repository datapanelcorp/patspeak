import os

script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
script_dir = os.path.dirname(os.path.abspath(__file__))
datafile = os.path.join(script_dir, TestName + ".pat")

# Controller source address used by production tests/firmware.
CTRL_SA = 0xD1

# Default candidate SA window for current 43009 firmware line.
# Override with env PAT_UUT_SAS to target any address list.
# Examples:
#   PAT_UUT_SAS=0xD9
#   PAT_UUT_SAS=0xD9,0xDA,224
#   PAT_UUT_SAS=0xD9-0xE0
DEFAULT_TARGET_SAS = list(range(0xD9, 0xE0 + 1))

RESET_RETRY_COUNT = 2
INTER_SA_WAIT_S = "0.10"
POST_TEST_WAIT_S = "0.50"


def ctrl1_id_for_dest(dest_sa: int) -> int:
    return 0x18EF0000 | ((dest_sa & 0xFF) << 8) | (CTRL_SA & 0xFF)


def cmd_cnfg_reset_payload() -> str:
    # CMD_FACTORY (0x10):
    #   Byte2 Request_Key = 0xA1
    #   Byte4 bit-pair1 = 0x01 (Erase_EEPROM_D13)
    return "0x10 0xA1 0x00 0x01 0x00 0x00 0x00 0x00"


def parse_sa_token(token: str) -> list[int]:
    t = token.strip()
    if not t:
        return []

    if "-" in t:
        start_s, end_s = t.split("-", 1)
        start = int(start_s, 0)
        end = int(end_s, 0)
        if start > end:
            start, end = end, start
        return list(range(start, end + 1))

    return [int(t, 0)]


def target_sas_from_env() -> list[int]:
    raw = os.getenv("PAT_UUT_SAS", "").strip()
    if not raw:
        return DEFAULT_TARGET_SAS

    vals: list[int] = []
    for part in raw.split(","):
        vals.extend(parse_sa_token(part))

    normalized: list[int] = []
    seen: set[int] = set()
    for v in vals:
        if 0 <= v <= 0xFF and v not in seen:
            normalized.append(v)
            seen.add(v)

    return normalized or DEFAULT_TARGET_SAS


TARGET_SAS = target_sas_from_env()

outstr = ""
outstr += "#43009-1\n"
outstr += "#Version 0.1\n"
outstr += "#factory EEPROM reset using CTRL1 command 0x10 to configurable target SA(s)\n"
outstr += "UUT_DBC = 43009-560.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"
outstr += "#Controller SA: 0x" + f"{CTRL_SA:02X}" + "\n"
outstr += "#Target SA(s): " + ", ".join("0x" + f"{sa:02X}" for sa in TARGET_SAS) + "\n"
outstr += "\n"

for sa in TARGET_SAS:
    outstr += "#Target SA 0x" + f"{sa:02X}" + "\n"
    can_id = "0x" + f"{ctrl1_id_for_dest(sa):08X}"
    for _ in range(RESET_RETRY_COUNT):
        outstr += "SEND_CAN CH0 " + can_id + " " + cmd_cnfg_reset_payload() + "\n"
    outstr += "NULL : NULL : WAIT = " + INTER_SA_WAIT_S + "\n"

outstr += "NULL : NULL : WAIT = " + POST_TEST_WAIT_S + "\n"

outstr += "SAVE\n"
outstr += "END\n"

f = open(datafile, "w", encoding="utf-8", newline="\n")
f.write(outstr)
f.close()
print(outstr)
print(TestName + ".pat")
