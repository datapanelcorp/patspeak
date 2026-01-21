#39009-1
#Verion 0.0
#input test
UUT_DBC = 39009-561.dbc
UUT_DATANAME = 39009-1-INPUT-ISR-LOCKUP


#-----setup pat-----
#setup meter
LdRemote = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1
#setup PS1
PwrRemote = 1 : NULL : WAIT = 0.1
PwrSetCurrent = 20 : NULL : WAIT = 0.1
PwrSetVoltage = 50.0 : NULL : WAIT = 0.1
PwrEnable = 1 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1
#setup freq
AfgEnable = 0 : NULL : WAIT = 0.1
AfgShape = 1 : NULL : WAIT = 0.1
AfgFreqSet = 500 : NULL : WAIT = 0.1
AfgDutySet = 50 : NULL : WAIT = 0.1
AfgAmplSet = 4000 : NULL : WAIT = 0.1
AfgOffsetSet = 4000 : NULL : WAIT = 0.1
AfgEnable = 1 : NULL : WAIT = 0.1
J0_11_FREQ_GEN = 0 : NULL : WAIT = 0.1
J4_03 = 1 : NULL : WAIT = 0.2
#cycle IGN to reset lockup
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1
#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 7, MODE1B = 7, MODE2A = 1, MODE2B = 1, MODE3A = 4, MODE3B = 6, MODE4A = 1, MODE4B = 1, MODE5A = 6, MODE5B = 6, MODE6A = 1, MODE6B = 1, MODE7A = 6, MODE7B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 6, MODE9B = 6, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.1

AfgFreqSet = 100 : NULL : WAIT = 0.1
#test for lockup
NULL : Hertz_Count_Input1A = 0 | 0.1 | 0.1
J0_11_FREQ_GEN = 1 : NULL : WAIT = 0.1
NULL : Hertz_Count_Input1A = 100 | 30 | 0.1
J0_11_FREQ_GEN = 0 : NULL : WAIT = 0.1
NULL : Hertz_Count_Input1A = 0 | 0.1 | 0.1

#Finished with port
#switch out input
J2_01 = 0 : NULL : WAIT = 0.1

#cycle IGN to reset lockup
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1
#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 7, MODE1B = 7, MODE2A = 1, MODE2B = 1, MODE3A = 4, MODE3B = 6, MODE4A = 1, MODE4B = 1, MODE5A = 6, MODE5B = 6, MODE6A = 1, MODE6B = 1, MODE7A = 6, MODE7B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 6, MODE9B = 6, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.1

AfgFreqSet = 100 : NULL : WAIT = 0.1
#test for lockup
NULL : Hertz_Count_Input1B = 0 | 0.1 | 0.1
J0_11_FREQ_GEN = 1 : NULL : WAIT = 0.1
NULL : Hertz_Count_Input1B = 100 | 30 | 0.1
J0_11_FREQ_GEN = 0 : NULL : WAIT = 0.1
NULL : Hertz_Count_Input1B = 0 | 0.1 | 0.1

#Finished with port
#switch out input
J2_02 = 0 : NULL : WAIT = 0.1

#cycle IGN to reset lockup
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1
#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 7, MODE1B = 7, MODE2A = 1, MODE2B = 1, MODE3A = 4, MODE3B = 6, MODE4A = 1, MODE4B = 1, MODE5A = 6, MODE5B = 6, MODE6A = 1, MODE6B = 1, MODE7A = 6, MODE7B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 6, MODE9B = 6, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J2_03 = 1 : NULL : WAIT = 0.1

J4_01 = 1 : NULL : WAIT = 0.1
SWEEP-RUNNING DEATHSWEEP!
J4_01 = 0 : NULL : WAIT = 0.1
#test for lockup
NULL : Port_3A = 0 | 0.1 | 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.1
NULL : Port_3A = 5.0 | 0.1 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.1
NULL : Port_3A = 0 | 0.1 | 0.1

#Finished with port
#switch out input
J2_03 = 0 : NULL : WAIT = 0.1

#cycle IGN to reset lockup
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1
#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 7, MODE1B = 7, MODE2A = 1, MODE2B = 1, MODE3A = 4, MODE3B = 6, MODE4A = 1, MODE4B = 1, MODE5A = 6, MODE5B = 6, MODE6A = 1, MODE6B = 1, MODE7A = 6, MODE7B = 6 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 6, MODE9B = 6, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J2_04 = 1 : NULL : WAIT = 0.1

J4_01 = 1 : NULL : WAIT = 0.1
SWEEP-RUNNING DEATHSWEEP!
J4_01 = 0 : NULL : WAIT = 0.1
#test for lockup
NULL : Port_3B = 0 | 0.1 | 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.1
NULL : Port_3B = 5.0 | 0.1 | 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.1
NULL : Port_3B = 0 | 0.1 | 0.1

#Finished with port
#switch out input
J2_04 = 0 : NULL : WAIT = 0.1


#Finished with mode
#switch out load line, set current
J2_04 = 0 : NULL : WAIT = 0.1
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
#tear down PS1
PwrSetCurrent = 0 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 0 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1
PwrRemote = 0 : NULL : WAIT = 0.1
J4_03 = 0 : NULL : WAIT = 0.2
SAVE
END
