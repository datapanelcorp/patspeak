t = 0
i = 0
Frequancy = 100
Kp = 0.05
Ki = 0.02

PortMode = 2

Coil1 = "J4_01"
Coil2 = "J4_02"
Scope = "J4_03"

Kp = Kp * 100
Ki = Ki * 100

#global setup
TestName = "34044-3-PWMI-BRIDGE"
datafile = TestName + ".pat"

outstr = ""
outstr += "#34044-3\n"
outstr += "#Verion 0.0\n"
outstr += "#PWMi h-bridge test with a 'red coil' 6.4 ohm inductive load. (2.27 amps @ 14.5 VDC)\n"
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

outstr += "#clean DBC signals\n"
outstr += "Command = 0 : NULL : WAIT = 0.5\n"
outstr += "MODE1 = 0, MODE2 = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0, MODE8A = 0, MODE8B = 0 : NULL : WAIT = 0.5\n"
outstr += "\n"


t = 0
while t <= 7:

    #skip 1A & 3A
    if(t == 0):
        t = 1
    if(t == 2):
        t = 3 

    if(t == 0):
        OutputName = "PWM_CTRL_1A"
        FeedbackNameA = "Feedback1A"
        FeedbackNameB = "Feedback1B"
        OutputConnectorA = "J2_01"
        OutputConnectorB = "J2_02"
        OutputStatusA = "OutStat1A"
        OutputStatusB = "OutStat1B"
        DirectionCtrl = "BRIDGE1_DIR"
    if(t == 1):
        OutputName = "PWM_CTRL_2A"
        FeedbackNameA = "Feedback2A"
        FeedbackNameB = "Feedback2B"
        OutputConnectorA = "J2_03"
        OutputConnectorB = "J2_04"
        OutputStatusA = "OutStat2A"
        OutputStatusB = "OutStat2B"
        DirectionCtrl = "BRIDGE2_DIR"
    if(t == 2):
        OutputName = "PWM_CTRL_3A"
        FeedbackNameA = "Feedback3A"
        FeedbackNameB = "Feedback3B"
        OutputConnectorA = "J2_05"
        OutputConnectorB = "J2_06"
        OutputStatusA = "OutStat3A"
        OutputStatusB = "OutStat3B"
        DirectionCtrl = "BRIDGE3_DIR"
    if(t == 3):
        OutputName = "PWM_CTRL_4A"
        FeedbackNameA = "Feedback4A"
        FeedbackNameB = "Feedback4B"
        OutputConnectorA = "J2_07"
        OutputConnectorB = "J2_08"
        OutputStatusA = "OutStat4A"
        OutputStatusB = "OutStat4B"
        DirectionCtrl = "BRIDGE4_DIR"
    if(t == 4):
        OutputName = "PWM_CTRL_5A"
        FeedbackNameA = "Feedback5A"
        FeedbackNameB = "Feedback5B"
        OutputConnectorA = "J2_09"
        OutputConnectorB = "J2_10"
        OutputStatusA = "OutStat5A"
        OutputStatusB = "OutStat5B"
        DirectionCtrl = "BRIDGE5_DIR"
    if(t == 5):
        OutputName = "PWM_CTRL_6A"
        FeedbackNameA = "Feedback6A"
        FeedbackNameB = "Feedback6B"
        OutputConnectorA = "J2_11"
        OutputConnectorB = "J2_12"
        OutputStatusA = "OutStat6A"
        OutputStatusB = "OutStat6B"
        DirectionCtrl = "BRIDGE6_DIR"
    if(t == 6):
        OutputName = "PWM_CTRL_7A"
        FeedbackNameA = "Feedback7A"
        FeedbackNameB = "Feedback7B"
        OutputConnectorA = "J3_01"
        OutputConnectorB = "J3_02"
        OutputStatusA = "OutStat7A"
        OutputStatusB = "OutStat7B"
        DirectionCtrl = "BRIDGE7_DIR"
    if(t == 7):
        OutputName = "PWM_CTRL_8A"
        FeedbackNameA = "Feedback8A"
        FeedbackNameB = "Feedback8B"
        OutputConnectorA = "J3_03"
        OutputConnectorB = "J3_04"
        OutputStatusA = "OutStat8A"
        OutputStatusB = "OutStat8B"
        DirectionCtrl = "BRIDGE8_DIR"
        
    #if t % 2 == 0:
    outstr += "#prompt user to switch\n"
    outstr += "PAUSE-please verify load connection " + DirectionCtrl + "\n"
        
    outstr += "\n"
    i = 0
    while i <= 2600:
        outstr += "#turn on output\n"
        DirectionValue = 1
        outstr += "Command = 81, " + OutputName + " = " + str(i) + ", " + DirectionCtrl + " = " + str(DirectionValue) + " : " + FeedbackNameA + " = " + str(i/1000) + " | 0.025 | 0.5\n"
        DirectionValue = 2
        outstr += "Command = 81, " + OutputName + " = " + str(i) + ", " + DirectionCtrl + " = " + str(DirectionValue) + " : " + FeedbackNameB + " = " + str(i/1000) + " | 0.025 | 0.5\n"
        i += 100
        
    outstr += "#turn off output\n"
    outstr += OutputName + " = 0 : NULL : WAIT = 1\n"
    t += 1

    
outstr += "SAVE\n"
#shut down test
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



