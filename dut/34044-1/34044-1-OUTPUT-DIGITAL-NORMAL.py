t = 0
i = 0

PortMode = 0

#global setup
TestName = "34044-1-OUTPUT-DIGITAL-NORMAL"
datafile = TestName + ".pat"

outstr = ""
outstr += "#34044-1\n"
outstr += "#Verion 0.0\n"
outstr += "#digital normal test using the E-LOAD\n"
outstr += "UUT_DBC = 34044-561.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 34044-----\n"
outstr += "#configure as Output Digital ON/OFF\n"
outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5\n"
outstr += "Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1, MODE5A = 1, MODE5B = 1, MODE6A = 1, MODE6B = 1, MODE7A = 1, MODE7B = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL\n"
outstr += "Command = 84, MODE8A = 1, MODE8B = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, MODE8A = 0, MODE8B = 0 : NULL\n"
outstr += "Command = 93, PORT1_MODE = " + str(PortMode) + ", PORT2_MODE = " + str(PortMode) + ", PORT3_MODE = " + str(PortMode) + ", PORT4_MODE = " + str(PortMode) + " : NULL : WAIT = 0.5\n"
outstr += "Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL : WAIT = 0.5\n"
outstr += "Command = 82, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1, Enable_Fault_Reset = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0, Enable_Fault_Reset = 0 : NULL\n"

outstr += "\n"

outstr += "#-----setup PAT-----\n"
outstr += "#setup load\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"

#verify faults clear
outstr += "NULL : OutStat1A = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat1B = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat2A = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat2B = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat3A = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat3B = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat4A = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat4B = 0 | 0.1 | 0.1\n"

t = 0
while t <= 7:
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

    outstr += "#switch in load line, set current\n"
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.5\n"

    outstr += "\n"
    i = 0
    while i <= 4500:
        outstr += "#set current and turn on output and verify feedback\n" 
        outstr += "Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.1\n"
        outstr += "LdCurrentSet = " + str(i) + ": NULL : WAIT = 0.1\n"
        if(i <= 4400):
            outstr += "#verify reading from load\n" 
            outstr += "NULL : " + FeedbackName + " = " + str(i/1000) + " | 0.1 | 0.1\n" 
            outstr += "NULL : " + OutputStatus + " = 1 | 0.01 | 0.1\n" 
            outstr += "NULL : MeterCurrent = " + str(i*0.001) + " | 0.1 | 0.1\n" 
            outstr += "\n"
        else:
            outstr += "#verify fault #1\n" 
            outstr += "NULL : " + FeedbackName + " = 0 | 0.1 | 0.1\n" 
            outstr += "NULL : " + OutputStatus + " = 2 | 0.1 | 0.1\n" 
            outstr += "NULL : MeterCurrent = 0  | 0.01 | 0.1\n" 
            outstr += "\n"
        i += 100
            
    outstr += "#switch out load line, clear current\n"
    outstr += OutputName + " = 0 : NULL : WAIT = 0.1\n"
    outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"
    outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
    outstr += "NULL : " + OutputStatus + " = 0 | 0.1 | 0.1\n" 
    t += 1


outstr += "#verify fault #1 cleared\n"
outstr += "NULL : OutStat1A = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat1B = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat2A = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat2B = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat3A = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat3B = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat4A = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat4B = 0 | 0.1 | 0.1\n"

t = 0
while t <= 7:
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

    outstr += "#switch in load line, set current\n"
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.5\n"
    outstr += "LdCurrentSet = 5000: NULL : WAIT = 0.1\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
    
    outstr += "\n"
    outstr += "#verify fault #1 clear\n" 
    outstr += "NULL : " + OutputStatus + " = 0 | 0 | 0.1\n"
    outstr += "#turn ON output\n" 
    outstr += "Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.2\n"
    outstr += "#enable load\n" 
    outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
    outstr += "#verify fault #2\n" 
    outstr += "NULL : " + OutputStatus + " = 2 | 0 | 0.1\n"
    outstr += "#disable load\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
    outstr += "#turn OFF output\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL : WAIT = 0.2\n"
    
    outstr += "\n"
    outstr += "#verify fault #2 clear\n" 
    outstr += "NULL : " + OutputStatus + " = 0 | 0 | 0.1\n"
    outstr += "#turn ON output\n" 
    outstr += "Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.2\n"
    outstr += "#enable load\n" 
    outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
    outstr += "#verify fault #3\n" 
    outstr += "NULL : " + OutputStatus + " = 2 | 0 | 0.1\n"
    outstr += "#disable load\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
    outstr += "#turn OFF output\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL : WAIT = 0.2\n"
    
    outstr += "\n"
    outstr += "#verify fault #3 clear\n" 
    outstr += "NULL : " + OutputStatus + " = 0 | 0 | 0.1\n"
    outstr += "#turn ON output\n" 
    outstr += "Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.2\n"
    outstr += "#enable load\n" 
    outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
    outstr += "#verify fault #4\n" 
    outstr += "NULL : " + OutputStatus + " = 2 | 0 | 0.1\n"
    outstr += "#disable load\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
    outstr += "#turn OFF output\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL : WAIT = 0.2\n"
    
    outstr += "\n"
    outstr += "#verify fault #4 clear\n" 
    outstr += "NULL : " + OutputStatus + " = 0 | 0 | 0.1\n"
    outstr += "#turn ON output\n" 
    outstr += "Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.2\n"
    outstr += "#enable load\n" 
    outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
    outstr += "#verify fault #5\n" 
    outstr += "NULL : " + OutputStatus + " = 2 | 0 | 0.1\n"
    outstr += "#disable load\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
    outstr += "#turn OFF output\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL : WAIT = 0.2\n"
    
    outstr += "\n"
    outstr += "#verify fault #5 sticks\n" 
    outstr += "NULL : " + OutputStatus + " = 2 | 0 | 0.1\n"
    
    outstr += "#switch out load line, clear current\n"
    outstr += OutputName + " = 0 : NULL : WAIT = 0.1\n"
    outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"
    outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
    t += 1
    
#verify no faults
outstr += "NULL : OutStat1A = 2 | 0.1 | 0.1\n"
outstr += "NULL : OutStat1B = 2 | 0.1 | 0.1\n"
outstr += "NULL : OutStat2A = 2 | 0.1 | 0.1\n"
outstr += "NULL : OutStat2B = 2 | 0.1 | 0.1\n"
outstr += "NULL : OutStat3A = 2 | 0.1 | 0.1\n"
outstr += "NULL : OutStat3B = 2 | 0.1 | 0.1\n"
outstr += "NULL : OutStat4A = 2 | 0.1 | 0.1\n"
outstr += "NULL : OutStat4B = 2 | 0.1 | 0.1\n"

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



