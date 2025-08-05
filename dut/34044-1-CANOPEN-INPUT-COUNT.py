#from input_count_write import WriteCountTest
#from input_count_write import WriteMaxCountTest
def unsigned_to_signed(value, bit_size):
    # Calculate the maximum value for the given bit size
    max_value = 2 ** bit_size
    # If the value exceeds the signed range, adjust it
    if value >= max_value // 2:
        value -= max_value
    return value
    
def WriteCountTest(outstr, SetPointValue, MaxCount, RolloverMode, InterlockMode):
    InPortAMode = 8
    InPortBMode = 0
    OutPortAMode = 3
    OutPortBMode = 3

    OutputMode = str(int(OutPortAMode | (OutPortBMode << 4)))
    InputMode = str(int(InPortAMode | (InPortBMode << 4)))
    
    print((OutputMode), (InputMode))

    PortIndex = 0
    
    while PortIndex <= 1:
        #outstr += "sdo[0x2003][1] = " + str(0x05) + " : NULL : WAIT = 0.1\n"#fCnt1Enabled, fCnt1Reset
        #outstr += "sdo[0x2003][2] = " + str(0x05) + " : NULL : WAIT = 0.1\n"#fCnt2Enabled, fCnt2Reset

        #outstr += "sdo[0x3001][1] = " + str(0x00) + " : NULL : WAIT = 0.1\n"#Set_Point_7A
        #outstr += "sdo[0x3001][2] = " + str(0x00) + " : NULL : WAIT = 0.1\n"#Set_Point_8A
        
        BitEnable = 0x01
        BitReset = 0x04
        BitOverflow = 0x10
        BitOutilock = 0x40
        
        if(PortIndex==0):
            outstr += "#7A/3A\n"
            InterlockOutput = "sdo[0x6411][5]"
            InterlockConnector = "J2_05" 
            InputConnector = "J3_01"
            InputName = "sdo[0x6000][1]"
            InputVal = 0x10
            Count = "sdo[0x6401][9]"
            SetPoint = "sdo[0x3001][1]"
            SetPointSet = "sdo[0x6401][10]"
            CntfigBits = "sdo[0x2003][1]"

        if(PortIndex==1):
            outstr += "#8A/3A\n"
            InterlockOutput = "sdo[0x6411][7]"
            InterlockConnector = "J2_07" 
            InputConnector = "J3_03"
            InputName = "sdo[0x6000][1]"
            InputVal = 0x40
            Count = "sdo[0x6401][11]"
            SetPoint = "sdo[0x3001][2]"
            SetPointSet = "sdo[0x6401][12]"
            CntfigBits = "sdo[0x2003][2]"
            
        outstr += "#disable global modes\n"
        outstr += "sdo[0x2000][3] = 0 : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2000][4] = 0 : NULL : WAIT = 0.1\n"
        outstr += "\n"
        outstr += "#configure Port Modes\n"
        outstr += "sdo[0x2001][1] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][2] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][3] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][4] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][5] = " + str(InputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][6] = " + str(InputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][7] = " + str(InputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][8] = " + str(InputMode) + " : NULL : WAIT = 0.1\n"

        outstr += "\n"
        
        #outstr += "Command = 83, MODE1A = " + OutPortAMode + ", MODE1B = " + OutPortBMode + ", MODE2A = " + OutPortAMode + ", MODE2B = " + OutPortBMode + ", MODE3A = " + OutPortAMode + ", MODE3B = " + OutPortBMode + ", MODE4A = " + OutPortAMode + ", MODE4B = " + OutPortBMode + " : NULL : WAIT = 0.2\n"
        #outstr += "Command = 83, MODE5A = " + InPortAMode + ", MODE5B = " + InPortBMode + ", MODE6A = " + InPortAMode + ", MODE6B = " + InPortBMode + ", MODE7A = " + InPortAMode + ", MODE7B = " + InPortBMode + " : NULL : WAIT = 0.2\n"
        #outstr += "\n"
        #outstr += "Command = 84, MODE8A = " + InPortAMode + ", MODE8B = " + InPortBMode + " : NULL : WAIT = 0.2\n"
        
        #outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2\n"
        #outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2\n"

        # if(PortIndex==0):
            # outstr += "Command = 87, Counter_7A_Reset = 1, Counter_8A_Reset = 1, Counter_7A_ON_OFF = 1, Counter_8A_ON_OFF = 1, LowBYTE_Counter_7A_Setpoint = " + str(SetPointValue) + ", LowBYTE_Counter_8A_Setpoint = 0 : NULL : WAIT = 0.2\n"

        # if(PortIndex==1):
            # outstr += "Command = 87, Counter_7A_Reset = 1, Counter_8A_Reset = 1, Counter_7A_ON_OFF = 1, Counter_8A_ON_OFF = 1, LowBYTE_Counter_7A_Setpoint = 0, LowBYTE_Counter_8A_Setpoint = " + str(SetPointValue) + " : NULL : WAIT = 0.2\n"
        
        #TODO: NEED TO DO BOTH A and B?
        ConfigValue = str((BitEnable|BitReset))
        
        if(RolloverMode):
            outstr += "#config RolloverMode\n"
            ConfigValue = str((BitEnable|BitReset|BitOverflow))
            
        if(InterlockMode):
            outstr += "#config InterlockMode\n"
            ConfigValue = str(int(ConfigValue)|BitOutilock)
        
        outstr += "#config counter\n"
        outstr += CntfigBits + " = " + ConfigValue + " : NULL : WAIT = 0.1\n"
        outstr += "\n"
        # if(RolloverMode==0):
            # outstr += "Command = 87, Counter_7A_Enable_Overflow = 0, Counter_8A_Enable_Overflow = 0 : NULL : WAIT = 0.2\n"
        # else:
            # if(PortIndex==0):
                # outstr += "Command = 87, Counter_7A_Enable_Overflow = 1, Counter_8A_Enable_Overflow = 0 : NULL : WAIT = 0.2\n"
            # if(PortIndex==1):
                # outstr += "Command = 87, Counter_7A_Enable_Overflow = 0, Counter_8A_Enable_Overflow = 1 : NULL : WAIT = 0.2\n"
                
        # if(InterlockMode==0):
            # outstr += "Command = 87, Counter_7A_Enable_OUT3A = 0, Counter_8A_Enable_OUT4A = 0 : NULL : WAIT = 0.2\n"
        # else:
            # outstr += "Command = 87, Counter_7A_Enable_OUT3A = 1, Counter_8A_Enable_OUT4A = 1 : NULL : WAIT = 0.2\n"
        outstr += "#config SetPointValue\n"    
        outstr += SetPoint + " = " + str(SetPointValue) + " : NULL : WAIT = 0.1\n"
        outstr += "\n"
        outstr += "#verify setpoint\n"
        outstr += "NULL : " + SetPointSet + " = " + str(SetPointValue) + " | 0 | 0.1\n"
        outstr += "#switch in and on interlock output\n"
        outstr += InterlockConnector + " = 1 : NULL : WAIT = 0.2\n"
        outstr += InterlockOutput + " = 1000 : NULL : WAIT = 0.2\n"
        outstr += "#verify voltage\n"
        outstr += "NULL : MeterVolts = 14 | 1 | 0.1\n"
        outstr += "#switch out interlock output\n"
        outstr += InterlockConnector + " = 0 : NULL : WAIT = 0.2\n"
        outstr += "#switch in test supply\n"
        outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2\n"
        outstr += "#switch in input\n"
        outstr += InputConnector + " = 1 : NULL : WAIT = 0.2\n"
        outstr += "\n"
        
        outstr += "#testing count events\n"
        TheCount = 0

        while TheCount <= MaxCount:
            TheCount += 1
            outstr += "PwrSetVoltage = 140 : NULL\n"
            if(SetPointValue > 0):
                if((TheCount > SetPointValue)&(RolloverMode==0)):
                    outstr += "#verify count WITHOUT RolloverMode 1 - " + str(SetPointValue) + "\n"
                    outstr += "NULL : " + Count + " = " + str(SetPointValue) + " | 0 | 0.1\n" 
                else:
                    outstr += "#verify count WITH RolloverMode 1 - " + str(SetPointValue) + "\n"
                    outstr += "NULL : " + Count + " = " + str(TheCount) + " | 0 | 0.1\n"
            else:
                outstr += "#verify count - " + str(SetPointValue) + "\n"
                outstr += "NULL : " + Count + " = " + str(TheCount) + " | 0 | 0.1\n"
            outstr += "PwrSetVoltage = 0 : NULL\n"
            outstr += "NULL : " + InputName + " = 0 | 0 | 0.1\n"
            if(TheCount == SetPointValue):
                outstr += "#verify output status at setpoint\n"
                outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2\n"
                outstr += InputConnector + " = 0 : NULL : WAIT = 0.2\n"
                outstr += InterlockConnector + " = 1 : NULL : WAIT = 0.2\n"
                if(InterlockMode==0):
                    outstr += "NULL : MeterVolts = 14 | 1 | 0.1\n"
                else:
                    outstr += "NULL : MeterVolts = 0 | 1 | 0.1\n"
                outstr += InterlockConnector + " = 0 : NULL : WAIT = 0.2\n"
                outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2\n"
                outstr += InputConnector + " = 1 : NULL : WAIT = 0.2\n"
            outstr += "\n"
            
        outstr += "#switch out input\n"
        outstr += InputConnector + " = 0 : NULL : WAIT = 0.2\n"
        outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2\n"
        outstr += "#turn off output and switch out is off\n"
        outstr += InterlockOutput + " = 0 : NULL : WAIT = 0.2\n"
        #outstr += "#disable counter\n"
        #outstr += CntfigBits + " = " + str((BitEnable)) + " : NULL : WAIT = 0.1\n"
        #outstr += "Command = 87, " + Enable + " = 1 : NULL : WAIT = 0.2\n"

        if(RolloverMode==0):
            outstr += "#verify count WITHOUT RolloverMode 2 - " + str(SetPointValue) + "\n"
            outstr += "NULL : " + Count + " = " + str(SetPointValue) + " | 0 | 0.1\n" 
        else:
            outstr += "#verify count WITH RolloverMode 2 - " + str(SetPointValue) + "\n"
            outstr += "NULL : " + Count + " = " + str(TheCount) + " | 0 | 0.1\n" 

        outstr += "#send counter reset\n"
        outstr += CntfigBits + " = " + str((BitReset)) + " : NULL : WAIT = 0.1\n"
        #outstr += "Command = 87, " + Reset + " = 1 : NULL : WAIT = 0.2\n"

        outstr += "#verify count reset\n"
        outstr += "NULL : " + Count + " = 0 | 0 | 0.1\n" 
        #outstr += "#verify setpoint\n"
        #outstr += "NULL : " + SetPoint + " = " + str(MaxCount) + " | 0 | 0.1\n"
        outstr += "\n"
        #clear setpoint (used to be prior to test)
        outstr += SetPoint + " = " + str(0) + " : NULL : WAIT = 0.1\n"
        PortIndex += 1
        
    outstr += "#switch out load line\n"
    outstr += InputConnector + " = 0 : NULL : WAIT = 0.1\n"
    return outstr

