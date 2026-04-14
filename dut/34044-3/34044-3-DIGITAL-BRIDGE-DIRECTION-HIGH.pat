#34044-3
#Verion 0.0
UUT_DBC = 34044-563.dbc
#Digital h-bridge test with 2.1 Ohm resistive load. (6.9 amps @ 14.5 VDC)
UUT_DATANAME = 34044-3-DIGITAL-BRIDGE-DIRECTION-HIGH

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

#prompt user to switch
PAUSE-please verify load connection BRIDGE1_DIR
#turn on output
Command = 81, Output1A = 1, BRIDGE1_DIR = 1 : Feedback1A = 6.9 | 0.2 | 0.5
#turn off output
Output1A = 0 : NULL : WAIT = 1
#turn on output
Command = 81, Output1B = 1, BRIDGE1_DIR = 2 : Feedback1B = 6.9 | 0.2 | 0.5
#turn off output
Output1B = 0 : NULL : WAIT = 1
#prompt user to switch
PAUSE-please verify load connection BRIDGE2_DIR
#turn on output
Command = 81, Output2A = 1, BRIDGE2_DIR = 1 : OutStat2A = 2 | 0 | 0.5
#turn off output
Output2A = 0 : NULL : WAIT = 1
#turn on output
Command = 81, Output2B = 1, BRIDGE2_DIR = 2 : OutStat2B = 2 | 0 | 0.5
#turn off output
Output2B = 0 : NULL : WAIT = 1
#prompt user to switch
PAUSE-please verify load connection BRIDGE3_DIR
#turn on output
Command = 81, Output3A = 1, BRIDGE3_DIR = 1 : Feedback3A = 6.9 | 0.2 | 0.5
#turn off output
Output3A = 0 : NULL : WAIT = 1
#turn on output
Command = 81, Output3B = 1, BRIDGE3_DIR = 2 : Feedback3B = 6.9 | 0.2 | 0.5
#turn off output
Output3B = 0 : NULL : WAIT = 1
#prompt user to switch
PAUSE-please verify load connection BRIDGE4_DIR
#turn on output
Command = 81, Output4A = 1, BRIDGE4_DIR = 1 : OutStat4A = 2 | 0 | 0.5
#turn off output
Output4A = 0 : NULL : WAIT = 1
#turn on output
Command = 81, Output4B = 1, BRIDGE4_DIR = 2 : OutStat4B = 2 | 0 | 0.5
#turn off output
Output4B = 0 : NULL : WAIT = 1
#prompt user to switch
PAUSE-please verify load connection BRIDGE5_DIR
#turn on output
Command = 81, Output5A = 1, BRIDGE5_DIR = 1 : OutStat5A = 2 | 0 | 0.5
#turn off output
Output5A = 0 : NULL : WAIT = 1
#turn on output
Command = 81, Output5B = 1, BRIDGE5_DIR = 2 : OutStat5B = 2 | 0 | 0.5
#turn off output
Output5B = 0 : NULL : WAIT = 1
#prompt user to switch
PAUSE-please verify load connection BRIDGE6_DIR
#turn on output
Command = 81, Output6A = 1, BRIDGE6_DIR = 1 : OutStat6A = 2 | 0 | 0.5
#turn off output
Output6A = 0 : NULL : WAIT = 1
#turn on output
Command = 81, Output6B = 1, BRIDGE6_DIR = 2 : OutStat6B = 2 | 0 | 0.5
#turn off output
Output6B = 0 : NULL : WAIT = 1
#prompt user to switch
PAUSE-please verify load connection BRIDGE7_DIR
#turn on output
Command = 81, Output7A = 1, BRIDGE7_DIR = 1 : OutStat7A = 2 | 0 | 0.5
#turn off output
Output7A = 0 : NULL : WAIT = 1
#turn on output
Command = 81, Output7B = 1, BRIDGE7_DIR = 2 : OutStat7B = 2 | 0 | 0.5
#turn off output
Output7B = 0 : NULL : WAIT = 1
#prompt user to switch
PAUSE-please verify load connection BRIDGE8_DIR
#turn on output
Command = 81, Output8A = 1, BRIDGE8_DIR = 1 : OutStat8A = 2 | 0 | 0.5
#turn off output
Output8A = 0 : NULL : WAIT = 1
#turn on output
Command = 81, Output8B = 1, BRIDGE8_DIR = 2 : OutStat8B = 2 | 0 | 0.5
#turn off output
Output8B = 0 : NULL : WAIT = 1
SAVE
END
