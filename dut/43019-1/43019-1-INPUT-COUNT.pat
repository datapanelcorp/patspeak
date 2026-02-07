#Verion 0.0
#input test
UUT_DBC = 43019-560.dbc
UUT_DATANAME = 43019-1-INPUT-COUNT

#setup PS1
PwrRemote = 1 : NULL : WAIT = 0.1
PwrSetCurrent = 100 : NULL : WAIT = 0.1
PwrSetVoltage = 140 : NULL : WAIT = 0.1
PwrEnable = 1 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 1

J4_03 = 1 : NULL : WAIT = 0.2
#******MAX COUNT = 5
#-----setup-----
Command = 82, MODE2 = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 8, MODE3B = 8, MODE4A = 8, MODE4B = 8, MODE5A = 1, MODE5B = 1 : NULL : WAIT = 1.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL

#switch in test supply
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#switch in input
J1_05 = 0 : NULL : WAIT = 0.2

PwrSetVoltage = 140 : NULL
#testing count events
Command = 87, Counter_3A_ON_OFF = 1, Counter_3A_Reset = 1 : NULL : WAIT = 0.2
Command = 0, Counter_3A_ON_OFF = 0, Counter_3A_Reset = 0 : NULL

J4_03 = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input3A = 0 | 0 | 0.1
J1_05 = 1 : NULL : WAIT = 1
NULL : Input_3A = 1 | 0 | 0.1
J1_05 = 0 : NULL : WAIT = 1
NULL : Input_3A = 0 | 0 | 0.1

#verify count
NULL : Hertz_Count_Input3A = 2 | 0 | 0.1
J1_05 = 1 : NULL : WAIT = 1
NULL : Input_3A = 1 | 0 | 0.1
J1_05 = 0 : NULL : WAIT = 1
NULL : Input_3A = 0 | 0 | 0.1

#verify count
NULL : Hertz_Count_Input3A = 4 | 0 | 0.1
J1_05 = 1 : NULL : WAIT = 1
NULL : Input_3A = 1 | 0 | 0.1
J1_05 = 0 : NULL : WAIT = 1
NULL : Input_3A = 0 | 0 | 0.1

#switch out input
J1_05 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#disable counter
Command = 87, Counter_3A_ON_OFF = 1 : NULL : WAIT = 0.2
Command = 0, Counter_3A_ON_OFF = 0 : NULL
#verify count
NULL : Hertz_Count_Input3A = 6 | 0 | 0.1
#send counter reset
Command = 87, Counter_3A_Reset = 1 : NULL : WAIT = 0.2
Command = 0, Counter_3A_Reset = 0 : NULL
#verify count reset
NULL : Hertz_Count_Input3A = 0 | 0 | 0.1

#-----setup-----
Command = 82, MODE2 = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 8, MODE3B = 8, MODE4A = 8, MODE4B = 8, MODE5A = 1, MODE5B = 1 : NULL : WAIT = 1.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL

#switch in test supply
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#switch in input
J1_06 = 0 : NULL : WAIT = 0.2

PwrSetVoltage = 140 : NULL
#testing count events
Command = 87, Counter_3B_ON_OFF = 1, Counter_3B_Reset = 1 : NULL : WAIT = 0.2
Command = 0, Counter_3B_ON_OFF = 0, Counter_3B_Reset = 0 : NULL

J4_03 = 1 : NULL : WAIT = 0.2
#verify count
NULL : Hertz_Count_Input4A = 0 | 0 | 0.1
J1_06 = 1 : NULL : WAIT = 1
NULL : Input_3B = 1 | 0 | 0.1
J1_06 = 0 : NULL : WAIT = 1
NULL : Input_3B = 0 | 0 | 0.1

#verify count
NULL : Hertz_Count_Input4A = 2 | 0 | 0.1
J1_06 = 1 : NULL : WAIT = 1
NULL : Input_3B = 1 | 0 | 0.1
J1_06 = 0 : NULL : WAIT = 1
NULL : Input_3B = 0 | 0 | 0.1

#verify count
NULL : Hertz_Count_Input4A = 4 | 0 | 0.1
J1_06 = 1 : NULL : WAIT = 1
NULL : Input_3B = 1 | 0 | 0.1
J1_06 = 0 : NULL : WAIT = 1
NULL : Input_3B = 0 | 0 | 0.1

#switch out input
J1_06 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#disable counter
Command = 87, Counter_3B_ON_OFF = 1 : NULL : WAIT = 0.2
Command = 0, Counter_3B_ON_OFF = 0 : NULL
#verify count
NULL : Hertz_Count_Input4A = 6 | 0 | 0.1
#send counter reset
Command = 87, Counter_3B_Reset = 1 : NULL : WAIT = 0.2
Command = 0, Counter_3B_Reset = 0 : NULL
#verify count reset
NULL : Hertz_Count_Input4A = 0 | 0 | 0.1

