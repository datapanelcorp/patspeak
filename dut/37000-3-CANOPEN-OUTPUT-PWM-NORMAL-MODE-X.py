
import os

script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")

t = 0
i = 0

#configuration
FaultReset = 1
Skip10A = 1
StartCurrent = 0

MaxLimit = 4400
FaultLimit = 4300
Increment = 200


#global setup
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

def WriteOutputTest(outstr, Frequancy, MaxOutput, OutputMode):
    t = 0
    Load1 = "J4_01"
    Scope = "J4_03"
    outstr += "#switch in 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)\n"
    outstr += Load1 + " = 1 : NULL : WAIT = 0.2\n"
    outstr += Scope + " = 1 : NULL : WAIT = 0.2\n"
    
    while t <= 15:
        if(Skip10A):
            if(t == 0):#skip 1A
                t += 1
            if(t == 4):#skip 3A
                t += 1
        if(t == 0):
            OutputBits = 0b00000001
            FdbkBits = 0b00000001
            FltBits = 0b00000010
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
                

        outstr += "#switch in load line, set current\n"
        outstr += OutputConnector + " = 1 : NULL : WAIT = 0.5\n"

        outstr += "\n"
        
        Step1 = 250
        Step2 = 500
        Step3 = 1000
        
        if(OutputMode == 0x22):
            Step1 = 1000
            Step2 = 2000
            Step3 = 4000
            
        if(OutputMode == 0x33):
            Step1 = 250
            Step2 = 500
            Step3 = 1000
            
        #TODO test duty at 50% and 100%
        outstr += PWMOutputName + " = " + str(Step1) + " : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 0.8 | 0.2 | 0.5\n"
        outstr += "NULL : " + FeedbackName + " = 800 | 200 | 0.5\n"
        outstr += PWMOutputName + " = " + str(Step2) + " : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 1.6 | 0.2 | 0.5\n"
        outstr += "NULL : " + FeedbackName + " = 1600 | 200 | 0.5\n"
        outstr += PWMOutputName + " = " + str(Step3) + " : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 3.3 | 0.2 | 0.5\n"
        outstr += "NULL : " + FeedbackName + " = 3300 | 200 | 0.5\n"
        #verify feedback and w/ ammeter
        outstr += "#switch out load line, switch coil\n"
        outstr += PWMOutputName + " = 0 : NULL : WAIT = 0.5\n"
        outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"
            
        t += 1
        
    return outstr

t = 0
i = 0
OutputMode = 0x22

#global setup
TestName = "37000-1-CANOPEN-OUTPUT-PWM-NORMAL-MODE-" + str(OutputMode)
datafile = TestName + ".pat"

outstr = ""
outstr += "#37000-1\n"
outstr += "#Verion 0.0\n"
outstr += "#PWM test with 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)\n"
outstr += "UUT_EDS = 37000-563.eds\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"
        
outstr += "#-----setup 37000-----\n"
outstr += "#disable global modes\n"
outstr += "sdo[0x2000][3] = 0 : NULL : WAIT = 0.1\n"
outstr += "sdo[0x2000][4] = 0 : NULL : WAIT = 0.1\n"
        
outstr += "#configure Ports\n"
outstr += "sdo[0x2001][1] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
outstr += "sdo[0x2001][2] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
outstr += "sdo[0x2001][3] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
outstr += "sdo[0x2001][4] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
#node.sdo[0x3000].raw = 500


Frequancy = 1000#64
outstr += "PRE_OPERATIONAL\n"
outstr += "#test at 1000hz\n"
outstr += "sdo[0x3000] = " + str(Frequancy) + " : NULL : WAIT = 0.5\n"
outstr += "OPERATIONAL\n"
outstr = WriteOutputTest(outstr, Frequancy, 7, OutputMode)

Frequancy = 500
outstr += "PRE_OPERATIONAL\n"
outstr += "#test at 500hz\n"
outstr += "sdo[0x3000] = " + str(Frequancy) + " : NULL : WAIT = 0.5\n"
outstr += "OPERATIONAL\n"
outstr = WriteOutputTest(outstr, Frequancy, 7, OutputMode)

Frequancy = 64#1000
outstr += "PRE_OPERATIONAL\n"
outstr += "#test at 64hz\n"
outstr += "sdo[0x3000] = " + str(Frequancy) + " : NULL : WAIT = 0.5\n"
outstr += "OPERATIONAL\n"
outstr = WriteOutputTest(outstr, Frequancy, 7, OutputMode)

#shut down test
outstr += "SAVE\n"
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



