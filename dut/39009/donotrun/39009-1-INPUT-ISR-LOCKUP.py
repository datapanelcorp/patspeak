import os

#global setup
script_name = os.path.basename(__file__)
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
datafile = TestName + ".pat"

PortMode = "0"
TEST_VOLTS = 5.0

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

Port1AMode = "0"
Port1BMode = "0"
Port3AMode = "0"
Port3BMode = "0"

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
MaxMode = 35

while ModeIndex <= MaxMode:

    while PortIndex <= MaxPort:
        Port1AMode = IN_MODE_OFF
        Port1BMode = IN_MODE_OFF
        Port3AMode = IN_MODE_OFF
        Port3BMode = IN_MODE_OFF
        
        if (ModeIndex == 0):
            Port1AMode = IN_MODE_A05V
            Port1BMode = IN_MODE_FREQ
            Port3AMode = IN_MODE_DPOS
            Port3BMode = IN_MODE_A05V

        elif (ModeIndex == 1):
            Port1AMode = IN_MODE_FREQ
            Port1BMode = IN_MODE_A05V
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_DPOS

        elif (ModeIndex == 2):
            Port1AMode = IN_MODE_A05V
            Port1BMode = IN_MODE_A05V
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_A05V

        elif (ModeIndex == 3):
            Port1AMode = IN_MODE_A05V
            Port1BMode = IN_MODE_A05V
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_DPOS

        elif (ModeIndex == 4):
            Port1AMode = IN_MODE_A05V
            Port1BMode = IN_MODE_A05V
            Port3AMode = IN_MODE_DPOS
            Port3BMode = IN_MODE_A05V

        elif (ModeIndex == 5):
            Port1AMode = IN_MODE_A05V
            Port1BMode = IN_MODE_A05V
            Port3AMode = IN_MODE_DPOS
            Port3BMode = IN_MODE_DPOS

        elif (ModeIndex == 6):
            Port1AMode = IN_MODE_A05V
            Port1BMode = IN_MODE_FREQ
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_A05V

        elif (ModeIndex == 7):
            Port1AMode = IN_MODE_A05V
            Port1BMode = IN_MODE_FREQ
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_DPOS

        elif (ModeIndex == 8):
            Port1AMode = IN_MODE_A05V
            Port1BMode = IN_MODE_FREQ
            Port3AMode = IN_MODE_DPOS
            Port3BMode = IN_MODE_DPOS

        elif (ModeIndex == 9):
            Port1AMode = IN_MODE_A05V
            Port1BMode = IN_MODE_DPOS
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_A05V

        elif (ModeIndex == 10):
            Port1AMode = IN_MODE_A05V
            Port1BMode = IN_MODE_DPOS
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_DPOS

        elif (ModeIndex == 11):
            Port1AMode = IN_MODE_A05V
            Port1BMode = IN_MODE_DPOS
            Port3AMode = IN_MODE_DPOS
            Port3BMode = IN_MODE_A05V

        elif (ModeIndex == 12):
            Port1AMode = IN_MODE_A05V
            Port1BMode = IN_MODE_DPOS
            Port3AMode = IN_MODE_DPOS
            Port3BMode = IN_MODE_DPOS

        elif (ModeIndex == 13):
            Port1AMode = IN_MODE_FREQ
            Port1BMode = IN_MODE_FREQ
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_A05V

        elif (ModeIndex == 14):
            Port1AMode = IN_MODE_FREQ
            Port1BMode = IN_MODE_FREQ
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_DPOS

        elif (ModeIndex == 15):
            Port1AMode = IN_MODE_FREQ
            Port1BMode = IN_MODE_FREQ
            Port3AMode = IN_MODE_DPOS
            Port3BMode = IN_MODE_A05V

        elif (ModeIndex == 16):
            Port1AMode = IN_MODE_FREQ
            Port1BMode = IN_MODE_FREQ
            Port3AMode = IN_MODE_DPOS
            Port3BMode = IN_MODE_DPOS

        elif (ModeIndex == 17):
            Port1AMode = IN_MODE_FREQ
            Port1BMode = IN_MODE_DPOS
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_A05V

        elif (ModeIndex == 18):
            Port1AMode = IN_MODE_FREQ
            Port1BMode = IN_MODE_DPOS
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_DPOS

        elif (ModeIndex == 19):
            Port1AMode = IN_MODE_FREQ
            Port1BMode = IN_MODE_DPOS
            Port3AMode = IN_MODE_DPOS
            Port3BMode = IN_MODE_A05V

        elif (ModeIndex == 20):
            Port1AMode = IN_MODE_FREQ
            Port1BMode = IN_MODE_DPOS
            Port3AMode = IN_MODE_DPOS
            Port3BMode = IN_MODE_DPOS

        elif (ModeIndex == 21):
            Port1AMode = IN_MODE_FREQ
            Port1BMode = IN_MODE_A05V
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_A05V

        elif (ModeIndex == 22):
            Port1AMode = IN_MODE_FREQ
            Port1BMode = IN_MODE_A05V
            Port3AMode = IN_MODE_DPOS
            Port3BMode = IN_MODE_A05V

        elif (ModeIndex == 23):
            Port1AMode = IN_MODE_FREQ
            Port1BMode = IN_MODE_A05V
            Port3AMode = IN_MODE_DPOS
            Port3BMode = IN_MODE_DPOS

        elif (ModeIndex == 24):
            Port1AMode = IN_MODE_A05V
            Port1BMode = IN_MODE_FREQ
            Port3AMode = IN_MODE_DPOS
            Port3BMode = IN_MODE_A05V

        elif (ModeIndex == 25):
            Port1AMode = IN_MODE_DPOS
            Port1BMode = IN_MODE_A05V
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_A05V

        elif (ModeIndex == 26):
            Port1AMode = IN_MODE_DPOS
            Port1BMode = IN_MODE_A05V
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_DPOS

        elif (ModeIndex == 27):
            Port1AMode = IN_MODE_DPOS
            Port1BMode = IN_MODE_A05V
            Port3AMode = IN_MODE_DPOS
            Port3BMode = IN_MODE_A05V

        elif (ModeIndex == 28):
            Port1AMode = IN_MODE_DPOS
            Port1BMode = IN_MODE_A05V
            Port3AMode = IN_MODE_DPOS
            Port3BMode = IN_MODE_DPOS

        elif (ModeIndex == 29):
            Port1AMode = IN_MODE_DPOS
            Port1BMode = IN_MODE_FREQ
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_A05V

        elif (ModeIndex == 30):
            Port1AMode = IN_MODE_DPOS
            Port1BMode = IN_MODE_FREQ
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_DPOS

        elif (ModeIndex == 31):
            Port1AMode = IN_MODE_DPOS
            Port1BMode = IN_MODE_FREQ
            Port3AMode = IN_MODE_DPOS
            Port3BMode = IN_MODE_A05V

        elif (ModeIndex == 32):
            Port1AMode = IN_MODE_DPOS
            Port1BMode = IN_MODE_FREQ
            Port3AMode = IN_MODE_DPOS
            Port3BMode = IN_MODE_DPOS

        elif (ModeIndex == 33):
            Port1AMode = IN_MODE_DPOS
            Port1BMode = IN_MODE_DPOS
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_A05V

        elif (ModeIndex == 34):
            Port1AMode = IN_MODE_DPOS
            Port1BMode = IN_MODE_DPOS
            Port3AMode = IN_MODE_A05V
            Port3BMode = IN_MODE_DPOS

        elif (ModeIndex == 35):
            Port1AMode = IN_MODE_DPOS
            Port1BMode = IN_MODE_DPOS
            Port3AMode = IN_MODE_DPOS
            Port3BMode = IN_MODE_A05V

        else:
            raise ValueError(f"Invalid ModeIndex: {ModeIndex} (expected 0..35)")


        if(PortIndex == 0):
            Feedback = "Port_1A"
            OutputConnector = "J2_01"
            Status = "Input_1A"
            FreqFeedback = "Hertz_Count_Input1A"
            PortUnderTest = Port1AMode

        if(PortIndex == 1):
            Feedback = "Port_1B"
            OutputConnector = "J2_02"
            Status = "Input_1B"
            FreqFeedback = "Hertz_Count_Input1B"
            PortUnderTest = Port1BMode

        if(PortIndex == 2):
            Feedback = "Port_3A"
            OutputConnector = "J2_03"
            Status = "Input_3A"
            PortUnderTest = Port3AMode
            
        if(PortIndex == 3):
            Feedback = "Port_3B"
            OutputConnector = "J2_04"
            Status = "Input_3B"
            PortUnderTest = Port3BMode

        InputName = Feedback

        # outstr += "#cycle IGN to reset lockup\n"
        # outstr += "RLY_K1 = 1 : NULL : WAIT = 2\n"
        # outstr += "RLY_K1 = 0 : NULL : WAIT = 2\n"

        outstr += "#-----setup 39009-----\n"
        outstr += "#configure\n"
        outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, Analog_Raw_Value = 0 : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, Analog_Raw_Value = 0 : NULL\n"
        outstr += "Command = 83, MODE1A = " + Port1AMode + ", MODE1B = " + Port1BMode + ", MODE2A = 1, MODE2B = 1, MODE3A = " + Port3AMode + ", MODE3B = " + Port3BMode + ", MODE4A = 1, MODE4B = 1, MODE5A = " + PortMode + ", MODE5B = " + PortMode + ", MODE6A = 1, MODE6B = 1, MODE7A = " + PortMode + ", MODE7B = " + PortMode + " : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL\n"
        outstr += "Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = " + PortMode + ", MODE9B = " + PortMode + ", MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL\n"

        outstr += "Command = 82, Enable_Fault_Reset = 1, Save_Configuration = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, Enable_Fault_Reset = 0, Save_Configuration = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"

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
            outstr += "SWEEP-RUNNING DEATHSWEEP!\n"
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
            outstr += "SWEEP-RUNNING DEATHSWEEP!\n"
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
