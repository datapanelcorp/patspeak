def WriteOutputTest(outstr, Frequancy, MaxOutput, OutputMode):
    t = 0
    Load1 = "J4_01"
    Scope = "J4_03"
    outstr += "#switch in 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)\n"
    outstr += Load1 + " = 1 : NULL : WAIT = 0.2\n"
    outstr += Scope + " = 1 : NULL : WAIT = 0.2\n"
    while t <= MaxOutput:
            
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
        
        Step1 = 250
        Step2 = 500
        Step3 = 1000
        
        if(OutputMode == 2):
            Step1 = 1000
            Step2 = 2000
            Step3 = 4000
            
        if(OutputMode == 3):
            Step1 = 250
            Step2 = 500
            Step3 = 1000
            
        #TODO test duty at 50% and 100%
        outstr += OutputName + " = " + str(Step1) + " : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 0.8 | 0.2 | 0.5\n"
        outstr += "NULL : " + FeedbackName + " = 0.8 | 0.2 | 0.5\n"
        outstr += OutputName + " = " + str(Step2) + " : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 1.6 | 0.2 | 0.5\n"
        outstr += "NULL : " + FeedbackName + " = 1.6 | 0.2 | 0.5\n"
        outstr += OutputName + " = " + str(Step3) + " : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 3.3 | 0.2 | 0.5\n"
        outstr += "NULL : " + FeedbackName + " = 3.3 | 0.2 | 0.5\n"
        #verify feedback and w/ ammeter
        outstr += "#switch out load line, switch coil\n"
        outstr += OutputName + " = 0 : NULL : WAIT = 0.5\n"
        outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"
            
        t += 1
        
    return outstr