def WriteMaxCountTest(outstr, SetPointValue, MaxCount, RolloverMode, InterlockMode):
    InPortAMode = 8
    InPortBMode = 0
    OutPortAMode = 3
    OutPortBMode = 3

    OutputMode = str(int(OutPortAMode | (OutPortBMode << 4)))
    InputMode = str(int(InPortAMode | (InPortBMode << 4)))
    
    print((OutputMode), (InputMode))

    PortIndex = 0
    
    while PortIndex <= 1:
        
        BitEnable = 0x01
        BitReset = 0x04
        BitOverflow = 0x10
        BitOutilock = 0x40
        
        if(PortIndex==0):
            InterlockStatus = "sdo[0x5001][4]"
            InterlockVal = 0x01
            #"PWM_CTRL_3A" 
            InterlockOutput = "sdo[0x6411][5]"
            InterlockConnector = "J2_05" 
            InputConnector = "J3_01"
            InputName = "sdo[0x6000][1]"
            InputVal = 0x10
            Count = "sdo[0x6401][9]"
            SetPoint = "sdo[0x3001][1]"
            SetPointSet = "sdo[0x6401][10]"
            CntfigBits = "sdo[0x2003][1]"

        if(PortIndex==1):
            InterlockStatus = "sdo[0x5001][4]"
            InterlockVal = 0x10
            #"PWM_CTRL_4A" 
            InterlockOutput = "sdo[0x6411][7]"
            InterlockConnector = "J2_07" 
            InputConnector = "J3_03"
            InputName = "sdo[0x6000][1]"
            InputVal = 0x40
            Count = "sdo[0x6401][11]"
            SetPoint = "sdo[0x3001][2]"
            SetPointSet = "sdo[0x6401][12]"
            CntfigBits = "sdo[0x2003][2]"
            
            
        outstr += "#disable global modes\n"
        outstr += "sdo[0x2000][3] = 0 : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2000][4] = 0 : NULL : WAIT = 0.1\n"
        outstr += "\n"
        outstr += "#configure Port Modes\n"
        outstr += "sdo[0x2001][1] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][2] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][3] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][4] = " + str(OutputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][5] = " + str(InputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][6] = " + str(InputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][7] = " + str(InputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "sdo[0x2001][8] = " + str(InputMode) + " : NULL : WAIT = 0.1\n"
        outstr += "\n"
        
        
        outstr += "\n"
        ConfigValue = str((BitEnable|BitReset))
        
        if(RolloverMode==1):
            ConfigValue = str((BitEnable|BitReset|BitOverflow))
            
        if(InterlockMode==1):
            ConfigValue = str(int(ConfigValue)|BitOutilock)
        
        outstr += "#config counter\n"
        outstr += CntfigBits + " = " + ConfigValue + " : NULL : WAIT = 0.1\n"
        outstr += "\n"
        
        # if(PortIndex==0):
            # outstr += "Command = 87, Counter_7A_Reset = 1, Counter_8A_Reset = 1, Counter_7A_ON_OFF = 1, Counter_8A_ON_OFF = 1, LowBYTE_Counter_7A_Setpoint = " + str(SetPointValue) + ", LowBYTE_Counter_8A_Setpoint = 0 : NULL : WAIT = 0.2\n"
        # if(PortIndex==1):
            # outstr += "Command = 87, Counter_7A_Reset = 1, Counter_8A_Reset = 1, Counter_7A_ON_OFF = 1, Counter_8A_ON_OFF = 1, LowBYTE_Counter_7A_Setpoint = 0, LowBYTE_Counter_8A_Setpoint = " + str(SetPointValue) + " : NULL : WAIT = 0.2\n"
        
        # if(RolloverMode==0):
            # outstr += "Command = 87, Counter_7A_Enable_Overflow = 0, Counter_8A_Enable_Overflow = 0 : NULL : WAIT = 0.2\n"
        # else:
            # if(PortIndex==0):
                # outstr += "Command = 87, Counter_7A_Enable_Overflow = 1, Counter_8A_Enable_Overflow = 0 : NULL : WAIT = 0.2\n"
            # if(PortIndex==1):
                # outstr += "Command = 87, Counter_7A_Enable_Overflow = 0, Counter_8A_Enable_Overflow = 1 : NULL : WAIT = 0.2\n"
                
        # if(InterlockMode==0):
            # outstr += "Command = 87, Counter_7A_Enable_OUT3A = 0, Counter_8A_Enable_OUT4A = 0 : NULL : WAIT = 0.2\n"
        # else:
            # outstr += "Command = 87, Counter_7A_Enable_OUT3A = 1, Counter_8A_Enable_OUT4A = 1 : NULL : WAIT = 0.2\n"
            
        outstr += "#config SetPointValue - " + str(SetPointValue) + "\n" 
        outstr += SetPoint + " = " + str(SetPointValue) + " : NULL : WAIT = 0.1\n"
        outstr += "#verify setpoint - " +  str(SetPointValue) + "\n"
        outstr += "NULL : " + SetPointSet + " = " + str(-1) + " | 0 | 0.1\n"
        outstr += "#switch in and on interlock output\n"
        outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2\n"
        outstr += InterlockConnector + " = 1 : NULL : WAIT = 0.2\n"
        outstr += InterlockOutput + " = 1000 : NULL : WAIT = 0.2\n"
        outstr += "#verify voltage\n"
        outstr += "NULL : MeterVolts = 14 | 1 | 0.1\n"
        outstr += "#switch out interlock output\n"
        outstr += InterlockConnector + " = 0 : NULL : WAIT = 0.2\n"
        outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 0.2\n"
        outstr += "#switch in test supply\n"
        #outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2\n"
        outstr += "#switch in input\n"
        outstr += InputConnector + " = 1 : NULL : WAIT = 0.2\n"
        outstr += "\n"
        
        outstr += "\n"
        outstr += "#-----setup pat-----\n"
        outstr += "#setup freq\n"
        outstr += "J0_11_FREQ_GEN = 1 : NULL : WAIT = 1\n"
        outstr += "\n"

        outstr += "#testing max count\n"
        
        ExpFreq = 3000
        ExpDuty = 50
        #outstr += "PAUSE- " + InputName + " SET FREQ_GEN TO " + str(ExpFreq) + "Hz " + str(ExpDuty) + "% Duty\n"
        outstr += "#wait for signal gen to max count\n"
        outstr += "NULL : NULL : WAIT = 20\n"
        outstr += "NULL : " + InterlockStatus + " = 0 | 0 | 0.4\n" 
        outstr += "\n"

        outstr += "#switch out input\n"
        outstr += InputConnector + " = 0 : NULL : WAIT = 0.2\n"
        #outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2\n"
        outstr += "J0_11_FREQ_GEN = 0 : NULL : WAIT = 1\n"
        outstr += "#turn off output and switch out is off\n"
        outstr += InterlockOutput + " = 0 : NULL : WAIT = 0.2\n"
        outstr += "#disable counter\n"
        outstr += CntfigBits + " = " + str((BitEnable)) + " : NULL : WAIT = 0.2\n"
        #outstr += "Command = 87, " + Enable + " = 1 : NULL : WAIT = 0.2\n"
        #outstr += "Command = 0, " + Enable + " = 0 : NULL\n"
        outstr += "#verify count\n"
        # if(RolloverMode==1):
            # outstr += "NULL : " + Count + " = " + str(SetPointValue) + " | 0 | 0.1\n" 
        # else:
            # outstr += "NULL : " + Count + " = " + str(TheCount) + " | 0 | 0.1\n" 
        outstr += "NULL : " + Count + " = " + str(-1) + " | 0 | 0.1\n" 
        outstr += "#send counter reset\n"
        outstr += CntfigBits + " = " + str((BitReset)) + " : NULL : WAIT = 0.2\n"
        #outstr += "Command = 87, " + Reset + " = 1 : NULL : WAIT = 0.2\n"
        #outstr += "Command = 0, " + Reset + " = 0 : NULL\n"
        outstr += "#verify count reset\n"
        outstr += "NULL : " + Count + " = 0 | 0 | 0.1\n" 
        outstr += "\n"
        #clear setpoint (used to be prior to test)
        outstr += SetPoint + " = " + str(0) + " : NULL : WAIT = 0.1\n"
        PortIndex += 1
        
    outstr += "#switch out load line\n"
    outstr += InputConnector + " = 0 : NULL : WAIT = 0.1\n"
    return outstr
    
    
