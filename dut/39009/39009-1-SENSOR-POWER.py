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
outstr += "#39009-1\n"
outstr += "#Verion 0.0\n"
outstr += "#digital normal test using the E-LOAD\n"
outstr += "UUT_DBC = 39009-561.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 39009-----\n"
outstr += "#configure as Output Digital ON/OFF\n"
outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5\n"
outstr += "Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1, MODE5A = 1, MODE5B = 1, MODE6A = 1, MODE6B = 1, MODE7A = 1, MODE7B = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL\n"
outstr += "Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 1, MODE9B = 1, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL\n"

outstr += "Command = 82, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1, Enable_Fault_Reset = 1 : NULL : WAIT = 0.5\n"
outstr += "Command = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0, Enable_Fault_Reset = 0 : NULL\n"

outstr += "\n"

outstr += "#-----setup PAT-----\n"
outstr += "#setup load\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "LdShort = 1 : NULL : WAIT = 1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"

#verify faults clear
outstr += "NULL : OutStat2A = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat2B = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat4A = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat4B = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat6A = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat6B = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat8A = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat8B = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat10A = 0 | 0.1 | 0.1\n"
outstr += "NULL : OutStat10B = 0 | 0.1 | 0.1\n"

t = 0
while t <= 4:
    if(t == 0):
        OutputName = "SPWR1_On"
        BattEn = "SPWR1_BattEn"
        OutputConnector = "J1_08"
        OutputStatus = "SpwrStat1"
    if(t == 1):
        OutputName = "SPWR3_On"
        BattEn = "SPWR3_BattEn"
        OutputConnector = "J1_09"
        OutputStatus = "SpwrStat3"
    if(t == 2):
        OutputName = "SPWR5_On"
        BattEn = "SPWR5_BattEn"
        OutputConnector = "J1_10"
        OutputStatus = "SpwrStat5"
    if(t == 3):
        OutputName = "SPWR7_On"
        BattEn = "SPWR7_BattEn"
        OutputConnector = "J1_11"
        OutputStatus = "SpwrStat7"
    if(t == 4):
        OutputName = "SPWR9_On"
        BattEn = "SPWR9_BattEn"
        OutputConnector = "J1_12"
        OutputStatus = "SpwrStat9"

    outstr += "#switch in load line, set current\n"
    outstr += OutputConnector + " = 1 : NULL : WAIT = 0.1\n"

    outstr += "#turn on sensor power\n" 
    outstr += "Command = 81, " + OutputName + " = 1 : NULL : WAIT = 0.1\n"
    outstr += "#check for 5VDC\n"
    outstr += "NULL : MeterVolts = " + str(5) + " | 0.2 | 0.1\n" 
    outstr += "#short output (#1)\n"
    outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
    outstr += "#verify fault\n"
    outstr += "NULL : " + OutputStatus + " = 2 | 0.1 | 0.1\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
    outstr += "#verify volotage\n"
    outstr += "NULL : MeterVolts = " + str(0) + " | 0.2 | 0.1\n" 
    outstr += "#clear fault\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL : WAIT = 0.5\n"
    outstr += "Command = 81, " + OutputName + " = 1 : NULL\n"
    outstr += "NULL : " + OutputStatus + " = 1 | 0.1 | 0.1\n"

    outstr += "#enable VBAT\n"
    outstr += "Command = 81, " + BattEn + " = 1 : NULL : WAIT = 0.1\n"

    outstr += "#check for VBAT\n"
    outstr += "NULL : MeterVolts = " + str(14) + " | 0.2 | 0.1\n"
    outstr += "#short output (#2)\n"
    outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
    outstr += "#verify fault\n"
    outstr += "NULL : " + OutputStatus + " = 2 | 0.1 | 0.1\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
    outstr += "#verify volotage\n"
    outstr += "NULL : MeterVolts = " + str(0) + " | 0.2 | 0.1\n" 
    outstr += "#clear fault\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL : WAIT = 0.5\n"
    outstr += "Command = 81, " + OutputName + " = 1 : NULL\n"
    outstr += "NULL : " + OutputStatus + " = 1 | 0.1 | 0.1\n"

    outstr += "#check for VBAT\n"
    outstr += "NULL : MeterVolts = " + str(14) + " | 0.2 | 0.1\n"
    outstr += "#short output (#3)\n"
    outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
    outstr += "#verify fault\n"
    outstr += "NULL : " + OutputStatus + " = 2 | 0.1 | 0.1\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
    outstr += "#verify volotage\n"
    outstr += "NULL : MeterVolts = " + str(0) + " | 0.2 | 0.1\n" 
    outstr += "#clear fault\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL : WAIT = 0.5\n"
    outstr += "Command = 81, " + OutputName + " = 1 : NULL\n"
    outstr += "NULL : " + OutputStatus + " = 1 | 0.1 | 0.1\n"

    outstr += "#check for VBAT\n"
    outstr += "NULL : MeterVolts = " + str(14) + " | 0.2 | 0.1\n"
    outstr += "#short output (#4)\n"
    outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
    outstr += "#verify fault\n"
    outstr += "NULL : " + OutputStatus + " = 2 | 0.1 | 0.1\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
    outstr += "#verify volotage\n"
    outstr += "NULL : MeterVolts = " + str(0) + " | 0.2 | 0.1\n" 
    outstr += "#clear fault\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL : WAIT = 0.5\n"
    outstr += "Command = 81, " + OutputName + " = 1 : NULL\n"
    outstr += "NULL : " + OutputStatus + " = 1 | 0.1 | 0.1\n"

    outstr += "#check for VBAT\n"
    outstr += "NULL : MeterVolts = " + str(14) + " | 0.2 | 0.1\n"
    outstr += "#short output (#5)\n"
    outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
    outstr += "#verify fault\n"
    outstr += "NULL : " + OutputStatus + " = 2 | 0.1 | 0.1\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
    outstr += "#verify volotage\n"
    outstr += "NULL : MeterVolts = " + str(0) + " | 0.2 | 0.1\n" 
    outstr += "#clear fault\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL : WAIT = 0.5\n"
    outstr += "Command = 81, " + OutputName + " = 1 : NULL\n"

    outstr += "#check for VBAT\n"
    outstr += "NULL : MeterVolts = " + str(0) + " | 0.2 | 0.1\n"
    outstr += "NULL : " + OutputStatus + " = 2 | 0.1 | 0.1\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL\n"
    outstr += "\n"
            
    outstr += "#switch out load line, clear current\n"
    outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
    outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.5\n"

    outstr += OutputConnector + " = 0 : NULL : WAIT = 0.5\n"
    outstr += "Command = 81, " + OutputName + " = 0 : NULL : WAIT = 0.5\n"
    t += 1


#verify faults
# outstr += "NULL : OutStat2A = 2 | 0.1 | 0.1\n"
# outstr += "NULL : OutStat2B = 2 | 0.1 | 0.1\n"
# outstr += "NULL : OutStat4A = 2 | 0.1 | 0.1\n"
# outstr += "NULL : OutStat4B = 2 | 0.1 | 0.1\n"
# outstr += "NULL : OutStat6A = 2 | 0.1 | 0.1\n"
# outstr += "NULL : OutStat6B = 2 | 0.1 | 0.1\n"
# outstr += "NULL : OutStat8A = 2 | 0.1 | 0.1\n"
# outstr += "NULL : OutStat8B = 2 | 0.1 | 0.1\n"
# outstr += "NULL : OutStat10A = 2 | 0.1 | 0.1\n"
# outstr += "NULL : OutStat10B = 2 | 0.1 | 0.1\n"

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
