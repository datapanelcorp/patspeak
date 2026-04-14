t = 0
i = 0
Frequancy = 100
Kp = 0.8
Ki = 0.5

PortMode = 0

Coil1 = "J4_01"
Coil2 = "J4_02"
Scope = "J4_03"

Kp = Kp * 100
Ki = Ki * 100

#global setup
TestName = "34044-3-PWMI-NORMAL-OVERCURRENT"
datafile = TestName + ".pat"

outstr = ""
outstr += "#34044-3\n"
outstr += "#Verion 0.0\n"
outstr += "#PWMi normal test with a 2.1 Ohm resistive load. (6.9 amps @ 14.5 VDC)\n"
outstr += "#PWMi overshoot should cause the output to overcurrent\n"
outstr += "UUT_DBC = 34044-563.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 34044-----\n"
outstr += "#disable global modes\n"

outstr += "#configure PWMi\n"
outstr += "Command = 83, MODE1A = 1, MODE1B = 4, MODE2A = 4, MODE2B = 4, MODE3A = 1, MODE3B = 4, MODE4A = 4, MODE4B = 4, MODE5A = 4, MODE5B = 4, MODE6A = 4, MODE6B = 4, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5\n"
outstr += "Command = 84, MODE8A = 4, MODE8B = 4 : NULL : WAIT = 0.5\n"
outstr += "Command = 84, Port1A_Kp = " + f"{Kp}" + ", Port1A_Ki = " + f"{Ki}" + ", Port1B_Kp = " + f"{Kp}" + ", Port1B_Ki = " + f"{Ki}" + ", Port2A_Kp = " + f"{Kp}" + ", Port2A_Ki = " + f"{Ki}" + " : NULL : WAIT = 0.5\n"
outstr += "Command = 85, Port2B_Kp = " + f"{Kp}" + ", Port2B_Ki = " + f"{Ki}" + ", Port3A_Kp = " + f"{Kp}" + ", Port3A_Ki = " + f"{Ki}" + ", Port3B_Kp = " + f"{Kp}" + ", Port3B_Ki = " + f"{Ki}" + " : NULL : WAIT = 0.5\n"
outstr += "Command = 86, Port4A_Kp = " + f"{Kp}" + ", Port4A_Ki = " + f"{Ki}" + ", Port4B_Kp = " + f"{Kp}" + ", Port4B_Ki = " + f"{Ki}" + ", Port5A_Kp = " + f"{Kp}" + ", Port5A_Ki = " + f"{Ki}" + ", Port5B_Kp = " + f"{Kp}" + " : NULL : WAIT = 0.5\n"
outstr += "Command = 89, Port5B_Ki = " + f"{Ki}" + ", Port6A_Kp = " + f"{Kp}" + ", Port6A_Ki = " + f"{Ki}" + ", Port6B_Kp = " + f"{Kp}" + ", Port6B_Ki = " + f"{Ki}" + ", Port7A_Kp = " + f"{Kp}" + ", Port7A_Ki = " + f"{Ki}" + " : NULL : WAIT = 0.5\n"
outstr += "Command = 90, Port7B_Kp = " + f"{Kp}" + ", Port7B_Ki = " + f"{Ki}" + ", Port8A_Kp = " + f"{Kp}" + ", Port8A_Ki = " + f"{Ki}" + ", Port8B_Kp = " + f"{Kp}" + ", Port8B_Ki = " + f"{Ki}" + " : NULL : WAIT = 0.5\n"
outstr += "Command = 93, PORT1_MODE = " + str(PortMode) + ", PORT2_MODE = " + str(PortMode) + ", PORT3_MODE = " + str(PortMode) + ", PORT4_MODE = " + str(PortMode) + ", PORT5_MODE = " + str(PortMode) + ", PORT6_MODE = " + str(PortMode) + ", PORT7_MODE = " + str(PortMode) + ", PORT8_MODE = " + str(PortMode) + " : NULL : WAIT = 0.5\n"
outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", SaveSettings = 1, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1 : NULL\n"
outstr += "Command = 82, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL\n"
outstr += "Command = 82, SaveSettings = 1 : NULL\n"

#outstr += "#clean DBC signals\n"
#outstr += "Command = 0 : NULL : WAIT = 0.5\n"
#outstr += "MODE1 = 0, MODE2 = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0, MODE8A = 0, MODE8B = 0 : NULL : WAIT = 0.5\n"
#outstr += "\n"


