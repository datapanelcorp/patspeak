t = 0
i = 0

PortMode = 0

#global setup
TestName = "34044-1-CANOPEN-TESTER"
datafile = TestName + ".pat"

outstr = ""

outstr += "#34044-1\n"
outstr += "#Verion 0.0\n"
outstr += "#digital normal test using the E-LOAD\n"
outstr += "UUT_EDS = 37000-561.eds\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup PAT-----\n"
outstr += "#setup load\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"


Cmd81 = "sdo[0x2000][1]"#Cmd81
FeedbackName = "sdo[0x5003][1]"#Feedback1A
OutputName = "sdo[0x6200][1]"#Output1A
PortMode = "sdo[0x2001][1]"#Port1
OutputStatus = "sdo[0x5001][1]"#OutStat1A

OutputConnector = "J2_01"

TheMode = 0x11

outstr += "#-----setup 34044-----\n"
outstr += Cmd81 + " = 0 : NULL : WAIT = 0.2\n"
outstr += PortMode + " = 0x11 : NULL : WAIT = 0.2\n"

outstr += "#switch in load line, set current\n"
outstr += OutputConnector + " = 1 : NULL : WAIT = 0.5\n"

# outstr += "#turn ON output\n" 
# outstr += OutputName + " = 1 : NULL : WAIT = 0.2\n"
# outstr += "#read current\n" 
# outstr += "NULL : " + FeedbackName + " = 1000 | 0 | 0.1\n"
# outstr += "#turn OFF output\n" 
# outstr += OutputName + " = 0 : NULL : WAIT = 0.1\n"

outstr += "\n"
i = 0
while i <= 4500:
    outstr += "#set current and turn on output and verify feedback\n" 
    outstr += OutputName + " = 1 : NULL : WAIT = 0.1\n"
    outstr += "LdCurrentSet = " + str(i) + ": NULL : WAIT = 0.1\n"
    if(i <= 4400):
        outstr += "#verify reading from load\n" 
        outstr += "NULL : " + FeedbackName + " = " + str(i) + " | 1000 | 0.1\n" 
        #outstr += "NULL : " + OutputStatus + " = 1 | 0.01 | 0.1\n" 
        #outstr += "NULL : MeterCurrent = " + str(i*0.001) + " | 0.1 | 0.1\n" 
        outstr += "\n"
    else:
        outstr += "#verify fault #1\n" 
        outstr += "NULL : " + FeedbackName + " = 0 | 0.1 | 0.1\n" 
        #outstr += "NULL : " + OutputStatus + " = 2 | 0.1 | 0.1\n" 
        #outstr += "NULL : MeterCurrent = 0  | 0.01 | 0.1\n" 
        outstr += "\n"
    i += 100

outstr += "#switch out load line, clear current\n"
outstr += OutputName + " = 0 : NULL : WAIT = 0.1\n"
outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "NULL : " + OutputStatus + " = 0 | 0.1 | 0.1\n" 

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
