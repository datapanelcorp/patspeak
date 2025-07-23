t = 0
i = 0

PortMode = 0

#global setup
TestName = "34044-1-CANOPEN-TESTER"
datafile = TestName + ".pat"

outstr = ""

outstr += "#34044-1\n"
outstr += "#Verion 0.0\n"
outstr += "#digital normal test using the E-LOAD\n"
outstr += "UUT_EDS = 37000-561.eds\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup PAT-----\n"
outstr += "#setup load\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"

FdbkBits = 0
FltBits = 0
t = 0
while t <= 7:
    if(t == 0):
        OutputBits = 0b00000001
        FdbkBits = 0b00000001
        FltBits = 0b00000010
        PortMode = "sdo[0x2001][1]"#Port1Mode
        OutputName = "sdo[0x6200][1]"#Output
        OutputStatus = "sdo[0x5001][3]"#OutStat
        FeedbackName = "sdo[0x5003][1]"#Feedback1A
        OutputConnector = "J2_01"
    if(t == 1):
        OutputBits = 0b00000010
        FdbkBits = 0b00000110
        FltBits = 0b00001010
        PortMode = "sdo[0x2001][1]"#Port1Mode
        OutputName = "sdo[0x6200][1]"#Output
        FeedbackName = "sdo[0x5003][2]"#Feedback1B
        OutputConnector = "J2_02"
    if(t == 2):
        OutputBits = 0b00000100
        FdbkBits = 0b00011010
        FltBits = 0b00101010
        PortMode = "sdo[0x2001][2]"#Port2Mode
        OutputName = "sdo[0x6200][1]"#Output
        OutputStatus = "sdo[0x5001][3]"#OutStat
        FeedbackName = "sdo[0x5003][3]"#Feedback2A
        OutputConnector = "J2_03"
    if(t == 3):
        OutputBits = 0b00001000
        FdbkBits = 0b01101010
        FltBits = 0b10101010
        PortMode = "sdo[0x2001][2]"#Port2Mode
        OutputName = "sdo[0x6200][1]"#Output
        OutputStatus = "sdo[0x5001][3]"#OutStat
        FeedbackName = "sdo[0x5003][4]"#Feedback2B
        OutputConnector = "J2_04"
    if(t == 4):
        OutputBits = 0b00010000
        FdbkBits = 0b00000001
        FltBits = 0b00000010
        PortMode = "sdo[0x2001][3]"#Port3Mode
        OutputName = "sdo[0x6200][1]"#Output
        OutputStatus = "sdo[0x5001][4]"#OutStat
        FeedbackName = "sdo[0x5003][5]"#Feedback3A
        OutputConnector = "J2_05"
    if(t == 5):
        OutputBits = 0b00100000
        FdbkBits = 0b00000110
        FltBits = 0b00001010
        PortMode = "sdo[0x2001][3]"#Port3Mode
        OutputName = "sdo[0x6200][1]"#Output
        OutputStatus = "sdo[0x5001][4]"#OutStat
        FeedbackName = "sdo[0x5003][6]"#Feedback3B
        OutputConnector = "J2_06"
    if(t == 6):
        OutputBits = 0b01000000
        FdbkBits = 0b00011010
        FltBits = 0b00101010
        PortMode = "sdo[0x2001][4]"#Port4Mode
        OutputName = "sdo[0x6200][1]"#Output
        OutputStatus = "sdo[0x5001][4]"#OutStat
        FeedbackName = "sdo[0x5003][7]"#Feedback4A
        OutputConnector = "J2_07"
    if(t == 7):
        OutputBits = 0b10000000
        FdbkBits = 0b01101010
        FltBits = 0b10101010
        PortMode = "sdo[0x2001][4]"#Port4Mode
        OutputName = "sdo[0x6200][1]"#Output
        OutputStatus = "sdo[0x5001][4]"#OutStat
        FeedbackName = "sdo[0x5003][8]"#Feedback4B
        OutputConnector = "J2_08"
        
    Cmd0x52 = "sdo[0x2000][1]"
    
    TheMode = 0x11

    outstr += "#-----setup 34044-----\n"
    outstr += Cmd0x52 + " = 0 : NULL : WAIT = 0.2\n"
    outstr += PortMode + " = " + str(TheMode) + " : NULL : WAIT = 0.2\n"

    outstr += "#switch in load line, set current\n"
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.5\n"

    outstr += "\n"
    i = 0
    while i <= 4500:
        outstr += "#set current and turn on output and verify feedback\n" 
        outstr += OutputName + " = " + str(OutputBits) + " : NULL : WAIT = 0.1\n"
        outstr += "LdCurrentSet = " + str(i) + ": NULL : WAIT = 0.1\n"
        if(i <= 4400):
            outstr += "#verify reading from load\n" 
            outstr += "NULL : " + FeedbackName + " = " + str(i) + " | 1000 | 0.1\n" 
            outstr += "NULL : " + OutputStatus + " = " + str(FdbkBits) + " | 0.01 | 0.1\n" 
            #outstr += "NULL : MeterCurrent = " + str(i*0.001) + " | 0.1 | 0.1\n" 
            outstr += "\n"
        else:
            outstr += "#verify fault #1\n" 
            outstr += "NULL : " + FeedbackName + " = 0 | 0.1 | 0.1\n" 
            outstr += "NULL : " + OutputStatus + " = 2 | 0.1 | 0.1\n" 
            #outstr += "NULL : MeterCurrent = 0  | 0.01 | 0.1\n" 
            outstr += "\n"
        i += 100

    outstr += "#switch out load line, clear current\n"
    outstr += OutputName + " = 0 : NULL : WAIT = 0.1\n"
    outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"
    outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
    outstr += "NULL : " + OutputStatus + " = 0 | 0.1 | 0.1\n" 
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
