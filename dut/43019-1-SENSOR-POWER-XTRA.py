import os
t = 0
i = 0
Increment = 100#100

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

outstr += "#-----setup 43019-----\n"
outstr += "#configure as Output Digital ON/OFF\n"
outstr += "Command = 82, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5\n"
outstr += "Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1, MODE5A = 1, MODE5B = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL\n"

outstr += "Command = 82, FaultReset = 1, SaveSettings = 0, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
outstr += "#clear multiplex\n"
outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"

outstr += "\n"

outstr += "#-----setup PAT-----\n"
outstr += "#setup load\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "LdShort = 0 : NULL : WAIT = 1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"

#verify faults clear
outstr += "NULL : SpwrStat1 = 0 | 0.1 | 0.1\n"
outstr += "NULL : SpwrStat2 = 0 | 0.1 | 0.1\n"
outstr += "NULL : SpwrStat3 = 0 | 0.1 | 0.1\n"
outstr += "NULL : SpwrStat4 = 0 | 0.1 | 0.1\n"


t = 0
while t <= 3:
    if(t == 0):
        OutputName = "SPWR1_On"
        en5VDC = "SPWR1_5V"
        OutputConnector = "J2_02"
        OutputStatus = "SpwrStat1"
    if(t == 1):
        OutputName = "SPWR2_On"
        en5VDC = "SPWR2_5V"
        OutputConnector = "J2_04"
        OutputStatus = "SpwrStat2"
    if(t == 2):
        OutputName = "SPWR3_On"
        en5VDC = "SPWR3_5V"
        OutputConnector = "J2_06"
        OutputStatus = "SpwrStat3"
    if(t == 3):
        OutputName = "SPWR4_On"
        en5VDC = "SPWR4_5V"
        OutputConnector = "J2_08"
        OutputStatus = "SpwrStat4"


    #baseline with out save
    outstr += "#1 configure for Battery\n" 
    outstr += "Command = 92, " + en5VDC + " = 0 : NULL : WAIT = 0.5\n"
    outstr += "#save\n"
    outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
    outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL : WAIT = 0.1\n"

    outstr += "#cycle power\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "\n"

    outstr += "#switch output to load line\n"
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.1\n"

    outstr += "#turn on output\n" 
    outstr += "Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.1\n"

    outstr += "#verify for Battery\n" 
    outstr += "NULL : MeterVolts = " + str(14) + " | 0.5 | 0.1\n" 

    outstr += "#verify output status\n"
    outstr += "NULL : " + OutputStatus + " = 1 | 0.1 | 0.1\n"

    outstr += "#turn off output\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL\n"

    outstr += "#verify zero\n" 
    outstr += "NULL : MeterVolts = " + str(0) + " | 0.5 | 0.1\n" 

    outstr += "#verify output status\n"
    outstr += "NULL : " + OutputStatus + " = 0 | 0.1 | 0.1\n"

    outstr += "#configure for 5VDC\n" 
    outstr += "Command = 92, " + en5VDC + " = 1 : NULL : WAIT = 0.5\n"

    outstr += "#turn on output\n" 
    outstr += "Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.1\n"

    outstr += "#verify 5VDC\n" 
    outstr += "NULL : MeterVolts = " + str(5) + " | 0.5 | 0.1\n" 

    outstr += "#verify output status\n"
    outstr += "NULL : " + OutputStatus + " = 1 | 0.1 | 0.1\n"

    outstr += "#turn off output\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL\n"

    outstr += "#verify zero\n" 
    outstr += "NULL : MeterVolts = " + str(0) + " | 0.5 | 0.1\n"

    outstr += "#check output status\n"
    outstr += "NULL : " + OutputStatus + " = 0 | 0.1 | 0.1\n"

    outstr += "#cycle power\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "\n"

    outstr += "#turn on output\n" 
    outstr += "Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.1\n"

    outstr += "#verify battery\n" 
    outstr += "NULL : MeterVolts = " + str(14) + " | 0.5 | 0.1\n" 

    outstr += "#verify output status\n"
    outstr += "NULL : " + OutputStatus + " = 1 | 0.1 | 0.1\n"

    outstr += "#turn off output\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL\n"

    outstr += "#verify zero\n" 
    outstr += "NULL : MeterVolts = " + str(0) + " | 0.5 | 0.1\n" 

    outstr += "#verify output status\n"
    outstr += "NULL : " + OutputStatus + " = 0 | 0.1 | 0.1\n"


    #test if 5VDC saves and powers up properly after a fault
    outstr += "#2 configure for 5VDC\n" 
    outstr += "Command = 92, " + en5VDC + " = 1 : NULL : WAIT = 0.5\n"
    outstr += "#save\n"
    outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
    outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL : WAIT = 0.1\n"

    outstr += "#turn on output\n" 
    outstr += "Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.1\n"

    outstr += "#verify 5VDC\n" 
    outstr += "NULL : MeterVolts = " + str(5) + " | 0.5 | 0.1\n" 

    outstr += "#verify output status\n"
    outstr += "NULL : " + OutputStatus + " = 1 | 0.1 | 0.1\n"

    outstr += "#turn off output\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL\n"

    outstr += "#verify zero\n" 
    outstr += "NULL : MeterVolts = " + str(0) + " | 0.5 | 0.1\n"

    outstr += "#check output status\n"
    outstr += "NULL : " + OutputStatus + " = 0 | 0.1 | 0.1\n"

    outstr += "#cycle power\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "\n"

    outstr += "#turn on output\n" 
    outstr += "Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.1\n"

    outstr += "#verify 5VDC\n" 
    outstr += "NULL : MeterVolts = " + str(5) + " | 0.5 | 0.1\n" 

    outstr += "#verify output status\n"
    outstr += "NULL : " + OutputStatus + " = 1 | 0.1 | 0.1\n"

    outstr += "#turn off output\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL\n"

    outstr += "#verify zero\n" 
    outstr += "NULL : MeterVolts = " + str(0) + " | 0.5 | 0.1\n"

    outstr += "#check output status\n"
    outstr += "NULL : " + OutputStatus + " = 0 | 0.1 | 0.1\n"

    #prepare to short output
    outstr += "#3 enable e-load short\n"
    outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
    outstr += "LdShort = 1 : NULL : WAIT = 1\n"

    outstr += "#turn on output\n" 
    outstr += "Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.1\n"

    outstr += "#verify zero\n" 
    outstr += "NULL : MeterVolts = " + str(0) + " | 0.5 | 0.1\n" 

    outstr += "#verify output status\n"
    outstr += "NULL : " + OutputStatus + " = 2 | 0.1 | 0.1\n"

    outstr += "#turn off output\n" 
    outstr += "Command = 81, " + OutputName + " = 0 : NULL : WAIT = 0.1\n"

    outstr += "#disable e-load short\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
    outstr += "LdShort = 0 : NULL : WAIT = 1\n"

    outstr += "#cycle power\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "\n"

    #verify it powers up as 5VDC
    outstr += "#4 turn on output\n" 
    outstr += "Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.1\n"

    outstr += "#verify 5VDC\n" 
    outstr += "NULL : MeterVolts = " + str(5) + " | 0.5 | 0.1\n" 

    outstr += "#verify output status\n"
    outstr += "NULL : " + OutputStatus + " = 1 | 0.1 | 0.1\n"

    outstr += "#turn off output\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL\n"

    outstr += "#verify zero\n" 
    outstr += "NULL : MeterVolts = " + str(0) + " | 0.5 | 0.1\n"

    outstr += "#check output status\n"
    outstr += "NULL : " + OutputStatus + " = 0 | 0.1 | 0.1\n"

    outstr += "#cycle power\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "\n"


    #test if battery saves and powers up properly after a fault
    outstr += "#5 configure for battery\n" 
    outstr += "Command = 92, " + en5VDC + " = 0 : NULL : WAIT = 0.5\n"
    outstr += "#save\n"
    outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
    outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL : WAIT = 0.1\n"

    outstr += "#turn on output\n" 
    outstr += "Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.1\n"

    outstr += "#verify battery\n" 
    outstr += "NULL : MeterVolts = " + str(14) + " | 0.5 | 0.1\n" 

    outstr += "#verify output status\n"
    outstr += "NULL : " + OutputStatus + " = 1 | 0.1 | 0.1\n"

    outstr += "#turn off output\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL\n"

    outstr += "#verify zero\n" 
    outstr += "NULL : MeterVolts = " + str(0) + " | 0.5 | 0.1\n"

    outstr += "#check output status\n"
    outstr += "NULL : " + OutputStatus + " = 0 | 0.1 | 0.1\n"

    outstr += "#cycle power\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "\n"

    outstr += "#turn on output\n" 
    outstr += "Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.1\n"

    outstr += "#verify battery\n" 
    outstr += "NULL : MeterVolts = " + str(14) + " | 0.5 | 0.1\n" 

    outstr += "#verify output status\n"
    outstr += "NULL : " + OutputStatus + " = 1 | 0.1 | 0.1\n"

    outstr += "#turn off output\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL\n"

    outstr += "#verify zero\n" 
    outstr += "NULL : MeterVolts = " + str(0) + " | 0.5 | 0.1\n"

    outstr += "#check output status\n"
    outstr += "NULL : " + OutputStatus + " = 0 | 0.1 | 0.1\n"

    #prepare to short output
    outstr += "#6 enable e-load short\n"
    outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
    outstr += "LdShort = 1 : NULL : WAIT = 1\n"

    outstr += "#turn on output\n" 
    outstr += "Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.1\n"

    outstr += "#verify zero\n" 
    outstr += "NULL : MeterVolts = " + str(0) + " | 0.5 | 0.1\n" 

    outstr += "#verify output status\n"
    outstr += "NULL : " + OutputStatus + " = 2 | 0.1 | 0.1\n"

    outstr += "#turn off output\n" 
    outstr += "Command = 81, " + OutputName + " = 0 : NULL : WAIT = 0.1\n"

    outstr += "#disable e-load short\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
    outstr += "LdShort = 0 : NULL : WAIT = 1\n"

    outstr += "#cycle power\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "\n"

    #verify it powers up as 5VDC
    outstr += "#7 turn on output\n" 
    outstr += "Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.1\n"

    outstr += "#verify battery\n" 
    outstr += "NULL : MeterVolts = " + str(14) + " | 0.5 | 0.1\n" 

    outstr += "#verify output status\n"
    outstr += "NULL : " + OutputStatus + " = 1 | 0.1 | 0.1\n"

    outstr += "#turn off output\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL\n"

    outstr += "#verify zero\n" 
    outstr += "NULL : MeterVolts = " + str(0) + " | 0.5 | 0.1\n"

    outstr += "#check output status\n"
    outstr += "NULL : " + OutputStatus + " = 0 | 0.1 | 0.1\n"

    outstr += "#cycle power\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "\n"

    t += 1

