#34044-3
#Verion 0.0
UUT_DBC = 34044-563.dbc
#Digital h-bridge brake test with 5 Ohm resistive pull-up load. (3.62 amps @ 14.5 VDC)
#this verifies the pins can sink current when put into brake mode.
UUT_DATANAME = 34044-3-DIGITAL-BRIDGE-BRAKE

#-----setup 34044-----
#disable global modes
#configure PWMi
Command = 83, MODE1A = 1, MODE1B = 1, MODE2A = 1, MODE2B = 1, MODE3A = 1, MODE3B = 1, MODE4A = 1, MODE4B = 1, MODE5A = 1, MODE5B = 1, MODE6A = 1, MODE6B = 1, MODE7A = 1, MODE7B = 1 : NULL : WAIT = 0.5
Command = 84, MODE8A = 1, MODE8B = 1 : NULL : WAIT = 0.5
Command = 93, PORT1_MODE = 2, PORT2_MODE = 2, PORT3_MODE = 2, PORT4_MODE = 2, PORT5_MODE = 2, PORT6_MODE = 2, PORT7_MODE = 2, PORT8_MODE = 2 : NULL : WAIT = 0.5
Command = 82, FREQ1 = 200, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL
Command = 82, SaveSettings = 1 : NULL
#clean DBC signals
Command = 0 : NULL : WAIT = 0.5
MODE1 = 0, MODE2 = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0, MODE8A = 0, MODE8B = 0 : NULL : WAIT = 0.5
PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0, PORT5_MODE = 0, PORT6_MODE = 0, PORT7_MODE = 0, PORT8_MODE = 0 : NULL : WAIT = 0.5

#switch in high side load
J5_01 = 1 : NULL : WAIT = 1
#switch meter to load line
J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2
#switch output to load line
J2_01 = 1 : NULL : WAIT = 0.2

#brake mode
Command = 81, Output1A = 1, Output1B = 1 : MeterVolts = 0.4 | 0.2 | 0.1
#switch out load line, clear current
Output1A = 0, Output1B = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
J2_01 = 0 : NULL : WAIT = 0.1
#switch meter to load line
J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2
#switch output to load line
J2_02 = 1 : NULL : WAIT = 0.2

#brake mode
Command = 81, Output1A = 1, Output1B = 1 : MeterVolts = 0.4 | 0.2 | 0.1
#switch out load line, clear current
Output1A = 0, Output1B = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
J2_02 = 0 : NULL : WAIT = 0.1
#switch meter to load line
J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2
#switch output to load line
J2_03 = 1 : NULL : WAIT = 0.2

#brake mode
Command = 81, Output2A = 1, Output2B = 1 : MeterVolts = 0.4 | 0.2 | 0.1
#switch out load line, clear current
Output2A = 0, Output2B = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
J2_03 = 0 : NULL : WAIT = 0.1
#switch meter to load line
J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2
#switch output to load line
J2_04 = 1 : NULL : WAIT = 0.2

#brake mode
Command = 81, Output2A = 1, Output2B = 1 : MeterVolts = 0.4 | 0.2 | 0.1
#switch out load line, clear current
Output2A = 0, Output2B = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
J2_04 = 0 : NULL : WAIT = 0.1
#switch meter to load line
J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2
#switch output to load line
J2_05 = 1 : NULL : WAIT = 0.2

#brake mode
Command = 81, Output3A = 1, Output3B = 1 : MeterVolts = 0.4 | 0.2 | 0.1
#switch out load line, clear current
Output3A = 0, Output3B = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
J2_05 = 0 : NULL : WAIT = 0.1
#switch meter to load line
J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2
#switch output to load line
J2_06 = 1 : NULL : WAIT = 0.2

