t = 0
i = 0
Frequancy = 200
Kp = 0.7
Ki = 0.3

PinMode1_3 = str(1)
PinMode = str(1)

PortMode = 2

#global setup
TestName = "34044-1-OUTPUT-DIGITAL-BRIDGE-BRAKE"
datafile = TestName + ".pat"

outstr = ""
outstr += "#34044-1\n"

outstr += "#Verion 0.0\n"
outstr += "UUT_DBC = 34044-561.dbc\n"
outstr += "#Digital h-bridge brake test with 5 Ohm resistive pull-up load. (3.62 amps @ 14.5 VDC)\n"
outstr += "#this verifies the pins can sink current when put into brake mode.\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 34044-----\n"
outstr += "#disable global modes\n"

outstr += "#configure PWMi\n"
outstr += "Command = 83, MODE1A = " + PinMode1_3 + ", MODE1B = " + PinMode1_3 + ", MODE2A = " + PinMode + ", MODE2B = " + PinMode + ", MODE3A = " + PinMode1_3 + ", MODE3B = " + PinMode1_3 + ", MODE4A = " + PinMode + ", MODE4B = " + PinMode + ", MODE5A = " + PinMode + ", MODE5B = " + PinMode + ", MODE6A = " + PinMode + ", MODE6B = " + PinMode + ", MODE7A = " + PinMode + ", MODE7B = " + PinMode + " : NULL : WAIT = 0.5\n"
outstr += "Command = 84, MODE8A = " + PinMode + ", MODE8B = " + PinMode + " : NULL : WAIT = 0.5\n"
outstr += "Command = 93, PORT1_MODE = " + str(PortMode) + ", PORT2_MODE = " + str(PortMode) + ", PORT3_MODE = " + str(PortMode) + ", PORT4_MODE = " + str(PortMode) + ", PORT5_MODE = " + str(PortMode) + ", PORT6_MODE = " + str(PortMode) + ", PORT7_MODE = " + str(PortMode) + ", PORT8_MODE = " + str(PortMode) + " : NULL : WAIT = 0.5\n"
outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL\n"
outstr += "Command = 82, SaveSettings = 1 : NULL\n"

outstr += "#clean DBC signals\n"
outstr += "Command = 0 : NULL : WAIT = 0.5\n"
outstr += "MODE1 = 0, MODE2 = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0, MODE8A = 0, MODE8B = 0 : NULL : WAIT = 0.5\n"
outstr += "PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0, PORT5_MODE = 0, PORT6_MODE = 0, PORT7_MODE = 0, PORT8_MODE = 0 : NULL : WAIT = 0.5\n"
outstr += "\n"

outstr += "#switch in high side load\n"
outstr += "J5_01 = 1 : NULL : WAIT = 1\n"

while t <= 7:
    if(t == 0):
        OutputNameA = "Output1A"
        OutputNameB = "Output1B"
        OutputConnector = "J2_01"
    if(t == 1):
        OutputNameA = "Output1A"
        OutputNameB = "Output1B"
        OutputConnector = "J2_02"
    if(t == 2):
        OutputNameA = "Output2A"
        OutputNameB = "Output2B"
        OutputConnector = "J2_03"
    if(t == 3):
        OutputNameA = "Output2A"
        OutputNameB = "Output2B"
        OutputConnector = "J2_04"
    if(t == 4):
        OutputNameA = "Output3A"
        OutputNameB = "Output3B"
        OutputConnector = "J2_05"
    if(t == 5):
        OutputNameA = "Output3A"
        OutputNameB = "Output3B"
        OutputConnector = "J2_06"
    if(t == 6):
        OutputNameA = "Output4A"
        OutputNameB = "Output4B"
        OutputConnector = "J2_07"
    if(t == 7):
        OutputNameA = "Output4A"
        OutputNameB = "Output4B"
        OutputConnector = "J2_08"

        
    outstr += "#switch meter to load line\n"
    outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2\n"
    outstr += "#switch output to load line\n"
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.2\n"
    outstr += "\n"
    outstr += "#brake mode\n"
    outstr += "Command = 81, " + OutputNameA + " = 1, " + OutputNameB + " = 1 : MeterVolts = " + str(0.4) + " | 0.2 | 0.1\n" 

    outstr += "#switch out load line, clear current\n"
    outstr += OutputNameA + " = 0, " + OutputNameB + " = 0 : NULL : WAIT = 0.1\n"
    outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1\n"
    outstr += OutputConnector + " = 0 : NULL : WAIT = 0.1\n"

    t += 1
    

    
outstr += "SAVE\n"
#shut down test
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



