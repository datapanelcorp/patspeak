import os

script_name = os.path.basename(__file__)


#global setup
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

outstr = ""
outstr += "UUT_DBC = 39009-561.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"

outstr += "LdRemote = 1 : NULL : WAIT = 0.2\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.2\n"
outstr += "LdShort = 0 : NULL : WAIT = 0.2\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 0.5\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 0.5\n"

outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)

print(TestName + ".pat")