
import os

script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")

t = 0
i = 0

#configuration
FaultReset = 1
Skip10A = 0
StartCurrent = 0

MaxLimit = 4400
FaultLimit = 4300
Increment = 200

#global setup
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

outstr = ""

outstr += "#37000-4\n"
outstr += "#Verion 0.0\n"
outstr += "#digital normal test using the E-LOAD\n"
outstr += "UUT_EDS = 37000-564.eds\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "PRE_OPERATIONAL\n"

outstr += "#-----setup PAT-----\n"
outstr += "#setup load\n"
outstr += "LdRemote = 1 : NULL\n"
outstr += "LdEnable = 0 : NULL\n"
outstr += "LdCurrentSet = 0 : NULL\n"
outstr += "J0_08_METER_LOAD = 1 : NULL\n"

outstr += "OPERATIONAL\n"

FdbkBits = 0
FltBits = 0
PortMode = 0


TheMode = 0x11
outstr += "#-----setup 34044-----\n"
if(FaultReset):
    outstr += "sdo[0x2000][1] = 1, sdo[0x2000][2] = 0 : NULL\n"
else:
    outstr += "sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL\n"
outstr += "#disable global modes\n"
outstr += "sdo[0x2000][3] = 0 : NULL\n"
outstr += "sdo[0x2000][4] = 0 : NULL\n"

outstr += "#-----set 1A/3A overcurrent-----\n"
outstr += "sdo[0x2004][1] = 45 : NULL\n"
outstr += "sdo[0x2004][2] = 45 : NULL\n"

outstr += "#switch in load line, set current\n"
    
start_out = 0
max_outs = 15
t = start_out