#shut down test
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdShort = 0 : NULL : WAIT = 1\n"
outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 1\n"
outstr += "SAVE\n"
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



print(TestName + ".pat")
quit()








    
#     outstr += "#short output (#1)\n"
#     outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
#     outstr += "#verify fault\n"
#     outstr += "NULL : " + OutputStatus + " = 2 | 0.1 | 0.1\n"
#     outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
#     outstr += "#verify volotage\n"
#     outstr += "NULL : MeterVolts = " + str(0) + " | 0.2 | 0.1\n" 
#     outstr += "#clear fault\n"
#     outstr += "Command = 81, " + OutputName + " = 0 : NULL : WAIT = 0.5\n"
#     outstr += "Command = 81, " + OutputName + " = 1 : NULL\n"
#     outstr += "NULL : " + OutputStatus + " = 1 | 0.1 | 0.1\n"

#     outstr += "#enable VBAT\n"
#     outstr += "Command = 92, " + BattEn + " = 0 : NULL : WAIT = 0.1\n"

#     outstr += "#check for VBAT\n"
#     outstr += "NULL : MeterVolts = " + str(14) + " | 0.2 | 0.1\n"
#     outstr += "#short output (#2)\n"
#     outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
#     outstr += "#verify fault\n"
#     outstr += "NULL : " + OutputStatus + " = 2 | 0.1 | 0.1\n"
#     outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
#     outstr += "#verify volotage\n"
#     outstr += "NULL : MeterVolts = " + str(0) + " | 0.2 | 0.1\n" 
#     outstr += "#clear fault\n"
#     outstr += "Command = 81, " + OutputName + " = 0 : NULL : WAIT = 0.5\n"
#     outstr += "Command = 81, " + OutputName + " = 1 : NULL\n"
#     outstr += "NULL : " + OutputStatus + " = 1 | 0.1 | 0.1\n"

