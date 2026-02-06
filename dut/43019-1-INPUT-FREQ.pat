#43019-1
#Verion 0.0
UUT_DBC = 43019-560.dbc
UUT_DATANAME = 43019-1-INPUT-FREQ

Command = 82, MODE1 = 0, MODE2 = 0, ADRaw = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 7, MODE3B = 0, MODE4A = 7, MODE4B = 0, MODE5A = 0, MODE5B = 0 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0 : NULL
Command = 82, FaultReset = 1, SaveSettings = 1, Enable_FAULT = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
#clear multiplex
Command = 0, FaultReset = 0, SaveSettings = 0, Enable_FAULT = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL

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
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 100 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 100 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 200 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 200 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 200 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 300 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 300 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 300 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 400 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 400 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 400 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 500 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 500 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 500 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 600 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 600 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 600 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 700 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 700 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 700 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 800 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 800 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 800 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 900 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 900 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 900 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1000 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 1000 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 1000 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1100 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 1100 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 1100 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1200 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 1200 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 1200 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1300 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 1300 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 1300 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1400 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 1400 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 1400 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1500 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 1500 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 1500 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1600 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 1600 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 1600 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1700 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 1700 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 1700 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1800 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 1800 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 1800 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 1900 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 1900 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 1900 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2000 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 2000 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 2000 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2100 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 2100 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 2100 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2200 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 2200 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 2200 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2300 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 2300 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 2300 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2400 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 2400 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 2400 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2500 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 2500 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 2500 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2600 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 2600 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 2600 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2700 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 2700 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 2700 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2800 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 2800 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 2800 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 2900 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 2900 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 2900 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgFreqSet = 3000 : NULL : WAIT = 0.1
#switch input to load line
J1_05 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input3A = 3000 | 30 | 0.1
J1_05 = 0 : NULL : WAIT = 0.5

#switch input to load line
J1_07 = 1 : NULL : WAIT = 0.5
NULL : Hertz_Count_Input4A = 3000 | 30 | 0.1
J1_07 = 0 : NULL : WAIT = 0.5

AfgEnable = 0 : NULL : WAIT = 0.1
#switch out load line
J1_07 = 0 : NULL : WAIT = 0.1
J0_11_FREQ_GEN = 0 : NULL : WAIT = 1
J4_03 = 0 : NULL : WAIT = 0.2
SAVE
END
