#43019-1
#Verion 0.0
#input test
UUT_DBC = 43019-560.dbc
UUT_DATANAME = !43019-1-INPUT-ISR-LOCKUP


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
#-----setup 39009-----
#configure
Command = 82, MODE2 = 0 : NULL : WAIT = 0.2
Command = 0, MODE2 = 0 : NULL
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 7, MODE3B = 1, MODE4A = 7, MODE4B = 1, MODE5A = 0, MODE5B = 0 : NULL : WAIT = 0.2
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#cycle IGN to reset hardware
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 2
#switch input to load line
J1_05 = 1 : NULL : WAIT = 1

#TESTING - ModeIndex 0 PortIndex 0
AfgFreqSet = 100 : NULL : WAIT = 0.1
#test for lockup
UUT_TXCHECK-2.0
NULL : Hertz_Count_Input3A = 0 | 0.1 | 0.1
J0_11_FREQ_GEN = 1 : NULL : WAIT = 0.1
NULL : Hertz_Count_Input3A = 100 | 30 | 0.1
J0_11_FREQ_GEN = 0 : NULL : WAIT = 0.1
NULL : Hertz_Count_Input3A = 0 | 0.1 | 0.1

#Finished with port
#switch out input
J1_05 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure
Command = 82, MODE2 = 0 : NULL : WAIT = 0.2
Command = 0, MODE2 = 0 : NULL
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 7, MODE3B = 1, MODE4A = 7, MODE4B = 1, MODE5A = 0, MODE5B = 0 : NULL : WAIT = 0.2
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#cycle IGN to reset hardware
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 2
#switch input to load line
J1_06 = 1 : NULL : WAIT = 1

#TESTING - ModeIndex 0 PortIndex 1
J4_01 = 1 : NULL : WAIT = 0.1
#SWEEP-RUNNING DEATHSWEEP!\nPAT dp800/rigol_dp800_sweep_ch2.py --resource USB0::0x1AB1::0x0E11::DP8C180100022::INSTR --channel 2 --start 4.32 --stop 4.43 --step 0.001 --mode updown --dwell 0.020 --opc-every 25 --output-off-at-end\nJ4_01 = 0 : NULL : WAIT = 0.1
#test for lockup
UUT_TXCHECK-2.0
#Finished with port
#switch out input
J1_06 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure
Command = 82, MODE2 = 0 : NULL : WAIT = 0.2
Command = 0, MODE2 = 0 : NULL
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 7, MODE3B = 1, MODE4A = 7, MODE4B = 1, MODE5A = 0, MODE5B = 0 : NULL : WAIT = 0.2
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#cycle IGN to reset hardware
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 2
#switch input to load line
J1_07 = 1 : NULL : WAIT = 1

#TESTING - ModeIndex 0 PortIndex 2
AfgFreqSet = 100 : NULL : WAIT = 0.1
#test for lockup
UUT_TXCHECK-2.0
NULL : Hertz_Count_Input4A = 0 | 0.1 | 0.1
J0_11_FREQ_GEN = 1 : NULL : WAIT = 0.1
NULL : Hertz_Count_Input4A = 100 | 30 | 0.1
J0_11_FREQ_GEN = 0 : NULL : WAIT = 0.1
NULL : Hertz_Count_Input4A = 0 | 0.1 | 0.1

#Finished with port
#switch out input
J1_07 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure
Command = 82, MODE2 = 0 : NULL : WAIT = 0.2
Command = 0, MODE2 = 0 : NULL
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 7, MODE3B = 1, MODE4A = 7, MODE4B = 1, MODE5A = 0, MODE5B = 0 : NULL : WAIT = 0.2
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#cycle IGN to reset hardware
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 2
#switch input to load line
J1_08 = 1 : NULL : WAIT = 1

#TESTING - ModeIndex 0 PortIndex 3
J4_01 = 1 : NULL : WAIT = 0.1
#SWEEP-RUNNING DEATHSWEEP!\nPAT dp800/rigol_dp800_sweep_ch2.py --resource USB0::0x1AB1::0x0E11::DP8C180100022::INSTR --channel 2 --start 4.32 --stop 4.43 --step 0.001 --mode updown --dwell 0.020 --opc-every 25 --output-off-at-end\nJ4_01 = 0 : NULL : WAIT = 0.1
#test for lockup
UUT_TXCHECK-2.0
#Finished with port
#switch out input
J1_08 = 0 : NULL : WAIT = 0.1


