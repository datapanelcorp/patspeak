import os

# global setup
script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

outstr = ""
outstr += "#39009-1\n"
outstr += "#Verion 0.0\n"
outstr += "#input test\n"
outstr += "UUT_DBC = 39009-561.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#switch in 420ma gen\n"
outstr += "J4_05 = 1 : NULL : WAIT = 0.2\n"

outstr += "NULL : Input_1A = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_1B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_3A = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_3B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_5A = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_5B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_7A = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_7B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_9A = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_9B = 0 | 0.1 | 0.1\n"

PortBMode = "3"

AmpsInc = 5000
AmpsStart = AmpsInc
AmpsMax = 20000
AmpsValue = AmpsStart

outstr += "#-----setup 39009-----\n"
outstr += "#configure as Output Digital ON/OFF\n"
outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0 : NULL : WAIT = 0.5\n"
outstr += "Command = 83, MODE1A = " + PortBMode + ", MODE1B = " + PortBMode + ", MODE2A = 1, MODE2B = 1, MODE3A = " + PortBMode + ", MODE3B = " + PortBMode + ", MODE4A = 1, MODE4B = 1, MODE5A = " + PortBMode + ", MODE5B = " + PortBMode + ", MODE6A = 1, MODE6B = 1, MODE7A = " + PortBMode + ", MODE7B = " + PortBMode + " : NULL : WAIT = 0.5\n"
outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL\n"
outstr += "Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = " + PortBMode + ", MODE9B = " + PortBMode + ", MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL\n"
outstr += "Command = 82, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
outstr += "#clear multiplex\n"
outstr += "Command = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"

outstr += "MrSignalMode = 0 : NULL : WAIT = 0.1\n"
outstr += "MrSignalEnable = 1 : NULL : WAIT = 0.5\n"
outstr += "METER_MODE = 1 : NULL : WAIT = 0.2\n"

FIRST_PORT_SETTLE_WAIT = 0.8
FIRST_PORT_TIMEOUT = 12
METER_TOL = 0.01
METER_TEST_TIME = 0.1
PORT_TOL = 0.155
PORT_TEST_TIME = 0.1

while AmpsValue <= AmpsMax:
    outstr += "MrSignalSetValue = " + str(AmpsValue / 1000) + " : NULL : WAIT = 0.5\n"
    PortIndex = 0

    while PortIndex <= 9:
        if PortIndex == 0:
            Feedback = "Port_1A"
            OutputConnector = "J2_01"
        if PortIndex == 1:
            Feedback = "Port_1B"
            OutputConnector = "J2_02"
        if PortIndex == 2:
            Feedback = "Port_3A"
            OutputConnector = "J2_03"
        if PortIndex == 3:
            Feedback = "Port_3B"
            OutputConnector = "J2_04"
        if PortIndex == 4:
            Feedback = "Port_5A"
            OutputConnector = "J2_05"
        if PortIndex == 5:
            Feedback = "Port_5B"
            OutputConnector = "J2_06"
        if PortIndex == 6:
            Feedback = "Port_7A"
            OutputConnector = "J2_07"
        if PortIndex == 7:
            Feedback = "Port_7B"
            OutputConnector = "J2_08"
        if PortIndex == 8:
            Feedback = "Port_9A"
            OutputConnector = "J2_09"
        if PortIndex == 9:
            Feedback = "Port_9B"
            OutputConnector = "J2_10"

        outstr += "#switch input to load line\n"
        outstr += OutputConnector + " = 1 : NULL : WAIT = 0.1\n"
        if PortIndex == 0:
            outstr += "#warm-up first meter sample\n"
            outstr += "NULL : NULL : WAIT = " + str(FIRST_PORT_SETTLE_WAIT) + "\n"
        outstr += "\n"
        outstr += "\n"
        outstr += "#Sweep of " + Feedback + " from " + str(AmpsStart) + " to " + str(AmpsMax) + " in " + str(AmpsInc) + " increments\n"
        outstr += "\n"
        outstr += "#test ammmeter\n"
        meter_step = (
            "NULL : MeterAmps = "
            + str(AmpsValue / 1000000)
            + " | "
            + str(METER_TOL)
            + " | "
            + str(METER_TEST_TIME)
        )
        if PortIndex == 0:
            meter_step += " : TIMEOUT = " + str(FIRST_PORT_TIMEOUT)
        outstr += meter_step + "\n"
        outstr += "#test feedback\n"
        feedback_step = (
            "NULL : "
            + Feedback
            + " = "
            + str(AmpsValue / 1000)
            + " | "
            + str(PORT_TOL)
            + " | "
            + str(PORT_TEST_TIME)
        )
        if PortIndex == 0:
            feedback_step += " : TIMEOUT = " + str(FIRST_PORT_TIMEOUT)
        outstr += feedback_step + "\n"

        outstr += "\n"
        outstr += "#Finished with port\n"
        outstr += "#switch out input\n"
        outstr += OutputConnector + " = 0 : NULL : WAIT = 0.2\n"
        PortIndex += 1
        outstr += "\n"

    AmpsValue += AmpsInc

outstr += "\n"
outstr += "#Finished with mode\n"
outstr += "#switch out load line\n"
outstr += OutputConnector + " = 0 : NULL : WAIT = 0.1\n"
outstr += "MrSignalSetValue = 0.0 : NULL : WAIT = 0.2\n"
outstr += "MrSignalEnable = 0 : NULL : WAIT = 0.2\n"
outstr += "#switch out 420ma gen\n"
outstr += "J4_05 = 0 : NULL : WAIT = 0.2\n"
outstr += "SAVE\n"
outstr += "END\n"

f = open(datafile, "w")
f.write(outstr)
f.close()
print(outstr)

print(TestName + ".pat")
