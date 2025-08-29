

PortIndex = 0
ModeIndex = 0

#global setup
TestName = "37000-1-CANOPEN-INPUT-FREQ"
datafile = TestName + ".pat"

outstr = ""
outstr += "#37000-1\n"
outstr += "#Verion 0.0\n"
outstr += "#input test\n"
outstr += "UUT_EDS = 37000-561.eds\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"

outstr += "\n"
outstr += "#-----setup pat-----\n"
outstr += "#setup freq\n"
outstr += "J0_11_FREQ_GEN = 1 : NULL : WAIT = 1\n"
outstr += "\n"

#PortAMode = "7"
#PortBMode = "0"

InPortAMode = 7
InPortBMode = 0
OutPortAMode = 0
OutPortBMode = 0

OutputMode = str(int(OutPortAMode | (OutPortBMode << 4)))
InputMode = str(int(InPortAMode | (InPortBMode << 4)))
    
Steps = 3

MaxFreq = 3000
ExpFreq = 0
FreqInc = 500

ExpDuty = 0
DutyInc = 15

ExpFreq = FreqInc
ExpDuty = DutyInc

while ExpFreq <= MaxFreq:
    outstr += "PAUSE- FREQ_GEN TO " + str(ExpFreq) + "Hz " + str(ExpDuty) + "% Duty\n"

    PortIndex = 0
    while PortIndex <= 1:

        if(PortIndex==0):
            OutputConnector = "J3_01"
            InputName = "Input_7A"
            Status = "Input_7A"
            FreqFeedback = "sdo[0x6401][9]"#"Hertz_Count_Input7A"
            DutyFeedback = "sdo[0x6401][10]"#"DutyCycle_SP_Input7A"
            
        if(PortIndex==1):
            OutputConnector = "J3_03"
            InputName = "Input_8A"
            Status = "Input_8A"
            FreqFeedback = "sdo[0x6401][11]"#"Hertz_Count_Input8A"
            DutyFeedback = "sdo[0x6401][12]"#"DutyCycle_SP_Input8A"
            
        outstr += "#-----setup 34044-----\n"
        outstr += "#disable global modes\n"
        outstr += "sdo[0x2000][3] = 0 : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2000][4] = 0 : NULL : WAIT = 0.1\n"
        #outstr += "#configure Port Modes\n"
        #outstr += "Command = 83, MODE5A = " + PortAMode + ", MODE5B = " + PortBMode + ", MODE6A = " + PortAMode + ", MODE6B = " + PortBMode + ", MODE7A = " + PortAMode + ", MODE7B = " + PortBMode + " : NULL : WAIT = 0.2\n"
        #outstr += "Command = 84, MODE8A = " + PortAMode + ", MODE8B = " + PortBMode + " : NULL : WAIT = 0.2\n"
        outstr += "#configure Port Modes\n"
        outstr += "sdo[0x2001][1] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][2] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][3] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][4] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][5] = " + str(InputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][6] = " + str(InputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][7] = " + str(InputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][8] = " + str(InputMode) + " : NULL : WAIT = 0.1\n"
        #outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2\n"
        #outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2\n"

        
        outstr += "#switch input to load line\n"
        outstr += OutputConnector + " = 1 : NULL : WAIT = 1\n"
        outstr += "NULL : " + FreqFeedback + " = " + str(ExpFreq) + " | 30 | 0.1\n" 
        outstr += "NULL : " + DutyFeedback + " = " + str(ExpDuty) + " | 1 | 0.1\n" 
        outstr += OutputConnector + " = 0 : NULL : WAIT = 1\n"
        outstr += "\n"
    
        PortIndex += 1
        
    ExpFreq += FreqInc
    ExpDuty += DutyInc
outstr += "#switch out load line\n"
outstr += OutputConnector + " = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_11_FREQ_GEN = 0 : NULL : WAIT = 1\n"

#outstr += "#switch out o-scope\n"
outstr += "J4_03 = 0 : NULL : WAIT = 0.2\n"
outstr += "SAVE\n"
outstr += "END\n"

f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)




