
import os

script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")

t = 0
i = 0

PortMode = 0
ScopePoint = "J1_12"

#global setup
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

outstr = ""
outstr += "#35062\n"
outstr += "#Verion 0.0\n"

outstr += "UUT_DBC = 35062-561.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup PAT-----\n"
outstr += "#setup load\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"


outstr += "TEST_MODE = 1 : NULL : WAIT = 1\n"

Max_Current = 5000
Step = 1000
t = 0

MaxOutputs = 3

AllOutputs = "J1_06"

while t <= MaxOutputs:
    if(t == 0):
        OutputName = "OUTPUT01"
        FeedbackName = "AMPS_FET1"
        OutputConnector = "J1_01"
        OutputStatus = "Out_Stat1"
    if(t == 1):
        OutputName = "OUTPUT02"
        FeedbackName = "AMPS_FET2"
        OutputConnector = "J1_02"
        OutputStatus = "Out_Stat2"
    if(t == 2):
        OutputName = "OUTPUT03"
        FeedbackName = "AMPS_FET3"
        OutputConnector = "J1_03"
        OutputStatus = "Out_Stat3"
    if(t == 3):
        OutputName = "OUTPUT04"
        FeedbackName = "AMPS_FET4"
        OutputConnector = "J1_04"
        OutputStatus = "Out_Stat4"

    outstr += "#switch in load line, set current\n"
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.1\n"

    outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"

    outstr += "#set high current value\n" 
    
    outstr += "#turn on output and wait a moment\n" 
    outstr += OutputName + " = 1 : NULL : WAIT = 0.1\n"
    outstr += ScopePoint + " = 1 : NULL : WAIT = 0.1\n"
    
    outstr += "LdCurrentSet = " + str(Max_Current) + " : NULL : WAIT = 0.1\n"
    outstr += "LdEnable = 1 : NULL : WAIT = 0.5\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.5\n"
    outstr += "LdEnable = 1 : NULL : WAIT = 0.5\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.5\n"
    outstr += OutputName + " = 0 : NULL : WAIT = 0.5\n"
    outstr += OutputName + " = 1 : NULL : WAIT = 0.5\n"
    outstr += "LdEnable = 1 : NULL : WAIT = 0.5\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.5\n"
    outstr += "LdEnable = 1 : NULL : WAIT = 0.5\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.5\n"
    outstr += OutputName + " = 0 : NULL : WAIT = 0.5\n"
    outstr += OutputName + " = 1 : NULL : WAIT = 0.5\n"
    outstr += "LdEnable = 1 : NULL : WAIT = 5\n"

    outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
    outstr += "#switch out load line, scope, clear current\n"
    outstr += OutputName + " = 0 : NULL : WAIT = 0.1\n"
    outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"
    outstr += ScopePoint + " = 0 : NULL : WAIT = 0.5\n"
    t += 1

#shut down test

outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 1\n"
outstr += "SAVE\n"
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



print(TestName + ".pat")