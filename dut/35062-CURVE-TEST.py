
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

# outstr += "DM_MEM_W(252'129'9) = 200 : DM_MEM_R(252'129'9) = 200 | 0 | 0\n"
# outstr += "DM_MEM_W(252'129'10) = 4000 : DM_MEM_R(252'129'10) = 4000 | 0 | 0\n"
# outstr += "DM_MEM_W(252'129'11) = 3500 : DM_MEM_R(252'129'11) = 3500 | 0 | 0\n"
# outstr += "DM_MEM_W(252'129'12) = 3000 : DM_MEM_R(252'129'12) = 3000 | 0 | 0\n"
# outstr += "DM_MEM_W(252'129'13) = 2500 : DM_MEM_R(252'129'13) = 2500 | 0 | 0\n"
# outstr += "DM_MEM_W(252'129'14) = 2000 : DM_MEM_R(252'129'14) = 2000 | 0 | 0\n"
# outstr += "DM_MEM_W(252'129'15) = 1500 : DM_MEM_R(252'129'15) = 1500 | 0 | 0\n"
# outstr += "DM_MEM_W(252'129'16) = 1000 : DM_MEM_R(252'129'16) = 1000 | 0 | 0\n"
# outstr += "DM_MEM_W(252'129'17) = 500 : DM_MEM_R(252'129'17) = 500  | 0 | 0\n"
# outstr += "DM_MEM_W(252'129'18) = 250 : DM_MEM_R(252'129'18) = 250  | 0 | 0\n"
# outstr += "DM_MEM_W(252'129'19) = 50 : DM_MEM_R(252'129'19) = 50  | 0 | 0\n"


outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"

# outstr += "TEST_MODE = 1 : NULL : WAIT = 1\n"
# outstr += "#ignore first read after power cycle\n"
# outstr += "NULL : DM_MEM_R(252'129'9) = -1 | 0 | 0\n" 
# outstr += "NULL : DM_MEM_R(252'129'9) = 200 | 0 | 0\n" 
# outstr += "NULL : DM_MEM_R(252'129'10) = 4000 | 0 | 0\n" 
# outstr += "NULL : DM_MEM_R(252'129'11) = 3500 | 0 | 0\n" 
# outstr += "NULL : DM_MEM_R(252'129'12) = 3000 | 0 | 0\n" 
# outstr += "NULL : DM_MEM_R(252'129'13) = 2500 | 0 | 0\n" 
# outstr += "NULL : DM_MEM_R(252'129'14) = 2000 | 0 | 0\n" 
# outstr += "NULL : DM_MEM_R(252'129'15) = 1500 | 0 | 0\n" 
# outstr += "NULL : DM_MEM_R(252'129'16) = 1000 | 0 | 0\n" 
# outstr += "NULL : DM_MEM_R(252'129'17) = 500  | 0 | 0\n" 
# outstr += "NULL : DM_MEM_R(252'129'18) = 250  | 0 | 0\n" 
# outstr += "NULL : DM_MEM_R(252'129'19) = 50  | 0 | 0\n" 


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
    outstr += "#all test times are set to zero to allow fast maniplation of the e-load\n"
    outstr += "TEST_MODE = 1 : NULL : WAIT = 1\n"
    while i <= MaxRetrys + 1:
        outstr += "#switch in load line, set current\n"
        outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
        outstr += OutputConnector + " = 1 : NULL : WAIT = 0.1\n"
        outstr += "#turn on output and wait a moment\n" 
        outstr += OutputName + " = 1 : NULL : WAIT = 0.1\n"
        Max_Current = 5000
        outstr += "LdCurrentSet = " + str(Max_Current) + " : NULL\n"
        outstr += "LdEnable = 1 : NULL : WAIT = 0.2\n"
        outstr += "NULL : " + FeedbackName + " = " + str(Max_Current) + " | 0 | 0\n"
        outstr += "NULL : " + OutputStatus + " = 1 | 0 | 0\n"
        Max_Current = 3000
        outstr += "LdCurrentSet = " + str(Max_Current) + " : NULL : WAIT = 0.5\n"
        outstr += "NULL : " + FeedbackName + " = " + str(Max_Current) + " | 0 | 0\n" 
        outstr += "NULL : MeterCurrent = " + str(Max_Current*0.001) + " | 1 | 0\n" 
        outstr += "NULL : " + OutputStatus + " = 1 | 0 | 0\n"
        Max_Current = 1000
        outstr += "LdCurrentSet = " + str(Max_Current) + " : NULL : WAIT = 0.7\n"
        outstr += "NULL : " + FeedbackName + " = " + str(Max_Current) + " | 0 | 0\n" 
        outstr += "NULL : MeterCurrent = " + str(Max_Current*0.001) + " | 1 | 0\n" 
        outstr += "NULL : " + OutputStatus + " = 1 | 0 | 0\n"
        Max_Current = 0
        if(i > MaxRetrys):
            Max_Current = 2000
            outstr += "LdCurrentSet = " + str(Max_Current) + " : NULL : WAIT = 0.5\n"
            outstr += "NULL : " + FeedbackName + " = " + str(Max_Current) + " | 0 | 0\n" 
            outstr += "NULL : MeterCurrent = " + str(Max_Current*0.001) + " | 0 | 0\n" 
            outstr += "NULL : " + OutputStatus + " = 2 | 0 | 0.001\n" 
        else:
            outstr += "NULL : " + FeedbackName + " = " + str(Max_Current) + " | 0 | 0\n" 
            outstr += "NULL : MeterCurrent = " + str(Max_Current*0.001) + " | 0 | 0\n" 
            outstr += "NULL : " + OutputStatus + " = 1 | 0 | 0.001\n" 
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
outstr += "J1_01 = 1, J1_02 = 1, J1_03 = 1, J1_04 = 1 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "OUTPUT01 = 0, OUTPUT02 = 0, OUTPUT03 = 0, OUTPUT04 = 0 : NULL : WAIT = 0.5\n"
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 1\n"

