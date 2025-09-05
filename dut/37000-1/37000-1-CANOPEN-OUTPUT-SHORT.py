
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

#global setup
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

outstr = ""

outstr += "#37000-1\n"
outstr += "#Verion 0.0\n"
outstr += "#digital normal test using the E-LOAD\n"
outstr += "UUT_EDS = 37000-561.eds\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "PRE_OPERATIONAL\n"

outstr += "PAUSE-MANUALLY ACTIVATE SHORT ON E_LOAD\n"

outstr += "#-----setup PAT-----\n"
outstr += "#setup load\n"
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"


#verify faults clear
outstr += "NULL : sdo[0x5001][3] = 0 | 0.1 | 0.1\n"
outstr += "NULL : sdo[0x5001][4] = 0 | 0.1 | 0.1\n"


outstr += "OPERATIONAL\n"
    
FdbkBits = 0
FltBits = 0

#MaxLimit = 4500
#FaultLimit = 4400


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
        if(FaultReset):
            FdbkBits = 0b00000100
            FltBits = 0b00001000
        else:
            FdbkBits = 0b00000110
            FltBits = 0b00001010
        PortMode = "sdo[0x2001][1]"#Port1Mode
        OutputName = "sdo[0x6200][1]"#Output
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
        OutputName = "sdo[0x6200][1]"#Output
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
        if(FaultReset):
            FdbkBits = 0b00000100
            FltBits = 0b00001000
        else:
            FdbkBits = 0b00000110
            FltBits = 0b00001010
        PortMode = "sdo[0x2001][3]"#Port3Mode
        OutputName = "sdo[0x6200][1]"#Output
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
        OutputName = "sdo[0x6200][1]"#Output
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
        OutputName = "sdo[0x6200][1]"#Output
        OutputStatus = "sdo[0x5001][4]"#OutStat
        FeedbackName = "sdo[0x5003][8]"#Feedback4B
        OutputConnector = "J2_08"
        
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


#verify faults
outstr += "NULL : sdo[0x5001][3] = 170 | 0.1 | 0.1\n"
outstr += "NULL : sdo[0x5001][4] = 170 | 0.1 | 0.1\n"


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