#brake mode
Command = 81, Output3A = 1, Output3B = 1 : MeterVolts = 0.4 | 0.2 | 0.1
#switch out load line, clear current
Output3A = 0, Output3B = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
J2_06 = 0 : NULL : WAIT = 0.1
#switch meter to load line
J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2
#switch output to load line
J2_07 = 1 : NULL : WAIT = 0.2

#brake mode
Command = 81, Output4A = 1, Output4B = 1 : MeterVolts = 0.4 | 0.2 | 0.1
#switch out load line, clear current
Output4A = 0, Output4B = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
J2_07 = 0 : NULL : WAIT = 0.1
#switch meter to load line
J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2
#switch output to load line
J2_08 = 1 : NULL : WAIT = 0.2

#brake mode
Command = 81, Output4A = 1, Output4B = 1 : MeterVolts = 0.4 | 0.2 | 0.1
#switch out load line, clear current
Output4A = 0, Output4B = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
J2_08 = 0 : NULL : WAIT = 0.1
#switch meter to load line
J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2
#switch output to load line
J2_09 = 1 : NULL : WAIT = 0.2

#brake mode
Command = 81, Output5A = 1, Output5B = 1 : MeterVolts = 0.4 | 0.2 | 0.1
#switch out load line, clear current
Output5A = 0, Output5B = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
J2_09 = 0 : NULL : WAIT = 0.1
#switch meter to load line
J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2
#switch output to load line
J2_10 = 1 : NULL : WAIT = 0.2

#brake mode
Command = 81, Output5A = 1, Output5B = 1 : MeterVolts = 0.4 | 0.2 | 0.1
#switch out load line, clear current
Output5A = 0, Output5B = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
J2_10 = 0 : NULL : WAIT = 0.1
#switch meter to load line
J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2
#switch output to load line
J2_11 = 1 : NULL : WAIT = 0.2

#brake mode
Command = 81, Output6A = 1, Output6B = 1 : MeterVolts = 0.4 | 0.2 | 0.1
#switch out load line, clear current
Output6A = 0, Output6B = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
J2_11 = 0 : NULL : WAIT = 0.1
#switch meter to load line
J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2
#switch output to load line
J2_12 = 1 : NULL : WAIT = 0.2

#brake mode
Command = 81, Output6A = 1, Output6B = 1 : MeterVolts = 0.4 | 0.2 | 0.1
#switch out load line, clear current
Output6A = 0, Output6B = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
J2_12 = 0 : NULL : WAIT = 0.1
#switch meter to load line
J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2
#switch output to load line
J3_01 = 1 : NULL : WAIT = 0.2

#brake mode
Command = 81, Output7A = 1, Output7B = 1 : MeterVolts = 0.4 | 0.2 | 0.1
#switch out load line, clear current
Output7A = 0, Output7B = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
J3_01 = 0 : NULL : WAIT = 0.1
#switch meter to load line
J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2
#switch output to load line
J3_02 = 1 : NULL : WAIT = 0.2

#brake mode
Command = 81, Output7A = 1, Output7B = 1 : MeterVolts = 0.4 | 0.2 | 0.1
#switch out load line, clear current
Output7A = 0, Output7B = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
J3_02 = 0 : NULL : WAIT = 0.1
#switch meter to load line
J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2
#switch output to load line
J3_03 = 1 : NULL : WAIT = 0.2

#brake mode
Command = 81, Output8A = 1, Output8B = 1 : MeterVolts = 0.4 | 0.2 | 0.1
#switch out load line, clear current
Output8A = 0, Output8B = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
J3_03 = 0 : NULL : WAIT = 0.1
#switch meter to load line
J0_08_METER_LOAD = 1 : NULL : WAIT = 0.2
#switch output to load line
J3_04 = 1 : NULL : WAIT = 0.2

#brake mode
Command = 81, Output8A = 1, Output8B = 1 : MeterVolts = 0.4 | 0.2 | 0.1
#switch out load line, clear current
Output8A = 0, Output8B = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
J3_04 = 0 : NULL : WAIT = 0.1
SAVE
END
