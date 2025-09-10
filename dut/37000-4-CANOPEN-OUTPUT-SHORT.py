
import os

script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")

t = 0
i = 0

PortMode = 0

#configuration
MaxLimit = 4500
FaultLimit = 4500
Increment = 500
FaultReset = 0
Skip10A = 0

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
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "LdShort = 1 : NULL : WAIT = 1\n"
outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"

#verify faults clear
outstr += "NULL : sdo[0x5001][3] = 0 | 0.1 | 0.1\n"
outstr += "NULL : sdo[0x5001][4] = 0 | 0.1 | 0.1\n"

outstr += "OPERATIONAL\n"
    
FdbkBits = 0
FltBits = 0

#MaxLimit = 4500
#FaultLimit = 4400

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
    
    Direction = "sdo[0x2005][1]"
    outstr += Direction + " = " + str(DirBits) + " : NULL : WAIT = 0.1\n"

    outstr += "\n"
    outstr += "#set current and turn on output and verify feedback\n" 
    outstr += OutputName + " = " + str(OutputBits) + " : NULL : WAIT = 0.1\n"
    outstr += "#check feedback is 0\n"
    outstr += "NULL : " + FeedbackName + " = 0 | 0 | 0.1\n" 
    outstr += "#check fault is set\n"
    outstr += "NULL : " + OutputStatus + " = " + str(FltBits) + " | 0 | 0.1\n"
    outstr += "#check fault code\n"
    outstr += "NULL : sdo[0x5000][3] = 1 | 0 | 0.1\n"
    outstr += "#switch out load line\n"
    outstr += OutputName + " = 0 : NULL : WAIT = 0.1\n"
    outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"
    t += 1


#verify faults clear
outstr += "NULL : sdo[0x5001][3] = 170 | 0 | 0.1\n"
outstr += "NULL : sdo[0x5001][4] = 170 | 0 | 0.1\n"
outstr += "NULL : sdo[0x5001][5] = 170 | 0 | 0.1\n"
outstr += "NULL : sdo[0x5001][6] = 170 | 0 | 0.1\n"

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
