import os

PortIndex = 0
ModeIndex = 0
PortAMode = "7"
PortBMode = "0"

#global setup
script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"


outstr = ""
outstr += "#39009-1\n"
outstr += "#Verion 0.0\n"
outstr += "#input test\n"
outstr += "UUT_DBC = 39009-561.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5\n"
outstr += "Command = 83, MODE1A = " + PortAMode + ", MODE1B = " + PortAMode + ", MODE2A = 1, MODE2B = 1, MODE3A = " + PortAMode + ", MODE3B = " + PortAMode + ", MODE4A = 1, MODE4B = 1, MODE5A = 1, MODE5B = 1, MODE6A = 1, MODE6B = 1, MODE7A = 1, MODE7B = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL\n"
outstr += "Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 1, MODE9B = 1, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL\n"

outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
outstr += "#clear multiplex\n"
outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"

outstr += "\n"
outstr += "#-----setup pat-----\n"
outstr += "#setup freq\n"
outstr += "AfgEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "AfgShape = 1 : NULL : WAIT = 0.1\n"
outstr += "AfgFreqSet = 500 : NULL : WAIT = 0.1\n"
outstr += "AfgDutySet = 50 : NULL : WAIT = 0.1\n"
outstr += "AfgAmplSet = 4000 : NULL : WAIT = 0.1\n"
outstr += "AfgOffsetSet = 4000 : NULL : WAIT = 0.1\n"
outstr += "AfgEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "J0_11_FREQ_GEN = 1 : NULL : WAIT = 0.1\n"
outstr += "\n"


#switch in scope
outstr += "J4_03 = 1 : NULL : WAIT = 0.2\n"

Steps = 3

MaxFreq = 3000
ExpFreq = 0
FreqInc = 100


ExpFreq = FreqInc

while ExpFreq <= MaxFreq:
    outstr += "AfgFreqSet = " + str(ExpFreq) + " : NULL : WAIT = 0.1\n"
    PortIndex = 0
    while PortIndex <= 1:

        if(PortIndex==0):
            OutputConnector = "J2_01"
            InputName = "Input_1A"
            Status = "Input_1A"
            FreqFeedback = "Hertz_Count_Input1A"
            
        if(PortIndex==1):
            OutputConnector = "J2_02"
            InputName = "Input_1B"
            Status = "Input_1B"
            FreqFeedback = "Hertz_Count_Input1B"

        outstr += "#switch input to load line\n"
        outstr += OutputConnector + " = 1 : NULL : WAIT = 0.5\n"
        outstr += "NULL : " + FreqFeedback + " = " + str(ExpFreq) + " | 30 | 0.1\n" 
        outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"
        outstr += "\n"
    
        PortIndex += 1
        
    ExpFreq += FreqInc

outstr += "AfgEnable = 0 : NULL : WAIT = 0.1\n"
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


print(TestName + ".pat")



