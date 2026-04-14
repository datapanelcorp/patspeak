#34044-1
#Verion 0.0
#input test
UUT_DBC = 34044-561.dbc
UUT_DATANAME = 34044-1-INPUT-FREQ

#-----setup 34044-----
Command = 93, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL

#-----setup pat-----
#setup freq
J0_11_FREQ_GEN = 1 : NULL : WAIT = 1

PAUSE- FREQ_GEN TO 500Hz 15% Duty
#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 7, MODE5B = 0, MODE6A = 7, MODE6B = 0, MODE7A = 7, MODE7B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 7, MODE8B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_01 = 1 : NULL : WAIT = 1
NULL : Hertz_Count_Input7A = 500 | 30 | 0.1
NULL : DutyCycle_SP_Input7A = 15 | 1 | 0.1
J3_01 = 0 : NULL : WAIT = 1

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 7, MODE5B = 0, MODE6A = 7, MODE6B = 0, MODE7A = 7, MODE7B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 7, MODE8B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_03 = 1 : NULL : WAIT = 1
NULL : Hertz_Count_Input8A = 500 | 30 | 0.1
NULL : DutyCycle_SP_Input8A = 15 | 1 | 0.1
J3_03 = 0 : NULL : WAIT = 1

PAUSE- FREQ_GEN TO 1000Hz 30% Duty
#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 7, MODE5B = 0, MODE6A = 7, MODE6B = 0, MODE7A = 7, MODE7B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 7, MODE8B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_01 = 1 : NULL : WAIT = 1
NULL : Hertz_Count_Input7A = 1000 | 30 | 0.1
NULL : DutyCycle_SP_Input7A = 30 | 1 | 0.1
J3_01 = 0 : NULL : WAIT = 1

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 7, MODE5B = 0, MODE6A = 7, MODE6B = 0, MODE7A = 7, MODE7B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 7, MODE8B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_03 = 1 : NULL : WAIT = 1
NULL : Hertz_Count_Input8A = 1000 | 30 | 0.1
NULL : DutyCycle_SP_Input8A = 30 | 1 | 0.1
J3_03 = 0 : NULL : WAIT = 1

PAUSE- FREQ_GEN TO 1500Hz 45% Duty
#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 7, MODE5B = 0, MODE6A = 7, MODE6B = 0, MODE7A = 7, MODE7B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 7, MODE8B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_01 = 1 : NULL : WAIT = 1
NULL : Hertz_Count_Input7A = 1500 | 30 | 0.1
NULL : DutyCycle_SP_Input7A = 45 | 1 | 0.1
J3_01 = 0 : NULL : WAIT = 1

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 7, MODE5B = 0, MODE6A = 7, MODE6B = 0, MODE7A = 7, MODE7B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 7, MODE8B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_03 = 1 : NULL : WAIT = 1
NULL : Hertz_Count_Input8A = 1500 | 30 | 0.1
NULL : DutyCycle_SP_Input8A = 45 | 1 | 0.1
J3_03 = 0 : NULL : WAIT = 1

PAUSE- FREQ_GEN TO 2000Hz 60% Duty
#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 7, MODE5B = 0, MODE6A = 7, MODE6B = 0, MODE7A = 7, MODE7B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 7, MODE8B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_01 = 1 : NULL : WAIT = 1
NULL : Hertz_Count_Input7A = 2000 | 30 | 0.1
NULL : DutyCycle_SP_Input7A = 60 | 1 | 0.1
J3_01 = 0 : NULL : WAIT = 1

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 7, MODE5B = 0, MODE6A = 7, MODE6B = 0, MODE7A = 7, MODE7B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 7, MODE8B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_03 = 1 : NULL : WAIT = 1
NULL : Hertz_Count_Input8A = 2000 | 30 | 0.1
NULL : DutyCycle_SP_Input8A = 60 | 1 | 0.1
J3_03 = 0 : NULL : WAIT = 1

PAUSE- FREQ_GEN TO 2500Hz 75% Duty
#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 7, MODE5B = 0, MODE6A = 7, MODE6B = 0, MODE7A = 7, MODE7B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 7, MODE8B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_01 = 1 : NULL : WAIT = 1
NULL : Hertz_Count_Input7A = 2500 | 30 | 0.1
NULL : DutyCycle_SP_Input7A = 75 | 1 | 0.1
J3_01 = 0 : NULL : WAIT = 1

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 7, MODE5B = 0, MODE6A = 7, MODE6B = 0, MODE7A = 7, MODE7B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 7, MODE8B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_03 = 1 : NULL : WAIT = 1
NULL : Hertz_Count_Input8A = 2500 | 30 | 0.1
NULL : DutyCycle_SP_Input8A = 75 | 1 | 0.1
J3_03 = 0 : NULL : WAIT = 1

PAUSE- FREQ_GEN TO 3000Hz 90% Duty
#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 7, MODE5B = 0, MODE6A = 7, MODE6B = 0, MODE7A = 7, MODE7B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 7, MODE8B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_01 = 1 : NULL : WAIT = 1
NULL : Hertz_Count_Input7A = 3000 | 30 | 0.1
NULL : DutyCycle_SP_Input7A = 90 | 1 | 0.1
J3_01 = 0 : NULL : WAIT = 1

#-----setup 34044-----
#disable global modes
#configure Port Modes
Command = 83, MODE5A = 7, MODE5B = 0, MODE6A = 7, MODE6B = 0, MODE7A = 7, MODE7B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 7, MODE8B = 0 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, MODE8A = 0, MODE8B = 0 : NULL
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0, Enable_Fault_Reset = 0 : NULL : WAIT = 0.2
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.2
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
#switch input to load line
J3_03 = 1 : NULL : WAIT = 1
NULL : Hertz_Count_Input8A = 3000 | 30 | 0.1
NULL : DutyCycle_SP_Input8A = 90 | 1 | 0.1
J3_03 = 0 : NULL : WAIT = 1

#switch out load line
J3_03 = 0 : NULL : WAIT = 0.1
J0_11_FREQ_GEN = 0 : NULL : WAIT = 1
J4_03 = 0 : NULL : WAIT = 0.2
SAVE
END
