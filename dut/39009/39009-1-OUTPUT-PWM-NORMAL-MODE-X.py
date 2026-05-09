import os

script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")

# configuration
FIRST_STEP_SETTLE_WAIT = 0.8
FIRST_STEP_TIMEOUT = 8
OUTPUT_MODES = (0x22, 0x33)  # 34 and 51


def _append_meter_current_20a(outstr):
    outstr += "# Set multimeter to DC current for high-current path (lead must be on 20A jack)\n"
    # Legacy path is the most reliable way to keep ROI in current mode.
    outstr += "METER_MODE = 1 : NULL : WAIT = 0.4\n"
    outstr += "METER_MODE = 1 : NULL : WAIT = 0.4\n"
    outstr += "NULL : NULL : WAIT = 0.4\n"
    return outstr


def _append_prompt_connect_5p1_load(outstr):
    outstr += "PAUSE-Set meter to mA mode. Connect 5.1 Ohm resistive load. Press Enter to continue.\n"
    return outstr


def write_output_test(outstr, output_mode):
    load1 = "J4_01"
    scope = "J4_03"
    outstr = _append_meter_current_20a(outstr)
    outstr += "#switch in 5.1 Ohm resistive load. (2.84 amps @ 14.5 VDC)\n"
    outstr += load1 + " = 1 : NULL : WAIT = 0.2\n"
    outstr += scope + " = 1 : NULL : WAIT = 0.2\n"

    ports = [
        ("PWM_CTRL_2A", "Feedback2A", "J3_01"),
        ("PWM_CTRL_2B", "Feedback2B", "J3_02"),
        ("PWM_CTRL_4A", "Feedback4A", "J3_03"),
        ("PWM_CTRL_4B", "Feedback4B", "J3_04"),
        ("PWM_CTRL_6A", "Feedback6A", "J3_05"),
        ("PWM_CTRL_6B", "Feedback6B", "J3_06"),
        ("PWM_CTRL_8A", "Feedback8A", "J3_07"),
        ("PWM_CTRL_8B", "Feedback8B", "J3_08"),
        ("PWM_CTRL_10A", "Feedback10A", "J3_09"),
        ("PWM_CTRL_10B", "Feedback10B", "J3_10"),
    ]

    step1 = 250
    step2 = 500
    step3 = 1000

    if output_mode == 0x22:
        step1 = 1000
        step2 = 2000
        step3 = 4000

    for idx, (output_name, feedback_name, output_connector) in enumerate(ports):
        outstr += "#switch in load line, set current\n"
        outstr += output_connector + " = 1 : NULL : WAIT = 0.5\n"
        outstr += "METER_MODE = 1 : NULL : WAIT = 0.3\n"
        outstr += "\n"

        outstr += output_name + " = " + str(step1) + " : NULL : WAIT = 0.2\n"
        if idx == 0:
            outstr += "#warm-up first meter sample after mode switch\n"
            outstr += "NULL : NULL : WAIT = " + str(FIRST_STEP_SETTLE_WAIT) + "\n"
            outstr += "NULL : MeterAmps = 0.7 | 0.3 | 0.5 : TIMEOUT = " + str(FIRST_STEP_TIMEOUT) + "\n"
        else:
            outstr += "NULL : MeterAmps = 0.7 | 0.3 | 0.5\n"
        outstr += "NULL : " + feedback_name + " = 0.7 | 0.2 | 0.5\n"

        outstr += output_name + " = " + str(step2) + " : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 1.4 | 0.3 | 0.5\n"
        outstr += "NULL : " + feedback_name + " = 1.4 | 0.2 | 0.5\n"

        outstr += output_name + " = " + str(step3) + " : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 2.8 | 0.3 | 0.5\n"
        outstr += "NULL : " + feedback_name + " = 2.8 | 0.2 | 0.5\n"

        outstr += "#switch out load line, switch coil\n"
        outstr += output_name + " = 0 : NULL : WAIT = 0.5\n"
        outstr += output_connector + " = 0 : NULL : WAIT = 0.5\n"

    return outstr


def build_pat(output_mode):
    test_name = os.path.splitext(script_name)[0].replace("X", str(output_mode))
    datafile = "!" + test_name + ".pat"

    outstr = ""
    outstr += "#39009-1\n"
    outstr += "#Verion 0.0\n"
    outstr += "#PWM test with 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)\n"
    outstr += "UUT_DBC = 39009-561.dbc\n"
    outstr += "UUT_DATANAME = " + test_name + "\n"
    outstr += "\n"

    outstr += "#-----setup 39009-----\n"
    outstr += "#configure as Output Digital ON/OFF\n"
    outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0 : NULL : WAIT = 0.5\n"
    outstr += (
        "Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = "
        + str(output_mode)
        + ", MODE2B = "
        + str(output_mode)
        + ", MODE3A = 4, MODE3B = 4, MODE4A = "
        + str(output_mode)
        + ", MODE4B = "
        + str(output_mode)
        + ", MODE5A = 4, MODE5B = 4, MODE6A = "
        + str(output_mode)
        + ", MODE6B = "
        + str(output_mode)
        + ", MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5\n"
    )
    outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL\n"
    outstr += (
        "Command = 84, MODE8A = "
        + str(output_mode)
        + ", MODE8B = "
        + str(output_mode)
        + ", MODE9A = 4, MODE9B = 4, MODE10A = "
        + str(output_mode)
        + ", MODE10B = "
        + str(output_mode)
        + ", GLOBAL_KP = 255, GLOBAL_KI =  255 : NULL : WAIT = 0.5\n"
    )
    outstr += "Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL\n"

    outstr += "Command = 82, FREQ1 = 1000, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
    outstr += "Command = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"

    # Prompt once at startup for manual meter/load setup.
    outstr = _append_meter_current_20a(outstr)
    outstr = _append_prompt_connect_5p1_load(outstr)

    for frequency in (1000, 500, 64):
        outstr += "#test at " + str(frequency) + "hz\n"
        outstr += (
            "Command = 82, FREQ1 = "
            + str(frequency)
            + ", MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
        )
        outstr = write_output_test(outstr, output_mode)

    outstr += "SAVE\n"
    outstr += "END\n"
    return datafile, outstr


def main():
    generated = []
    for output_mode in OUTPUT_MODES:
        datafile, outstr = build_pat(output_mode)
        with open(datafile, "w") as f:
            f.write(outstr)
        generated.append(datafile)

    for path in generated:
        print(path)


if __name__ == "__main__":
    main()
