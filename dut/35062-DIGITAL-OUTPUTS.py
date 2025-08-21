t = 0
i = 0

PortMode = 0

#global setup
TestName = "35062-DIGITAL-OUTPUT"
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
outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"

outstr += "TEST_MODE = 1 : NULL : WAIT = 1\n"

Max_Current = 10000#10000
Step = 100
t = 0

while t <= 3:
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
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.5\n"

    outstr += "\n"
    i = 0
    while i <= Max_Current:
        outstr += "#set current and turn on output and verify feedback\n" 
        outstr += "LdCurrentSet = " + str(i) + ", Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.1\n"
        outstr += "#verify reading from load\n" 
        outstr += "NULL : " + FeedbackName + " = " + str(i/1000) + " | 1.0 | 0.1\n" 
        outstr += "NULL : " + OutputStatus + " = 1 | 0.01 | 0.1\n" 
        outstr += "NULL : MeterCurrent = " + str(i*0.001) + " | 0.01 | 0.1\n" 
        outstr += "\n"
        i += Step

    
    outstr += "#switch out load line, clear current\n"
    outstr += OutputName + " = 0 : NULL : WAIT = 0.1\n"
    outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"
    outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
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



