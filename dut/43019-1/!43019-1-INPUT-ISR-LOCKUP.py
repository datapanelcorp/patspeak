import os

#global setup
script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

PortMode = "0"
TEST_VOLTS = 5.0

outstr = ""
outstr += "#43019-1\n"
outstr += "#Verion 0.0\n"
outstr += "#input test\n"
outstr += "UUT_DBC = 43019-560.dbc\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "\n"
outstr += "#-----setup pat-----\n"
outstr += "#setup meter\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n"

outstr += "#setup PS1\n"
outstr += "PwrRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "PwrSetCurrent = 20 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = " + str(TEST_VOLTS*10) + " : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1\n"

outstr += "#setup freq\n"
outstr += "AfgEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "AfgShape = 1 : NULL : WAIT = 0.1\n"
outstr += "AfgFreqSet = 500 : NULL : WAIT = 0.1\n"
outstr += "AfgDutySet = 50 : NULL : WAIT = 0.1\n"
outstr += "AfgAmplSet = 4000 : NULL : WAIT = 0.1\n"
outstr += "AfgOffsetSet = 4000 : NULL : WAIT = 0.1\n"
outstr += "AfgEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "J0_11_FREQ_GEN = 0 : NULL : WAIT = 0.1\n"

#outstr += "#switch in o-scope\n"
outstr += "J4_03 = 1 : NULL : WAIT = 0.2\n"

Port3AMode = "0"
Port3BMode = "0"
Port4AMode = "0"
Port4BMode = "0"

DeathSweep = "J4_01"

IN_MODE_OFF = "0"
IN_MODE_DPOS = "1"
IN_MODE_DGND = "2"
IN_MODE_A420MA = "3"
IN_MODE_A05V = "4"
IN_MODE_A32V = "6"
IN_MODE_FREQ = "7"
IN_MODE_CNT = "8"
#IN_MODE_ENC = "10"

MaxFreq = 3000
ExpFreq = 0
FreqInc = 100

ExpFreq = FreqInc

PortMode = IN_MODE_A32V
PortUnderTest = PortMode

PortIndex = 0
MaxPort = 3

ModeIndex = 0
MaxMode = 1

