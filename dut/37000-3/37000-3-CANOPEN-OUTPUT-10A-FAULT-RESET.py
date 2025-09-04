
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

outstr += "#37000-3\n"
outstr += "#Verion 0.0\n"
outstr += "#digital normal test using the E-LOAD\n"
outstr += "UUT_EDS = 37000-563.eds\n"
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
outstr += "sdo[0x2000][1] = 1, sdo[0x2000][2] = 0 : NULL\n"
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
        if(t == 4):#skip 3A
            t += 1
    if(t == 0):
        OutputBits = 0b00000001
        FdbkBits = 0b00000001
        FltBits = 0b00000010
        PortBits = 0b00000011
        OutputStatus = "sdo[0x5001][3]"#OutStat1-2
        PortMode = "sdo[0x2001][1]"#Port1Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        PWMOutputName = "sdo[0x6411][1]"#Output1A
        FeedbackName = "sdo[0x5003][1]"#Feedback1A
        OutDesc = "Output1A"
        OutputConnector = "J2_01"
    if(t == 1):
        OutputBits = 0b00000010
        FdbkBits = 0b00000110
        FltBits = 0b00001010
        PortBits = 0b00001100
        OutputStatus = "sdo[0x5001][3]"#OutStat1-2
        PortMode = "sdo[0x2001][1]"#Port1Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        PWMOutputName = "sdo[0x6411][2]"#Output1B
        FeedbackName = "sdo[0x5003][2]"#Feedback1B
        OutDesc = "Output1B"
        OutputConnector = "J2_02"
    if(t == 2):
        OutputBits = 0b00000100
        FdbkBits = 0b00011010
        FltBits = 0b00101010
        PortBits = 0b00110000
        OutputStatus = "sdo[0x5001][3]"#OutStat1-2
        PortMode = "sdo[0x2001][2]"#Port2Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        PWMOutputName = "sdo[0x6411][3]"#Output2A
        FeedbackName = "sdo[0x5003][3]"#Feedback2A
        OutDesc = "Output2A"
        OutputConnector = "J2_03"
    if(t == 3):
        OutputBits = 0b00001000
        FdbkBits = 0b01101010
        FltBits = 0b10101010
        PortBits = 0b11000000
        OutputStatus = "sdo[0x5001][3]"#OutStat1-2
        PortMode = "sdo[0x2001][2]"#Port2Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        PWMOutputName = "sdo[0x6411][4]"#Output2B
        FeedbackName = "sdo[0x5003][4]"#Feedback2B
        OutDesc = "Output2B"
        OutputConnector = "J2_04"
    if(t == 4):
        OutputBits = 0b00010000
        FdbkBits = 0b00000001
        FltBits = 0b00000010
        PortBits = 0b00000011
        OutputStatus = "sdo[0x5001][4]"#OutStat3-4
        PortMode = "sdo[0x2001][3]"#Port3Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        PWMOutputName = "sdo[0x6411][5]"#Output3A
        FeedbackName = "sdo[0x5003][5]"#Feedback3A
        OutDesc = "Output3A"
        OutputConnector = "J2_05"
    if(t == 5):
        OutputBits = 0b00100000
        FdbkBits = 0b00000110
        FltBits = 0b00001010
        PortBits = 0b00001100
        OutputStatus = "sdo[0x5001][4]"#OutStat3-4
        PortMode = "sdo[0x2001][3]"#Port3Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        PWMOutputName = "sdo[0x6411][6]"#Output3B
        FeedbackName = "sdo[0x5003][6]"#Feedback3B
        OutDesc = "Output3B"
        OutputConnector = "J2_06"
    if(t == 6):
        OutputBits = 0b01000000
        FdbkBits = 0b00011010
        FltBits = 0b00101010
        PortBits = 0b00110000
        OutputStatus = "sdo[0x5001][4]"#OutStat3-4
        PortMode = "sdo[0x2001][4]"#Port4Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        PWMOutputName = "sdo[0x6411][7]"#Output4A
        FeedbackName = "sdo[0x5003][7]"#Feedback4A
        OutDesc = "Output4A"
        OutputConnector = "J2_07"
    if(t == 7):
        OutputBits = 0b10000000
        FdbkBits = 0b01101010
        FltBits = 0b10101010
        PortBits = 0b11000000
        OutputStatus = "sdo[0x5001][4]"#OutStat3-4
        PortMode = "sdo[0x2001][4]"#Port4Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        PWMOutputName = "sdo[0x6411][8]"#Output4B
        FeedbackName = "sdo[0x5003][8]"#Feedback4B
        OutDesc = "Output4B"
        OutputConnector = "J2_08"
    if(t == 8):
        OutputBits = 0b00000001
        FdbkBits = 0b00000001
        FltBits = 0b00000010
        PortBits = 0b00000011
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        PortMode = "sdo[0x2001][5]"#Port5Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        PWMOutputName = "sdo[0x6411][9]"#Output5A
        FeedbackName = "sdo[0x5003][9]"#Feedback5A
        OutDesc = "Output5A"
        OutputConnector = "J2_09"
    if(t == 9):
        OutputBits = 0b00000010
        FdbkBits = 0b00000110
        FltBits = 0b00001010
        PortBits = 0b00001100
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        PortMode = "sdo[0x2001][5]"#Port5Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        PWMOutputName = "sdo[0x6411][10]"#Output5B
        FeedbackName = "sdo[0x5003][10]"#Feedback5B
        OutDesc = "Output5B"
        OutputConnector = "J2_10"
    if(t == 10):
        OutputBits = 0b00000100
        FdbkBits = 0b00011010
        FltBits = 0b00101010
        PortBits = 0b00110000
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        PortMode = "sdo[0x2001][6]"#Port6Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        PWMOutputName = "sdo[0x6411][11]"#Output6A
        FeedbackName = "sdo[0x5003][11]"#Feedback6A
        OutDesc = "Output6A"
        OutputConnector = "J2_11"
    if(t == 11):
        OutputBits = 0b00001000
        FdbkBits = 0b01101010
        FltBits = 0b10101010
        PortBits = 0b11000000
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        PortMode = "sdo[0x2001][6]"#Port6Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        PWMOutputName = "sdo[0x6411][12]"#Output6B
        FeedbackName = "sdo[0x5003][12]"#Feedback6B
        OutDesc = "Output6B"
        OutputConnector = "J2_12"
    if(t == 12):
        OutputBits = 0b00010000
        FdbkBits = 0b00000001
        FltBits = 0b00000010
        PortBits = 0b00000011
        OutputStatus = "sdo[0x5001][6]"#OutStat7-8
        PortMode = "sdo[0x2001][7]"#Port7Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        PWMOutputName = "sdo[0x6411][13]"#Output7A
        FeedbackName = "sdo[0x5003][13]"#Feedback7A
        OutDesc = "Output7A"
        OutputConnector = "J3_01"
    if(t == 13):
        OutputBits = 0b00100000
        FdbkBits = 0b00000110
        FltBits = 0b00001010
        PortBits = 0b00001100
        OutputStatus = "sdo[0x5001][6]"#OutStat7-8
        PortMode = "sdo[0x2001][7]"#Port7Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        PWMOutputName = "sdo[0x6411][14]"#Output7B
        FeedbackName = "sdo[0x5003][14]"#Feedback7B
        OutDesc = "Output7B"
        OutputConnector = "J3_02"
    if(t == 14):
        OutputBits = 0b01000000
        FdbkBits = 0b00011010
        FltBits = 0b00101010
        PortBits = 0b00110000
        OutputStatus = "sdo[0x5001][6]"#OutStat7-8
        PortMode = "sdo[0x2001][8]"#Port8Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        PWMOutputName = "sdo[0x6411][15]"#Output8A
        FeedbackName = "sdo[0x5003][15]"#Feedback8A
        OutDesc = "Output8A"
        OutputConnector = "J3_03"
    if(t == 15):
        OutputBits = 0b10000000
        FdbkBits = 0b01101010
        FltBits = 0b10101010
        PortBits = 0b11000000
        OutputStatus = "sdo[0x5001][6]"#OutStat7-8
        PortMode = "sdo[0x2001][8]"#Port8Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        PWMOutputName = "sdo[0x6411][16]"#Output8B
        FeedbackName = "sdo[0x5003][16]"#Feedback8B
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
    
    outstr += "#switch in load line, set current\n"
    outstr += OutputConnector + " = 1 : NULL\n"
    outstr += "LdCurrentSet = 5000: NULL\n"
    outstr += "LdEnable = 0 : NULL\n"
    
    outstr += "\n"
    outstr += "\n"
    outstr += "#verify fault clear\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(FltBits & ~PortBits) + " | 0 | 0.01\n"
    outstr += "#turn ON " + OutDesc +"\n" 
    outstr += OutputName + " = " + str(OutputBits) + " : NULL\n"
    outstr += "#enable load\n" 
    outstr += "LdEnable = 1 : NULL\n"
    outstr += "#verify fault #1\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(FltBits) + " | 0 | 0.01\n"  
    outstr += "#disable load\n"
    outstr += "LdEnable = 0 : NULL\n"
    outstr += "#turn OFF " + OutDesc +"\n" 
    outstr += OutputName + " = 0 : NULL\n"
    
    outstr += "\n"
    outstr += "#verify fault #1 clear\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(FltBits & ~PortBits) + " | 0 | 0.01\n"
    outstr += "#turn ON " + OutDesc +"\n"
    outstr += OutputName + " = " + str(OutputBits) + " : NULL\n"
    outstr += "#enable load\n" 
    outstr += "LdEnable = 1 : NULL\n"
    outstr += "#verify fault #2\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(FltBits) + " | 0 | 0.01\n" 
    outstr += "#disable load\n"
    outstr += "LdEnable = 0 : NULL\n"
    outstr += "#turn OFF " + OutDesc +"\n" 
    outstr += OutputName + " = 0 : NULL\n"
    
    outstr += "\n"
    outstr += "#verify fault #2 clear\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(FltBits & ~PortBits) + " | 0 | 0.01\n"
    outstr += "#turn ON " + OutDesc +"\n" 
    outstr += OutputName + " = " + str(OutputBits) + " : NULL\n"
    outstr += "#enable load\n" 
    outstr += "LdEnable = 1 : NULL\n"
    outstr += "#verify fault #3\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(FltBits) + " | 0 | 0.01\n" 
    outstr += "#disable load\n"
    outstr += "LdEnable = 0 : NULL\n"
    outstr += "#turn OFF " + OutDesc +"\n" 
    outstr += OutputName + " = 0 : NULL\n"
    
    outstr += "\n"
    outstr += "#verify fault #3 clear\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(FltBits & ~PortBits) + " | 0 | 0.01\n"
    outstr += "#turn ON " + OutDesc +"\n" 
    outstr += OutputName + " = " + str(OutputBits) + " : NULL\n"
    outstr += "#enable load\n" 
    outstr += "LdEnable = 1 : NULL\n"
    outstr += "#verify fault #4\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(FltBits) + " | 0 | 0.01\n" 
    outstr += "#disable load\n"
    outstr += "LdEnable = 0 : NULL\n"
    outstr += "#turn OFF " + OutDesc +"\n" 
    outstr += OutputName + " = 0 : NULL\n"
    
    outstr += "\n"
    outstr += "#verify fault #4 clear\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(FltBits & ~PortBits) + " | 0 | 0.01\n"
    outstr += "#turn ON " + OutDesc +"\n" 
    outstr += OutputName + " = " + str(OutputBits) + " : NULL\n"
    outstr += "#enable load\n" 
    outstr += "LdEnable = 1 : NULL\n"
    outstr += "#verify fault #5\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(FltBits) + " | 0 | 0.01\n" 
    outstr += "#disable load\n"
    outstr += "LdEnable = 0 : NULL\n"
    outstr += "#turn OFF " + OutDesc +"\n" 
    outstr += OutputName + " = 0 : NULL\n"
    
    outstr += "\n"
    outstr += "#verify fault #5 sticks\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(FltBits) + " | 0 | 0.01\n" 
    
    outstr += "#switch out load line, clear current\n"
    outstr += OutputName + " = 0 : NULL\n"
    outstr += OutputConnector + " = 0 : NULL\n"
    outstr += "LdCurrentSet = 0 : NULL\n"
    t += 1
    
#verify faults
outstr += "NULL : sdo[0x5001][3] = 170 | 0 | 0.001\n"
outstr += "NULL : sdo[0x5001][4] = 170 | 0 | 0.001\n"
outstr += "NULL : sdo[0x5001][5] = 170 | 0 | 0.001\n"
outstr += "NULL : sdo[0x5001][6] = 170 | 0 | 0.001\n"

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