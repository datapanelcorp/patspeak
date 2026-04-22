import os


script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
script_dir = os.path.dirname(os.path.abspath(__file__))
datafile = os.path.join(script_dir, TestName + ".pat")


# Keep this table as the single source of truth for message/enable mapping.
TARGETS = [
    {"name": "DIGIN", "enable": "Enable_DIGIN", "can_id": "0x98FF15D9", "present_timeout_s": "1.2"},
    {"name": "AD2", "enable": "Enable_AD2", "can_id": "0x98FF16D9", "present_timeout_s": "1.2"},
    {"name": "AD3", "enable": "Enable_AD3", "can_id": "0x98FF17D9", "present_timeout_s": "1.2"},
    {"name": "AD4", "enable": "Enable_AD4", "can_id": "0x98FF18D9", "present_timeout_s": "1.2"},
    {"name": "DPLF2", "enable": "Enable_DPLF2", "can_id": "0x98FFFCD9", "present_timeout_s": "1.5"},
    {"name": "FAULT", "enable": "Enable_FAULT", "can_id": "0x98FFE6D9", "present_timeout_s": "1.5"},
]

ENABLE_FIELDS = [
    "Enable_DIGIN",
    "Enable_AD2",
    "Enable_AD3",
    "Enable_AD4",
    "Enable_DPLF2",
    "Enable_FAULT",
]

SETTLE_WAIT_S = "0.8"
SILENT_TIMEOUT_S = "1.2"


def command_line(enabled_field=None):
    vals = {k: 0 for k in ENABLE_FIELDS}
    if enabled_field is not None:
        vals[enabled_field] = 1

    fields = ", ".join(f"{k} = {vals[k]}" for k in ENABLE_FIELDS)
    return f"Command = 1, {fields} : NULL : WAIT = {SETTLE_WAIT_S}\n"


outstr = ""
outstr += "#43009-1\n"
outstr += "#Version 0.2\n"
outstr += "#message enable/disable independence validation (ID-specific)\n"
outstr += "UUT_DBC = 43009-560.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "# Frame IDs under test (43009-560.dbc)\n"
for t in TARGETS:
    outstr += "# " + f"{t['name']:<6}" + " = " + t["can_id"] + "\n"
outstr += "\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#start from all-target-messages disabled\n"
outstr += command_line(None)
for t in TARGETS:
    outstr += "UUT_TXCHECK_NOT_ID " + t["can_id"] + " " + SILENT_TIMEOUT_S + "\n"
outstr += "\n"

for t in TARGETS:
    outstr += "#-----" + t["enable"] + " only-----\n"
    outstr += command_line(t["enable"])
    outstr += "UUT_TXCHECK_ID " + t["can_id"] + " " + t["present_timeout_s"] + "\n"
    for other in TARGETS:
        if other["enable"] == t["enable"]:
            continue
        outstr += "UUT_TXCHECK_NOT_ID " + other["can_id"] + " " + SILENT_TIMEOUT_S + "\n"
    outstr += command_line(None)
    outstr += "UUT_TXCHECK_NOT_ID " + t["can_id"] + " " + SILENT_TIMEOUT_S + "\n"
    outstr += "\n"

outstr += "SAVE\n"
outstr += "END\n"

with open(datafile, "w", encoding="utf-8", newline="\n") as f:
    f.write(outstr)

print(outstr)
print(TestName + ".pat")
