import os

script_name = os.path.basename(__file__)

#global setup
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

t = 0
i = 0
Frequancy = 200
Kp = 0.3
Ki = 0.2
Skip10A = 1
#PortMode = 0

FaultReset = 0

Coil1 = "J4_01"
Coil2 = "J4_02"
Scope = "J4_03"

Kp = Kp * 100
Ki = Ki * 100

#global setup
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

outstr = ""
outstr += "#37000-1\n"
outstr += "#Verion 0.0\n"
outstr += "#PWMi h-bridge test with a 'red coil' 6.4 ohm inductive load. (2.27 amps @ 14.5 VDC)\n"
outstr += "UUT_EDS = 37000-563.eds\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "PRE_OPERATIONAL\n"

outstr += "#-----configure PWMi-----\n"
outstr += "sdo[0x2002][1] = " + f"{Kp}" + ", sdo[0x2002][2] = " + f"{Ki}" + ", sdo[0x2002][3] = " + f"{Kp}" + ", sdo[0x2002][4] = " + f"{Ki}" + ", sdo[0x2002][5] = " + f"{Kp}" + ", sdo[0x2002][6] = " + f"{Ki}" + " : NULL : WAIT = 0.1\n"
outstr += "sdo[0x2002][7] = " + f"{Kp}" + ", sdo[0x2002][8] = " + f"{Ki}" + ", sdo[0x2002][9] = " + f"{Kp}" + ", sdo[0x2002][10] = " + f"{Ki}" + ", sdo[0x2002][11] = " + f"{Kp}" + ", sdo[0x2002][12] = " + f"{Ki}" + " : NULL : WAIT = 0.1\n"
outstr += "sdo[0x2002][13] = " + f"{Kp}" + ", sdo[0x2002][14] = " + f"{Ki}" + ", sdo[0x2002][15] = " + f"{Kp}" + ", sdo[0x2002][16] = " + f"{Ki}" + " : NULL\n"

outstr += "sdo[0x2002][17] = " + f"{Kp}" + ", sdo[0x2002][18] = " + f"{Ki}" + ", sdo[0x2002][19] = " + f"{Kp}" + ", sdo[0x2002][20] = " + f"{Ki}" + ", sdo[0x2002][21] = " + f"{Kp}" + ", sdo[0x2002][22] = " + f"{Ki}" + " : NULL : WAIT = 0.1\n"
outstr += "sdo[0x2002][23] = " + f"{Kp}" + ", sdo[0x2002][24] = " + f"{Ki}" + ", sdo[0x2002][25] = " + f"{Kp}" + ", sdo[0x2002][26] = " + f"{Ki}" + ", sdo[0x2002][27] = " + f"{Kp}" + ", sdo[0x2002][28] = " + f"{Ki}" + " : NULL : WAIT = 0.1\n"
outstr += "sdo[0x2002][29] = " + f"{Kp}" + ", sdo[0x2002][30] = " + f"{Ki}" + ", sdo[0x2002][31] = " + f"{Kp}" + ", sdo[0x2002][32] = " + f"{Ki}" + " : NULL\n"

outstr += "#-----set freq-----\n"
outstr += "sdo[0x3000] = " + str(Frequancy) + " : NULL : WAIT = 0.2\n"

