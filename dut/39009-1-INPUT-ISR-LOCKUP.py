import os

#global setup
script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

PortMode = "0"

outstr = ""
outstr += "#39009-1\n"
outstr += "#Verion 0.0\n"
outstr += "#input test\n"
outstr += "UUT_DBC = 39009-561.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "\n"
outstr += "#-----setup pat-----\n"
outstr += "#setup meter\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"

#outstr += "#switch in o-scope\n"
outstr += "J4_03 = 1 : NULL : WAIT = 0.2\n"

PortIndex = 0
ModeIndex = 0

ModeIndex = 0
MaxMode = 0

Port1AMode = "0"
Port1BMode = "0"
Port3AMode = "0"
Port3BMode = "0"

DeathSweep = "J4_01"

while ModeIndex <= MaxMode:
    
    if(ModeIndex==0):#5VDC
        PortMode = "4"
        StartVolts = 1
        MaxVolts = 5
        FaultLimit = 5.5
        BVoltInc = 0.1
        SVoltInc = 0.1
        
    IN_MODE_A05V = "4"
    IN_MODE_A32V = "6"
    IN_MODE_FREQ = "7"
    IN_MODE_CNT = "8"
    IN_MODE_ENC = "10"

    while PortIndex <= 3:

        VoltInc = BVoltInc

        if(PortIndex == 0):#test IN_MODE_FREQ, IN_MODE_CNT, IN_MODE_ENC
            Feedback = "Port_1A"
            OutputConnector = "J2_01"
            Status = "Input_1A"
            Port1AMode = IN_MODE_A05V
            
        if(PortIndex == 1):#test IN_MODE_CNT, IN_MODE_ENC
            Feedback = "Port_1B"
            OutputConnector = "J2_02"
            Status = "Input_1B"
            Port1BMode = IN_MODE_A05V
            
        if(PortIndex == 2):#test IN_MODE_FREQ, IN_MODE_CNT, IN_MODE_ENC
            Feedback = "Port_3A"
            OutputConnector = "J2_03"
            Status = "Input_3A"
            Port3AMode = IN_MODE_A05V
            
        if(PortIndex == 3):#test IN_MODE_CNT, IN_MODE_ENC
            Feedback = "Port_3B"
            OutputConnector = "J2_04"
            Status = "Input_3B"
            Port3BMode = IN_MODE_A05V

        InputName = Feedback

        outstr += "#-----setup 39009-----\n"
        outstr += "#configure as Output Digital ON/OFF\n"
        outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5\n"
        outstr += "Command = 83, MODE1A = " + Port1AMode + ", MODE1B = " + Port1BMode + ", MODE2A = 1, MODE2B = 1, MODE3A = " + Port3AMode + ", MODE3B = " + Port3BMode + ", MODE4A = 1, MODE4B = 1, MODE5A = " + PortMode + ", MODE5B = " + PortMode + ", MODE6A = 1, MODE6B = 1, MODE7A = " + PortMode + ", MODE7B = " + PortMode + " : NULL : WAIT = 0.5\n"
        outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL\n"
        outstr += "Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = " + PortMode + ", MODE9B = " + PortMode + ", MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5\n"
        outstr += "Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL\n"

        outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
        outstr += "#clear multiplex\n"
        outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"

        outstr += "#switch input to load line\n"
        outstr += OutputConnector + " = 1 : NULL : WAIT = 0.1\n"
        
        outstr += "\n"
        
        # Voltage = StartVolts
        outstr += DeathSweep + " = 1 : NULL : WAIT = 0.1\n"
        outstr += "SWEEP-RUNNING DEATHSWEEP!\n"
        
        outstr += "\n"
        outstr += "#Finished with port\n"
        outstr += "#switch out input\n"
        outstr += OutputConnector + " = 0 : NULL : WAIT = 0.1\n"
        PortIndex += 1

        outstr += "\n"
        
    ModeIndex += 1
    PortIndex = 0
    outstr += "\n"
    outstr += "#Finished with mode"
    outstr += "\n"
    outstr += "#cycle IGN to clean slate\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"
    outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
    outstr += "RLY_K1 = 0 : NULL : WAIT = 1\n"

outstr += "#switch out load line, set current\n"
outstr += OutputConnector + " = 0 : NULL : WAIT = 0.1\n"
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1\n"

outstr += "#tear down PS1\n"
outstr += "PwrSetCurrent = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1\n"
outstr += "PwrRemote = 0 : NULL : WAIT = 0.1\n"

#outstr += "#switch out o-scope\n"
outstr += "J4_03 = 0 : NULL : WAIT = 0.2\n"
outstr += "SAVE\n"
outstr += "END\n"

f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



print(TestName + ".pat")
