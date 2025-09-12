import os

script_name = os.path.basename(__file__)

#global setup
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

t = 0
i = 0
Frequancy = 200
Kp = 0.8
Ki = 0.5
Skip10A = 1
#PortMode = 0

FaultReset = 0

Load1 = "J4_01"
Scope = "J4_03"

Kp = Kp * 100
Ki = Ki * 100

#global setup
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

outstr = ""
outstr += "#37000-4\n"
outstr += "#Verion 0.0\n"
outstr += "#PWMi overcurrent test with a 2.1 Ohm resistive load. (6.9 amps @ 14.5 VDC)\n"
outstr += "UUT_EDS = 37000-564.eds\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "PRE_OPERATIONAL\n"

outstr += "#-----configure PWMi-----\n"
outstr += "sdo[0x2002][1] = " + f"{Kp}" + ", sdo[0x2002][2] = " + f"{Ki}" + ", sdo[0x2002][3] = " + f"{Kp}" + ", sdo[0x2002][4] = " + f"{Ki}" + ", sdo[0x2002][5] = " + f"{Kp}" + ", sdo[0x2002][6] = " + f"{Ki}" + " : NULL : WAIT = 0.1\n"
outstr += "sdo[0x2002][7] = " + f"{Kp}" + ", sdo[0x2002][8] = " + f"{Ki}" + ", sdo[0x2002][9] = " + f"{Kp}" + ", sdo[0x2002][10] = " + f"{Ki}" + ", sdo[0x2002][11] = " + f"{Kp}" + ", sdo[0x2002][12] = " + f"{Ki}" + " : NULL : WAIT = 0.1\n"
outstr += "sdo[0x2002][13] = " + f"{Kp}" + ", sdo[0x2002][14] = " + f"{Ki}" + ", sdo[0x2002][15] = " + f"{Kp}" + ", sdo[0x2002][16] = " + f"{Ki}" + " : NULL\n"

# outstr += "sdo[0x2002][17] = " + f"{Kp}" + ", sdo[0x2002][18] = " + f"{Ki}" + ", sdo[0x2002][19] = " + f"{Kp}" + ", sdo[0x2002][20] = " + f"{Ki}" + ", sdo[0x2002][21] = " + f"{Kp}" + ", sdo[0x2002][22] = " + f"{Ki}" + " : NULL : WAIT = 0.1\n"
# outstr += "sdo[0x2002][23] = " + f"{Kp}" + ", sdo[0x2002][24] = " + f"{Ki}" + ", sdo[0x2002][25] = " + f"{Kp}" + ", sdo[0x2002][26] = " + f"{Ki}" + ", sdo[0x2002][27] = " + f"{Kp}" + ", sdo[0x2002][28] = " + f"{Ki}" + " : NULL : WAIT = 0.1\n"
# outstr += "sdo[0x2002][29] = " + f"{Kp}" + ", sdo[0x2002][30] = " + f"{Ki}" + ", sdo[0x2002][31] = " + f"{Kp}" + ", sdo[0x2002][32] = " + f"{Ki}" + " : NULL\n"

outstr += "#-----set freq-----\n"
outstr += "sdo[0x3000] = " + str(Frequancy) + " : NULL : WAIT = 0.2\n"
outstr += "#-----no fault reset-----\n"
outstr += "sdo[0x2000][1] = 0 : NULL\n"
outstr += "METER_MODE = 1 : NULL : WAIT = 0.2\n"

t = 0
while t <= 15:
    
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
            FdbkBits &= 0b11110000
            FltBits &= 0b11110000
                
                
    TheGlobalOutputMode = "sdo[0x2000][3]"
    TheGlobalInputMode = "sdo[0x2000][4]"
    Direction = "sdo[0x2005][1]"
    
    TheMode = 0x44 #PWMI Mode

    outstr += "#-----setup 37000-----\n"
    outstr += TheGlobalOutputMode + " = " + str(0) + " : NULL : WAIT = 0.2\n"
    outstr += TheGlobalInputMode + " = " + str(0) + " : NULL : WAIT = 0.2\n"
    outstr += PortMode + " = " + str(TheMode) + " : NULL : WAIT = 0.2\n"
    outstr += "#switch in load line, set current\n"
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.5\n"
    outstr += Scope + " = 1 : NULL : WAIT = 0.5\n"
    outstr += Load1 + " = 1 : NULL : WAIT = 0.5\n"
    outstr += "OPERATIONAL\n"
    outstr += "\n"
    outstr += Direction + " = " + str(DirBits) + " : NULL : WAIT = 0.1\n"

    
    outstr += "\n"
    i = 4000
    while i <= 4000:
        outstr += PWMOutputName + " = " + str(i) + " : " + OutputStatus + " = " + str(FltBits) + " | 0.1 | 1\n"
        i += 1000
        
    #outstr += "NULL : " + OutputStatus + " = " + str(FltBits) + " | 0.1 | 0.1\n" 
    outstr += "#switch out load line, switch coil\n"
    outstr += PWMOutputName + " = 0 : NULL : WAIT = 1\n"
    outstr += OutputConnector + " = 0 : NULL : WAIT = 1\n"
    #outstr += "SAVE\n"
    # if t % 2 == 0:
        # outstr += Coil1 + " = 0, " + Scope + " = 1 : NULL : WAIT = 0.5\n"
    # else:
        # outstr += Coil2 + " = 0, " + Scope + " = 1 : NULL : WAIT = 0.5\n"
    t += 1
    #outstr += "SAVE\n"
#shut down test

outstr += "SAVE\n"
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



print(TestName + ".pat")