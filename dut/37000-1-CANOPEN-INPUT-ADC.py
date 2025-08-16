PortMode = 0

#global setup
TestName = "37000-1-CANOPEN-INPUT-ADC"
datafile = TestName + ".pat"

outstr = ""
outstr += "#37000-1\n"
outstr += "#Verion 0.0\n"
outstr += "#input test\n"
outstr += "UUT_EDS = 37000-561.eds\n"
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


PortIndex = 0
ModeIndex = 0


ModeIndex = 0
MaxMode = 2

while ModeIndex <= MaxMode:
    
    if(ModeIndex==0):#5VDC
        PortMode = 64#0x40
        StartVolts = 1
        MaxVolts = 5
        
        #Classic limit
        FaultLimit = 5.5

        #Enhanced limit
        #FaultLimit = 5.6
        
        BVoltInc = 0.5
        SVoltInc = 0.1
        
    if(ModeIndex==1):#10VDC
        PortMode = 80#0x50
        StartVolts = 1
        MaxVolts = 10
        
        #Classic limit
        FaultLimit = 10.5
        
        #Enhanced limit
        #FaultLimit = 11.1
        
        BVoltInc = 0.5
        SVoltInc = 0.1
        
    if(ModeIndex==2):#32VDC
        PortMode = 96#0x60
        StartVolts = 1
        MaxVolts = 32
        
        #Classic limit
        FaultLimit = 34
        
        #Enhanced limit
        #FaultLimit = 36.5
        
        BVoltInc = 0.5
        SVoltInc = 0.1
        
    while PortIndex <= 3:
        outstr += "#cycle IGN to clear any faults\n"
        outstr += "RLY_K1 = 1 : NULL : WAIT = 1\n"
        outstr += "RLY_K1 = 0 : NULL : WAIT = 0.2\n"
        
        VoltInc = BVoltInc
        
        ErrorCount = "sdo[0x1003][0]"
        Status = "sdo[0x1001]"
        
        if(PortIndex==0):
            OutputConnector = "J2_10"
            InputName = "Input_5B"
            Feedback = "sdo[0x6401][2]"
            
        if(PortIndex==1):
            OutputConnector = "J2_12"
            InputName = "Input_6B"
            Feedback = "sdo[0x6401][4]"
            
        if(PortIndex==2):
            OutputConnector = "J3_02"
            InputName = "Input_7B"
            Feedback = "sdo[0x6401][6]"
            
        if(PortIndex==3):
            OutputConnector = "J3_04"
            InputName = "Input_8B"
            Feedback = "sdo[0x6401][8]"

        outstr += "#-----setup 34044-----\n"
        outstr += "sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL : WAIT = 0.1\n"
        outstr += "#disable global modes\n"
        outstr += "sdo[0x2000][3] = 0 : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2000][4] = 0 : NULL : WAIT = 0.1\n"

        outstr += "#configure Port Modes\n"
        outstr += "sdo[0x2001][5] = " + str(PortMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][6] = " + str(PortMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][7] = " + str(PortMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][8] = " + str(PortMode) + " : NULL : WAIT = 0.1\n"
        
        outstr += "#verify fault clear\n"
        outstr += "NULL : " + Status + " = 0 | 0.1 | 0.1\n"
        
        #--------------------
        outstr += "#set power supply and wait\n"
        outstr += "PwrSetVoltage = " + str(int(StartVolts * 10)) + " : NULL : WAIT = 0.1\n"
        outstr += "#test power supply\n"
        outstr += "NULL : MeterVolts = " + str(StartVolts) + " | 0.155 | 0.1\n"

        outstr += "#switch input to load line\n"
        outstr += OutputConnector + " = 1 : NULL : WAIT = 0.1\n"
        outstr += "\n"
        outstr += "#Sweep of " + InputName + " from " + str(StartVolts) + " to " + str(MaxVolts)  + " in " + str(VoltInc) + " increments\n"
        outstr += "\n"

        Voltage = StartVolts
        
        while Voltage <= (FaultLimit + VoltInc):
            outstr += "#set power supply\n"
            outstr += "PwrSetVoltage = " + str(int(Voltage * 10)) + " : NULL : WAIT = 0.1\n"
            outstr += "#test power supply\n"
            outstr += "NULL : MeterVolts = " + str(Voltage) + " | 0.155 | 0.1\n"
            outstr += "#test feedback\n"    
            if(Voltage >= FaultLimit):
                VoltInc = SVoltInc
                outstr += "NULL : " + Feedback + " = 0 | 0.1 | 0.1\n"
                outstr += "NULL : " + Status + " = 1 | 0.1 | 0.1\n"
                outstr += "NULL : " + ErrorCount + " = 1 | 0.1 | 0.1\n"
            else:
                VoltInc = BVoltInc
                outstr += "NULL : " + Feedback + " = " + str(int(Voltage * 1000)) + " | 155 | 0.1\n" 
                outstr += "NULL : " + Status + " = 0 | 0.1 | 0.1\n"
                outstr += "NULL : " + ErrorCount + " = 0 | 0.1 | 0.1\n"
            Voltage += VoltInc
        
        outstr += "\n"
        outstr += "#Finished with port\n"
        outstr += "#switch out input\n"
        outstr += OutputConnector + " = 0 : NULL : WAIT = 0.1\n"
        PortIndex += 1

        outstr += "\n"

        #outstr += "PAUSE- CYCLE POWER TO CLEAR FAULT\n"
        #outstr += "#cycle IGN\n"
        #outstr += "RLY_K1 = 1 : NULL : WAIT = 1\n"
        #outstr += "RLY_K1 = 0 : NULL : WAIT = 0.2\n"
        
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




        # #!!!!!!!!!!!!!!!!!!!!!!!!!!
        # outstr += "#END TEST EARLY\n"
        # outstr += "#switch out load line, set current\n"
        # outstr += OutputConnector + " = 0 : NULL : WAIT = 0.1\n"
        # outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
        # outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
        # outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
        # outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1\n"

        # outstr += "#tear down PS1\n"
        # outstr += "PwrSetCurrent = 0 : NULL : WAIT = 0.1\n"
        # outstr += "PwrSetVoltage = 0 : NULL : WAIT = 0.1\n"
        # outstr += "PwrEnable = 0 : NULL : WAIT = 0.1\n"
        # outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1\n"
        # outstr += "PwrRemote = 0 : NULL : WAIT = 0.1\n"
        
        # outstr += "#switch out o-scope\n"
        # outstr += "J4_03 = 0 : NULL : WAIT = 0.2\n"
        # outstr += "SAVE\n"
        # outstr += "END\n"

        # f = open(datafile, 'w')
        # f.write(outstr)
        # f.close()    
        # print(outstr)
        # quit()
        # #!!!!!!!!!!!!!!!!!!!!!!!!!!