PortIndex = 0
ModeIndex = 0
PortMode = 0

#global setup
TestName = "34044-1-CANOPEN-INPUT-COUNT"
datafile = TestName + ".pat"

outstr = ""
outstr += "#34044-1\n"
outstr += "#Verion 0.0\n"
outstr += "#input test\n"
outstr += "UUT_EDS = 37000-561.eds\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 34044-----\n"

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
outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1\n"
outstr += "\n"

outstr += "OPERATIONAL\n"

MaxCount = 5
SetPoint = 5
RolloverMode = 0
InterlockMode = 1
outstr += "#****** NO OVERFLOW, SET POINT = 5, MAX COUNT = 5, OUTPUT INTERLOCK\n"
outstr = WriteCountTest(outstr, SetPoint, MaxCount, RolloverMode, InterlockMode)

MaxCount = 5
SetPoint = 3
RolloverMode = 1
InterlockMode = 0
outstr += "#****** OVERFLOW, SET POINT = 3, MAX COUNT = 5, NO OUTPUT INTERLOCK\n"
outstr = WriteCountTest(outstr, SetPoint, MaxCount, RolloverMode, InterlockMode)

MaxCount = 5
SetPoint = 2
RolloverMode = 1
InterlockMode = 1
outstr += "#****** OVERFLOW, SET POINT = 3, MAX COUNT = 5, OUTPUT INTERLOCK\n"
outstr = WriteCountTest(outstr, SetPoint, MaxCount, RolloverMode, InterlockMode)

MaxCount = 5
SetPoint = 0
RolloverMode = 1
InterlockMode = 0
outstr += "#****** OVERFLOW, SET POINT = 0, MAX COUNT = 5, NO OUTPUT INTERLOCK\n"
outstr = WriteCountTest(outstr, SetPoint, MaxCount, RolloverMode, InterlockMode)

MaxCount = 65535
SetPoint = 65535
RolloverMode = 0
InterlockMode = 1
outstr += "#****** MAX COUNT\n"
outstr = WriteMaxCountTest(outstr, SetPoint, MaxCount, RolloverMode, InterlockMode)

outstr += "#switch out power supply\n"
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1\n"

outstr += "PRE_OPERATIONAL\n"

outstr += "SAVE\n"
outstr += "END\n"

f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)




