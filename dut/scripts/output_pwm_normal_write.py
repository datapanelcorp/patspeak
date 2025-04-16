def WriteOutputTest(outstr, Frequancy, MaxOutput):
    t = 0
    Coil1 = "J4_01"
    Coil2 = "J4_02"
    Scope = "J4_03"
    outstr += "#switch in scope\n"
    outstr += Scope + " = 1 : NULL : WAIT = 0.2\n"
    while t <= MaxOutput:
        outstr += Coil1 + " = 1, " + Scope + " = 1 : NULL : WAIT = 0.2\n"
        # if t % 2 == 0:
            # outstr += Coil1 + " = 1, " + Scope + " = 1 : NULL : WAIT = 0.2\n"
        # else:
            # outstr += Coil2 + " = 1, " + Scope + " = 1 : NULL : WAIT = 0.2\n"
            
        #skip 1A & 3A
        if(t == 0):
            t = 1
        if(t == 4):
            t = 5 
            
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
        if(t == 8):
            OutputName = "PWM_CTRL_5A"
            FeedbackName = "Feedback5A"
            OutputConnector = "J2_09"
        if(t == 9):
            OutputName = "PWM_CTRL_5B"
            FeedbackName = "Feedback5B"
            OutputConnector = "J2_10"
        if(t == 10):
            OutputName = "PWM_CTRL_6A"
            FeedbackName = "Feedback6A"
            OutputConnector = "J2_11"
        if(t == 11):
            OutputName = "PWM_CTRL_6B"
            FeedbackName = "Feedback6B"
            OutputConnector = "J2_12"
        if(t == 12):
            OutputName = "PWM_CTRL_7A"
            FeedbackName = "Feedback7A"
            OutputConnector = "J3_01"
        if(t == 13):
            OutputName = "PWM_CTRL_7B"
            FeedbackName = "Feedback7B"
            OutputConnector = "J3_02"
        if(t == 14):
            OutputName = "PWM_CTRL_8A"
            FeedbackName = "Feedback8A"
            OutputConnector = "J3_03"
        if(t == 15):
            OutputName = "PWM_CTRL_8B"
            FeedbackName = "Feedback8B"
            OutputConnector = "J3_04"

        outstr += "#switch in load line, set current\n"
        outstr += OutputConnector + " = 1 : NULL : WAIT = 0.5\n"

        outstr += "\n"
        
        #TODO test duty at 50% and 100%
        outstr += OutputName + " = 250 : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 0.8 | 0.15 | 0.5\n"
        outstr += "NULL : " + FeedbackName + " = 0.8 | 0.15 | 0.5\n"
        outstr += OutputName + " = 500 : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 1.6 | 0.15 | 0.5\n"
        outstr += "NULL : " + FeedbackName + " = 1.6 | 0.15 | 0.5\n"
        outstr += OutputName + " = 1000 : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 3.3 | 0.15 | 0.5\n"
        outstr += "NULL : " + FeedbackName + " = 3.3 | 0.15 | 0.5\n"
        #verify feedback and w/ ammeter
        outstr += "#switch out load line, switch coil\n"
        outstr += OutputName + " = 0 : NULL : WAIT = 0.5\n"
        outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"

        # if t % 2 == 0:
            # outstr += Coil1 + " = 0, " + Scope + " = 1 : NULL : WAIT = 0.5\n"
        # else:
            # outstr += Coil2 + " = 0, " + Scope + " = 1 : NULL : WAIT = 0.5\n"
            
        t += 1
        
    return outstr