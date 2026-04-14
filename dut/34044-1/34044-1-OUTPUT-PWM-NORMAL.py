from output_pwm_normal_write import WriteOutputTest
 
t = 0
i = 0

PortMode = 0
OutputMode = 2
#global setup
TestName = "34044-1-OUTPUT-PWM-NORMAL-MODE-" + str(OutputMode)
datafile = TestName + ".pat"

outstr = ""
outstr += "#34044-1\n"
outstr += "#Verion 0.0\n"
outstr += "#PWM test with 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)\n"
outstr += "UUT_DBC = 34044-561.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 34044-----\n"
outstr += "#disable global modes\n"

outstr += "#configure Ports\n"
outstr += "Command = 83, MODE1A = " + str(OutputMode) + ", MODE1B = " + str(OutputMode) + ", MODE2A = " + str(OutputMode) + ", MODE2B = " + str(OutputMode) + ", MODE3A = " + str(OutputMode) + ", MODE3B = " + str(OutputMode) + ", MODE4A = " + str(OutputMode) + ", MODE4B = " + str(OutputMode) + " : NULL : WAIT = 0.5\n"
outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL\n"
outstr += "Command = 93, PORT1_MODE = " + str(PortMode) + ", PORT2_MODE = " + str(PortMode) + ", PORT3_MODE = " + str(PortMode) + ", PORT4_MODE = " + str(PortMode) + " : NULL : WAIT = 0.5\n"
outstr += "Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL : WAIT = 0.5\n"
outstr += "Command = 82, SaveSettings = 1, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, SaveSettings = 0, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"

Frequancy = 40
outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, FREQ1 = 0, SaveSettings = 0 : NULL\n"
outstr = WriteOutputTest(outstr, Frequancy, 7, OutputMode)

Frequancy = 500
outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, FREQ1 = 0, SaveSettings = 0 : NULL\n"
outstr = WriteOutputTest(outstr, Frequancy, 7, OutputMode)

Frequancy = 1200
outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, FREQ1 = 0, SaveSettings = 0 : NULL\n"
outstr = WriteOutputTest(outstr, Frequancy, 7, OutputMode)

#shut down test
outstr += "SAVE\n"
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



