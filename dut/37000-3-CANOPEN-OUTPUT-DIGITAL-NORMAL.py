
import os

script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")


t = 0
i = 0

PortMode = 0

FaultReset = 0

#global setup
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

outstr = ""

outstr += "#37000-3\n"
outstr += "#Verion 0.0\n"
outstr += "#digital normal test using the E-LOAD\n"
outstr += "UUT_EDS = 37000-563.eds\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"

outstr += "PRE_OPERATIONAL\n"

outstr += "#-----setup PAT-----\n"
outstr += "#setup load\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"

#verify faults clear
outstr += "NULL : sdo[0x5001][3] = 0 | 0 | 0.1\n"
outstr += "NULL : sdo[0x5001][4] = 0 | 0 | 0.1\n"
outstr += "NULL : sdo[0x5001][5] = 0 | 0 | 0.1\n"
outstr += "NULL : sdo[0x5001][6] = 0 | 0 | 0.1\n"

FdbkBits = 0
FltBits = 0

#MaxLimit = 4500
#FaultLimit = 4400

MaxLimit = 4500
FaultLimit = 4300

t = 0
while t <= 7:
    if(t == 0):
        OutputBits = 0b00000001
        FdbkBits = 0b00000001
        FltBits = 0b00000010
        OutputStatus = "sdo[0x5001][3]"#OutStat1-2
        PortMode = "sdo[0x2001][1]"#Port1Mode
        OutputName = "sdo[0x6411][1]"#Output1A
        FeedbackName = "sdo[0x5003][1]"#Feedback1A
        OutputConnector = "J2_01"
    if(t == 1):
        OutputBits = 0b00000010
        FdbkBits = 0b00000110
        FltBits = 0b00001010
        OutputStatus = "sdo[0x5001][3]"#OutStat1-2
        PortMode = "sdo[0x2001][1]"#Port1Mode
        OutputName = "sdo[0x6411][2]"#Output1B
        FeedbackName = "sdo[0x5003][2]"#Feedback1B
        OutputConnector = "J2_02"
    if(t == 2):
        OutputBits = 0b00000100
        FdbkBits = 0b00011010
        FltBits = 0b00101010
        OutputStatus = "sdo[0x5001][3]"#OutStat1-2
        PortMode = "sdo[0x2001][2]"#Port2Mode
        OutputName = "sdo[0x6411][3]"#Output2A
        FeedbackName = "sdo[0x5003][3]"#Feedback2A
        OutputConnector = "J2_03"
    if(t == 3):
        OutputBits = 0b00001000
        FdbkBits = 0b01101010
        FltBits = 0b10101010
        OutputStatus = "sdo[0x5001][3]"#OutStat1-2
        PortMode = "sdo[0x2001][2]"#Port2Mode
        OutputName = "sdo[0x6411][4]"#Output2B
        FeedbackName = "sdo[0x5003][4]"#Feedback2B
        OutputConnector = "J2_04"
    if(t == 4):
        OutputBits = 0b00010000
        FdbkBits = 0b00000001
        FltBits = 0b00000010
        OutputStatus = "sdo[0x5001][4]"#OutStat3-4
        PortMode = "sdo[0x2001][3]"#Port3Mode
        OutputName = "sdo[0x6411][5]"#Output3A
        FeedbackName = "sdo[0x5003][5]"#Feedback3A
        OutputConnector = "J2_05"
    if(t == 5):
        OutputBits = 0b00100000
        FdbkBits = 0b00000110
        FltBits = 0b00001010
        OutputStatus = "sdo[0x5001][4]"#OutStat3-4
        PortMode = "sdo[0x2001][3]"#Port3Mode
        OutputName = "sdo[0x6411][6]"#Output3B
        FeedbackName = "sdo[0x5003][6]"#Feedback3B
        OutputConnector = "J2_06"
    if(t == 6):
        OutputBits = 0b01000000
        FdbkBits = 0b00011010
        FltBits = 0b00101010
        OutputStatus = "sdo[0x5001][4]"#OutStat3-4
        PortMode = "sdo[0x2001][4]"#Port4Mode
        OutputName = "sdo[0x6411][7]"#Output4A
        FeedbackName = "sdo[0x5003][7]"#Feedback4A
        OutputConnector = "J2_07"
    if(t == 7):
        OutputBits = 0b10000000
        FdbkBits = 0b01101010
        FltBits = 0b10101010
        OutputStatus = "sdo[0x5001][4]"#OutStat3-4
        PortMode = "sdo[0x2001][4]"#Port4Mode
        OutputName = "sdo[0x6411][8]"#Output4B
        FeedbackName = "sdo[0x5003][8]"#Feedback4B
        OutputConnector = "J2_08"
    if(t == 8):
        OutputBits = 0b00000001
        FdbkBits = 0b00000001
        FltBits = 0b00000010
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        PortMode = "sdo[0x2001][5]"#Port5Mode
        OutputName = "sdo[0x6411][9]"#Output5A
        FeedbackName = "sdo[0x5003][9]"#Feedback5A
        OutputConnector = "J2_09"
    if(t == 9):
        OutputBits = 0b00000010
        FdbkBits = 0b00000110
        FltBits = 0b00001010
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        PortMode = "sdo[0x2001][5]"#Port5Mode
        OutputName = "sdo[0x6411][10]"#Output5B
        FeedbackName = "sdo[0x5003][10]"#Feedback5B
        OutputConnector = "J2_10"
    if(t == 10):
        OutputBits = 0b00000100
        FdbkBits = 0b00011010
        FltBits = 0b00101010
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        PortMode = "sdo[0x2001][6]"#Port6Mode
        OutputName = "sdo[0x6411][11]"#Output6A
        FeedbackName = "sdo[0x5003][11]"#Feedback6A
        OutputConnector = "J2_11"
    if(t == 11):
        OutputBits = 0b00001000
        FdbkBits = 0b01101010
        FltBits = 0b10101010
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        PortMode = "sdo[0x2001][6]"#Port6Mode
        OutputName = "sdo[0x6411][12]"#Output6B
        FeedbackName = "sdo[0x5003][12]"#Feedback6B
        OutputConnector = "J2_12"
    if(t == 12):
        OutputBits = 0b00010000
        FdbkBits = 0b00000001
        FltBits = 0b00000010
        OutputStatus = "sdo[0x5001][6]"#OutStat7-8
        PortMode = "sdo[0x2001][7]"#Port7Mode
        OutputName = "sdo[0x6411][13]"#Output7A
        FeedbackName = "sdo[0x5003][13]"#Feedback7A
        OutputConnector = "J3_01"
    if(t == 13):
        OutputBits = 0b00100000
        FdbkBits = 0b00000110
        FltBits = 0b00001010
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        PortMode = "sdo[0x2001][7]"#Port7Mode
        OutputName = "sdo[0x6411][14]"#Output7B
        FeedbackName = "sdo[0x5003][14]"#Feedback7B
        OutputConnector = "J3_02"
    if(t == 14):
        OutputBits = 0b01000000
        FdbkBits = 0b00011010
        FltBits = 0b00101010
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        PortMode = "sdo[0x2001][8]"#Port8Mode
        OutputName = "sdo[0x6411][15]"#Output8A
        FeedbackName = "sdo[0x5003][15]"#Feedback8A
        OutputConnector = "J3_03"
    if(t == 15):
        OutputBits = 0b10000000
        FdbkBits = 0b01101010
        FltBits = 0b10101010
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        PortMode = "sdo[0x2001][8]"#Port8Mode
        OutputName = "sdo[0x6411][16]"#Output8B
        FeedbackName = "sdo[0x5003][16]"#Feedback8B
        OutputConnector = "J3_04"

    Cmd0x52 = "sdo[0x2000][1]"
    
    TheMode = 0x11

    outstr += "#-----setup 34044-----\n"
    outstr += "sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1\n"
    outstr += "#disable global modes\n"
    outstr += "sdo[0x2000][3] = 0 : NULL : WAIT = 0.1\n"
    outstr += "sdo[0x2000][4] = 0 : NULL : WAIT = 0.1\n"
    outstr += Cmd0x52 + " = " + str(FaultReset) + " : NULL : WAIT = 0.2\n"
    outstr += PortMode + " = " + str(TheMode) + " : NULL : WAIT = 0.2\n"

    outstr += "#switch in load line, set current\n"
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.5\n"
    
    outstr += "OPERATIONAL\n"
    
    outstr += "\n"
    i = 0
    while i <= MaxLimit:
        outstr += "#set current and turn on output and verify feedback\n" 
        outstr += OutputName + " = " + str(OutputBits) + " : NULL : WAIT = 0.1\n"
        outstr += "LdCurrentSet = " + str(i) + ": NULL : WAIT = 0.1\n"
        if(i <= FaultLimit):
            outstr += "#verify reading from load\n" 
            outstr += "NULL : " + FeedbackName + " = " + str(i) + " | 1000 | 0.1\n" 
            outstr += "NULL : " + OutputStatus + " = " + str(FdbkBits) + " | 0.01 | 0.1\n" 
            outstr += "NULL : MeterCurrent = " + str(i*0.001) + " | 0.1 | 0.1\n" 
            outstr += "\n"
        else:
            outstr += "#verify fault #1\n" 
            outstr += "NULL : " + FeedbackName + " = 0 | 0.1 | 0.1\n" 
            outstr += "NULL : " + OutputStatus + " = " + str(FltBits) + " | 0.1 | 0.1\n" 
            outstr += "NULL : MeterCurrent = 0  | 0.01 | 0.1\n" 
            outstr += "\n"
        i += 100

    outstr += "#switch out load line, clear current\n"
    outstr += OutputName + " = 0 : NULL : WAIT = 0.1\n"
    outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"
    outstr += "#read signal value to update\n"
    outstr += "NULL : " + FeedbackName + " = 0 | 155 | 0.5\n"
    outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
    outstr += "NULL : " + OutputStatus + " = 0 | 0.1 | 0.1\n" 
    t += 1


#verify faults clear
outstr += "NULL : sdo[0x5001][3] = 0 | 0 | 0.1\n"
outstr += "NULL : sdo[0x5001][4] = 0 | 0 | 0.1\n"
outstr += "NULL : sdo[0x5001][5] = 0 | 0 | 0.1\n"
outstr += "NULL : sdo[0x5001][6] = 0 | 0 | 0.1\n"


#shut down test
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 1\n"
outstr += "PRE_OPERATIONAL\n"
outstr += "SAVE\n"
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)


print(TestName + ".pat")