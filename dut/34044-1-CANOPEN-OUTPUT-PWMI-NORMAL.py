t = 0
i = 0
Frequancy = 100
Kp = 0.2
Ki = 0.1

#PortMode = 0

FaultReset = 1

Coil1 = "J4_01"
Coil2 = "J4_02"
Scope = "J4_03"

Kp = Kp * 100
Ki = Ki * 100

#global setup
TestName = "34044-1-CANOPEN-OUTPUT-PWMI-NORMAL"
datafile = TestName + ".pat"

outstr = ""
outstr += "#34044-1\n"
outstr += "#Verion 0.0\n"
outstr += "#PWMi h-bridge test with a 'red coil' 6.4 ohm inductive load. (2.27 amps @ 14.5 VDC)\n"
outstr += "UUT_EDS = 37000-561.eds\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "PRE_OPERATIONAL\n"

outstr += "#-----configure PWMi-----\n"
outstr += "sdo[0x2002][1] = " + f"{Kp}" + ", sdo[0x2002][2] = " + f"{Ki}" + ", sdo[0x2002][3] = " + f"{Kp}" + ", sdo[0x2002][4] = " + f"{Ki}" + ", sdo[0x2002][5] = " + f"{Kp}" + ", sdo[0x2002][6] = " + f"{Ki}" + " : NULL : WAIT = 0.5\n"
outstr += "sdo[0x2002][7] = " + f"{Kp}" + ", sdo[0x2002][8] = " + f"{Ki}" + ", sdo[0x2002][9] = " + f"{Kp}" + ", sdo[0x2002][10] = " + f"{Ki}" + ", sdo[0x2002][11] = " + f"{Kp}" + ", sdo[0x2002][12] = " + f"{Ki}" + " : NULL : WAIT = 0.5\n"
outstr += "sdo[0x2002][13] = " + f"{Kp}" + ", sdo[0x2002][14] = " + f"{Ki}" + ", sdo[0x2002][15] = " + f"{Kp}" + ", sdo[0x2002][16] = " + f"{Ki}" + " : NULL : WAIT = 0.5\n"

outstr += "#-----set freq-----\n"
outstr += "sdo[0x3000][0] = " + str(Frequancy) + " : NULL : WAIT = 0.2\n"

