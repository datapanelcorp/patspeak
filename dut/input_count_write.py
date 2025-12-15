def WriteCountTest(outstr, SetPointValue, MaxCount, RolloverMode, InterlockMode):
    InPortAMode = "8"
    InPortBMode = "0"
    OutPortAMode = "3"
    OutPortBMode = "3"

    PortIndex = 0
    
    while PortIndex <= 1:

        if(PortIndex==0):
            InterlockOutput = "PWM_CTRL_3A" 
            InterlockConnector = "J2_05" 
            InputConnector = "J3_01"
            InputName = "Input_7A"
            Status = "Input_7A"
            Count = "Hertz_Count_Input7A"
            SetPoint = "DutyCycle_SP_Input7A"
            Reset = "Counter_7A_Reset"
            Enable = "Counter_7A_ON_OFF"
            
        if(PortIndex==1):
            InterlockOutput = "PWM_CTRL_4A" 
            InterlockConnector = "J2_07" 
            InputConnector = "J3_03"
            InputName = "Input_8A"
            Status = "Input_8A"
            Count = "Hertz_Count_Input8A"
            SetPoint = "DutyCycle_SP_Input8A"
            Reset = "Counter_8A_Reset"
            Enable = "Counter_8A_ON_OFF"
            
        outstr += "#-----setup 34044-----\n"
        outstr += "#configure Port Modes\n"
        outstr += "Command = 83, MODE1A = " + OutPortAMode + ", MODE1B = " + OutPortBMode + ", MODE2A = " + OutPortAMode + ", MODE2B = " + OutPortBMode + ", MODE3A = " + OutPortAMode + ", MODE3B = " + OutPortBMode + ", MODE4A = " + OutPortAMode + ", MODE4B = " + OutPortBMode + " : NULL : WAIT = 0.2\n"
        outstr += "Command = 83, MODE5A = " + InPortAMode + ", MODE5B = " + InPortBMode + ", MODE6A = " + InPortAMode + ", MODE6B = " + InPortBMode + ", MODE7A = " + InPortAMode + ", MODE7B = " + InPortBMode + " : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL : WAIT = 0.2\n"

        outstr += "\n"
        outstr += "Command = 84, MODE8A = " + InPortAMode + ", MODE8B = " + InPortBMode + " : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, MODE8A = 0, MODE8B = 0 : NULL\n"
        outstr += "\n"
        
        outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2\n"
        outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"
        
        outstr += "\n"
        if(PortIndex==0):
            outstr += "Command = 87, Counter_7A_Reset = 1, Counter_8A_Reset = 1, Counter_7A_ON_OFF = 1, Counter_8A_ON_OFF = 1, LowBYTE_Counter_7A_Setpoint = " + str(SetPointValue) + ", LowBYTE_Counter_8A_Setpoint = 0 : NULL : WAIT = 0.2\n"
        if(PortIndex==1):
            outstr += "Command = 87, Counter_7A_Reset = 1, Counter_8A_Reset = 1, Counter_7A_ON_OFF = 1, Counter_8A_ON_OFF = 1, LowBYTE_Counter_7A_Setpoint = 0, LowBYTE_Counter_8A_Setpoint = " + str(SetPointValue) + " : NULL : WAIT = 0.2\n"
        
        if(RolloverMode==0):
            outstr += "Command = 87, Counter_7A_Enable_Overflow = 0, Counter_8A_Enable_Overflow = 0 : NULL : WAIT = 0.2\n"
        else:
            if(PortIndex==0):
                outstr += "Command = 87, Counter_7A_Enable_Overflow = 1, Counter_8A_Enable_Overflow = 0 : NULL : WAIT = 0.2\n"
            if(PortIndex==1):
                outstr += "Command = 87, Counter_7A_Enable_Overflow = 0, Counter_8A_Enable_Overflow = 1 : NULL : WAIT = 0.2\n"
                
        if(InterlockMode==0):
            outstr += "Command = 87, Counter_7A_Enable_OUT3A = 0, Counter_8A_Enable_OUT4A = 0 : NULL : WAIT = 0.2\n"
        else:
            outstr += "Command = 87, Counter_7A_Enable_OUT3A = 1, Counter_8A_Enable_OUT4A = 1 : NULL : WAIT = 0.2\n"
            
        outstr += "#clear multiplex\n"
        outstr += "Command = 0, Counter_7A_Reset = 0, Counter_8A_Reset = 0, Counter_7A_ON_OFF = 0, Counter_8A_ON_OFF = 0, LowBYTE_Counter_7A_Setpoint = 0, LowBYTE_Counter_8A_Setpoint = 0 : NULL\n"
        outstr += "Command = 0, Counter_7A_Enable_OUT3A = 0, Counter_8A_Enable_OUT4A = 0, Counter_7A_Enable_Overflow = 0, Counter_8A_Enable_Overflow = 0 : NULL\n"
        outstr += "\n"
        outstr += "#verify setpoint\n"
        outstr += "NULL : " + SetPoint + " = " + str(SetPointValue) + " | 0 | 0.1\n"
        # outstr += "#switch in and on interlock output\n"
        # outstr += InterlockConnector + " = 1 : NULL : WAIT = 0.2\n"
        # outstr += InterlockOutput + " = 1000 : NULL : WAIT = 0.2\n"
        # outstr += "#verify voltage\n"
        # outstr += "NULL : MeterVolts = 14 | 1 | 0.1\n"
        # outstr += "#switch out interlock output\n"
        # outstr += InterlockConnector + " = 0 : NULL : WAIT = 0.2\n"
        # outstr += "#switch in test supply\n"
        outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2\n"
        outstr += "PwrSetVoltage = 140 : NULL : WAIT = 1\n"
        outstr += "#switch in input\n"
        outstr += InputConnector + " = 1 : NULL : WAIT = 0.2\n"
        outstr += "\n"
        
        outstr += "#testing count events\n"
        TheCount = 0

        while TheCount <= MaxCount:
            TheCount += 1
            outstr += "PwrSetVoltage = 140 : NULL\n"
            outstr += "J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2\n"
            if(SetPointValue > 0):
                if((TheCount > SetPointValue)&(RolloverMode==0)):
                    outstr += "#verify no rollover\n"
                    outstr += "NULL : " + Count + " = " + str(SetPointValue) + " | 0 | 0.1\n" 
                else:
                    outstr += "#verify count\n"
                    outstr += "NULL : " + Count + " = " + str(TheCount) + " | 0 | 0.1\n"
            else:
                outstr += "#verify count\n"
                outstr += "NULL : " + Count + " = " + str(TheCount) + " | 0 | 0.1\n"
            outstr += "PwrSetVoltage = 140 : NULL\n"
            outstr += "J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2\n"
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
        outstr += "#disable counter\n"
        outstr += "Command = 87, " + Enable + " = 1 : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, " + Enable + " = 0 : NULL\n"
        outstr += "#verify count\n"
        if(RolloverMode==0):
            outstr += "NULL : " + Count + " = " + str(SetPointValue) + " | 0 | 0.1\n" 
        else:
            outstr += "NULL : " + Count + " = " + str(TheCount) + " | 0 | 0.1\n" 
        outstr += "#send counter reset\n"
        outstr += "Command = 87, " + Reset + " = 1 : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, " + Reset + " = 0 : NULL\n"
        outstr += "#verify count reset\n"
        outstr += "NULL : " + Count + " = 0 | 0 | 0.1\n" 
        #outstr += "#verify setpoint\n"
        #outstr += "NULL : " + SetPoint + " = " + str(MaxCount) + " | 0 | 0.1\n"
        outstr += "\n"
        PortIndex += 1
        
    outstr += "#switch out load line\n"
    outstr += InputConnector + " = 0 : NULL : WAIT = 0.1\n"
    return outstr
    
    
    
    
