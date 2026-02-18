#39009-1
#Verion 0.0
#input test
UUT_DBC = 39009-561.dbc
UUT_DATANAME = 39009-1-INPUT-FREQ

Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 7, MODE1B = 7, MODE2A = 1, MODE2B = 1, MODE3A = 7, MODE3B = 7, MODE4A = 1, MODE4B = 1, MODE5A = 1, MODE5B = 1, MODE6A = 1, MODE6B = 1, MODE7A = 1, MODE7B = 1 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 1, MODE8B = 1, MODE9A = 1, MODE9B = 1, MODE10A = 1, MODE10B = 1, GLOBAL_KP = 255, GLOBAL_KI = 255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL

#-----setup pat-----
#setup freq
AfgEnable = 0 : NULL : WAIT = 0.1
AfgShape = 1 : NULL : WAIT = 0.1
AfgFreqSet = 500 : NULL : WAIT = 0.1
AfgDutySet = 50 : NULL : WAIT = 0.1
AfgAmplSet = 4000 : NULL : WAIT = 0.1
AfgOffsetSet = 4000 : NULL : WAIT = 0.1
AfgEnable = 1 : NULL : WAIT = 0.1
J0_11_FREQ_GEN = 1 : NULL : WAIT = 0.1

J4_03 = 1 : NULL : WAIT = 0.2
AfgFreqSet = 100 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 100 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 100 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 200 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 200 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 200 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 300 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 300 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 300 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 400 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 400 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 400 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 500 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 500 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 500 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 600 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 600 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 600 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 700 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 700 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 700 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 800 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 800 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 800 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 900 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 900 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 900 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1000 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 1000 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 1000 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1100 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 1100 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 1100 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1200 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 1200 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 1200 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1300 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 1300 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 1300 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1400 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 1400 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 1400 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1500 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 1500 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 1500 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1600 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 1600 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 1600 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1700 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 1700 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 1700 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1800 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 1800 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 1800 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1900 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 1900 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 1900 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2000 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 2000 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 2000 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2100 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 2100 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 2100 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2200 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 2200 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 2200 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2300 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 2300 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 2300 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2400 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 2400 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 2400 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2500 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 2500 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 2500 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2600 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 2600 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 2600 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2700 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 2700 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 2700 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2800 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 2800 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 2800 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2900 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 2900 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 2900 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 3000 : NULL : WAIT = 0.1
#switch input to load line
J2_01 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1A = 3000 | 30 | 0.1
J2_01 = 0 : NULL : WAIT = 0.5

#switch input to load line
J2_02 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input1B = 3000 | 30 | 0.1
J2_02 = 0 : NULL : WAIT = 0.5

AfgEnable = 0 : NULL : WAIT = 0.1
#switch out load line
J2_02 = 0 : NULL : WAIT = 0.1
J0_11_FREQ_GEN = 0 : NULL : WAIT = 1
J4_03 = 0 : NULL : WAIT = 0.2
SAVE
END
