import os

script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")

TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

outstr = ""

outstr += "UUT_EDS = 37000-564.eds\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#setup load\n"
outstr += "LdRemote = 1 : NULL\n"
outstr += "LdEnable = 0 : NULL\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL\n"
outstr += "LdCurrentSet = 1 : NULL : WAIT = 1\n"
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)


print(TestName + ".pat")