#     outstr += "#check for VBAT\n"
#     outstr += "NULL : MeterVolts = " + str(14) + " | 0.2 | 0.1\n"
#     outstr += "#short output (#3)\n"
#     outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
#     outstr += "#verify fault\n"
#     outstr += "NULL : " + OutputStatus + " = 2 | 0.1 | 0.1\n"
#     outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
#     outstr += "#verify volotage\n"
#     outstr += "NULL : MeterVolts = " + str(0) + " | 0.2 | 0.1\n" 
#     outstr += "#clear fault\n"
#     outstr += "Command = 81, " + OutputName + " = 0 : NULL : WAIT = 0.5\n"
#     outstr += "Command = 81, " + OutputName + " = 1 : NULL\n"
#     outstr += "NULL : " + OutputStatus + " = 1 | 0.1 | 0.1\n"

#     outstr += "#check for VBAT\n"
#     outstr += "NULL : MeterVolts = " + str(14) + " | 0.2 | 0.1\n"
#     outstr += "#short output (#4)\n"
#     outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
#     outstr += "#verify fault\n"
#     outstr += "NULL : " + OutputStatus + " = 2 | 0.1 | 0.1\n"
#     outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
#     outstr += "#verify volotage\n"
#     outstr += "NULL : MeterVolts = " + str(0) + " | 0.2 | 0.1\n" 
#     outstr += "#clear fault\n"
#     outstr += "Command = 81, " + OutputName + " = 0 : NULL : WAIT = 0.5\n"
#     outstr += "Command = 81, " + OutputName + " = 1 : NULL\n"
#     outstr += "NULL : " + OutputStatus + " = 1 | 0.1 | 0.1\n"

