t = 0
i = 0

PortMode = 2    #bridge

Kp = 0.2
Ki = 0.1

Kp = Kp * 100
Ki = Ki * 100

Frequancy = 100

#global setup
TestName = "34044-1-OUTPUT-BRIDGE-DIR"
datafile = TestName + ".pat"

outstr = ""
outstr += "#34044-1\n"
outstr += "#Verion 0.0\n"

outstr += "UUT_DBC = 34044-561.dbc\n"
outstr += "#Digital h-bridge test with 4 Ohm resistive load. (3.62 amps @ 14.5 VDC)\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 34044-----\n"
outstr += "#disable global modes\n"

PinMode = 1

FirstPort = 0
MaxPort = 3

t = FirstPort
while t <= MaxPort:
    if(t == 0):
        DOutputAName = "Output1A"
        DOutputBName = "Output1B"
        POutputAName = "PWM_CTRL_1A"
        POutputBName = "PWM_CTRL_1B"
        FeedbackAName = "Feedback1A"
        FeedbackBName = "Feedback1B"
        DirectionCtrl = "BRIDGE1_DIR"
    if(t == 1):
        DOutputAName = "Output2A"
        POutputAName = "PWM_CTRL_2A"
        FeedbackAName = "Feedback2A"
        DOutputBName = "Output2B"
        POutputBName = "PWM_CTRL_2B"
        FeedbackBName = "Feedback2B"
        DirectionCtrl = "BRIDGE2_DIR"
    if(t == 2):
        DOutputAName = "Output3A"
        POutputAName = "PWM_CTRL_3A"
        FeedbackAName = "Feedback3A"
        DOutputBName = "Output3B"
        POutputBName = "PWM_CTRL_3B"
        FeedbackBName = "Feedback3B"
        DirectionCtrl = "BRIDGE3_DIR"
    if(t == 3):
        DOutputAName = "Output4A"
        POutputAName = "PWM_CTRL_4A"
        FeedbackAName = "Feedback4A"
        DOutputBName = "Output4B"
        POutputBName = "PWM_CTRL_4B"
        FeedbackBName = "Feedback4B"
        DirectionCtrl = "BRIDGE4_DIR"

    outstr += "#prompt user to switch\n"
    outstr += "PAUSE-please verify load connection " + DirectionCtrl + "\n"
            
    PinMode = 0
    
    while PinMode <= 4:
        outstr += "#configure to mode " + str(PinMode) + "\n"
        outstr += "Command = 83, MODE1A = " + str(PinMode) + ", MODE1B = " + str(PinMode) + ", MODE2A = " + str(PinMode) + ", MODE2B = " + str(PinMode) + ", MODE3A = " + str(PinMode) + ", MODE3B = " + str(PinMode) + ", MODE4A = " + str(PinMode) + ", MODE4B = " + str(PinMode) + " : NULL : WAIT = 0.1\n"
        outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL\n"
        outstr += "Command = 84, Port1A_Kp = " + f"{Kp}" + ", Port1A_Ki = " + f"{Ki}" + ", Port1B_Kp = " + f"{Kp}" + ", Port1B_Ki = " + f"{Ki}" + ", Port2A_Kp = " + f"{Kp}" + ", Port2A_Ki = " + f"{Ki}" + " : NULL : WAIT = 0.1\n"
        outstr += "Command = 0, Port1A_Kp = 0, Port1A_Ki = 0, Port1B_Kp = 0, Port1B_Ki = 0, Port2A_Kp = 0, Port2A_Ki = 0 : NULL\n"
        outstr += "Command = 85, Port2B_Kp = " + f"{Kp}" + ", Port2B_Ki = " + f"{Ki}" + ", Port3A_Kp = " + f"{Kp}" + ", Port3A_Ki = " + f"{Ki}" + ", Port3B_Kp = " + f"{Kp}" + ", Port3B_Ki = " + f"{Ki}" + " : NULL : WAIT = 0.1\n"
        outstr += "Command = 0, Port2B_Kp = 0, Port2B_Ki = 0, Port3A_Kp = 0, Port3A_Ki = 0, Port3B_Kp = 0, Port3B_Ki = 0 : NULL\n"
        outstr += "Command = 86, Port4A_Kp = " + f"{Kp}" + ", Port4A_Ki = " + f"{Ki}" + ", Port4B_Kp = " + f"{Kp}" + ", Port4B_Ki = " + f"{Ki}" + " : NULL : WAIT = 0.1\n"
        outstr += "Command = 0, Port4A_Kp = 0, Port4A_Ki = 0, Port4B_Kp = 0, Port4B_Ki = 0 : NULL\n"
        outstr += "Command = 93, PORT1_MODE = " + str(PortMode) + ", PORT2_MODE = " + str(PortMode) + ", PORT3_MODE = " + str(PortMode) + ", PORT4_MODE = " + str(PortMode) + " : NULL : WAIT = 0.1\n"
        outstr += "Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL\n"
        outstr += "Command = 82, SaveSettings = 1, FREQ1 = " + str(Frequancy) + ", MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.1\n"
        outstr += "Command = 0, SaveSettings = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"
        
        Fdbks = [0.8, 1.6, 3.3] #expected feedback at 25%, 50% and 100%
        
        if(PinMode == 1):
            outstr += "#turn on digtial A output\n"
            outstr += "Command = 81, " + DOutputAName + " = 1, " + DirectionCtrl + " = 1 : NULL\n"
            outstr += "NULL : " + FeedbackAName + " = " + str(Fdbks[2]) + " | 0.4 | 0.1\n"
            outstr += "#turn off\n"
            outstr += "Command = 81, " + DOutputAName + " = 0 : NULL : WAIT = 0.1\n"
            outstr += "#turn on digtial B output\n"
            outstr += "Command = 81, " + DOutputBName + " = 1, " + DirectionCtrl + " = 2 : NULL\n"
            outstr += "NULL : " + FeedbackBName + " = " + str(Fdbks[2]) + " | 0.4 | 0.1\n"
            outstr += "#turn off\n"
            outstr += "Command = 81, " + DOutputBName + " = 0 : NULL : WAIT = 0.1\n"

        if(PinMode == 2):
            i = 0
            Steps = [1000, 2000, 4000]
            outstr += "#test data at 25%, 50% and 100%\n"
            while i <= 2:
                outstr += "#turn on pwm data A output\n"
                outstr += POutputAName + " = " + str(Steps[i]) + ", " + DirectionCtrl + " = 1 : NULL\n"
                outstr += "NULL : " + FeedbackAName + " = " + str(Fdbks[i]) + " | 0.4 | 0.1\n"
                outstr += "#turn off\n"
                outstr += POutputAName + " = 0 : NULL : WAIT = 0.1\n"
                outstr += "#turn on pwm data B output\n"
                outstr += POutputAName + " = " + str(Steps[i]) + ", " + DirectionCtrl + " = 2 : NULL\n"
                outstr += "NULL : " + FeedbackBName + " = " + str(Fdbks[i]) + " | 0.4 | 0.1\n"
                outstr += "#turn off\n"
                outstr += POutputAName + " = 0 : NULL : WAIT = 0.1\n"
                i += 1
            
        if(PinMode == 3):
            i = 0
            Steps = [250, 500, 1000]
            outstr += "#test percent at 25%, 50% and 100%\n"
            while i <= 2:
                outstr += "#turn on pwm percent A output\n"
                outstr += POutputAName + " = " + str(Steps[i]) + ", " + DirectionCtrl + " = 1 : NULL\n"
                outstr += "NULL : " + FeedbackAName + " = " + str(Fdbks[i]) + " | 0.4 | 0.1\n"
                outstr += "#turn off\n"
                outstr += POutputAName + " = 0 : NULL : WAIT = 0.1\n"
                outstr += "#turn on pwm data B output\n"
                outstr += POutputAName + " = " + str(Steps[i]) + ", " + DirectionCtrl + " = 2 : NULL\n"
                outstr += "NULL : " + FeedbackBName + " = " + str(Fdbks[i]) + " | 0.4 | 0.1\n"
                outstr += "#turn off\n"
                outstr += POutputAName + " = 0 : NULL : WAIT = 0.1\n"
                i += 1
                
        if(PinMode == 4):
            i = 0
            outstr += "#test PWMi in 500ma increments\n"
            while i <= 3500:
                outstr += "#turn on output\n"
                outstr += POutputAName + " = " + str(i) + ", " + DirectionCtrl + " = 1 : " + FeedbackAName + " = " + str(i/1000) + " | 0.155 | 0.2\n"
                outstr += POutputAName + " = " + str(i) + ", " + DirectionCtrl + " = 2 : " + FeedbackBName + " = " + str(i/1000) + " | 0.155 | 0.2\n"
                i += 500
            outstr += POutputAName + " = 0, " + DirectionCtrl + " = 0 : NULL : WAIT = 0.1\n"
        PinMode += 1
    t += 1
        
outstr += "SAVE\n"
#shut down test
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



