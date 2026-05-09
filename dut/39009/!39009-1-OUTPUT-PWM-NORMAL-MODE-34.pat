#39009-1
#Verion 0.0
#PWM test with 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
UUT_DBC = 39009-561.dbc
UUT_DATANAME = 39009-1-OUTPUT-PWM-NORMAL-MODE-34

#-----setup 39009-----
#configure as Output Digital ON/OFF
Command = 82, MODE1 = 0, MODE2 = 0, Enable_24VDC = 0 : NULL : WAIT = 0.5
Command = 83, MODE1A = 4, MODE1B = 4, MODE2A = 34, MODE2B = 34, MODE3A = 4, MODE3B = 4, MODE4A = 34, MODE4B = 34, MODE5A = 4, MODE5B = 4, MODE6A = 34, MODE6B = 34, MODE7A = 4, MODE7B = 4 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0 : NULL
Command = 84, MODE8A = 34, MODE8B = 34, MODE9A = 4, MODE9B = 4, MODE10A = 34, MODE10B = 34, GLOBAL_KP = 255, GLOBAL_KI =  255 : NULL : WAIT = 0.5
Command = 0, MODE8A = 0, MODE8B = 0, MODE9A = 0, MODE9B = 0, MODE10A = 0, MODE10B = 0, GLOBAL_KP = 0, GLOBAL_KI = 0 : NULL
Command = 82, FREQ1 = 1000, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FREQ1 = 0, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
# Set multimeter to DC current for high-current path (lead must be on 20A jack)
METER_MODE = 1 : NULL : WAIT = 0.4
METER_MODE = 1 : NULL : WAIT = 0.4
NULL : NULL : WAIT = 0.4
PAUSE-Set meter to mA mode. Connect 5.1 Ohm resistive load. Press Enter to continue.
#test at 1000hz
Command = 82, FREQ1 = 1000, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
# Set multimeter to DC current for high-current path (lead must be on 20A jack)
METER_MODE = 1 : NULL : WAIT = 0.4
METER_MODE = 1 : NULL : WAIT = 0.4
NULL : NULL : WAIT = 0.4
#switch in 5.1 Ohm resistive load. (2.84 amps @ 14.5 VDC)
J4_01 = 1 : NULL : WAIT = 0.2
J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_2A = 1000 : NULL : WAIT = 0.2
#warm-up first meter sample after mode switch
NULL : NULL : WAIT = 0.8
NULL : MeterAmps = 0.7 | 0.3 | 0.5 : TIMEOUT = 8
NULL : Feedback2A = 0.7 | 0.2 | 0.5
PWM_CTRL_2A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback2A = 1.4 | 0.2 | 0.5
PWM_CTRL_2A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback2A = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_2A = 0 : NULL : WAIT = 0.5
J3_01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_2B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback2B = 0.7 | 0.2 | 0.5
PWM_CTRL_2B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback2B = 1.4 | 0.2 | 0.5
PWM_CTRL_2B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback2B = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_2B = 0 : NULL : WAIT = 0.5
J3_02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_4A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback4A = 0.7 | 0.2 | 0.5
PWM_CTRL_4A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback4A = 1.4 | 0.2 | 0.5
PWM_CTRL_4A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback4A = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_4A = 0 : NULL : WAIT = 0.5
J3_03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_4B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback4B = 0.7 | 0.2 | 0.5
PWM_CTRL_4B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback4B = 1.4 | 0.2 | 0.5
PWM_CTRL_4B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback4B = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_4B = 0 : NULL : WAIT = 0.5
J3_04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_05 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_6A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback6A = 0.7 | 0.2 | 0.5
PWM_CTRL_6A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback6A = 1.4 | 0.2 | 0.5
PWM_CTRL_6A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback6A = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_6A = 0 : NULL : WAIT = 0.5
J3_05 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_06 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_6B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback6B = 0.7 | 0.2 | 0.5
PWM_CTRL_6B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback6B = 1.4 | 0.2 | 0.5
PWM_CTRL_6B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback6B = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_6B = 0 : NULL : WAIT = 0.5
J3_06 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_07 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_8A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback8A = 0.7 | 0.2 | 0.5
PWM_CTRL_8A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback8A = 1.4 | 0.2 | 0.5
PWM_CTRL_8A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback8A = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_8A = 0 : NULL : WAIT = 0.5
J3_07 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_08 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_8B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback8B = 0.7 | 0.2 | 0.5
PWM_CTRL_8B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback8B = 1.4 | 0.2 | 0.5
PWM_CTRL_8B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback8B = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_8B = 0 : NULL : WAIT = 0.5
J3_08 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_09 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_10A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback10A = 0.7 | 0.2 | 0.5
PWM_CTRL_10A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback10A = 1.4 | 0.2 | 0.5
PWM_CTRL_10A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback10A = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_10A = 0 : NULL : WAIT = 0.5
J3_09 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_10 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_10B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback10B = 0.7 | 0.2 | 0.5
PWM_CTRL_10B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback10B = 1.4 | 0.2 | 0.5
PWM_CTRL_10B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback10B = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_10B = 0 : NULL : WAIT = 0.5
J3_10 = 0 : NULL : WAIT = 0.5
#test at 500hz
Command = 82, FREQ1 = 500, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
# Set multimeter to DC current for high-current path (lead must be on 20A jack)
METER_MODE = 1 : NULL : WAIT = 0.4
METER_MODE = 1 : NULL : WAIT = 0.4
NULL : NULL : WAIT = 0.4
#switch in 5.1 Ohm resistive load. (2.84 amps @ 14.5 VDC)
J4_01 = 1 : NULL : WAIT = 0.2
J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_2A = 1000 : NULL : WAIT = 0.2
#warm-up first meter sample after mode switch
NULL : NULL : WAIT = 0.8
NULL : MeterAmps = 0.7 | 0.3 | 0.5 : TIMEOUT = 8
NULL : Feedback2A = 0.7 | 0.2 | 0.5
PWM_CTRL_2A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback2A = 1.4 | 0.2 | 0.5
PWM_CTRL_2A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback2A = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_2A = 0 : NULL : WAIT = 0.5
J3_01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_2B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback2B = 0.7 | 0.2 | 0.5
PWM_CTRL_2B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback2B = 1.4 | 0.2 | 0.5
PWM_CTRL_2B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback2B = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_2B = 0 : NULL : WAIT = 0.5
J3_02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_4A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback4A = 0.7 | 0.2 | 0.5
PWM_CTRL_4A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback4A = 1.4 | 0.2 | 0.5
PWM_CTRL_4A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback4A = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_4A = 0 : NULL : WAIT = 0.5
J3_03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_4B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback4B = 0.7 | 0.2 | 0.5
PWM_CTRL_4B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback4B = 1.4 | 0.2 | 0.5
PWM_CTRL_4B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback4B = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_4B = 0 : NULL : WAIT = 0.5
J3_04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_05 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_6A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback6A = 0.7 | 0.2 | 0.5
PWM_CTRL_6A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback6A = 1.4 | 0.2 | 0.5
PWM_CTRL_6A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback6A = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_6A = 0 : NULL : WAIT = 0.5
J3_05 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_06 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_6B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback6B = 0.7 | 0.2 | 0.5
PWM_CTRL_6B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback6B = 1.4 | 0.2 | 0.5
PWM_CTRL_6B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback6B = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_6B = 0 : NULL : WAIT = 0.5
J3_06 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_07 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_8A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback8A = 0.7 | 0.2 | 0.5
PWM_CTRL_8A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback8A = 1.4 | 0.2 | 0.5
PWM_CTRL_8A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback8A = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_8A = 0 : NULL : WAIT = 0.5
J3_07 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_08 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_8B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback8B = 0.7 | 0.2 | 0.5
PWM_CTRL_8B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback8B = 1.4 | 0.2 | 0.5
PWM_CTRL_8B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback8B = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_8B = 0 : NULL : WAIT = 0.5
J3_08 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_09 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_10A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback10A = 0.7 | 0.2 | 0.5
PWM_CTRL_10A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback10A = 1.4 | 0.2 | 0.5
PWM_CTRL_10A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback10A = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_10A = 0 : NULL : WAIT = 0.5
J3_09 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_10 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_10B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback10B = 0.7 | 0.2 | 0.5
PWM_CTRL_10B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback10B = 1.4 | 0.2 | 0.5
PWM_CTRL_10B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback10B = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_10B = 0 : NULL : WAIT = 0.5
J3_10 = 0 : NULL : WAIT = 0.5
#test at 64hz
Command = 82, FREQ1 = 64, MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
# Set multimeter to DC current for high-current path (lead must be on 20A jack)
METER_MODE = 1 : NULL : WAIT = 0.4
METER_MODE = 1 : NULL : WAIT = 0.4
NULL : NULL : WAIT = 0.4
#switch in 5.1 Ohm resistive load. (2.84 amps @ 14.5 VDC)
J4_01 = 1 : NULL : WAIT = 0.2
J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_2A = 1000 : NULL : WAIT = 0.2
#warm-up first meter sample after mode switch
NULL : NULL : WAIT = 0.8
NULL : MeterAmps = 0.7 | 0.3 | 0.5 : TIMEOUT = 8
NULL : Feedback2A = 0.7 | 0.2 | 0.5
PWM_CTRL_2A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback2A = 1.4 | 0.2 | 0.5
PWM_CTRL_2A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback2A = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_2A = 0 : NULL : WAIT = 0.5
J3_01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_2B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback2B = 0.7 | 0.2 | 0.5
PWM_CTRL_2B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback2B = 1.4 | 0.2 | 0.5
PWM_CTRL_2B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback2B = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_2B = 0 : NULL : WAIT = 0.5
J3_02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_4A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback4A = 0.7 | 0.2 | 0.5
PWM_CTRL_4A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback4A = 1.4 | 0.2 | 0.5
PWM_CTRL_4A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback4A = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_4A = 0 : NULL : WAIT = 0.5
J3_03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_4B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback4B = 0.7 | 0.2 | 0.5
PWM_CTRL_4B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback4B = 1.4 | 0.2 | 0.5
PWM_CTRL_4B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback4B = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_4B = 0 : NULL : WAIT = 0.5
J3_04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_05 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_6A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback6A = 0.7 | 0.2 | 0.5
PWM_CTRL_6A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback6A = 1.4 | 0.2 | 0.5
PWM_CTRL_6A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback6A = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_6A = 0 : NULL : WAIT = 0.5
J3_05 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_06 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_6B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback6B = 0.7 | 0.2 | 0.5
PWM_CTRL_6B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback6B = 1.4 | 0.2 | 0.5
PWM_CTRL_6B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback6B = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_6B = 0 : NULL : WAIT = 0.5
J3_06 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_07 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_8A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback8A = 0.7 | 0.2 | 0.5
PWM_CTRL_8A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback8A = 1.4 | 0.2 | 0.5
PWM_CTRL_8A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback8A = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_8A = 0 : NULL : WAIT = 0.5
J3_07 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_08 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_8B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback8B = 0.7 | 0.2 | 0.5
PWM_CTRL_8B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback8B = 1.4 | 0.2 | 0.5
PWM_CTRL_8B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback8B = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_8B = 0 : NULL : WAIT = 0.5
J3_08 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_09 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_10A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback10A = 0.7 | 0.2 | 0.5
PWM_CTRL_10A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback10A = 1.4 | 0.2 | 0.5
PWM_CTRL_10A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback10A = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_10A = 0 : NULL : WAIT = 0.5
J3_09 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J3_10 = 1 : NULL : WAIT = 0.5
METER_MODE = 1 : NULL : WAIT = 0.3

PWM_CTRL_10B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.7 | 0.3 | 0.5
NULL : Feedback10B = 0.7 | 0.2 | 0.5
PWM_CTRL_10B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.4 | 0.3 | 0.5
NULL : Feedback10B = 1.4 | 0.2 | 0.5
PWM_CTRL_10B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 2.8 | 0.3 | 0.5
NULL : Feedback10B = 2.8 | 0.2 | 0.5
#switch out load line, switch coil
PWM_CTRL_10B = 0 : NULL : WAIT = 0.5
J3_10 = 0 : NULL : WAIT = 0.5
SAVE
END