def WriteMaxCountTest(outstr, SetPointValue, MaxCount, RolloverMode, InterlockMode):
    InPortAMode = "8"
    InPortBMode = "0"
    OutPortAMode = "3"
    OutPortBMode = "3"

    PortIndex = 0
    
    while PortIndex <= 1:

        if(PortIndex==0):
            InterlockStatus = "OutStat3A"
            InterlockOutput = "PWM_CTRL_3A"
            InterlockConnector = "J2_05" 
            InputConnector = "J3_01"
            InputName = "Input_7A"
            Status = "Input_7A"
            Count = "Hertz_Count_Input7A"
            SetPoint = "DutyCycle_SP_Input7A"
            Reset = "Counter_7A_Reset"
            Enable = "Counter_7A_ON_OFF"
            
        if(PortIndex==1):
            InterlockStatus = "OutStat4A"
            InterlockOutput = "PWM_CTRL_4A" 
            InterlockConnector = "J2_07" 
            InputConnector = "J3_03"
            InputName = "Input_8A"
            Status = "Input_8A"
            Count = "Hertz_Count_Input8A"
            SetPoint = "DutyCycle_SP_Input8A"
            Reset = "Counter_8A_Reset"
            Enable = "Counter_8A_ON_OFF"
            
        outstr += "#-----setup 34044-----\n"
        outstr += "#configure Port Modes\n"
        outstr += "Command = 83, MODE1A = " + OutPortAMode + ", MODE1B = " + OutPortBMode + ", MODE2A = " + OutPortAMode + ", MODE2B = " + OutPortBMode + ", MODE3A = " + OutPortAMode + ", MODE3B = " + OutPortBMode + ", MODE4A = " + OutPortAMode + ", MODE4B = " + OutPortBMode + " : NULL : WAIT = 0.2\n"
        outstr += "Command = 83, MODE5A = " + InPortAMode + ", MODE5B = " + InPortBMode + ", MODE6A = " + InPortAMode + ", MODE6B = " + InPortBMode + ", MODE7A = " + InPortAMode + ", MODE7B = " + InPortBMode + " : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL : WAIT = 0.2\n"

        outstr += "\n"
        outstr += "Command = 84, MODE8A = " + InPortAMode + ", MODE8B = " + InPortBMode + " : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, MODE8A = 0, MODE8B = 0 : NULL\n"
        outstr += "\n"
        
        outstr += "Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2\n"
        outstr += "Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL\n"
        
        outstr += "\n"
        if(PortIndex==0):
            outstr += "Command = 87, Counter_7A_Reset = 1, Counter_8A_Reset = 1, Counter_7A_ON_OFF = 1, Counter_8A_ON_OFF = 1, LowBYTE_Counter_7A_Setpoint = " + str(SetPointValue) + ", LowBYTE_Counter_8A_Setpoint = 0 : NULL : WAIT = 0.2\n"
        if(PortIndex==1):
            outstr += "Command = 87, Counter_7A_Reset = 1, Counter_8A_Reset = 1, Counter_7A_ON_OFF = 1, Counter_8A_ON_OFF = 1, LowBYTE_Counter_7A_Setpoint = 0, LowBYTE_Counter_8A_Setpoint = " + str(SetPointValue) + " : NULL : WAIT = 0.2\n"
        
        if(RolloverMode==0):
            outstr += "Command = 87, Counter_7A_Enable_Overflow = 0, Counter_8A_Enable_Overflow = 0 : NULL : WAIT = 0.2\n"
        else:
            if(PortIndex==0):
                outstr += "Command = 87, Counter_7A_Enable_Overflow = 1, Counter_8A_Enable_Overflow = 0 : NULL : WAIT = 0.2\n"
            if(PortIndex==1):
                outstr += "Command = 87, Counter_7A_Enable_Overflow = 0, Counter_8A_Enable_Overflow = 1 : NULL : WAIT = 0.2\n"
                
        if(InterlockMode==0):
            outstr += "Command = 87, Counter_7A_Enable_OUT3A = 0, Counter_8A_Enable_OUT4A = 0 : NULL : WAIT = 0.2\n"
        else:
            outstr += "Command = 87, Counter_7A_Enable_OUT3A = 1, Counter_8A_Enable_OUT4A = 1 : NULL : WAIT = 0.2\n"
            
        outstr += "#clear multiplex\n"
        outstr += "Command = 0, Counter_7A_Reset = 0, Counter_8A_Reset = 0, Counter_7A_ON_OFF = 0, Counter_8A_ON_OFF = 0, LowBYTE_Counter_7A_Setpoint = 0, LowBYTE_Counter_8A_Setpoint = 0 : NULL\n"
        outstr += "Command = 0, Counter_7A_Enable_OUT3A = 0, Counter_8A_Enable_OUT4A = 0, Counter_7A_Enable_Overflow = 0, Counter_8A_Enable_Overflow = 0 : NULL\n"
        outstr += "\n"
        outstr += "#verify setpoint\n"
        outstr += "NULL : " + SetPoint + " = " + str(SetPointValue) + " | 0 | 0.1\n"
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
        outstr += "Command = 87, " + Enable + " = 1 : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, " + Enable + " = 0 : NULL\n"
        outstr += "#verify count\n"
        if(RolloverMode==0):
            outstr += "NULL : " + Count + " = " + str(SetPointValue) + " | 0 | 0.1\n" 
        else:
            outstr += "NULL : " + Count + " = " + str(TheCount) + " | 0 | 0.1\n" 
        outstr += "#send counter reset\n"
        outstr += "Command = 87, " + Reset + " = 1 : NULL : WAIT = 0.2\n"
        outstr += "Command = 0, " + Reset + " = 0 : NULL\n"
        outstr += "#verify count reset\n"
        outstr += "NULL : " + Count + " = 0 | 0 | 0.1\n" 
        outstr += "\n"
        PortIndex += 1
        
    outstr += "#switch out load line\n"
    outstr += InputConnector + " = 0 : NULL : WAIT = 0.1\n"
    return outstr