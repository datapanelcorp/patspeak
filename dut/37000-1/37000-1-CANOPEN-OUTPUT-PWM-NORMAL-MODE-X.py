import os

FaultReset = 0

def WriteOutputTest(outstr, Frequancy, MaxOutput, OutputMode):
    t = 0
    Load1 = "J4_01"
    Scope = "J4_03"
    outstr += "#switch in 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)\n"
    outstr += Load1 + " = 1 : NULL : WAIT = 0.2\n"
    outstr += Scope + " = 1 : NULL : WAIT = 0.2\n"
    outstr += "METER_MODE = 1 : NULL : WAIT = 0.2\n"
    
    while t <= 7:
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
            OutputStatus = "sdo[0x5001][3]"#OutStat
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
        outstr += OutputName + " = " + str(Step1) + " : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 0.8 | 0.2 | 0.5\n"
        outstr += "NULL : " + FeedbackName + " = 800 | 200 | 0.5\n"
        outstr += OutputName + " = " + str(Step2) + " : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 1.6 | 0.2 | 0.5\n"
        outstr += "NULL : " + FeedbackName + " = 1600 | 200 | 0.5\n"
        outstr += OutputName + " = " + str(Step3) + " : NULL : WAIT = 0.2\n"
        outstr += "NULL : MeterAmps = 3.3 | 0.2 | 0.5\n"
        outstr += "NULL : " + FeedbackName + " = 3300 | 200 | 0.5\n"
        #verify feedback and w/ ammeter
        outstr += "#switch out load line, switch coil\n"
        outstr += OutputName + " = 0 : NULL : WAIT = 0.5\n"
        outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"
            
        t += 1
        
    return outstr

t = 0
i = 0
OutputMode = 0x22

#global setup

script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0].replace('X',  str(OutputMode))
datafile = TestName + ".pat"

outstr = ""
outstr += "#37000-1\n"
outstr += "#Verion 0.0\n"
outstr += "#PWM test with 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)\n"
outstr += "UUT_EDS = 37000-561.eds\n"
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



print(TestName + ".pat")