#34044-1
#Verion 0.0
#PWM test with 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
UUT_DBC = 34044-561.dbc
UUT_DATANAME = 34044-1-OUTPUT-PWM-NORMAL-MODE-2

#-----setup 34044-----
#disable global modes
#configure Ports
Command = 83, MODE1A = 2, MODE1B = 2, MODE2A = 2, MODE2B = 2, MODE3A = 2, MODE3B = 2, MODE4A = 2, MODE4B = 2 : NULL : WAIT = 0.5
Command = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0 : NULL
Command = 93, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL : WAIT = 0.5
Command = 0, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0 : NULL : WAIT = 0.5
Command = 82, SaveSettings = 1, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, SaveSettings = 0, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 0, Enable_DPLF1 = 0, Enable_DPLF2 = 0 : NULL
Command = 82, FREQ1 = 40, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FREQ1 = 0, SaveSettings = 0 : NULL
#switch in 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
J4_01 = 1 : NULL : WAIT = 0.2
J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5

PWM_CTRL_1A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback1A = 0.8 | 0.15 | 0.5
PWM_CTRL_1A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback1A = 1.6 | 0.15 | 0.5
PWM_CTRL_1A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback1A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_1A = 0 : NULL : WAIT = 0.5
J2_01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

PWM_CTRL_1B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback1B = 0.8 | 0.15 | 0.5
PWM_CTRL_1B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback1B = 1.6 | 0.15 | 0.5
PWM_CTRL_1B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback1B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_1B = 0 : NULL : WAIT = 0.5
J2_02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback2A = 0.8 | 0.15 | 0.5
PWM_CTRL_2A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback2A = 1.6 | 0.15 | 0.5
PWM_CTRL_2A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback2A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_2A = 0 : NULL : WAIT = 0.5
J2_03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback2B = 0.8 | 0.15 | 0.5
PWM_CTRL_2B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback2B = 1.6 | 0.15 | 0.5
PWM_CTRL_2B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback2B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_2B = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5

PWM_CTRL_3A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback3A = 0.8 | 0.15 | 0.5
PWM_CTRL_3A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback3A = 1.6 | 0.15 | 0.5
PWM_CTRL_3A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback3A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_3A = 0 : NULL : WAIT = 0.5
J2_05 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

PWM_CTRL_3B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback3B = 0.8 | 0.15 | 0.5
PWM_CTRL_3B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback3B = 1.6 | 0.15 | 0.5
PWM_CTRL_3B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback3B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_3B = 0 : NULL : WAIT = 0.5
J2_06 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback4A = 0.8 | 0.15 | 0.5
PWM_CTRL_4A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback4A = 1.6 | 0.15 | 0.5
PWM_CTRL_4A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback4A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_4A = 0 : NULL : WAIT = 0.5
J2_07 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback4B = 0.8 | 0.15 | 0.5
PWM_CTRL_4B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback4B = 1.6 | 0.15 | 0.5
PWM_CTRL_4B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback4B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_4B = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
Command = 82, FREQ1 = 500, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FREQ1 = 0, SaveSettings = 0 : NULL
#switch in 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
J4_01 = 1 : NULL : WAIT = 0.2
J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5

PWM_CTRL_1A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback1A = 0.8 | 0.15 | 0.5
PWM_CTRL_1A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback1A = 1.6 | 0.15 | 0.5
PWM_CTRL_1A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback1A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_1A = 0 : NULL : WAIT = 0.5
J2_01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

PWM_CTRL_1B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback1B = 0.8 | 0.15 | 0.5
PWM_CTRL_1B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback1B = 1.6 | 0.15 | 0.5
PWM_CTRL_1B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback1B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_1B = 0 : NULL : WAIT = 0.5
J2_02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback2A = 0.8 | 0.15 | 0.5
PWM_CTRL_2A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback2A = 1.6 | 0.15 | 0.5
PWM_CTRL_2A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback2A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_2A = 0 : NULL : WAIT = 0.5
J2_03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback2B = 0.8 | 0.15 | 0.5
PWM_CTRL_2B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback2B = 1.6 | 0.15 | 0.5
PWM_CTRL_2B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback2B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_2B = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5

PWM_CTRL_3A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback3A = 0.8 | 0.15 | 0.5
PWM_CTRL_3A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback3A = 1.6 | 0.15 | 0.5
PWM_CTRL_3A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback3A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_3A = 0 : NULL : WAIT = 0.5
J2_05 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

PWM_CTRL_3B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback3B = 0.8 | 0.15 | 0.5
PWM_CTRL_3B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback3B = 1.6 | 0.15 | 0.5
PWM_CTRL_3B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback3B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_3B = 0 : NULL : WAIT = 0.5
J2_06 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback4A = 0.8 | 0.15 | 0.5
PWM_CTRL_4A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback4A = 1.6 | 0.15 | 0.5
PWM_CTRL_4A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback4A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_4A = 0 : NULL : WAIT = 0.5
J2_07 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback4B = 0.8 | 0.15 | 0.5
PWM_CTRL_4B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback4B = 1.6 | 0.15 | 0.5
PWM_CTRL_4B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback4B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_4B = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
Command = 82, FREQ1 = 1200, SaveSettings = 1, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL : WAIT = 0.5
Command = 0, FREQ1 = 0, SaveSettings = 0 : NULL
#switch in 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
J4_01 = 1 : NULL : WAIT = 0.2
J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_01 = 1 : NULL : WAIT = 0.5

PWM_CTRL_1A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback1A = 0.8 | 0.15 | 0.5
PWM_CTRL_1A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback1A = 1.6 | 0.15 | 0.5
PWM_CTRL_1A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback1A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_1A = 0 : NULL : WAIT = 0.5
J2_01 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

PWM_CTRL_1B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback1B = 0.8 | 0.15 | 0.5
PWM_CTRL_1B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback1B = 1.6 | 0.15 | 0.5
PWM_CTRL_1B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback1B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_1B = 0 : NULL : WAIT = 0.5
J2_02 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback2A = 0.8 | 0.15 | 0.5
PWM_CTRL_2A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback2A = 1.6 | 0.15 | 0.5
PWM_CTRL_2A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback2A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_2A = 0 : NULL : WAIT = 0.5
J2_03 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback2B = 0.8 | 0.15 | 0.5
PWM_CTRL_2B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback2B = 1.6 | 0.15 | 0.5
PWM_CTRL_2B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback2B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_2B = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_05 = 1 : NULL : WAIT = 0.5

PWM_CTRL_3A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback3A = 0.8 | 0.15 | 0.5
PWM_CTRL_3A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback3A = 1.6 | 0.15 | 0.5
PWM_CTRL_3A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback3A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_3A = 0 : NULL : WAIT = 0.5
J2_05 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

PWM_CTRL_3B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback3B = 0.8 | 0.15 | 0.5
PWM_CTRL_3B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback3B = 1.6 | 0.15 | 0.5
PWM_CTRL_3B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback3B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_3B = 0 : NULL : WAIT = 0.5
J2_06 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback4A = 0.8 | 0.15 | 0.5
PWM_CTRL_4A = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback4A = 1.6 | 0.15 | 0.5
PWM_CTRL_4A = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback4A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_4A = 0 : NULL : WAIT = 0.5
J2_07 = 0 : NULL : WAIT = 0.5
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback4B = 0.8 | 0.15 | 0.5
PWM_CTRL_4B = 2000 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback4B = 1.6 | 0.15 | 0.5
PWM_CTRL_4B = 4000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback4B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_4B = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
SAVE
END
