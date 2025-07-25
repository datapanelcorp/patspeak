t = 0
i = 0
Frequancy = 100
Kp = 0.2
Ki = 0.1

PortMode = 0

Coil1 = "J4_01"
Coil2 = "J4_02"
Scope = "J4_03"

Kp = Kp * 100
Ki = Ki * 100

#global setup
TestName = "34044-1-OUTPUT-PWMI-NORMAL"
datafile = TestName + ".pat"

outstr = ""
outstr += "#34044-1\n"
outstr += "#Verion 0.0\n"
outstr += "#PWMi h-bridge test with a 'red coil' 6.4 ohm inductive load. (2.27 amps @ 14.5 VDC)\n"
outstr += "UUT_DBC = 34044-561.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 34044-----\n"
outstr += "#disable global modes\n"

outstr += "#configure PWMi\n"
outstr += "Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4: NULL : WAIT = 0.5\n"
outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL\n"
outstr += "Command = 84, MODE8A = 4, MODE8B = 4 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, MODE8A = 0, MODE8B = 0 : NULL\n"
outstr += "Command = 84, Port1A_Kp = " + f"{Kp}" + ", Port1A_Ki = " + f"{Ki}" + ", Port1B_Kp = " + f"{Kp}" + ", Port1B_Ki = " + f"{Ki}" + ", Port2A_Kp = " + f"{Kp}" + ", Port2A_Ki = " + f"{Ki}" + " : NULL : WAIT = 0.5\n"
outstr += "Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL\n"
outstr += "Command = 85, Port2B_Kp = " + f"{Kp}" + ", Port2B_Ki = " + f"{Ki}" + ", Port3A_Kp = " + f"{Kp}" + ", Port3A_Ki = " + f"{Ki}" + ", Port3B_Kp = " + f"{Kp}" + ", Port3B_Ki = " + f"{Ki}" + " : NULL : WAIT = 0.5\n"
outstr += "Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL\n"
outstr += "Command = 86, Port4A_Kp = " + f"{Kp}" + ", Port4A_Ki = " + f"{Ki}" + ", Port4B_Kp = " + f"{Kp}" + ", Port4B_Ki = " + f"{Ki}" + " : NULL : WAIT = 0.5\n"
outstr += "Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL\n"
outstr += "Command = 93, PORT1_MODE = " + str(PortMode) + ", PORT2_MODE = " + str(PortMode) + ", PORT3_MODE = " + str(PortMode) + ", PORT4_MODE = " + str(PortMode) + " : NULL : WAIT = 0.5\n"
outstr += "Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL\n"
outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", SaveSettings = 1, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, FREQ1 = 0, SaveSettings = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"

while t <= 7:
    if t % 2 == 0:
        outstr += Coil1 + " = 1, " + Scope + " = 1 : NULL : WAIT = 1\n"
    else:
        outstr += Coil2 + " = 1, " + Scope + " = 1 : NULL : WAIT = 1\n"
        
    if(t == 0):
        OutputName = "PWM_CTRL_1A"
        FeedbackName = "Feedback1A"
        OutputConnector = "J2_01"
    if(t == 1):
        OutputName = "PWM_CTRL_1B"
        FeedbackName = "Feedback1B"
        OutputConnector = "J2_02"
    if(t == 2):
        OutputName = "PWM_CTRL_2A"
        FeedbackName = "Feedback2A"
        OutputConnector = "J2_03"
    if(t == 3):
        OutputName = "PWM_CTRL_2B"
        FeedbackName = "Feedback2B"
        OutputConnector = "J2_04"
    if(t == 4):
        OutputName = "PWM_CTRL_3A"
        FeedbackName = "Feedback3A"
        OutputConnector = "J2_05"
    if(t == 5):
        OutputName = "PWM_CTRL_3B"
        FeedbackName = "Feedback3B"
        OutputConnector = "J2_06"
    if(t == 6):
        OutputName = "PWM_CTRL_4A"
        FeedbackName = "Feedback4A"
        OutputConnector = "J2_07"
    if(t == 7):
        OutputName = "PWM_CTRL_4B"
        FeedbackName = "Feedback4B"
        OutputConnector = "J2_08"

    outstr += "#switch in load line, set current\n"
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.5\n"

    outstr += "\n"
    i = 0
    while i <= 1500:
        outstr += OutputName + " = " + str(i) + " : MeterAmps = " + str(i/1000) + " | 0.155 | 0.5\n"
        outstr += OutputName + " = " + str(i) + " : " + FeedbackName + " = " + str(i/1000) + " | 0.155 | 0.5\n"
        i += 100
            
    outstr += "#switch out load line, switch coil\n"
    outstr += OutputName + " = 0 : NULL : WAIT = 1\n"
    outstr += OutputConnector + " = 0 : NULL : WAIT = 1\n"
    if t % 2 == 0:
        outstr += Coil1 + " = 0, " + Scope + " = 1 : NULL : WAIT = 0.5\n"
    else:
        outstr += Coil2 + " = 0, " + Scope + " = 1 : NULL : WAIT = 0.5\n"
    t += 1

#shut down test
outstr += "SAVE\n"
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



