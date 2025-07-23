t = 0
i = 0

PortMode = 0

#global setup
TestName = "34044-1-CANOPEN-OUTPUT-NORMAL"
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



outstr += "#-----setup 34044-----\n"

FeedbackName = "sdo[0x5003][1]"
OutputName = "sdo[0x6200][1]"


outstr += "#turn ON output\n" 
outstr += OutputName + " = 1 : NULL : WAIT = 0.2\n"
outstr += "#read current\n" 
outstr += "NULL : " + FeedbackName + " = 1000 | 0 | 0.1\n"
outstr += "#turn OFF output\n" 
outstr += OutputName + " = 0 : NULL : WAIT = 0.1\n"

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
