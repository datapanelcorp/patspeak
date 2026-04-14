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
TestName = "34044-4-PWMI-NORMAL"
datafile = TestName + ".pat"

outstr = ""
outstr += "#34044-4\n"
outstr += "#Verion 0.0\n"
outstr += "#PWMi normal test with a 'red coil' 6.4 ohm inductive load. (2.27 amps @ 14.5 VDC)\n"
outstr += "UUT_DBC = 34044-564.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 34044-----\n"
outstr += "#disable global modes\n"

outstr += "#configure PWMi\n"
outstr += "Command = 83, MODE1A = 1, MODE1B = 4, MODE2A = 4, MODE2B = 4, MODE3A = 1, MODE3B = 4, MODE4A = 4, MODE4B = 4, MODE5A = 4, MODE5B = 4, MODE6A = 4, MODE6B = 4, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5\n"
outstr += "Command = 84, MODE8A = 4, MODE8B = 4 : NULL : WAIT = 0.5\n"
outstr += "Command = 84, Port1_Kp = " + f"{Kp}" + ", Port1_Ki = " + f"{Ki}" + ", Port2_Kp = " + f"{Kp}" + ", Port2_Ki = " + f"{Ki}" + ", Port3_Kp = " + f"{Kp}" + ", Port3_Ki = " + f"{Ki}" + " : NULL : WAIT = 0.5\n"
outstr += "Command = 85, Port4_Kp = " + f"{Kp}" + ", Port4_Ki = " + f"{Ki}" + ", Port5_Kp = " + f"{Kp}" + ", Port5_Ki = " + f"{Ki}" + ", Port6_Kp = " + f"{Kp}" + ", Port6_Ki = " + f"{Ki}" + " : NULL : WAIT = 0.5\n"
outstr += "Command = 86, Port7_Kp = " + f"{Kp}" + ", Port7_Ki = " + f"{Ki}" + ", Port8_Kp = " + f"{Kp}" + ", Port8_Ki = " + f"{Ki}" + " : NULL : WAIT = 0.5\n"
outstr += "Command = 93, PORT1_MODE = " + str(PortMode) + ", PORT2_MODE = " + str(PortMode) + ", PORT3_MODE = " + str(PortMode) + ", PORT4_MODE = " + str(PortMode) + ", PORT5_MODE = " + str(PortMode) + ", PORT6_MODE = " + str(PortMode) + ", PORT7_MODE = " + str(PortMode) + ", PORT8_MODE = " + str(PortMode) + " : NULL : WAIT = 0.5\n"
outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", SaveSettings = 1, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1 : NULL: WAIT = 0.5\n"
outstr += "Command = 82, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL: WAIT = 0.5\n"
outstr += "Command = 82, SaveSettings = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 0 : NULL\n"
#outstr += "#clean DBC signals\n"
#outstr += "Command = 0 : NULL : WAIT = 0.5\n"
#outstr += "MODE1 = 0, MODE2 = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0, MODE8A = 0, MODE8B = 0 : NULL : WAIT = 0.5\n"
#outstr += "\n"


