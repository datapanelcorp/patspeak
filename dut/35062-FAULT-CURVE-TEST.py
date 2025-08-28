
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


Step = 1000
t = 0

MaxOutputs = 3

outstr += ScopePoint + " = 1 : NULL : WAIT = 0.1\n"
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
        
    i = 0
    MaxRetrys = 2
    
    while i <= MaxRetrys + 1:
        outstr += "#switch in load line, set current\n"
        outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
        outstr += OutputConnector + " = 1 : NULL : WAIT = 0.1\n"
        outstr += "#turn on output and wait a moment\n" 
        outstr += OutputName + " = 1 : NULL : WAIT = 0.1\n"
        Max_Current = 5000
        outstr += "LdCurrentSet = " + str(Max_Current) + " : NULL\n"
        outstr += "LdEnable = 1 : NULL : WAIT = 0.2\n"
        outstr += "NULL : " + FeedbackName + " = " + str(Max_Current) + " | 1000 | 0\n" 
        outstr += "NULL : " + OutputStatus + " = 1 | 0 | 0\n" 
        Max_Current = 3000
        outstr += "LdCurrentSet = " + str(Max_Current) + " : NULL : WAIT = 0.5\n"
        outstr += "NULL : " + FeedbackName + " = " + str(Max_Current) + " | 1000 | 0\n" 
        outstr += "NULL : MeterCurrent = " + str(Max_Current*0.001) + " | 1 | 0\n" 
        outstr += "NULL : " + OutputStatus + " = 1 | 0 | 0\n" 
        Max_Current = 1000
        outstr += "LdCurrentSet = " + str(Max_Current) + " : NULL : WAIT = 0.7\n"
        outstr += "NULL : " + FeedbackName + " = " + str(Max_Current) + " | 1000 | 0\n" 
        outstr += "NULL : MeterCurrent = " + str(Max_Current*0.001) + " | 1 | 0\n" 
        outstr += "NULL : " + OutputStatus + " = 1 | 0 | 0\n" 
        Max_Current = 0
        if(i > MaxRetrys):
           Max_Current = 2000
        outstr += "LdCurrentSet = " + str(Max_Current) + " : NULL : WAIT = 0.5\n"
        outstr += "NULL : " + FeedbackName + " = " + str(Max_Current) + " | 1000 | 0\n" 
        outstr += "NULL : MeterCurrent = " + str(Max_Current*0.001) + " | 1 | 0\n" 
        outstr += "NULL : " + OutputStatus + " = 2 | 0 | 0\n" 
        outstr += "LdEnable = 0 : NULL : WAIT = 0.5\n"
        outstr += OutputName + " = 0 : NULL : WAIT = 0.5\n"
        i += 1
        
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