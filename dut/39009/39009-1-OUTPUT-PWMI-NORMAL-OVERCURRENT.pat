#39009-1
#Verion 0.0
#PWMi normal test with a 2.1 Ohm resistive load. (6.9 amps @ 14.5 VDC)
#PWMi overshoot should cause the output to overcurrent
UUT_DBC = 39009-561.dbc
UUT_DATANAME = 39009-1-OUTPUT-PWMI-NORMAL-OVERCURRENT

#-----setup 39009-----
#disable global modes
#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 4, MODE2B = 4, MODE3A = 4, MODE3B = 4, MODE4A = 4, MODE4B = 4, MODE5A = 4, MODE5B = 4, MODE6A = 4, MODE6B = 4, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 4, MODE8B = 4, MODE9A = 4, MODE9B = 4, MODE10A = 4, MODE10B = 4, GLOBAL_KP = 80.0, GLOBAL_KI =  50.0 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FREQ1 = 100, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
METER_MODE = 1 : NULL : WAIT = 0.2
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2A = 4000 : OutStat2A = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_2A = 0 : NULL : WAIT = 1
J3_01 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2B = 4000 : OutStat2B = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_2B = 0 : NULL : WAIT = 1
J3_02 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4A = 4000 : OutStat4A = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_4A = 0 : NULL : WAIT = 1
J3_03 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4B = 4000 : OutStat4B = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_4B = 0 : NULL : WAIT = 1
J3_04 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_05 = 1 : NULL : WAIT = 0.5

PWM_CTRL_6A = 4000 : OutStat6A = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_6A = 0 : NULL : WAIT = 1
J3_05 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_06 = 1 : NULL : WAIT = 0.5

PWM_CTRL_6B = 4000 : OutStat6B = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_6B = 0 : NULL : WAIT = 1
J3_06 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_07 = 1 : NULL : WAIT = 0.5

PWM_CTRL_8A = 4000 : OutStat8A = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_8A = 0 : NULL : WAIT = 1
J3_07 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_08 = 1 : NULL : WAIT = 0.5

PWM_CTRL_8B = 4000 : OutStat8B = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_8B = 0 : NULL : WAIT = 1
J3_08 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_09 = 1 : NULL : WAIT = 0.5

PWM_CTRL_10A = 4000 : OutStat10A = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_10A = 0 : NULL : WAIT = 1
J3_09 = 0 : NULL : WAIT = 1
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 1
#switch in load line, set current
J3_10 = 1 : NULL : WAIT = 0.5

PWM_CTRL_10B = 4000 : OutStat10B = 2 | 1 | 1
#switch out load line, switch coil
PWM_CTRL_10B = 0 : NULL : WAIT = 1
J3_10 = 0 : NULL : WAIT = 1
SAVE
END