while t <= 15:
    if t % 2 == 0:
        outstr += Coil1 + " = 1, " + Scope + " = 1 : NULL : WAIT = 1\n"
    else:
        outstr += Coil2 + " = 1, " + Scope + " = 1 : NULL : WAIT = 1\n"
    
    #skip 1A & 3A
    if(t == 0):
        t = 2
    if(t == 4):
        t = 6
        
    if(t == 0):
        OutputName = "PWM_CTRL_PORT1"
        FeedbackName = "Port1AmpData"
        OutputConnector = "J2_01"
        DirectionBits = "PWM_SIGN_PORT1"
    if(t == 1):
        OutputName = "PWM_CTRL_PORT1"
        FeedbackName = "Port1AmpData"
        OutputConnector = "J2_02"
        DirectionBits = "PWM_SIGN_PORT1"
    if(t == 2):
        OutputName = "PWM_CTRL_PORT2"
        FeedbackName = "Port2AmpData"
        OutputConnector = "J2_03"
        DirectionBits = "PWM_SIGN_PORT2"
    if(t == 3):
        OutputName = "PWM_CTRL_PORT2"
        FeedbackName = "Port2AmpData"
        OutputConnector = "J2_04"
        DirectionBits = "PWM_SIGN_PORT2"
    if(t == 4):
        OutputName = "PWM_CTRL_PORT3"
        FeedbackName = "Port3AmpData"
        OutputConnector = "J2_05"
        DirectionBits = "PWM_SIGN_PORT3"
    if(t == 5):
        OutputName = "PWM_CTRL_PORT3"
        FeedbackName = "Port3AmpData"
        OutputConnector = "J2_06"
        DirectionBits = "PWM_SIGN_PORT3"
    if(t == 6):
        OutputName = "PWM_CTRL_PORT4"
        FeedbackName = "Port4AmpData"
        OutputConnector = "J2_07"
        DirectionBits = "PWM_SIGN_PORT4"
    if(t == 7):
        OutputName = "PWM_CTRL_PORT4"
        FeedbackName = "Port4AmpData"
        OutputConnector = "J2_08"
        DirectionBits = "PWM_SIGN_PORT4"
    if(t == 8):
        OutputName = "PWM_CTRL_PORT5"
        FeedbackName = "Port5AmpData"
        OutputConnector = "J2_09"
        DirectionBits = "PWM_SIGN_PORT5"
    if(t == 9):
        OutputName = "PWM_CTRL_PORT5"
        FeedbackName = "Port5AmpData"
        OutputConnector = "J2_10"
        DirectionBits = "PWM_SIGN_PORT5"
    if(t == 10):
        OutputName = "PWM_CTRL_PORT6"
        FeedbackName = "Port6AmpData"
        OutputConnector = "J2_11"
        DirectionBits = "PWM_SIGN_PORT6"
    if(t == 11):
        OutputName = "PWM_CTRL_PORT6"
        FeedbackName = "Port6AmpData"
        OutputConnector = "J2_12"
        DirectionBits = "PWM_SIGN_PORT6"
    if(t == 12):
        OutputName = "PWM_CTRL_PORT7"
        FeedbackName = "Port7AmpData"
        OutputConnector = "J3_01"
        DirectionBits = "PWM_SIGN_PORT7"
    if(t == 13):
        OutputName = "PWM_CTRL_PORT7"
        FeedbackName = "Port7AmpData"
        OutputConnector = "J3_02"
        DirectionBits = "PWM_SIGN_PORT7"
    if(t == 14):
        OutputName = "PWM_CTRL_PORT8"
        FeedbackName = "Port8AmpData"
        OutputConnector = "J3_03"
        DirectionBits = "PWM_SIGN_PORT8"
    if(t == 15):
        OutputName = "PWM_CTRL_PORT8"
        FeedbackName = "Port8AmpData"
        OutputConnector = "J3_04"
        DirectionBits = "PWM_SIGN_PORT8"

    outstr += "#switch in load line, set current\n"
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.5\n"
    
    if t % 2 == 0:
        outstr += DirectionBits + " = 0 : NULL : WAIT = 0.5\n"
    else:
        outstr += DirectionBits + " = 1 : NULL : WAIT = 0.5\n"
        
    outstr += "\n"
    i = 0
    while i <= 1500:
        outstr += OutputName + " = " + str(i) + " : MeterAmps = " + str(i/1000) + " | 0.02 | 0.8\n"
        outstr += OutputName + " = " + str(i) + " : " + FeedbackName + " = " + str(i/1000) + " | 0.02 | 0.8\n"
        i += 50
            
    outstr += "#switch out load line, switch coil\n"
    outstr += OutputName + " = 0 : NULL : WAIT = 1\n"
    outstr += OutputConnector + " = 0 : NULL : WAIT = 1\n"

    #outstr += "SAVE\n"
    if t % 2 == 0:
        outstr += Coil1 + " = 0, " + Scope + " = 1 : NULL : WAIT = 0.5\n"
    else:
        outstr += Coil2 + " = 0, " + Scope + " = 1 : NULL : WAIT = 0.5\n"
    t += 1
    #outstr += "SAVE\n"
#shut down test
outstr += "SAVE\n"
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



