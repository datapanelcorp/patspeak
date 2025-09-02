
import os

script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")

t = 0
i = 0

#configuration
FaultReset = 0
Skip10A = 1
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

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"

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

Cmd0x52 = "sdo[0x2000][1]"
TheMode = 0x11
outstr += "#-----setup 34044-----\n"
outstr += "sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL\n"
outstr += "#disable global modes\n"
outstr += "sdo[0x2000][3] = 0 : NULL\n"
outstr += "sdo[0x2000][4] = 0 : NULL\n"

outstr += "#-----set 1A/3A overcurrent-----\n"
outstr += "sdo[0x2004][1] = 45 : NULL\n"
outstr += "sdo[0x2004][2] = 45 : NULL\n"

outstr += Cmd0x52 + " = " + str(FaultReset) + " : NULL\n"
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
        FltBits = 0b00000010
        OffBits = 0b00000000
        PortMode = "sdo[0x2001][1]"#Port1Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        OutputStatus = "sdo[0x5001][3]"#OutStat1-2
        FeedbackName = "sdo[0x5003][1]"#Port_1A
        OutputConnector = "J2_01"
        OutputNameStr = "Port_1A"
    if(t == 1):
        OutputBits = 0b00000010
        FltBits = 0b00001000
        OffBits = 0b00000000
        PortMode = "sdo[0x2001][1]"#Port1Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        OutputStatus = "sdo[0x5001][3]"#OutStat1-2
        FeedbackName = "sdo[0x5003][2]"#Port_1B
        OutputConnector = "J2_02"
        OutputNameStr = "Port_1B"
    if(t == 2):
        OutputBits = 0b00000100
        FltBits = 0b00101000
        OffBits = 0b00001000
        PortMode = "sdo[0x2001][2]"#Port2Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        OutputStatus = "sdo[0x5001][3]"#OutStat1-2
        FeedbackName = "sdo[0x5003][3]"#Port_2A
        OutputConnector = "J2_03"
        OutputNameStr = "Port_2A"
    if(t == 3):
        OutputBits = 0b00001000
        FltBits = 0b10101000
        OffBits = 0b00101000
        PortMode = "sdo[0x2001][2]"#Port2Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        OutputStatus = "sdo[0x5001][3]"#OutStat1-2
        FeedbackName = "sdo[0x5003][4]"#Port_2B
        OutputConnector = "J2_04"
        OutputNameStr = "Port_2B"
    if(t == 4):
        OutputBits = 0b00010000
        FltBits = 0b00000010
        OffBits = 0b00000000
        PortMode = "sdo[0x2001][3]"#Port3Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        OutputStatus = "sdo[0x5001][4]"#OutStat3-4
        FeedbackName = "sdo[0x5003][5]"#Port_3A
        OutputConnector = "J2_05"
        OutputNameStr = "Port_3A"
    if(t == 5):
        OutputBits = 0b00100000
        FltBits = 0b00001000
        OffBits = 0b00000000
        PortMode = "sdo[0x2001][3]"#Port3Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        OutputStatus = "sdo[0x5001][4]"#OutStat3-4
        FeedbackName = "sdo[0x5003][6]"#Port_3B
        OutputConnector = "J2_06"
        OutputNameStr = "Port_3B"
    if(t == 6):
        OutputBits = 0b01000000
        FltBits = 0b00101000
        OffBits = 0b00001000
        PortMode = "sdo[0x2001][4]"#Port4Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        OutputStatus = "sdo[0x5001][4]"#OutStat3-4
        FeedbackName = "sdo[0x5003][7]"#Port_4A
        OutputConnector = "J2_07"
        OutputNameStr = "Port_4A"
    if(t == 7):
        OutputBits = 0b10000000
        FltBits = 0b10101000
        OffBits = 0b00101000
        PortMode = "sdo[0x2001][4]"#Port4Mode
        OutputName = "sdo[0x6200][1]"#Output_1
        OutputStatus = "sdo[0x5001][4]"#OutStat3-4
        FeedbackName = "sdo[0x5003][8]"#Port_4B
        OutputConnector = "J2_08"
        OutputNameStr = "Port_4B"
    if(t == 8):
        OutputBits = 0b00000001
        FltBits = 0b00000010
        OffBits = 0b00000000
        PortMode = "sdo[0x2001][5]"#Port5Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        FeedbackName = "sdo[0x5003][9]"#Port_5A
        OutputConnector = "J2_09"
        OutputNameStr = "Port_5A"
    if(t == 9):
        OutputBits = 0b00000010
        FltBits = 0b00001010
        OffBits = 0b00000010
        PortMode = "sdo[0x2001][5]"#Port5Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        FeedbackName = "sdo[0x5003][10]"#Port_5B
        OutputConnector = "J2_10"
        OutputNameStr = "Port_5B"
    if(t == 10):
        OutputBits = 0b00000100
        FltBits = 0b00101010
        OffBits = 0b00001010
        PortMode = "sdo[0x2001][6]"#Port6Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        FeedbackName = "sdo[0x5003][11]"#Port_6A
        OutputConnector = "J2_11"
        OutputNameStr = "Port_6A"
    if(t == 11):
        OutputBits = 0b00001000
        FltBits = 0b10101010
        OffBits = 0b00101010
        PortMode = "sdo[0x2001][6]"#Port6Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        OutputStatus = "sdo[0x5001][5]"#OutStat5-6
        FeedbackName = "sdo[0x5003][12]"#Port_6B
        OutputConnector = "J2_12"
        OutputNameStr = "Port_6B"
    if(t == 12):
        OutputBits = 0b00010000
        FltBits = 0b00000010
        OffBits = 0b00000000
        PortMode = "sdo[0x2001][7]"#Port7Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        OutputStatus = "sdo[0x5001][6]"#OutStat7-8
        FeedbackName = "sdo[0x5003][13]"#Port_7A
        OutputConnector = "J3_01"
        OutputNameStr = "Port_7A"
    if(t == 13):
        OutputBits = 0b00100000
        FltBits = 0b00001010
        OffBits = 0b00000010
        PortMode = "sdo[0x2001][7]"#Port7Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        OutputStatus = "sdo[0x5001][6]"#OutStat7-8
        FeedbackName = "sdo[0x5003][14]"#Port_7B
        OutputConnector = "J3_02"
        OutputNameStr = "Port_7B"
    if(t == 14):
        OutputBits = 0b01000000
        FltBits = 0b00101010
        OffBits = 0b00001010
        PortMode = "sdo[0x2001][8]"#Port8Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        OutputStatus = "sdo[0x5001][6]"#OutStat7-8
        FeedbackName = "sdo[0x5003][15]"#Port_8A
        OutputConnector = "J3_03"
        OutputNameStr = "Port_8A"
    if(t == 15):
        OutputBits = 0b10000000
        FltBits = 0b10101010
        OffBits = 0b00101010
        PortMode = "sdo[0x2001][8]"#Port8Mode
        OutputName = "sdo[0x6200][2]"#Output_2
        OutputStatus = "sdo[0x5001][6]"#OutStat7-8
        FeedbackName = "sdo[0x5003][16]"#Port_8B
        OutputConnector = "J3_04"
        OutputNameStr = "Port_8B"

    FaultReset = 1 #HACK
    #outstr += "#-----setup 34044-----\n"
    outstr += "sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL\n"
    outstr += PortMode + " = " + str(TheMode) + " : NULL\n"
    outstr += Cmd0x52 + " = " + str(FaultReset) + " : NULL\n"
    outstr += "#switch in load line, set current\n"
    outstr += OutputConnector + " = 1 : NULL\n"
    
    outstr += "#switch in load line, set current\n"
    outstr += OutputConnector + " = 1 : NULL\n"
    outstr += "LdCurrentSet = 5000: NULL\n"
    outstr += "LdEnable = 0 : NULL\n"
    
    outstr += "\n"
    outstr += "\n"
    outstr += "#verify fault clear\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(OffBits) + " | 0 | 0.01\n"
    outstr += "#turn ON " + OutputNameStr +"\n" 
    outstr += OutputName + " = " + str(OutputBits) + " : NULL\n"
    outstr += "#enable load\n" 
    outstr += "LdEnable = 1 : NULL\n"
    outstr += "#verify fault #1\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(FltBits) + " | 0 | 0.01\n"  
    outstr += "#disable load\n"
    outstr += "LdEnable = 0 : NULL\n"
    outstr += "#turn OFF " + OutputNameStr +"\n" 
    outstr += OutputName + " = 0 : NULL\n"
    
    outstr += "\n"
    outstr += "#verify fault #1 clear\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(OffBits) + " | 0 | 0.01\n"
    outstr += "#turn ON " + OutputNameStr +"\n"
    outstr += OutputName + " = " + str(OutputBits) + " : NULL\n"
    outstr += "#enable load\n" 
    outstr += "LdEnable = 1 : NULL\n"
    outstr += "#verify fault #2\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(FltBits) + " | 0 | 0.01\n" 
    outstr += "#disable load\n"
    outstr += "LdEnable = 0 : NULL\n"
    outstr += "#turn OFF " + OutputNameStr +"\n" 
    outstr += OutputName + " = 0 : NULL\n"
    
    outstr += "\n"
    outstr += "#verify fault #2 clear\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(OffBits) + " | 0 | 0.01\n"
    outstr += "#turn ON " + OutputNameStr +"\n" 
    outstr += OutputName + " = " + str(OutputBits) + " : NULL\n"
    outstr += "#enable load\n" 
    outstr += "LdEnable = 1 : NULL\n"
    outstr += "#verify fault #3\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(FltBits) + " | 0 | 0.01\n" 
    outstr += "#disable load\n"
    outstr += "LdEnable = 0 : NULL\n"
    outstr += "#turn OFF " + OutputNameStr +"\n" 
    outstr += OutputName + " = 0 : NULL\n"
    
    outstr += "\n"
    outstr += "#verify fault #3 clear\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(OffBits) + " | 0 | 0.01\n"
    outstr += "#turn ON " + OutputNameStr +"\n" 
    outstr += OutputName + " = " + str(OutputBits) + " : NULL\n"
    outstr += "#enable load\n" 
    outstr += "LdEnable = 1 : NULL\n"
    outstr += "#verify fault #4\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(FltBits) + " | 0 | 0.01\n" 
    outstr += "#disable load\n"
    outstr += "LdEnable = 0 : NULL\n"
    outstr += "#turn OFF " + OutputNameStr +"\n" 
    outstr += OutputName + " = 0 : NULL\n"
    
    outstr += "\n"
    outstr += "#verify fault #4 clear\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(OffBits) + " | 0 | 0.01\n"
    outstr += "#turn ON " + OutputNameStr +"\n" 
    outstr += OutputName + " = " + str(OutputBits) + " : NULL\n"
    outstr += "#enable load\n" 
    outstr += "LdEnable = 1 : NULL\n"
    outstr += "#verify fault #5\n" 
    outstr += "NULL : " + OutputStatus + " = " + str(FltBits) + " | 0 | 0.01\n" 
    outstr += "#disable load\n"
    outstr += "LdEnable = 0 : NULL\n"
    outstr += "#turn OFF " + OutputNameStr +"\n" 
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
outstr += "NULL : sdo[0x5001][3] = 168 | 0 | 0.001\n"
outstr += "NULL : sdo[0x5001][4] = 168 | 0 | 0.001\n"
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