t = 0
while t <= 7:
    if t % 2 == 0:
        outstr += Coil1 + " = 1, " + Scope + " = 1 : NULL : WAIT = 1\n"
    else:
        outstr += Coil2 + " = 1, " + Scope + " = 1 : NULL : WAIT = 1\n"
    if(t == 0):
        OutputBits = 0b00000001
        FdbkBits = 0b00000001
        FltBits = 0b00000010
        PortMode = "sdo[0x2001][1]"#Port1Mode
        OutputName = "sdo[0x6411][1]"#Output
        OutputStatus = "sdo[0x5001][3]"#OutStat
        FeedbackName = "sdo[0x5003][1]"#Feedback1A
        OutputConnector = "J2_01"
    if(t == 1):
        OutputBits = 0b00000010
        if(FaultReset):
            FdbkBits = 0b00000100
            FltBits = 0b00001000
        else:
            FdbkBits = 0b00000110
            FltBits = 0b00001010
        PortMode = "sdo[0x2001][1]"#Port1Mode
        OutputName = "sdo[0x6411][2]"#Output
        FeedbackName = "sdo[0x5003][2]"#Feedback1B
        OutputConnector = "J2_02"
    if(t == 2):
        OutputBits = 0b00000100
        if(FaultReset):
            FdbkBits = 0b00010000
            FltBits = 0b00100000
        else:
            FdbkBits = 0b00011010
            FltBits = 0b00101010
        PortMode = "sdo[0x2001][2]"#Port2Mode
        OutputName = "sdo[0x6411][3]"#Output
        OutputStatus = "sdo[0x5001][3]"#OutStat
        FeedbackName = "sdo[0x5003][3]"#Feedback2A
        OutputConnector = "J2_03"
    if(t == 3):
        OutputBits = 0b00001000
        if(FaultReset):
            FdbkBits = 0b01000000
            FltBits = 0b10000000
        else:
            FdbkBits = 0b01101010
            FltBits = 0b10101010
        PortMode = "sdo[0x2001][2]"#Port2Mode
        OutputName = "sdo[0x6411][4]"#Output
        OutputStatus = "sdo[0x5001][3]"#OutStat
        FeedbackName = "sdo[0x5003][4]"#Feedback2B
        OutputConnector = "J2_04"
    if(t == 4):
        OutputBits = 0b00010000
        FdbkBits = 0b00000001
        FltBits = 0b00000010
        PortMode = "sdo[0x2001][3]"#Port3Mode
        OutputName = "sdo[0x6411][5]"#Output
        OutputStatus = "sdo[0x5001][4]"#OutStat
        FeedbackName = "sdo[0x5003][5]"#Feedback3A
        OutputConnector = "J2_05"
    if(t == 5):
        OutputBits = 0b00100000
        if(FaultReset):
            FdbkBits = 0b00000100
            FltBits = 0b00001000
        else:
            FdbkBits = 0b00000110
            FltBits = 0b00001010
        PortMode = "sdo[0x2001][3]"#Port3Mode
        OutputName = "sdo[0x6411][6]"#Output
        OutputStatus = "sdo[0x5001][4]"#OutStat
        FeedbackName = "sdo[0x5003][6]"#Feedback3B
        OutputConnector = "J2_06"
    if(t == 6):
        OutputBits = 0b01000000
        if(FaultReset):
            FdbkBits = 0b00010000
            FltBits = 0b00100000
        else:
            FdbkBits = 0b00011010
            FltBits = 0b00101010
        PortMode = "sdo[0x2001][4]"#Port4Mode
        OutputName = "sdo[0x6411][7]"#Output
        OutputStatus = "sdo[0x5001][4]"#OutStat
        FeedbackName = "sdo[0x5003][7]"#Feedback4A
        OutputConnector = "J2_07"
    if(t == 7):
        OutputBits = 0b10000000
        if(FaultReset):
            FdbkBits = 0b01000000
            FltBits = 0b10000000
        else:
            FdbkBits = 0b01101010
            FltBits = 0b10101010
        PortMode = "sdo[0x2001][4]"#Port4Mode
        OutputName = "sdo[0x6411][8]"#Output
        OutputStatus = "sdo[0x5001][4]"#OutStat
        FeedbackName = "sdo[0x5003][8]"#Feedback4B
        OutputConnector = "J2_08"
        
    Cmd0x52 = "sdo[0x2000][1]"
    
    TheGlobalOutputMode = "sdo[0x2000][3]"
    TheGlobalInputMode = "sdo[0x2000][4]"
    
    TheMode = 0x44 #PWMI Mode

    outstr += "#-----setup 34044-----\n"
    outstr += Cmd0x52 + " = " + str(FaultReset) + " : NULL : WAIT = 0.2\n"
    outstr += TheGlobalOutputMode + " = " + str(0) + " : NULL : WAIT = 0.2\n"
    outstr += TheGlobalInputMode + " = " + str(0) + " : NULL : WAIT = 0.2\n"
    outstr += PortMode + " = " + str(TheMode) + " : NULL : WAIT = 0.2\n"
    outstr += "#switch in load line, set current\n"
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.5\n"
    outstr += "OPERATIONAL\n"
    outstr += "\n"
    i = 0
    while i <= 1500:
        outstr += OutputName + " = " + str(i) + " : MeterAmps = " + str(i/1000) + " | 0.155 | 0.5\n"
        outstr += OutputName + " = " + str(i) + " : " + FeedbackName + " = " + str(i) + " | 155 | 0.5\n"
        i += 10
            
    outstr += "#switch out load line, switch coil\n"
    outstr += OutputName + " = 0 : NULL : WAIT = 1\n"
    outstr += OutputConnector + " = 0 : NULL : WAIT = 1\n"
    outstr += "#read signal value to update\n"
    outstr += "NULL : " + FeedbackName + " = 0 | 155 | 0.5\n"
    if t % 2 == 0:
        outstr += Coil1 + " = 0, " + Scope + " = 1 : NULL : WAIT = 0.5\n"
    else:
        outstr += Coil2 + " = 0, " + Scope + " = 1 : NULL : WAIT = 0.5\n"
    t += 1
    
outstr += "PRE_OPERATIONAL\n"
#shut down test
outstr += "SAVE\n"
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



