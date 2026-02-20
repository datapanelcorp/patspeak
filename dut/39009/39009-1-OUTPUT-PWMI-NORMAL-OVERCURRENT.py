import os
#global setup
script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

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


outstr = ""
outstr += "#39009-1\n"
outstr += "#Verion 0.0\n"
outstr += "#PWMi normal test with a 2.1 Ohm resistive load. (6.9 amps @ 14.5 VDC)\n"
outstr += "#PWMi overshoot should cause the output to overcurrent\n"
outstr += "UUT_DBC = 39009-561.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 39009-----\n"
outstr += "#disable global modes\n"

outstr += "#-----setup 39009-----\n"
outstr += "#configure as Output Digital ON/OFF\n"
outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0 : NULL : WAIT = 0.5\n"
outstr += "Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4, MODE5A = 4, MODE5B = 4, MODE6A = 4, MODE6B = 4, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL\n"
outstr += "Command = 84, MODE8A = 4, MODE8B = 4, MODE9A = 4, MODE9B = 4, MODE10A = 4, MODE10B = 4, GLOBAL_KP = " + f"{Kp}" + ", GLOBAL_KI =  " + f"{Ki}" + " : NULL : WAIT = 0.5\n"
outstr += "Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL\n"

outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"

outstr += "METER_MODE = 1 : NULL : WAIT = 0.2\n"


t = 0
while t <= 9:
    outstr += Coil1 + " = 1, " + Scope + " = 1 : NULL : WAIT = 1\n"
    # if t % 2 == 0:
    #     outstr += Coil1 + " = 1, " + Scope + " = 1 : NULL : WAIT = 1\n"
    # else:
    #     outstr += Coil2 + " = 1, " + Scope + " = 1 : NULL : WAIT = 1\n"
    if(t == 0):
        OutputName = "PWM_CTRL_2A"
        FeedbackName = "Feedback2A"
        OutputConnector = "J3_01"
        OutputStatus = "OutStat2A"
    if(t == 1):
        OutputName = "PWM_CTRL_2B"
        FeedbackName = "Feedback2B"
        OutputConnector = "J3_02"
        OutputStatus = "OutStat2B"
    if(t == 2):
        OutputName = "PWM_CTRL_4A"
        FeedbackName = "Feedback4A"
        OutputConnector = "J3_03"
        OutputStatus = "OutStat4A"
    if(t == 3):
        OutputName = "PWM_CTRL_4B"
        FeedbackName = "Feedback4B"
        OutputConnector = "J3_04"
        OutputStatus = "OutStat4B"
    if(t == 4):
        OutputName = "PWM_CTRL_6A"
        FeedbackName = "Feedback6A"
        OutputConnector = "J3_05"
        OutputStatus = "OutStat6A"
    if(t == 5):
        OutputName = "PWM_CTRL_6B"
        FeedbackName = "Feedback6B"
        OutputConnector = "J3_06"
        OutputStatus = "OutStat6B"
    if(t == 6):
        OutputName = "PWM_CTRL_8A"
        FeedbackName = "Feedback8A"
        OutputConnector = "J3_07"
        OutputStatus = "OutStat8A"
    if(t == 7):
        OutputName = "PWM_CTRL_8B"
        FeedbackName = "Feedback8B"
        OutputConnector = "J3_08"
        OutputStatus = "OutStat8B"
    if(t == 8):
        OutputName = "PWM_CTRL_10A"
        FeedbackName = "Feedback10A"
        OutputConnector = "J3_09"
        OutputStatus = "OutStat10A"
    if(t == 9):
        OutputName = "PWM_CTRL_10B"
        FeedbackName = "Feedback10B"
        OutputConnector = "J3_10"
        OutputStatus = "OutStat10B"

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



print(TestName + ".pat")