#****************************************************************************
outstr += "#-----setup PAT-----\n"
outstr += "#setup load\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"

outstr += "DM_MEM_W(252'129'9) = 200 : DM_MEM_R(252'129'9) = 200 | 0 | 0\n"
outstr += "DM_MEM_W(252'129'10) = 700 : DM_MEM_R(252'129'10) = 700 | 0 | 0\n"
outstr += "DM_MEM_W(252'129'11) = 650 : DM_MEM_R(252'129'11) = 650 | 0 | 0\n"
outstr += "DM_MEM_W(252'129'12) = 600 : DM_MEM_R(252'129'12) = 600 | 0 | 0\n"
outstr += "DM_MEM_W(252'129'13) = 550 : DM_MEM_R(252'129'13) = 550 | 0 | 0\n"
outstr += "DM_MEM_W(252'129'14) = 500 : DM_MEM_R(252'129'14) = 500 | 0 | 0\n"
outstr += "DM_MEM_W(252'129'15) = 450 : DM_MEM_R(252'129'15) = 450 | 0 | 0\n"
outstr += "DM_MEM_W(252'129'16) = 400 : DM_MEM_R(252'129'16) = 400 | 0 | 0\n"
outstr += "DM_MEM_W(252'129'17) = 350 : DM_MEM_R(252'129'17) = 350  | 0 | 0\n"
outstr += "DM_MEM_W(252'129'18) = 300 : DM_MEM_R(252'129'18) = 300  | 0 | 0\n"
outstr += "DM_MEM_W(252'129'19) = 250 : DM_MEM_R(252'129'19) = 250  | 0 | 0\n"

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"

outstr += "TEST_MODE = 1 : NULL : WAIT = 1\n"
outstr += "#ignore first read after power cycle\n"
outstr += "NULL : DM_MEM_R(252'129'9) = -1 | 0 | 0\n" 
outstr += "NULL : DM_MEM_R(252'129'9) = 200 | 0 | 0\n" 
outstr += "NULL : DM_MEM_R(252'129'10) = 700 | 0 | 0\n" 
outstr += "NULL : DM_MEM_R(252'129'11) = 650 | 0 | 0\n" 
outstr += "NULL : DM_MEM_R(252'129'12) = 600 | 0 | 0\n" 
outstr += "NULL : DM_MEM_R(252'129'13) = 550 | 0 | 0\n" 
outstr += "NULL : DM_MEM_R(252'129'14) = 500 | 0 | 0\n" 
outstr += "NULL : DM_MEM_R(252'129'15) = 450 | 0 | 0\n" 
outstr += "NULL : DM_MEM_R(252'129'16) = 400 | 0 | 0\n" 
outstr += "NULL : DM_MEM_R(252'129'17) = 350  | 0 | 0\n" 
outstr += "NULL : DM_MEM_R(252'129'18) = 300  | 0 | 0\n" 
outstr += "NULL : DM_MEM_R(252'129'19) = 250  | 0 | 0\n" 



cycles = 5
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
    outstr += "LdCurrentSet = 3500 : NULL : WAIT = 0.1\n"

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
    outstr += "NULL : Out_Stat1 = 2 | 0 | 0.001\n"
    outstr += "NULL : Out_Stat2 = 2 | 0 | 0.001\n"
    outstr += "NULL : Out_Stat3 = 2 | 0 | 0.001\n"
    outstr += "NULL : Out_Stat4 = 2 | 0 | 0.001\n"

cycles = 5
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
    outstr += "LdCurrentSet = 2000 : NULL : WAIT = 0.1\n"

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
    outstr += "NULL : Out_Stat1 = 0 | 0 | 0.001\n"
    outstr += "NULL : Out_Stat2 = 0 | 0 | 0.001\n"
    outstr += "NULL : Out_Stat3 = 0 | 0 | 0.001\n"
    outstr += "NULL : Out_Stat4 = 0 | 0 | 0.001\n"
    

outstr += "#cycle IGN to clean slate\n"
outstr += "RLY_K1 = 1 : NULL : WAIT = 1\n"
outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"


#*****************************************************************


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