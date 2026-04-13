import os

#global setup
script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

PortMode = 0

outstr = ""
outstr += "#43019-1\n"
outstr += "#Verion 0.0\n"
outstr += "#input test\n"
outstr += "UUT_DBC = 43019-560.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#switch in 420ma gen\n"
outstr += "J4_05 = 1 : NULL : WAIT = 0.2\n"

outstr += "NULL : Input_1A = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_1B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_2A = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_2B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_3A = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_3B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_4A = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_4B = 0 | 0.1 | 0.1\n"

PortIndex = 0
ModeIndex = 0

PortMode = "3"

AmpsInc = 5000
AmpsStart = AmpsInc
AmpsMax = 20000
AmpsValue = AmpsStart

outstr += "#-----setup 39009-----\n"
outstr += "#configure as Output Digital ON/OFF\n"
outstr += "Command = 82, MODE2 = 0, ADRaw = 0 : NULL : WAIT = 0.5\n"
outstr += "Command = 83, MODE1A = " + PortMode + ", MODE1B = " + PortMode + ", MODE2A = " + PortMode + ", MODE2B = " + PortMode + ", MODE3A = " + PortMode + ", MODE3B = " + PortMode + ", MODE4A = " + PortMode + ", MODE4B = " + PortMode + " : NULL : WAIT = 0.5\n"
outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL\n"

outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
outstr += "#clear multiplex\n"
outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"

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
    outstr += "MrSignalSetValue = " + str(AmpsValue/1000) + " : NULL : WAIT = 0.5\n"

    #outstr += f"PAUSE- OUTPUT SHOULD BE ON @ {AmpsValue/1000:.3f} mA\n"
    PortIndex = 0
    
    while PortIndex <= 7:
        
        if(PortIndex == 0):
            Feedback = "Port_1A"
            OutputConnector = "J1_01"
            Status = "Input_1A"
        if(PortIndex == 1):
            Feedback = "Port_1B"
            OutputConnector = "J1_02"
            Status = "Input_1B"
        if(PortIndex == 2):
            Feedback = "Port_2A"
            OutputConnector = "J1_03"
            Status = "Input_2A"
        if(PortIndex == 3):
            Feedback = "Port_2B"
            OutputConnector = "J1_04"
            Status = "Input_2B"
        if(PortIndex == 4):
            Feedback = "Port_3A"
            OutputConnector = "J1_05"
            Status = "Input_3A"
        if(PortIndex == 5):
            Feedback = "Port_3B"
            OutputConnector = "J1_06"
            Status = "Input_3B"
        if(PortIndex == 6):
            Feedback = "Port_4A"
            OutputConnector = "J1_07"
            Status = "Input_4A"
        if(PortIndex == 7):
            Feedback = "Port_4B"
            OutputConnector = "J1_08"
            Status = "Input_4B"

        InputName = Feedback

        

        outstr += "#switch input to load line\n"
        outstr += OutputConnector + " = 1 : NULL : WAIT = 0.1\n"
        if(PortIndex == 0):
            outstr += "#warm-up first meter sample\n"
            outstr += "NULL : NULL : WAIT = " + str(FIRST_PORT_SETTLE_WAIT) + "\n"
        outstr += "\n"
        outstr += "\n"
        outstr += "#Sweep of " + InputName + " from " + str(AmpsStart) + " to " + str(AmpsMax)  + " in " + str(AmpsInc) + " increments\n"
        outstr += "\n"
        
        #outstr += "PAUSE- TESTING " + InputName + ", SET GEN TO " + str(AmpsValue) + "ma\n"
        outstr += "#test ammmeter\n"
        meter_step = (
            "NULL : MeterAmps = "
            + str(AmpsValue/1000000)
            + " | "
            + str(METER_TOL)
            + " | "
            + str(METER_TEST_TIME)
        )
        if(PortIndex == 0):
            meter_step += " : TIMEOUT = " + str(FIRST_PORT_TIMEOUT)
        outstr += meter_step + "\n"
        outstr += "#test feedback\n"
        feedback_step = (
            "NULL : "
            + Feedback
            + " = "
            + str(AmpsValue/1000)
            + " | "
            + str(PORT_TOL)
            + " | "
            + str(PORT_TEST_TIME)
        )
        if(PortIndex == 0):
            feedback_step += " : TIMEOUT = " + str(FIRST_PORT_TIMEOUT)
        outstr += feedback_step + "\n"

        outstr += "\n"
        outstr += "#Finished with port\n"
        outstr += "#switch out input\n"
        outstr += OutputConnector + " = 0 : NULL : WAIT = 0.2\n"
        PortIndex += 1

        outstr += "\n"
        
    AmpsValue += AmpsInc

PortIndex = 0
outstr += "\n"
outstr += "#Finished with mode"
outstr += "\n"
    
outstr += "#switch out load line\n"
outstr += OutputConnector + " = 0 : NULL : WAIT = 0.1\n"
outstr += "#switch out 420ma gen\n"
outstr += "J4_05 = 0 : NULL : WAIT = 0.2\n"
outstr += "SAVE\n"
outstr += "END\n"

f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)


print(TestName + ".pat")