#-----setup-----
Command = 82, MODE2 = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 8, MODE3B = 8, MODE4A = 8, MODE4B = 8, MODE5A = 1, MODE5B = 1 : NULL : WAIT = 1.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL

#switch in test supply
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#switch in input
J1_07 = 0 : NULL : WAIT = 0.2

PwrSetVoltage = 140 : NULL
#testing count events
Command = 87, Counter_4A_ON_OFF = 1, Counter_4A_Reset = 1 : NULL : WAIT = 0.2
Command = 0, Counter_4A_ON_OFF = 0, Counter_4A_Reset = 0 : NULL

J4_03 = 1 : NULL : WAIT = 0.2
#verify count
NULL : Count_Input4A = 0 | 0 | 0.1
J1_07 = 1 : NULL : WAIT = 1
NULL : Input_4A = 1 | 0 | 0.1
J1_07 = 0 : NULL : WAIT = 1
NULL : Input_4A = 0 | 0 | 0.1

#verify count
NULL : Count_Input4A = 2 | 0 | 0.1
J1_07 = 1 : NULL : WAIT = 1
NULL : Input_4A = 1 | 0 | 0.1
J1_07 = 0 : NULL : WAIT = 1
NULL : Input_4A = 0 | 0 | 0.1

#verify count
NULL : Count_Input4A = 4 | 0 | 0.1
J1_07 = 1 : NULL : WAIT = 1
NULL : Input_4A = 1 | 0 | 0.1
J1_07 = 0 : NULL : WAIT = 1
NULL : Input_4A = 0 | 0 | 0.1

#switch out input
J1_07 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#disable counter
Command = 87, Counter_4A_ON_OFF = 1 : NULL : WAIT = 0.2
Command = 0, Counter_4A_ON_OFF = 0 : NULL
#verify count
NULL : Count_Input4A = 6 | 0 | 0.1
#send counter reset
Command = 87, Counter_4A_Reset = 1 : NULL : WAIT = 0.2
Command = 0, Counter_4A_Reset = 0 : NULL
#verify count reset
NULL : Count_Input4A = 0 | 0 | 0.1

#-----setup-----
Command = 82, MODE2 = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 8, MODE3B = 8, MODE4A = 8, MODE4B = 8, MODE5A = 1, MODE5B = 1 : NULL : WAIT = 1.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL

#switch in test supply
J0_09_TEST_SUPPLY = 1 : NULL : WAIT = 0.2
#switch in input
J1_08 = 0 : NULL : WAIT = 0.2

PwrSetVoltage = 140 : NULL
#testing count events
Command = 87, Counter_4B_ON_OFF = 1, Counter_4B_Reset = 1 : NULL : WAIT = 0.2
Command = 0, Counter_4B_ON_OFF = 0, Counter_4B_Reset = 0 : NULL

J4_03 = 1 : NULL : WAIT = 0.2
#verify count
NULL : Count_Input4B = 0 | 0 | 0.1
J1_08 = 1 : NULL : WAIT = 1
NULL : Input_4B = 1 | 0 | 0.1
J1_08 = 0 : NULL : WAIT = 1
NULL : Input_4B = 0 | 0 | 0.1

#verify count
NULL : Count_Input4B = 2 | 0 | 0.1
J1_08 = 1 : NULL : WAIT = 1
NULL : Input_4B = 1 | 0 | 0.1
J1_08 = 0 : NULL : WAIT = 1
NULL : Input_4B = 0 | 0 | 0.1

#verify count
NULL : Count_Input4B = 4 | 0 | 0.1
J1_08 = 1 : NULL : WAIT = 1
NULL : Input_4B = 1 | 0 | 0.1
J1_08 = 0 : NULL : WAIT = 1
NULL : Input_4B = 0 | 0 | 0.1

#switch out input
J1_08 = 0 : NULL : WAIT = 0.2
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 0.2
#disable counter
Command = 87, Counter_4B_ON_OFF = 1 : NULL : WAIT = 0.2
Command = 0, Counter_4B_ON_OFF = 0 : NULL
#verify count
NULL : Count_Input4B = 6 | 0 | 0.1
#send counter reset
Command = 87, Counter_4B_Reset = 1 : NULL : WAIT = 0.2
Command = 0, Counter_4B_Reset = 0 : NULL
#verify count reset
NULL : Count_Input4B = 0 | 0 | 0.1

#switch out load line
J1_08 = 0 : NULL : WAIT = 0.1
#switch out power supply
LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
J4_03 = 0 : NULL : WAIT = 0.2
SAVE
END