#     outstr += "#check for VBAT\n"
#     outstr += "NULL : MeterVolts = " + str(14) + " | 0.2 | 0.1\n"
#     outstr += "#short output (#5)\n"
#     outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
#     outstr += "#verify fault\n"
#     outstr += "NULL : " + OutputStatus + " = 2 | 0.1 | 0.1\n"
#     outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
#     outstr += "#verify volotage\n"
#     outstr += "NULL : MeterVolts = " + str(0) + " | 0.2 | 0.1\n" 
#     outstr += "#clear fault\n"
#     outstr += "Command = 81, " + OutputName + " = 0 : NULL : WAIT = 0.5\n"
#     outstr += "Command = 81, " + OutputName + " = 1 : NULL\n"

#     outstr += "#check for VBAT\n"
#     outstr += "NULL : MeterVolts = " + str(0) + " | 0.2 | 0.1\n"
#     outstr += "NULL : " + OutputStatus + " = 2 | 0.1 | 0.1\n"
#     outstr += "Command = 81, " + OutputName + " = 0 : NULL\n"
#     outstr += "\n"
            
#     outstr += "#switch out load line, clear current\n"
#     outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
#     outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.5\n"

#     outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"
#     outstr += "Command = 81, " + OutputName + " = 0 : NULL : WAIT = 0.5\n"
#     t += 1


# #shut down test
# outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
# outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
# outstr += "LdShort = 0 : NULL : WAIT = 1\n"
# outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 1\n"
# outstr += "SAVE\n"
# outstr += "END\n"
    
# f = open(datafile, 'w')
# f.write(outstr)
# f.close()    
# print(outstr)



# print(TestName + ".pat")
