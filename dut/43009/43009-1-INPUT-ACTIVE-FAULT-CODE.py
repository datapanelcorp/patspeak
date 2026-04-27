import os


script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
script_dir = os.path.dirname(os.path.abspath(__file__))
datafile = os.path.join(script_dir, TestName + ".pat")


PORTS = [
    ("Port_1A", "J1_01"),
    ("Port_1B", "J1_02"),
    ("Port_2A", "J1_03"),
    ("Port_2B", "J1_04"),
    ("Port_3A", "J1_05"),
    ("Port_3B", "J1_06"),
    ("Port_4A", "J1_07"),
    ("Port_4B", "J1_08"),
]

# J1939 Request PGN (0xEA00), destination global (0xFF), controller SA=0xD1.
PWS_REQUEST_CAN_ID = "0x18EAFFD1"
# Request PGN FEAC in J1939 byte order: Data[0..2] = AC FE 00.
PWS_REQUEST_BYTES = "172 254 0 0 0 0 0 0"
# Firmware rejects controller SA 0x00. Use fixed controller SA 0xD1.
CTRL1_CMD0_CAN_ID = "0x18EFD9D1"
CTRL1_CMD0_BYTES_RAW = "0 0 0 0 0 0 0 0"

V_LOW = 0.0
V_NOM = 1.0
V_FAULT = 5.7
V_TOL = "0.050"
SUPPLY_SETTLE = 0.20
FAULT_CLEAR_WAIT = 0.40
ACTIVE_FAULT_NONE = 0
ACTIVE_FAULT_INPUT_OVERVOLTAGE = 53


def ps_set_cmd(volts: float, wait_s: float = SUPPLY_SETTLE) -> str:
    # PAT bench supply uses 0.1V units.
    decivolts = int(round(volts * 10.0))
    return f"PwrSetVoltage = {decivolts} : NULL : WAIT = {wait_s:.2f}\n"


def send_can_cmd(can_id: str, payload: str) -> str:
    return "SEND_CAN CH0 " + can_id + " " + payload + "\n"


def pws_request_cmd() -> str:
    return "SEND_CAN CH0 " + PWS_REQUEST_CAN_ID + " " + PWS_REQUEST_BYTES + "\n"


outstr = ""
outstr += "#43009-1\n"
outstr += "#Version 0.1\n"
outstr += "#focused Active_Fault_Code validation for input overvoltage\n"
outstr += "UUT_DBC = 43009-560.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#force command 0 and verify comms are alive\n"
outstr += send_can_cmd(CTRL1_CMD0_CAN_ID, CTRL1_CMD0_BYTES_RAW)
outstr += "Command = 0 : NULL : WAIT = 0.5\n"
outstr += "NULL : Response = 0 | 0.1 | 0.3\n"
outstr += "NULL : Software_Version = 0 | 255 | 0.3\n"
outstr += "NULL : Software_Revision = 0 | 255 | 0.3\n"
outstr += "\n"

outstr += "#-----setup PAT-----\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#setup PS1 input path\n"
outstr += "PwrRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "PwrSetCurrent = 100 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 10 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "#all input routes off before test\n"
outstr += "J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2\n"
outstr += "\n"

for feedback, output_connector in PORTS:
    outstr += "#-----" + feedback + " Active_Fault_Code-----\n"
    outstr += output_connector + " = 1 : NULL : WAIT = 0.1\n"
    outstr += "\n"

    outstr += "#normal 1.0V should not report active fault\n"
    outstr += ps_set_cmd(V_NOM, wait_s=0.10)
    outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.20\n"
    outstr += "NULL : MeterVolts = " + f"{V_NOM:.1f}" + " | " + V_TOL + " | 0.2\n"
    outstr += send_can_cmd(CTRL1_CMD0_CAN_ID, CTRL1_CMD0_BYTES_RAW)
    outstr += "Command = 0 : NULL : WAIT = 0.2\n"
    outstr += pws_request_cmd()
    outstr += "NULL : Active_Fault_Code = " + str(ACTIVE_FAULT_NONE) + " | 0.1 | 0.3\n"
    outstr += "\n"

    outstr += "#fault at 5.7V must report Active_Fault_Code=53\n"
    outstr += ps_set_cmd(V_FAULT, wait_s=0.20)
    outstr += "NULL : MeterVolts = " + f"{V_FAULT:.1f}" + " | " + V_TOL + " | 0.2\n"
    outstr += send_can_cmd(CTRL1_CMD0_CAN_ID, CTRL1_CMD0_BYTES_RAW)
    outstr += "Command = 0 : NULL : WAIT = 0.2\n"
    outstr += pws_request_cmd()
    outstr += "NULL : Active_Fault_Code = " + str(ACTIVE_FAULT_INPUT_OVERVOLTAGE) + " | 0.1 | 0.3\n"
    outstr += "\n"

    outstr += "#return to 1.0V and verify fault clears\n"
    outstr += ps_set_cmd(V_NOM, wait_s=FAULT_CLEAR_WAIT)
    outstr += "NULL : MeterVolts = " + f"{V_NOM:.1f}" + " | " + V_TOL + " | 0.3\n"
    outstr += send_can_cmd(CTRL1_CMD0_CAN_ID, CTRL1_CMD0_BYTES_RAW)
    outstr += "Command = 0 : NULL : WAIT = 0.2\n"
    outstr += pws_request_cmd()
    outstr += "NULL : Active_Fault_Code = " + str(ACTIVE_FAULT_NONE) + " | 0.1 | 0.3\n"
    outstr += "\n"

    outstr += "#back to 0V (path off) before switching input\n"
    outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20\n"
    outstr += "NULL : MeterVolts = " + f"{V_LOW:.1f}" + " | " + V_TOL + " | 0.2\n"
    outstr += "\n"

    outstr += output_connector + " = 0 : NULL : WAIT = 0.1\n"
    outstr += "\n"

outstr += "#-----teardown-----\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.20\n"
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrSetCurrent = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "SAVE\n"
outstr += "END\n"

with open(datafile, "w", encoding="utf-8") as f:
    f.write(outstr)

print(outstr)
print(TestName + ".pat")
