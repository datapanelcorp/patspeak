

PortIndex = 0
ModeIndex = 0
PortMode = 0

#global setup
TestName = "34044-1-INPUT-FREQ"
datafile = TestName + ".pat"

outstr = ""
outstr += "#34044-1\n"
outstr += "#Verion 0.0\n"
outstr += "#input test\n"
outstr += "UUT_DBC = 34044-561.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 34044-----\n"
outstr += "Command = 93, PORT1_MODE = " + str(PortMode) + ", PORT2_MODE = " + str(PortMode) + ", PORT3_MODE = " + str(PortMode) + ", PORT4_MODE = " + str(PortMode) + " : NULL : WAIT = 0.2\n"
outstr += "#clear multiplex\n"
outstr += "Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL\n"

outstr += "\n"
outstr += "#-----setup pat-----\n"
outstr += "#setup freq\n"
outstr += "J0_11_FREQ_GEN = 1 : NULL : WAIT = 1\n"
outstr += "\n"

PortAMode = "7"
PortBMode = "0"

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
            FreqFeedback = "Hertz_Count_Input7A"
            DutyFeedback = "DutyCycle_SP_Input7A"
            
        if(PortIndex==1):
            OutputConnector = "J3_03"
            InputName = "Input_8A"
            Status = "Input_8A"
            FreqFeedback = "Hertz_Count_Input8A"
            DutyFeedback = "DutyCycle_SP_Input8A"
            
        outstr += "#-----setup 34044-----\n"
        outstr += "#disable global modes\n"
        outstr += "#configure Port Modes\n"
        outstr += "Command = 83, MODE5A = " + PortAMode + ", MODE5B = " + PortBMode + ", MODE6A = " + PortAMode + ", MODE6B = " + PortBMode + ", MODE7A = " + PortAMode + ", MODE7B = " + PortBMode + " : NULL : WAIT = 0.2\n"
        outstr += "#clear multiplex\n"
        outstr += "Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL\n"
        
        outstr += "Command = 84, MODE8A = " + PortAMode + ", MODE8B = " + PortBMode + " : NULL : WAIT = 0.2\n"
        outstr += "#clear multiplex\n"
        outstr += "Command = 0, MODE8A = 0, MODE8B = 0 : NULL\n"
        outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2\n"
        outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2\n"
        outstr += "#clear multiplex\n"
        outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"
        
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




