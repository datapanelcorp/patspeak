t = 0
i = 0

PortMode = 0

#global setup
TestName = "34044-5-DIGITAL-NORMAL"
datafile = TestName + ".pat"

outstr = ""
outstr += "#34044-5\n"
outstr += "#Verion 0.0\n"

outstr += "UUT_DBC = 34044-565.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 34044-----\n"
outstr += "#configure as Output Digital ON/OFF\n"
outstr += "Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1, MODE5A = 1, MODE5B = 1, MODE6A = 1, MODE6B = 1, MODE7A = 1, MODE7B = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 84, MODE8A = 1, MODE8B = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 82, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 93, PORT1_MODE = " + str(PortMode) + ", PORT2_MODE = " + str(PortMode) + ", PORT3_MODE = " + str(PortMode) + ", PORT4_MODE = " + str(PortMode) + ", PORT5_MODE = " + str(PortMode) + ", PORT6_MODE = " + str(PortMode) + ", PORT7_MODE = " + str(PortMode) + ", PORT8_MODE = " + str(PortMode) + " : NULL : WAIT = 0.5\n"
outstr += "Command = 82, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 82, SaveSettings = 1 : NULL\n"

outstr += "#clean DBC signals\n"
outstr += "Command = 0 : NULL : WAIT = 0.5\n"
outstr += "MODE1 = 0, MODE2 = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0, MODE8A = 0, MODE8B = 0 : NULL : WAIT = 0.5\n"
outstr += "Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL : WAIT = 0.5\n"
outstr += "\n"

outstr += "#-----setup PAT-----\n"
outstr += "#setup load\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"