while t <= max_outs:
    if(Skip10A):
        if(t == 0):#skip 1A
            t += 1
        if(t == 1):#skip 1B
            t += 1
        if(t == 4):#skip 3A
            t += 1
        if(t == 5):#skip 3B
            t += 1
    if(t == 0):
        OutputBits = 0b00000001
        FdbkBits = 0b00000001
        FltBits = 0b00000010
        DirBits = 0b00000000
        PortBits = 0b00000011
        OutputStatus = "sdo[0x5001][3]"#OutStat1-2
        PortMode = "sdo[0x2001][1]"#Port1Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        PWMOutputName = "sdo[0x6411][1]"#Port_1
        FeedbackName = "sdo[0x5003][1]"#Port_1
        OutDesc = "Output1A"
        OutputConnector = "J2_01"
    if(t == 1):
        OutputBits = 0b00000010
        FdbkBits = 0b00000110
        FltBits = 0b00001010
        DirBits = 0b00000001
        PortBits = 0b00001100
        OutputStatus = "sdo[0x5001][3]"#OutStat1-2
        PortMode = "sdo[0x2001][1]"#Port1Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        PWMOutputName = "sdo[0x6411][1]"#Port_1
        FeedbackName = "sdo[0x5003][1]"#Port_1
        OutDesc = "Output1B"
        OutputConnector = "J2_02"
    if(t == 2):
        OutputBits = 0b00000100
        FdbkBits = 0b00011010
        FltBits = 0b00101010
        DirBits = 0b00000000
        PortBits = 0b00110000
        OutputStatus = "sdo[0x5001][3]"#OutStat1-2
        PortMode = "sdo[0x2001][2]"#Port2Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        PWMOutputName = "sdo[0x6411][2]"#Port_2
        FeedbackName = "sdo[0x5003][2]"#Port_2
        OutDesc = "Output2A"
        OutputConnector = "J2_03"
    if(t == 3):
        OutputBits = 0b00001000
        FdbkBits = 0b01101010
        FltBits = 0b10101010
        DirBits = 0b00000010
        PortBits = 0b11000000
        OutputStatus = "sdo[0x5001][3]"#OutStat1-2
        PortMode = "sdo[0x2001][2]"#Port2Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        PWMOutputName = "sdo[0x6411][2]"#Port_2
        FeedbackName = "sdo[0x5003][2]"#Port_2
        OutDesc = "Output2B"
        OutputConnector = "J2_04"
    if(t == 4):
        OutputBits = 0b00010000
        FdbkBits = 0b00000001
        FltBits = 0b00000010
        DirBits = 0b00000000
        PortBits = 0b00000011
        OutputStatus = "sdo[0x5001][4]"#OutStat3-4
        PortMode = "sdo[0x2001][3]"#Port3Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        PWMOutputName = "sdo[0x6411][3]"#Port_3
        FeedbackName = "sdo[0x5003][3]"#Port_3
        OutDesc = "Output3A"
        OutputConnector = "J2_05"
    if(t == 5):
        OutputBits = 0b00100000
        FdbkBits = 0b00000110
        FltBits = 0b00001010
        DirBits = 0b00000100
        PortBits = 0b00001100
        OutputStatus = "sdo[0x5001][4]"#OutStat3-4
        PortMode = "sdo[0x2001][3]"#Port3Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        PWMOutputName = "sdo[0x6411][3]"#Port_3
        FeedbackName = "sdo[0x5003][3]"#Port_3
        OutDesc = "Output3B"
        OutputConnector = "J2_06"
    if(t == 6):
        OutputBits = 0b01000000
        FdbkBits = 0b00011010
        FltBits = 0b00101010
        DirBits = 0b00000000
        PortBits = 0b00110000
        OutputStatus = "sdo[0x5001][4]"#OutStat3-4
        PortMode = "sdo[0x2001][4]"#Port4Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        PWMOutputName = "sdo[0x6411][4]"#Port_4
        FeedbackName = "sdo[0x5003][4]"#Port_4
        OutDesc = "Output4A"
        OutputConnector = "J2_07"
    if(t == 7):
        OutputBits = 0b10000000
        FdbkBits = 0b01101010
        FltBits = 0b10101010
        DirBits = 0b00001000
        PortBits = 0b11000000
        OutputStatus = "sdo[0x5001][4]"#OutStat3-4
        PortMode = "sdo[0x2001][4]"#Port4Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        PWMOutputName = "sdo[0x6411][4]"#Port_4
        FeedbackName = "sdo[0x5003][4]"#Port_4
        OutDesc = "Output4B"
        OutputConnector = "J2_08"
    if(t == 8):
        OutputBits = 0b00000001
        FdbkBits = 0b00000001
        FltBits = 0b00000010
        DirBits = 0b00000000
        PortBits = 0b00000011
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        PortMode = "sdo[0x2001][5]"#Port5Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        PWMOutputName = "sdo[0x6411][5]"#Port_5
        FeedbackName = "sdo[0x5003][5]"#Port_5
        OutDesc = "Output5A"
        OutputConnector = "J2_09"
    if(t == 9):
        OutputBits = 0b00000010
        FdbkBits = 0b00000110
        FltBits = 0b00001010
        DirBits = 0b00010000
        PortBits = 0b00001100
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        PortMode = "sdo[0x2001][5]"#Port5Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        PWMOutputName = "sdo[0x6411][5]"#Port_5
        FeedbackName = "sdo[0x5003][5]"#Port_5
        OutDesc = "Output5B"
        OutputConnector = "J2_10"
    if(t == 10):
        OutputBits = 0b00000100
        FdbkBits = 0b00011010
        FltBits = 0b00101010
        DirBits = 0b00000000
        PortBits = 0b00110000
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        PortMode = "sdo[0x2001][6]"#Port6Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        PWMOutputName = "sdo[0x6411][6]"#Port_6
        FeedbackName = "sdo[0x5003][6]"#Port_6
        OutDesc = "Output6A"
        OutputConnector = "J2_11"
    if(t == 11):
        OutputBits = 0b00001000
        FdbkBits = 0b01101010
        FltBits = 0b10101010
        DirBits = 0b00100000
        PortBits = 0b11000000
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        PortMode = "sdo[0x2001][6]"#Port6Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        PWMOutputName = "sdo[0x6411][6]"#Port_6
        FeedbackName = "sdo[0x5003][6]"#Port_6
        OutDesc = "Output6B"
        OutputConnector = "J2_12"
    if(t == 12):
        OutputBits = 0b00010000
        FdbkBits = 0b00000001
        FltBits = 0b00000010
        DirBits = 0b00000000
        PortBits = 0b00000011
        OutputStatus = "sdo[0x5001][6]"#OutStat7-8
        PortMode = "sdo[0x2001][7]"#Port7Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        PWMOutputName = "sdo[0x6411][7]"#Port_7
        FeedbackName = "sdo[0x5003][7]"#Port_7
        OutDesc = "Output7A"
        OutputConnector = "J3_01"
    if(t == 13):
        OutputBits = 0b00100000
        FdbkBits = 0b00000110
        FltBits = 0b00001010
        DirBits = 0b01000000
        PortBits = 0b00001100
        OutputStatus = "sdo[0x5001][6]"#OutStat7-8
        PortMode = "sdo[0x2001][7]"#Port7Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        PWMOutputName = "sdo[0x6411][7]"#Port_7
        FeedbackName = "sdo[0x5003][7]"#Port_7
        OutDesc = "Output7B"
        OutputConnector = "J3_02"
    if(t == 14):
        OutputBits = 0b01000000
        FdbkBits = 0b00011010
        FltBits = 0b00101010
        DirBits = 0b00000000
        PortBits = 0b00110000
        OutputStatus = "sdo[0x5001][6]"#OutStat7-8
        PortMode = "sdo[0x2001][8]"#Port8Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        PWMOutputName = "sdo[0x6411][8]"#Port_8
        FeedbackName = "sdo[0x5003][8]"#Port_8
        OutDesc = "Output8A"
        OutputConnector = "J3_03"
    if(t == 15):
        OutputBits = 0b10000000
        FdbkBits = 0b01101010
        FltBits = 0b10101010
        DirBits = 0b10000000
        PortBits = 0b11000000
        OutputStatus = "sdo[0x5001][6]"#OutStat7-8
        PortMode = "sdo[0x2001][8]"#Port8Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        PWMOutputName = "sdo[0x6411][8]"#Port_8
        FeedbackName = "sdo[0x5003][8]"#Port_8
        OutDesc = "Output8B"
        OutputConnector = "J3_04"


    if(Skip10A): #if skip 10A
        if PortMode == "sdo[0x2001][1]" or PortMode == "sdo[0x2001][2]" or PortMode == "sdo[0x2001][3]" or PortMode == "sdo[0x2001][4]" : #if port 1, 2, 3 or 4
            #keep 1A & 3A clear
            FdbkBits &= 0b11111100
            FltBits &= 0b11111100

    #outstr += "#-----setup 34044-----\n"
    outstr += PortMode + " = " + str(TheMode) + " : NULL\n"
    outstr += "#switch in load line, set current\n"
    outstr += OutputConnector + " = 1 : NULL\n"
    Direction = "sdo[0x2005][1]"
    outstr += Direction + " = " + str(DirBits) + " : NULL : WAIT = 0.1\n"
    
    outstr += "LdCurrentSet = 5000: NULL\n"
    outstr += "LdEnable = 0 : NULL\n"
    

    #outstr += "#-----setup 34044-----\n"
    outstr += PortMode + " = " + str(TheMode) + " : NULL\n"
    outstr += "#switch in load line, set current\n"
    outstr += OutputConnector + " = 1 : NULL\n"
    
    outstr += "#switch in load line, set current\n"
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.5\n"
    outstr += "LdCurrentSet = 5500: NULL : WAIT = 0.5\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.5\n"
    
    outstr += "\n"
    outstr += "\n"
    outstr += "#turn ON " + OutDesc +"\n" 
    outstr += OutputName + " = " + str(OutputBits) + " : NULL\n"
    outstr += "#enable load\n" 
    outstr += "LdEnable = 1 : NULL : WAIT = 0.5\n"
    outstr += "#disable load\n"
    outstr += "LdEnable = 0 : NULL\n"
    outstr += "#turn OFF " + OutDesc +"\n" 
    outstr += OutputName + " = 0 : NULL\n"

    outstr += "#switch out load line, clear current\n"
    outstr += OutputName + " = 0 : NULL\n"
    outstr += OutputConnector + " = 0 : NULL\n"
    outstr += "LdCurrentSet = 0 : NULL\n"
    
    #outstr += "#cycle IGN to clean slate\n"
    #outstr += "RLY_K1 = 1 : NULL : WAIT = 1\n"
    #outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    t += 1

#shut down test
outstr += "LdRemote = 0 : NULL\n"
outstr += "LdEnable = 0 : NULL\n"
outstr += "J0_08_METER_LOAD = 0 : NULL\n"
outstr += "PRE_OPERATIONAL\n"
outstr += "SAVE\n"
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)


print(TestName + ".pat")