while ModeIndex <= MaxMode:

    while PortIndex <= MaxPort:
        Port3AMode = IN_MODE_OFF
        Port3BMode = IN_MODE_OFF
        Port4AMode = IN_MODE_OFF
        Port4BMode = IN_MODE_OFF
        
        if (ModeIndex == 0):
            Port3AMode = IN_MODE_FREQ 
            Port3BMode = IN_MODE_DPOS
            Port4AMode = IN_MODE_FREQ
            Port4BMode = IN_MODE_DPOS

        elif (ModeIndex == 1):
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_A05V
            Port4AMode = IN_MODE_A05V
            Port4BMode = IN_MODE_A05V

        elif (ModeIndex == 2):
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_A05V
            Port4AMode = IN_MODE_FREQ
            Port4BMode = IN_MODE_A05V

        elif (ModeIndex == 3):
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_A05V
            Port4AMode = IN_MODE_A05V
            Port4BMode = IN_MODE_DPOS

        else:
            raise ValueError(f"Invalid ModeIndex: {ModeIndex} (expected 0..35)")


        if(PortIndex == 0):
            Feedback = "Port_3A"
            OutputConnector = "J1_05"
            Status = "Input_3A"
            FreqFeedback = "Hertz_Count_Input3A"
            PortUnderTest = Port3AMode

        if(PortIndex == 1):
            Feedback = "Port_3B"
            OutputConnector = "J1_06"
            Status = "Input_3B"
            PortUnderTest = Port3BMode

        if(PortIndex == 2):
            Feedback = "Port_4A"
            OutputConnector = "J1_07"
            Status = "Input_4A"
            FreqFeedback = "Hertz_Count_Input4A"
            PortUnderTest = Port4AMode
            
        if(PortIndex == 3):
            Feedback = "Port_4B"
            OutputConnector = "J1_08"
            Status = "Input_4B"
            PortUnderTest = Port4BMode

        InputName = Feedback

        # outstr += "#cycle IGN to reset lockup\n"
        # outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
        # outstr += "RLY_K1 = 0 : NULL : WAIT = 2\n"

        outstr += "#-----setup 39009-----\n"
        outstr += "#configure\n"
        outstr += "Command = 82, MODE2 = 0 : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, MODE2 = 0 : NULL\n"
        outstr += "Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = " + Port3AMode + ", MODE3B = " + Port3BMode + ", MODE4A = " + Port4AMode + ", MODE4B = " + Port4BMode + ", MODE5A = 0, MODE5B = 0 : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL\n"

        outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
        outstr += "#clear multiplex\n"
        outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"

        outstr += "#cycle IGN to reset hardware\n"
        outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
        outstr += "RLY_K1 = 0 : NULL : WAIT = 2\n"

        outstr += "#switch input to load line\n"
        outstr += OutputConnector + " = 1 : NULL : WAIT = 1\n"
        
        outstr += "\n"

        outstr += "#TESTING - ModeIndex " + str(ModeIndex) +  " PortIndex " + str(PortIndex) + "\n"

        if((PortUnderTest==IN_MODE_A05V)|(PortUnderTest==IN_MODE_A32V)):
            TEST_VOLTS = 5.0
            #outstr += "PwrSetVoltage = " + str(TEST_VOLTS*10) + " : NULL : WAIT = 0.1\n"
            outstr += DeathSweep + " = 1 : NULL : WAIT = 0.1\n"
            outstr += "#SWEEP-RUNNING DEATHSWEEP!\\n"
            outstr += "PAT dp800/rigol_dp800_sweep_ch2.py --resource USB0::0x1AB1::0x0E11::DP8C180100022::INSTR --channel 2 --start 4.32 --stop 4.43 --step 0.001 --mode updown --dwell 0.020 --opc-every 25 --output-off-at-end\\n"
            outstr += DeathSweep + " = 0 : NULL : WAIT = 0.1\n"
            outstr += "#test for lockup\n"
            outstr += "UUT_TXCHECK-2.0\n"
            # outstr += "NULL : " + Feedback + " = 0 | 0.1 | 0.1\n"
            # outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.1\n"
            # outstr += "NULL : " + Feedback + " = " + str(TEST_VOLTS) + " | 0.1 | 0.1\n"
            # outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.1\n"
            # outstr += "NULL : " + Feedback + " = 0 | 0.1 | 0.1\n"
            # outstr += "\n"

        if(PortUnderTest==IN_MODE_DPOS):
            TEST_VOLTS = 5.0
            #outstr += "PwrSetVoltage = " + str(TEST_VOLTS*10) + " : NULL : WAIT = 0.1\n"
            outstr += DeathSweep + " = 1 : NULL : WAIT = 0.1\n"
            outstr += "#SWEEP-RUNNING DEATHSWEEP!\\n"
            outstr += "PAT dp800/rigol_dp800_sweep_ch2.py --resource USB0::0x1AB1::0x0E11::DP8C180100022::INSTR --channel 2 --start 4.32 --stop 4.43 --step 0.001 --mode updown --dwell 0.020 --opc-every 25 --output-off-at-end\\n"
            outstr += DeathSweep + " = 0 : NULL : WAIT = 0.1\n"
            outstr += "#test for lockup\n"
            outstr += "UUT_TXCHECK-2.0\n"
            # outstr += "NULL : " + Status + " = 0 | 0.1 | 0.1\n"
            # outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.1\n"
            # outstr += "NULL : " + Status + " = 1 | 0.1 | 0.1\n"
            # outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.1\n"
            # outstr += "NULL : " + Status + " = 0 | 0.1 | 0.1\n"
            # outstr += "\n"

        if(PortUnderTest==IN_MODE_FREQ):
            outstr += "AfgFreqSet = " + str(ExpFreq) + " : NULL : WAIT = 0.1\n"
            outstr += "#test for lockup\n"
            outstr += "UUT_TXCHECK-2.0\n"
            outstr += "NULL : " + FreqFeedback + " = 0 | 0.1 | 0.1\n"
            outstr += "J0_11_FREQ_GEN = 1 : NULL : WAIT = 0.1\n"
            outstr += "NULL : " + FreqFeedback + " = " + str(ExpFreq) + " | 30 | 0.1\n" 
            outstr += "J0_11_FREQ_GEN = 0 : NULL : WAIT = 0.1\n"
            outstr += "NULL : " + FreqFeedback + " = 0 | 0.1 | 0.1\n"
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
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.5\n"
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