t = 0
while t <= 15:
    if(t == 0):
        OutputName = "Output1A"
        FeedbackName = "Feedback1A"
        OutputConnector = "J2_01"
        OutputStatus = "OutStat1A"
    if(t == 1):
        OutputName = "Output1B"
        FeedbackName = "Feedback1B"
        OutputConnector = "J2_02"
        OutputStatus = "OutStat1B"
    if(t == 2):
        OutputName = "Output2A"
        FeedbackName = "Feedback2A"
        OutputConnector = "J2_03"
        OutputStatus = "OutStat2A"
    if(t == 3):
        OutputName = "Output2B"
        FeedbackName = "Feedback2B"
        OutputConnector = "J2_04"
        OutputStatus = "OutStat2B"
    if(t == 4):
        OutputName = "Output3A"
        FeedbackName = "Feedback3A"
        OutputConnector = "J2_05"
        OutputStatus = "OutStat3A"
    if(t == 5):
        OutputName = "Output3B"
        FeedbackName = "Feedback3B"
        OutputConnector = "J2_06"
        OutputStatus = "OutStat3B"
    if(t == 6):
        OutputName = "Output4A"
        FeedbackName = "Feedback4A"
        OutputConnector = "J2_07"
        OutputStatus = "OutStat4A"
    if(t == 7):
        OutputName = "Output4B"
        FeedbackName = "Feedback4B"
        OutputConnector = "J2_08"
        OutputStatus = "OutStat4B"
    if(t == 8):
        OutputName = "Output5A"
        FeedbackName = "Feedback5A"
        OutputConnector = "J2_09"
        OutputStatus = "OutStat5A"
    if(t == 9):
        OutputName = "Output5B"
        FeedbackName = "Feedback5B"
        OutputConnector = "J2_10"
        OutputStatus = "OutStat5B"
    if(t == 10):
        OutputName = "Output6A"
        FeedbackName = "Feedback6A"
        OutputConnector = "J2_11"
        OutputStatus = "OutStat6A"
    if(t == 11):
        OutputName = "Output6B"
        FeedbackName = "Feedback6B"
        OutputConnector = "J2_12"
        OutputStatus = "OutStat6B"
    if(t == 12):
        OutputName = "Output7A"
        FeedbackName = "Feedback7A"
        OutputConnector = "J3_01"
        OutputStatus = "OutStat7A"
    if(t == 13):
        OutputName = "Output7B"
        FeedbackName = "Feedback7B"
        OutputConnector = "J3_02"
        OutputStatus = "OutStat7B"
    if(t == 14):
        OutputName = "Output8A"
        FeedbackName = "Feedback8A"
        OutputConnector = "J3_03"
        OutputStatus = "OutStat8A"
    if(t == 15):
        OutputName = "Output8B"
        FeedbackName = "Feedback8B"
        OutputConnector = "J3_04"
        OutputStatus = "OutStat8B"

    outstr += "#switch in load line, set current\n"
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.5\n"

    outstr += "\n"
    i = 0
    if((t == 0)|(t == 4)):
        while i <= 10000:
            outstr += "#set current and turn on output and verify feedback\n" 
            outstr += "LdCurrentSet = " + str(i) + ", Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.1\n"
            outstr += "#verify reading from load\n" 
            outstr += "NULL : " + FeedbackName + " = " + str(i/1000) + " | 1.0 | 0.1\n" 
            outstr += "NULL : " + OutputStatus + " = 1 | 0.01 | 0.1\n" 
            outstr += "NULL : MeterCurrent = " + str(i*0.001) + " | 0.01 | 0.1\n" 
            outstr += "\n"
            # if(i <= 10000):
                # outstr += "#verify reading from load\n" 
                # outstr += "NULL : " + FeedbackName + " = " + str(i/1000) + " | 1.0 | 0.1\n" 
                # outstr += "NULL : " + OutputStatus + " = 1 | 0.01 | 0.1\n" 
                # outstr += "NULL : MeterCurrent = " + str(i*0.001) + " | 0.01 | 0.1\n" 
                # outstr += "\n"
            # else:
                # outstr += "#verify fault\n" 
                # outstr += "NULL : " + FeedbackName + " = 0 | 0.25 | 0.1\n" 
                # outstr += "NULL : " + OutputStatus + " = 2 | 0.01 | 0.1\n" 
                # outstr += "NULL : MeterCurrent = 0  | 0.01 | 0.1\n" 
                # outstr += "\n"
            i += 100
    else:
        while i <= 5000:
            outstr += "#set current and turn on output and verify feedback\n" 
            outstr += "LdCurrentSet = " + str(i) + ", Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.1\n"
            outstr += "#verify reading from load\n" 
            outstr += "NULL : " + FeedbackName + " = " + str(i/1000) + " | 0.5 | 0.1\n" 
            outstr += "NULL : " + OutputStatus + " = 1 | 0.01 | 0.1\n" 
            outstr += "NULL : MeterCurrent = " + str(i*0.001) + " | 0.01 | 0.1\n" 
            outstr += "\n"
            # if(i <= 5100):
                # outstr += "#verify reading from load\n" 
                # outstr += "NULL : " + FeedbackName + " = " + str(i/1000) + " | 0.5 | 0.1\n" 
                # outstr += "NULL : " + OutputStatus + " = 1 | 0.01 | 0.1\n" 
                # outstr += "NULL : MeterCurrent = " + str(i*0.001) + " | 0.01 | 0.1\n" 
                # outstr += "\n"
            # else:
                # outstr += "#verify fault\n" 
                # outstr += "NULL : " + FeedbackName + " = 0 | 0.25 | 0.1\n" 
                # outstr += "NULL : " + OutputStatus + " = 2 | 0.01 | 0.1\n" 
                # outstr += "NULL : MeterCurrent = 0  | 0.01 | 0.1\n" 
                # outstr += "\n"
            i += 100
    
    outstr += "#switch out load line, clear current\n"
    outstr += OutputName + " = 0 : NULL : WAIT = 0.1\n"
    outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"
    outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
    #outstr += "SAVE\n"
    #outstr += "END\n"
    t += 1

#shut down test
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 1\n"
outstr += "SAVE\n"
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



