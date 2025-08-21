
import os

script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")


t = 0
i = 0

PortMode = 0
ScopePoint = "J1_12"

#global setup
TestName = "35062-FAULT-CURVE-MULTI-ALL"
datafile = TestName + ".pat"

outstr = ""
outstr += "#35062\n"
outstr += "#Verion 0.0\n"

outstr += "UUT_DBC = 35062-561.dbc\n"
outstr += "UUT_DATANAME = " + script_name + "\n"
outstr += "\n"

outstr += "#-----setup PAT-----\n"
outstr += "#setup load\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"


cycles = 50
c = 0
while c <= cycles:
    outstr += "TEST_MODE = 1 : NULL : WAIT = 1\n"
    t = 0

    outstr += "#cycle IGN to clean slate\n"
    outstr += "RLY_K1 = 1 : NULL : WAIT = 1\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"

    outstr += "#switch in load line, set current\n"

    outstr += ScopePoint + " = 1 : NULL : WAIT = 0.1\n"
    outstr += "J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1 : NULL : WAIT = 0.1\n"

    outstr += "#set high current value\n" 
    outstr += "LdCurrentSet = 3250 : NULL : WAIT = 0.1\n"

    outstr += "OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 = 0, OUTPUT04 = 0 : NULL : WAIT = 0.5\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.5\n"

    max = 40
    while t <= max:
        outstr += "OUTPUT01 = 1, OUTPUT02 = 1, OUTPUT03 = 1, OUTPUT04 = 1 : NULL : WAIT = 0.2\n"
        outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
        outstr += "LdEnable = 0 : NULL\n"
        outstr += "OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 =  0, OUTPUT04 = 0 : NULL : WAIT = 0.2\n"
        t += 1
    c += 1

#shut down test
outstr += "J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 = 0, OUTPUT04 = 0 : NULL : WAIT = 0.5\n"
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