while t <= 15:
    outstr += Coil1 + " = 1, " + Scope + " = 1 : NULL : WAIT = 1\n"
    # if t % 2 == 0:
        # outstr += Coil1 + " = 1, " + Scope + " = 1 : NULL : WAIT = 1\n"
    # else:
        # outstr += Coil2 + " = 1, " + Scope + " = 1 : NULL : WAIT = 1\n"
    
    #skip 1A & 3A
    if(t == 0):
        t = 1
    if(t == 4):
        t = 5 
        
    if(t == 0):
        OutputName = "PWM_CTRL_1A"
        FeedbackName = "Feedback1A"
        OutputConnector = "J2_01"
        OutputStatus = "OutStat1A"
    if(t == 1):
        OutputName = "PWM_CTRL_1B"
        FeedbackName = "Feedback1B"
        OutputConnector = "J2_02"
        OutputStatus = "OutStat1B"
    if(t == 2):
        OutputName = "PWM_CTRL_2A"
        FeedbackName = "Feedback2A"
        OutputConnector = "J2_03"
        OutputStatus = "OutStat2A"
    if(t == 3):
        OutputName = "PWM_CTRL_2B"
        FeedbackName = "Feedback2B"
        OutputConnector = "J2_04"
        OutputStatus = "OutStat2B"
    if(t == 4):
        OutputName = "PWM_CTRL_3A"
        FeedbackName = "Feedback3A"
        OutputConnector = "J2_05"
        OutputStatus = "OutStat3A"
    if(t == 5):
        OutputName = "PWM_CTRL_3B"
        FeedbackName = "Feedback3B"
        OutputConnector = "J2_06"
        OutputStatus = "OutStat3B"
    if(t == 6):
        OutputName = "PWM_CTRL_4A"
        FeedbackName = "Feedback4A"
        OutputConnector = "J2_07"
        OutputStatus = "OutStat4A"
    if(t == 7):
        OutputName = "PWM_CTRL_4B"
        FeedbackName = "Feedback4B"
        OutputConnector = "J2_08"
        OutputStatus = "OutStat4B"
    if(t == 8):
        OutputName = "PWM_CTRL_5A"
        FeedbackName = "Feedback5A"
        OutputConnector = "J2_09"
        OutputStatus = "OutStat5A"
    if(t == 9):
        OutputName = "PWM_CTRL_5B"
        FeedbackName = "Feedback5B"
        OutputConnector = "J2_10"
        OutputStatus = "OutStat5B"
    if(t == 10):
        OutputName = "PWM_CTRL_6A"
        FeedbackName = "Feedback6A"
        OutputConnector = "J2_11"
        OutputStatus = "OutStat6A"
    if(t == 11):
        OutputName = "PWM_CTRL_6B"
        FeedbackName = "Feedback6B"
        OutputConnector = "J2_12"
        OutputStatus = "OutStat6B"
    if(t == 12):
        OutputName = "PWM_CTRL_7A"
        FeedbackName = "Feedback7A"
        OutputConnector = "J3_01"
        OutputStatus = "OutStat7A"
    if(t == 13):
        OutputName = "PWM_CTRL_7B"
        FeedbackName = "Feedback7B"
        OutputConnector = "J3_02"
        OutputStatus = "OutStat7B"
    if(t == 14):
        OutputName = "PWM_CTRL_8A"
        FeedbackName = "Feedback8A"
        OutputConnector = "J3_03"
        OutputStatus = "OutStat8A"
    if(t == 15):
        OutputName = "PWM_CTRL_8B"
        FeedbackName = "Feedback8B"
        OutputConnector = "J3_04"
        OutputStatus = "OutStat8B"

    outstr += "#switch in load line, set current\n"
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.5\n"

    outstr += "\n"
    i = 4000
    while i <= 4000:
        outstr += OutputName + " = " + str(i) + " : " + OutputStatus + " = 2 | 1 | 1\n"
        i += 1000
            
    outstr += "#switch out load line, switch coil\n"
    outstr += OutputName + " = 0 : NULL : WAIT = 1\n"
    outstr += OutputConnector + " = 0 : NULL : WAIT = 1\n"
    #outstr += "SAVE\n"
    # if t % 2 == 0:
        # outstr += Coil1 + " = 0, " + Scope + " = 1 : NULL : WAIT = 0.5\n"
    # else:
        # outstr += Coil2 + " = 0, " + Scope + " = 1 : NULL : WAIT = 0.5\n"
    t += 1
    #outstr += "SAVE\n"
#shut down test
outstr += "SAVE\n"
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



