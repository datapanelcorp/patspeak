def WriteOutputTest(outstr, Frequancy, StopOutput):
    t = 0
    Coil = "J4_02"

    outstr += "#switch in coil\n"
    #outstr += Scope + " = 1 : NULL : WAIT = 0.2\n"
    while t <= StopOutput:
        outstr += Coil + " = 1 : NULL : WAIT = 0.2\n"
            
        #skip port 1 & port 3
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

        outstr += "\n"
        if t % 2 == 0:
            outstr += DirectionBits + " = 0 : NULL : WAIT = 0.5\n"
        else:
            outstr += DirectionBits + " = 1 : NULL : WAIT = 0.5\n"
            
        #TODO test duty at 50% and 100%
        outstr += OutputName + " = 250 : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 0.8 | 0.155 | 0.5\n"
        outstr += "NULL : " + FeedbackName + " = 0.8 | 0.2 | 0.5\n"
        outstr += OutputName + " = 500 : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 1.6 | 0.155 | 0.5\n"
        outstr += "NULL : " + FeedbackName + " = 1.6 | 0.2 | 0.5\n"
        outstr += OutputName + " = 1000 : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 3.3 | 0.155 | 0.5\n"
        outstr += "NULL : " + FeedbackName + " = 3.3 | 0.155 | 0.5\n"
        #verify feedback and w/ ammeter
        outstr += "#switch out load line, switch coil\n"
        outstr += OutputName + " = 0 : NULL : WAIT = 0.5\n"
        outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"
            
        t += 1
        
    return outstr
    

t = 0
i = 0

PortMode = 0

#global setup
TestName = "34044-4-PWM-NORMAL"
datafile = TestName + ".pat"

outstr = ""
outstr += "#34044-4\n"
outstr += "#Verion 0.0\n"
outstr += "#PWM test with 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)\n"
outstr += "UUT_DBC = 34044-564.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 34044-----\n"
outstr += "#disable global modes\n"

outstr += "#configure Ports\n"
outstr += "Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 3, MODE2B = 3, MODE3A = 1, MODE3B = 1, MODE4A = 3, MODE4B = 3, MODE5A = 3, MODE5B = 3, MODE6A = 3, MODE6B = 3, MODE7A = 3, MODE7B = 3 : NULL : WAIT = 0.5\n"
outstr += "Command = 84, MODE8A = 3, MODE8B = 3 : NULL : WAIT = 0.5\n"
outstr += "Command = 82, FREQ1 = 1000, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1, SaveSettings = 1 : NULL : WAIT = 0.5\n"

Frequancy = 40
outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", SaveSettings = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 0 : NULL : WAIT = 0.1\n"
outstr = WriteOutputTest(outstr, Frequancy, 15)#all 15 outputs

Frequancy = 500
outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", SaveSettings = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 0 : NULL : WAIT = 0.1\n"
outstr = WriteOutputTest(outstr, Frequancy, 15)#all 15 outputs

Frequancy = 1200
outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", SaveSettings = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 0 : NULL : WAIT = 0.1\n"
outstr = WriteOutputTest(outstr, Frequancy, 15)#all 15 outputs

#shut down test
outstr += "SAVE\n"
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



