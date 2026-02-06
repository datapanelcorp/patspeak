import os

PortIndex = 0
ModeIndex = 0
PortMode = "7"

#global setup
script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"


outstr = ""
outstr += "#43019-1\n"
outstr += "#Verion 0.0\n"
outstr += "UUT_DBC = 43019-560.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "Command = 82, MODE1 = 0, MODE2 = 0, ADRaw = 0 : NULL : WAIT = 0.5\n"
outstr += "Command = 83, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = " + PortMode + ", MODE3B = 0, MODE4A = " + PortMode + ", MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0 : NULL\n"

outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
outstr += "#clear multiplex\n"
outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"

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

#outstr += "PAUSE- GEN IS ENABLED\n"
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
            OutputConnector = "J1_05"
            InputName = "Input_3A"
            Status = "Input_3A"
            FreqFeedback = "Hertz_Count_Input3A"
            
        if(PortIndex==1):
            OutputConnector = "J1_07"
            InputName = "Input_4A"
            Status = "Input_4A"
            FreqFeedback = "Hertz_Count_Input4A"

        outstr += "#switch input to load line\n"
        outstr += OutputConnector + " = 1 : NULL : WAIT = 0.5\n"
        outstr += "NULL : " + FreqFeedback + " = " + str(ExpFreq) + " | 30 | 0.1\n" 
        outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"
        outstr += "\n"
    
        PortIndex += 1
        
    #outstr += "PAUSE- GEN IS SWITCHED AND ENABLED\n" 
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



