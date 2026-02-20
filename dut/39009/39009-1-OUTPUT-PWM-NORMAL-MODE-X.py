
import os

script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")

t = 0
i = 0

#configuration
FaultReset = 1
Skip10A = 1
StartCurrent = 0

MaxLimit = 4400
FaultLimit = 4300
Increment = 200


def WriteOutputTest(outstr, Frequancy, MaxOutput, OutputMode):
    Load1 = "J4_01"
    Scope = "J4_03"
    outstr += "#switch in 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)\n"
    outstr += Load1 + " = 1 : NULL : WAIT = 0.2\n"
    outstr += Scope + " = 1 : NULL : WAIT = 0.2\n"
    outstr += "METER_MODE = 1 : NULL : WAIT = 0.2\n"

    t = 0
    while t <= 9:
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

        # Direction = "sdo[0x2005][1]"
        outstr += "#switch in load line, set current\n"
        outstr += OutputConnector + " = 1 : NULL : WAIT = 0.5\n"
       
        outstr += "\n"
        
        Step1 = 250
        Step2 = 500
        Step3 = 1000
        
        if(OutputMode == 0x22):
            Step1 = 1000
            Step2 = 2000
            Step3 = 4000
            
        if(OutputMode == 0x33):
            Step1 = 250
            Step2 = 500
            Step3 = 1000
            
        outstr += OutputName + " = " + str(Step1) + " : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 0.6 | 0.3 | 0.5\n"
        outstr += "NULL : " + FeedbackName + " = 0.7 | 0.2 | 0.5\n"
        outstr += OutputName + " = " + str(Step2) + " : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 1.2 | 0.3 | 0.5\n"
        outstr += "NULL : " + FeedbackName + " = 1.4 | 0.2 | 0.5\n"
        outstr += OutputName + " = " + str(Step3) + " : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 2.4 | 0.3 | 0.5\n"
        outstr += "NULL : " + FeedbackName + " = 2.8 | 0.2 | 0.5\n"
        #verify feedback and w/ ammeter
        outstr += "#switch out load line, switch coil\n"
        outstr += OutputName + " = 0 : NULL : WAIT = 0.5\n"
        outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"

        # outstr += Direction + " = " + str(DirBits) + " : NULL : WAIT = 0.1\n"
        # outstr += "# Testing " + OutputName + "\n"
        # outstr += OutputName + " = " + str(Step1) + " : NULL : WAIT = 0.2\n"
        # outstr += "NULL : MeterAmps = 0.8 | 0.2 | 0.5\n"
        # outstr += "NULL : " + FeedbackName + " = 800 | 200 | 0.5\n"
        # outstr += OutputName + " = " + str(Step2) + " : NULL : WAIT = 0.2\n"
        # outstr += "NULL : MeterAmps = 1.6 | 0.2 | 0.5\n"
        # outstr += "NULL : " + FeedbackName + " = 1600 | 200 | 0.5\n"
        # outstr += OutputName + " = " + str(Step3) + " : NULL : WAIT = 0.2\n"
        # outstr += "NULL : MeterAmps = 3.3 | 0.2 | 0.5\n"
        # outstr += "NULL : " + FeedbackName + " = 3300 | 200 | 0.5\n"
        # #verify feedback and w/ ammeter
        # outstr += "#switch out load line, switch coil\n"
        # outstr += OutputName + " = 0 : NULL : WAIT = 0.5\n"
        # outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"
            
        t += 1
        
    return outstr

t = 0
i = 0
OutputMode = 0x22

#global setup
#TestName = os.path.splitext(script_name)[0]
TestName = os.path.splitext(script_name)[0].replace('X',  str(OutputMode))
datafile = TestName + ".pat"


outstr = ""
outstr += "#39009-1\n"
outstr += "#Verion 0.0\n"
outstr += "#PWM test with 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)\n"
outstr += "UUT_DBC = 39009-561.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 39009-----\n"
outstr += "#configure as Output Digital ON/OFF\n"
outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0 : NULL : WAIT = 0.5\n"
outstr += "Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = " + str(OutputMode) + ", MODE2B = " + str(OutputMode) + ", MODE3A = 4, MODE3B = 4, MODE4A = " + str(OutputMode) + ", MODE4B = " + str(OutputMode) + ", MODE5A = 4, MODE5B = 4, MODE6A = " + str(OutputMode) + ", MODE6B = " + str(OutputMode) + ", MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL\n"
outstr += "Command = 84, MODE8A = " + str(OutputMode) + ", MODE8B = " + str(OutputMode) + ", MODE9A = 4, MODE9B = 4, MODE10A = " + str(OutputMode) + ", MODE10B = " + str(OutputMode) + ", GLOBAL_KP = " + f"{255}" + ", GLOBAL_KI =  " + f"{255}" + " : NULL : WAIT = 0.5\n"
outstr += "Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL\n"
Frequancy = 1000
outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"

outstr += "METER_MODE = 1 : NULL : WAIT = 0.2\n"

# outstr += "#-----setup 39009-----\n"
# outstr += "#disable global modes\n"
# outstr += "sdo[0x2000][3] = 0 : NULL : WAIT = 0.1\n"
# outstr += "sdo[0x2000][4] = 0 : NULL : WAIT = 0.1\n"
        
# outstr += "#configure Ports\n"
# outstr += "sdo[0x2001][1] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
# outstr += "sdo[0x2001][2] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
# outstr += "sdo[0x2001][3] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
# outstr += "sdo[0x2001][4] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
# outstr += "sdo[0x2001][5] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
# outstr += "sdo[0x2001][6] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
# outstr += "sdo[0x2001][7] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
# outstr += "sdo[0x2001][8] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
# #node.sdo[0x3000].raw = 500


Frequancy = 1000
#outstr += "PRE_OPERATIONAL\n"
outstr += "#test at 1000hz\n"
#outstr += "sdo[0x3000] = " + str(Frequancy) + " : NULL : WAIT = 0.5\n"
#outstr += "OPERATIONAL\n"
outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
outstr = WriteOutputTest(outstr, Frequancy, 7, OutputMode)

Frequancy = 500
#outstr += "PRE_OPERATIONAL\n"
outstr += "#test at 500hz\n"
#outstr += "sdo[0x3000] = " + str(Frequancy) + " : NULL : WAIT = 0.5\n"
#outstr += "OPERATIONAL\n"
outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
outstr = WriteOutputTest(outstr, Frequancy, 7, OutputMode)

Frequancy = 64
#outstr += "PRE_OPERATIONAL\n"
outstr += "#test at 64hz\n"
#outstr += "sdo[0x3000] = " + str(Frequancy) + " : NULL : WAIT = 0.5\n"
#outstr += "OPERATIONAL\n"
outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
outstr = WriteOutputTest(outstr, Frequancy, 7, OutputMode)

#shut down test
outstr += "SAVE\n"
outstr += "END\n"

f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



print(TestName + ".pat")