t = 0
while t <= 15:
    
    if(Skip10A):
        if(t == 0):#skip 1A
            t += 1
        if(t == 4):#skip 3A
            t += 1
        
    if t % 2 == 0:
        outstr += Coil1 + " = 1, " + Scope + " = 1 : NULL : WAIT = 1\n"
    else:
        outstr += Coil2 + " = 1, " + Scope + " = 1 : NULL : WAIT = 1\n"
    if(t == 0):
        PortMode = "sdo[0x2001][1]"#Port1Mode
        OutputName = "sdo[0x6411][1]"#Output1A
        FeedbackName = "sdo[0x5003][1]"#Feedback1A
        OutputConnector = "J2_01"
    if(t == 1):
        PortMode = "sdo[0x2001][1]"#Port1Mode
        OutputName = "sdo[0x6411][2]"#Output1B
        FeedbackName = "sdo[0x5003][2]"#Feedback1B
        OutputConnector = "J2_02"
    if(t == 2):
        PortMode = "sdo[0x2001][2]"#Port2Mode
        OutputName = "sdo[0x6411][3]"#Output2A
        FeedbackName = "sdo[0x5003][3]"#Feedback2A
        OutputConnector = "J2_03"
    if(t == 3):
        PortMode = "sdo[0x2001][2]"#Port2Mode
        OutputName = "sdo[0x6411][4]"#Output2B
        FeedbackName = "sdo[0x5003][4]"#Feedback2B
        OutputConnector = "J2_04"
    if(t == 4):
        PortMode = "sdo[0x2001][3]"#Port3Mode
        OutputName = "sdo[0x6411][5]"#Output3A
        FeedbackName = "sdo[0x5003][5]"#Feedback3A
        OutputConnector = "J2_05"
    if(t == 5):
        PortMode = "sdo[0x2001][3]"#Port3Mode
        OutputName = "sdo[0x6411][6]"#Output3B
        FeedbackName = "sdo[0x5003][6]"#Feedback3B
        OutputConnector = "J2_06"
    if(t == 6):
        PortMode = "sdo[0x2001][4]"#Port4Mode
        OutputName = "sdo[0x6411][7]"#Output4A
        FeedbackName = "sdo[0x5003][7]"#Feedback4A
        OutputConnector = "J2_07"
    if(t == 7):
        PortMode = "sdo[0x2001][4]"#Port4Mode
        OutputName = "sdo[0x6411][8]"#Output4B
        FeedbackName = "sdo[0x5003][8]"#Feedback4B
        OutputConnector = "J2_08"
    if(t == 8):
        PortMode = "sdo[0x2001][5]"#Port5Mode
        OutputName = "sdo[0x6411][9]"#Output5A
        FeedbackName = "sdo[0x5003][9]"#Feedback5A
        OutputConnector = "J2_09"
    if(t == 9):
        PortMode = "sdo[0x2001][5]"#Port5Mode
        OutputName = "sdo[0x6411][10]"#Output5B
        FeedbackName = "sdo[0x5003][10]"#Feedback5B
        OutputConnector = "J2_10"
    if(t == 10):
        PortMode = "sdo[0x2001][6]"#Port6Mode
        OutputName = "sdo[0x6411][11]"#Output6A
        FeedbackName = "sdo[0x5003][11]"#Feedback6A
        OutputConnector = "J2_11"
    if(t == 11):
        PortMode = "sdo[0x2001][6]"#Port6Mode
        OutputName = "sdo[0x6411][12]"#Output6B
        FeedbackName = "sdo[0x5003][12]"#Feedback6B
        OutputConnector = "J2_12"
    if(t == 12):
        PortMode = "sdo[0x2001][7]"#Port7Mode
        OutputName = "sdo[0x6411][13]"#Output7A
        FeedbackName = "sdo[0x5003][13]"#Feedback7A
        OutputConnector = "J3_01"
    if(t == 13):
        PortMode = "sdo[0x2001][7]"#Port7Mode
        OutputName = "sdo[0x6411][14]"#Output7B
        FeedbackName = "sdo[0x5003][14]"#Feedback7B
        OutputConnector = "J3_02"
    if(t == 14):
        PortMode = "sdo[0x2001][8]"#Port8Mode
        OutputName = "sdo[0x6411][15]"#Output8A
        FeedbackName = "sdo[0x5003][15]"#Feedback8A
        OutputConnector = "J3_03"
    if(t == 15):
        PortMode = "sdo[0x2001][8]"#Port8Mode
        OutputName = "sdo[0x6411][16]"#Output8B
        FeedbackName = "sdo[0x5003][16]"#Feedback8B
        OutputConnector = "J3_04"

    
    TheGlobalOutputMode = "sdo[0x2000][3]"
    TheGlobalInputMode = "sdo[0x2000][4]"
    
    TheMode = 0x44 #PWMI Mode

    outstr += "#-----setup 37000-----\n"
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
        outstr += OutputName + " = " + str(i) + " : " + FeedbackName + " = " + str(i/100) + " | 1.55 | 0.5\n"
        i += 100
            
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



