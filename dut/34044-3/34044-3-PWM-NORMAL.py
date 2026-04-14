from output_pwm_normal_write import WriteOutputTest
 
t = 0
i = 0

PortMode = 0

#global setup
TestName = "34044-3-PWM-NORMAL"
datafile = TestName + ".pat"

outstr = ""
outstr += "#34044-3\n"
outstr += "#Verion 0.0\n"
outstr += "#PWM test with 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)\n"
outstr += "UUT_DBC = 34044-563.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 34044-----\n"
outstr += "#disable global modes\n"

outstr += "#configure Ports\n"
outstr += "Command = 83, MODE1A = 1, MODE1B = 3, MODE2A = 3, MODE2B = 3, MODE3A = 1, MODE3B = 3, MODE4A = 3, MODE4B = 3, MODE5A = 3, MODE5B = 3, MODE6A = 3, MODE6B = 3, MODE7A = 3, MODE7B = 3 : NULL : WAIT = 0.5\n"
outstr += "Command = 84, MODE8A = 3, MODE8B = 3 : NULL : WAIT = 0.5\n"
outstr += "Command = 93, PORT1_MODE = " + str(PortMode) + ", PORT2_MODE = " + str(PortMode) + ", PORT3_MODE = " + str(PortMode) + ", PORT4_MODE = " + str(PortMode) + ", PORT5_MODE = " + str(PortMode) + ", PORT6_MODE = " + str(PortMode) + ", PORT7_MODE = " + str(PortMode) + ", PORT8_MODE = " + str(PortMode) + " : NULL : WAIT = 0.5\n"
outstr += "Command = 82, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL\n"
outstr += "Command = 82, SaveSettings = 1 : NULL\n"

Frequancy = 40
outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", SaveSettings = 1 : NULL\n"
outstr = WriteOutputTest(outstr, Frequancy, 15)#all 15 outputs

Frequancy = 500
outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", SaveSettings = 1 : NULL\n"
outstr = WriteOutputTest(outstr, Frequancy, 15)#only check 2

Frequancy = 1200
outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", SaveSettings = 1 : NULL\n"
outstr = WriteOutputTest(outstr, Frequancy, 15)#only check 2

#shut down test
outstr += "SAVE\n"
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



