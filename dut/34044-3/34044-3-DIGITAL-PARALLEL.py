t = 0
i = 0

PortMode = 1

#global setup
TestName = "34044-3-DIGITAL-PARALLEL"
datafile = TestName + ".pat"

outstr = ""
outstr += "#34044-3\n"
outstr += "#Verion 0.0\n"

outstr += "UUT_DBC = 34044-563.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 34044-----\n"
outstr += "#disable global modes\n"
outstr += "#configure as Output Digital ON/OFF\n"
outstr += "Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1, MODE5A = 1, MODE5B = 1, MODE6A = 1, MODE6B = 1, MODE7A = 1, MODE7B = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 84, MODE8A = 1, MODE8B = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 93, PORT1_MODE = " + str(PortMode) + ", PORT2_MODE = " + str(PortMode) + ", PORT3_MODE = " + str(PortMode) + ", PORT4_MODE = " + str(PortMode) + ", PORT5_MODE = " + str(PortMode) + ", PORT6_MODE = " + str(PortMode) + ", PORT7_MODE = " + str(PortMode) + ", PORT8_MODE = " + str(PortMode) + " : NULL : WAIT = 0.5\n"
outstr += "Command = 82, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL\n"
outstr += "Command = 82, SaveSettings = 1 : NULL\n"

outstr += "#clean DBC signals\n"
outstr += "Command = 0 : NULL : WAIT = 0.5\n"
outstr += "MODE1 = 0, MODE2 = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0, MODE8A = 0, MODE8B = 0 : NULL : WAIT = 0.5\n"
outstr += "PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0, PORT5_MODE = 0, PORT6_MODE = 0, PORT7_MODE = 0, PORT8_MODE = 0 : NULL : WAIT = 0.5\n"
outstr += "\n"

outstr += "#-----setup PAT-----\n"
outstr += "#setup load\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"

while t <= 7:
    if(t == 0):
        OutputName = "Output1A"
        FeedbackNameA = "Feedback1A"
        FeedbackNameB = "Feedback1B"
        OutputConnectorA = "J2_01"
        OutputConnectorB = "J2_02"
        OutputStatusA = "OutStat1A"
        OutputStatusB = "OutStat1B"
    if(t == 1):
        OutputName = "Output2A"
        FeedbackNameA = "Feedback2A"
        FeedbackNameB = "Feedback2B"
        OutputConnectorA = "J2_03"
        OutputConnectorB = "J2_04"
        OutputStatusA = "OutStat2A"
        OutputStatusB = "OutStat2B"
    if(t == 2):
        OutputName = "Output3A"
        FeedbackNameA = "Feedback3A"
        FeedbackNameB = "Feedback3B"
        OutputConnectorA = "J2_05"
        OutputConnectorB = "J2_06"
        OutputStatusA = "OutStat3A"
        OutputStatusB = "OutStat3B"
    if(t == 3):
        OutputName = "Output4A"
        FeedbackNameA = "Feedback4A"
        FeedbackNameB = "Feedback4B"
        OutputConnectorA = "J2_07"
        OutputConnectorB = "J2_08"
        OutputStatusA = "OutStat4A"
        OutputStatusB = "OutStat4B"
    if(t == 4):
        OutputName = "Output5A"
        FeedbackNameA = "Feedback5A"
        FeedbackNameB = "Feedback5B"
        OutputConnectorA = "J2_09"
        OutputConnectorB = "J2_10"
        OutputStatusA = "OutStat5A"
        OutputStatusB = "OutStat5B"
    if(t == 5):
        OutputName = "Output6A"
        FeedbackNameA = "Feedback6A"
        FeedbackNameB = "Feedback6B"
        OutputConnectorA = "J2_11"
        OutputConnectorB = "J2_12"
        OutputStatusA = "OutStat6A"
        OutputStatusB = "OutStat6B"
    if(t == 6):
        OutputName = "Output7A"
        FeedbackNameA = "Feedback7A"
        FeedbackNameB = "Feedback7B"
        OutputConnectorA = "J3_01"
        OutputConnectorB = "J3_02"
        OutputStatusA = "OutStat7A"
        OutputStatusB = "OutStat7B"
    if(t == 7):
        OutputName = "Output8A"
        FeedbackNameA = "Feedback8A"
        FeedbackNameB = "Feedback8B"
        OutputConnectorA = "J3_03"
        OutputConnectorB = "J3_04"
        OutputStatusA = "OutStat8A"
        OutputStatusB = "OutStat8B"
        
    outstr += "#switch outputs to load line\n"
    outstr += OutputConnectorA + " = 1, " + OutputConnectorB + " = 1 : NULL : WAIT = 0.5\n"

    outstr += "\n"
    i = 0
    while i <= 10000:
        outstr += "#set current and turn on output\n" 
        outstr += "LdCurrentSet = " + str(i) + ", Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.5\n" 
        outstr += "#verify reading from load\n" 
        outstr += "NULL : MeterCurrent = " + str(i*0.001) + " | 0.01 | 0.2\n" 
        outstr += "#verify feedback\n" 
        outstr += "NULL : " + FeedbackNameA + " = " + str((i/1000)/2) + " | " + str(i/1000) + " | 0.2\n"
        outstr += "NULL : " + FeedbackNameB + " = " + str((i/1000)/2) + " | " + str(i/1000) + " | 0.2\n" 
        outstr += "\n"
        i += 100
            
    outstr += "#verify fault status\n" 
    if((t == 0)|(t == 2)):
        outstr += "NULL : " + OutputStatusA + " = 1 | 0 | 0.1\n"
        outstr += "NULL : " + OutputStatusB + " = 1 | 0 | 0.1\n" 
    else:
        outstr += "NULL : " + OutputStatusA + " = 2 | 0 | 0.1\n"
        outstr += "NULL : " + OutputStatusB + " = 2 | 0 | 0.1\n" 

            
    outstr += "#disconnect outputs from load line, clear current\n"
    outstr += OutputName + " = 0 : NULL : WAIT = 0.1\n"
    outstr += OutputConnectorA + " = 0, " + OutputConnectorB + " = 0 : NULL : WAIT = 0.5\n"
    outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
    #outstr += "SAVE\n"
    outstr += "\n"
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