#Finished with mode
#-----setup 39009-----
#configure
Command = 82, MODE2 = 0 : NULL : WAIT = 0.2
Command = 0, MODE2 = 0 : NULL
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4, MODE5A = 0, MODE5B = 0 : NULL : WAIT = 0.2
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#cycle IGN to reset hardware
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 2
#switch input to load line
J1_05 = 1 : NULL : WAIT = 1

#TESTING - ModeIndex 1 PortIndex 0
J4_01 = 1 : NULL : WAIT = 0.1
#SWEEP-RUNNING DEATHSWEEP!\nPAT dp800/rigol_dp800_sweep_ch2.py --resource USB0::0x1AB1::0x0E11::DP8C180100022::INSTR --channel 2 --start 4.32 --stop 4.43 --step 0.001 --mode updown --dwell 0.020 --opc-every 25 --output-off-at-end\nJ4_01 = 0 : NULL : WAIT = 0.1
#test for lockup
UUT_TXCHECK-2.0
#Finished with port
#switch out input
J1_05 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure
Command = 82, MODE2 = 0 : NULL : WAIT = 0.2
Command = 0, MODE2 = 0 : NULL
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4, MODE5A = 0, MODE5B = 0 : NULL : WAIT = 0.2
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#cycle IGN to reset hardware
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 2
#switch input to load line
J1_06 = 1 : NULL : WAIT = 1

#TESTING - ModeIndex 1 PortIndex 1
J4_01 = 1 : NULL : WAIT = 0.1
#SWEEP-RUNNING DEATHSWEEP!\nPAT dp800/rigol_dp800_sweep_ch2.py --resource USB0::0x1AB1::0x0E11::DP8C180100022::INSTR --channel 2 --start 4.32 --stop 4.43 --step 0.001 --mode updown --dwell 0.020 --opc-every 25 --output-off-at-end\nJ4_01 = 0 : NULL : WAIT = 0.1
#test for lockup
UUT_TXCHECK-2.0
#Finished with port
#switch out input
J1_06 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure
Command = 82, MODE2 = 0 : NULL : WAIT = 0.2
Command = 0, MODE2 = 0 : NULL
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4, MODE5A = 0, MODE5B = 0 : NULL : WAIT = 0.2
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#cycle IGN to reset hardware
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 2
#switch input to load line
J1_07 = 1 : NULL : WAIT = 1

#TESTING - ModeIndex 1 PortIndex 2
J4_01 = 1 : NULL : WAIT = 0.1
#SWEEP-RUNNING DEATHSWEEP!\nPAT dp800/rigol_dp800_sweep_ch2.py --resource USB0::0x1AB1::0x0E11::DP8C180100022::INSTR --channel 2 --start 4.32 --stop 4.43 --step 0.001 --mode updown --dwell 0.020 --opc-every 25 --output-off-at-end\nJ4_01 = 0 : NULL : WAIT = 0.1
#test for lockup
UUT_TXCHECK-2.0
#Finished with port
#switch out input
J1_07 = 0 : NULL : WAIT = 0.1

#-----setup 39009-----
#configure
Command = 82, MODE2 = 0 : NULL : WAIT = 0.2
Command = 0, MODE2 = 0 : NULL
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4, MODE5A = 0, MODE5B = 0 : NULL : WAIT = 0.2
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#cycle IGN to reset hardware
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 2
#switch input to load line
J1_08 = 1 : NULL : WAIT = 1

#TESTING - ModeIndex 1 PortIndex 3
J4_01 = 1 : NULL : WAIT = 0.1
#SWEEP-RUNNING DEATHSWEEP!\nPAT dp800/rigol_dp800_sweep_ch2.py --resource USB0::0x1AB1::0x0E11::DP8C180100022::INSTR --channel 2 --start 4.32 --stop 4.43 --step 0.001 --mode updown --dwell 0.020 --opc-every 25 --output-off-at-end\nJ4_01 = 0 : NULL : WAIT = 0.1
#test for lockup
UUT_TXCHECK-2.0
#Finished with port
#switch out input
J1_08 = 0 : NULL : WAIT = 0.1


#Finished with mode
#switch out load line, set current
J1_08 = 0 : NULL : WAIT = 0.1
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
#tear down PS1
PwrSetCurrent = 0 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 0 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.5
PwrRemote = 0 : NULL : WAIT = 0.1
J4_03 = 0 : NULL : WAIT = 0.2
SAVE
END
