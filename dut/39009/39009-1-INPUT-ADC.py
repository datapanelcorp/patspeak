import os

#global setup
script_name = os.path.basename(__file__)
script_dir = os.path.dirname(os.path.abspath(__file__))
print(f"The name of the running script is: {script_name}")
TestName = os.path.splitext(script_name)[0]
datafile = os.path.join(script_dir, TestName + ".pat")

def to_decivolts(volts):
    return int(round(volts * 10))

PortMode = 0

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
outstr += "\n"
outstr += "#setup PS1\n"
outstr += "PwrRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "PwrSetCurrent = 20 : NULL : WAIT = 0.1\n"
outstr += "PwrSetVoltage = 0 : NULL : WAIT = 0.1\n"
outstr += "PwrEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1\n"
outstr += "\n"
#outstr += "#switch in o-scope\n"
outstr += "J4_03 = 1 : NULL : WAIT = 0.2\n"

outstr += "NULL : Input_1A = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_1B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_3A = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_3B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_5A = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_5B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_7A = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_7B = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_9A = 0 | 0.1 | 0.1\n"
outstr += "NULL : Input_9B = 0 | 0.1 | 0.1\n"


PortIndex = 0
MaxPort = 9

ModeIndex = 0
MaxMode = 3

while ModeIndex <= MaxMode:
    
    if(ModeIndex==0):#GROUND
        PortMode = "2"
        StartVolts = 14
        MaxVolts = 14
        FaultLimit = 14
        BVoltInc = 0.5
        SVoltInc = 0.1
        MaxValue = StartVolts
        Tol = "0.050"
        
    if(ModeIndex==1):#POSITVE
        PortMode = "1"
        StartVolts = 14
        MaxVolts = 14
        FaultLimit = 14
        BVoltInc = 0.5
        SVoltInc = 0.1
        MaxValue = StartVolts
        Tol = "0.050"
        
    if(ModeIndex==2):#5VDC
        PortMode = "4"
        StartVolts = 1
        MaxVolts = 5
        FaultLimit = 5.1
        BVoltInc = 0.1
        SVoltInc = 0.1
        Tol = "0.050"
        
    # if(ModeIndex==1):#10VDC
    #     PortAMode = "0"
    #     PortBMode = "5"
    #     StartVolts = 1
    #     MaxVolts = 10
    #     FaultLimit = 11.1
    #     BVoltInc = 0.5
    #     SVoltInc = 0.1
        
    if(ModeIndex==3):#32VDC
        PortMode = "6"
        StartVolts = 1
        MaxVolts = 32
        FaultLimit = 33.5
        BVoltInc = 0.5
        SVoltInc = 0.1
        Tol = "0.320"
        
    while PortIndex <= MaxPort:

        VoltInc = BVoltInc

        if(PortIndex == 0):
            Feedback = "Port_1A"
            OutputConnector = "J2_01"
            Status = "Input_1A"
        if(PortIndex == 1):
            Feedback = "Port_1B"
            OutputConnector = "J2_02"
            Status = "Input_1B"
        if(PortIndex == 2):
            Feedback = "Port_3A"
            OutputConnector = "J2_03"
            Status = "Input_3A"
        if(PortIndex == 3):
            Feedback = "Port_3B"
            OutputConnector = "J2_04"
            Status = "Input_3B"
        if(PortIndex == 4):
            Feedback = "Port_5A"
            OutputConnector = "J2_05"
            Status = "Input_5A"
        if(PortIndex == 5):
            Feedback = "Port_5B"
            OutputConnector = "J2_06"
            Status = "Input_5B"
        if(PortIndex == 6):
            Feedback = "Port_7A"
            OutputConnector = "J2_07"
            Status = "Input_7A"
        if(PortIndex == 7):
            Feedback = "Port_7B"
            OutputConnector = "J2_08"
            Status = "Input_7B"
        if(PortIndex == 8):
            Feedback = "Port_9A"
            OutputConnector = "J2_09"
            Status = "Input_9A"
        if(PortIndex == 9):
            Feedback = "Port_9B"
            OutputConnector = "J2_10"
            Status = "Input_9B"

        InputName = Feedback


        outstr += "#-----setup 39009-----\n"
        outstr += "#configure as Output Digital ON/OFF\n"
        outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0 : NULL : WAIT = 0.5\n"
        outstr += "Command = 83, MODE1A = " + PortMode + ", MODE1B = " + PortMode + ", MODE2A = 1, MODE2B = 1, MODE3A = " + PortMode + ", MODE3B = " + PortMode + ", MODE4A = 1, MODE4B = 1, MODE5A = " + PortMode + ", MODE5B = " + PortMode + ", MODE6A = 1, MODE6B = 1, MODE7A = " + PortMode + ", MODE7B = " + PortMode + " : NULL : WAIT = 0.5\n"
        outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL\n"
        outstr += "Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = " + PortMode + ", MODE9B = " + PortMode + ", MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5\n"
        outstr += "Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL\n"

        outstr += "Command = 82, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5\n"
        outstr += "#clear multiplex\n"
        outstr += "Command = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"
        
        outstr += "#set power supply and wait\n"
        outstr += "PwrSetVoltage = " + str(to_decivolts(StartVolts)) + " : NULL : WAIT = 0.1\n"
        #outstr += "#test power supply\n"
        #outstr += "NULL : MeterVolts = " + str(StartVolts) + " | 0.155 | 0.1\n"

        if(ModeIndex==0):
            outstr += "#Ground Test " + InputName + "\n"
        elif(ModeIndex==1):
            outstr += "#Positive Test " + InputName + "\n"
        else:
            outstr += "#Sweep of " + InputName + " from " + str(StartVolts) + " to " + str(MaxVolts)  + " in " + str(VoltInc) + " increments\n"
        outstr += "\n"
        
        Voltage = StartVolts
        
        if(ModeIndex==0):
            outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.5\n"
            outstr += "J0_01_3A_LOAD = 1 : NULL : WAIT = 0.5\n"
        else:
            outstr += "J0_01_3A_LOAD = 0 : NULL : WAIT = 0.5\n"
            outstr += "PwrSetVoltage = " + str(to_decivolts(Voltage)) + " : NULL : WAIT = 0.1\n"
            outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.5\n"
            outstr += "#test power supply\n"
            if(ModeIndex>1):
                outstr += "NULL : MeterVolts = " + str(StartVolts) + " | " + Tol  + " | 1\n"
            else:
                outstr += "NULL : MeterVolts = " + str(StartVolts) + " | " + Tol  + " | 1\n"
                
        outstr += "#switch input to load line\n"
        outstr += OutputConnector + " = 1 : NULL : WAIT = 0.1\n"
        outstr += "\n"
        outstr += "\n"
        
        while Voltage <= (FaultLimit + VoltInc):
            outstr += "#set power supply\n"
            outstr += "PwrSetVoltage = " + str(to_decivolts(Voltage)) + " : NULL : WAIT = 0.1\n"
            outstr += "#test power supply\n"
            if(ModeIndex>0):
                outstr += "NULL : MeterVolts = " + str(Voltage) + " | " + Tol  + " | 1\n"
            outstr += "#test feedback\n"    
            if(Voltage >= FaultLimit):
                VoltInc = SVoltInc
                if(ModeIndex>1):
                    outstr += "NULL : " + Feedback + " = 0 | 0.1 | 0.1\n"
                    outstr += "NULL : " + Status + " = 2 | 0.1 | 0.1\n"
                else:
                    outstr += "NULL : " + Status + " = 1 | 0.1 | 0.1\n"
            else:
                VoltInc = BVoltInc
                if(ModeIndex>1):
                    outstr += "NULL : " + Feedback + " = " + str(Voltage) + " | " + Tol + " | 0.1\n" 
                    outstr += "NULL : " + Status + " = 0 | 0.1 | 0.1\n"
                else:
                    outstr += "NULL : " + Status + " = 1 | 0.1 | 0.1\n"
            Voltage += VoltInc
        
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

# outstr += "NULL : Input_1A = 2 | 0.1 | 0.1\n"
# outstr += "NULL : Input_1B = 2 | 0.1 | 0.1\n"
# outstr += "NULL : Input_3A = 2 | 0.1 | 0.1\n"
# outstr += "NULL : Input_3B = 2 | 0.1 | 0.1\n"
# outstr += "NULL : Input_5A = 2 | 0.1 | 0.1\n"
# outstr += "NULL : Input_5B = 2 | 0.1 | 0.1\n"
# outstr += "NULL : Input_7A = 2 | 0.1 | 0.1\n"
# outstr += "NULL : Input_7B = 2 | 0.1 | 0.1\n"
# outstr += "NULL : Input_9A = 2 | 0.1 | 0.1\n"
# outstr += "NULL : Input_9B = 2 | 0.1 | 0.1\n"

#outstr += "#switch out o-scope\n"
outstr += "J4_03 = 0 : NULL : WAIT = 0.2\n"
outstr += "SAVE\n"
outstr += "END\n"

f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



print(TestName + ".pat")
