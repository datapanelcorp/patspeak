#34044-3
#Verion 0.0
#PWM test with 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
UUT_DBC = 34044-563.dbc
UUT_DATANAME = 34044-3-PWM-NORMAL

#-----setup 34044-----
#disable global modes
#configure Ports
Command = 83, MODE1A = 1, MODE1B = 3, MODE2A = 3, MODE2B = 3, MODE3A = 1, MODE3B = 3, MODE4A = 3, MODE4B = 3, MODE5A = 3, MODE5B = 3, MODE6A = 3, MODE6B = 3, MODE7A = 3, MODE7B = 3 : NULL : WAIT = 0.5
Command = 84, MODE8A = 3, MODE8B = 3 : NULL : WAIT = 0.5
Command = 93, PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0, PORT5_MODE = 0, PORT6_MODE = 0, PORT7_MODE = 0, PORT8_MODE = 0 : NULL : WAIT = 0.5
Command = 82, MODE1 = 0, MODE2 = 0, ADRaw = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL
Command = 82, SaveSettings = 1 : NULL
Command = 82, FREQ1 = 40, SaveSettings = 1 : NULL
#switch in scope
J4_03 = 1 : NULL : WAIT = 0.2
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

PWM_CTRL_1B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback1B = 0.8 | 0.15 | 0.5
PWM_CTRL_1B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback1B = 1.6 | 0.15 | 0.5
PWM_CTRL_1B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback1B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_1B = 0 : NULL : WAIT = 0.5
J2_02 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2A = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback2A = 0.8 | 0.15 | 0.5
PWM_CTRL_2A = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback2A = 1.6 | 0.15 | 0.5
PWM_CTRL_2A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback2A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_2A = 0 : NULL : WAIT = 0.5
J2_03 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback2B = 0.8 | 0.15 | 0.5
PWM_CTRL_2B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback2B = 1.6 | 0.15 | 0.5
PWM_CTRL_2B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback2B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_2B = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

PWM_CTRL_3B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback3B = 0.8 | 0.15 | 0.5
PWM_CTRL_3B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback3B = 1.6 | 0.15 | 0.5
PWM_CTRL_3B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback3B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_3B = 0 : NULL : WAIT = 0.5
J2_06 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4A = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback4A = 0.8 | 0.15 | 0.5
PWM_CTRL_4A = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback4A = 1.6 | 0.15 | 0.5
PWM_CTRL_4A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback4A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_4A = 0 : NULL : WAIT = 0.5
J2_07 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback4B = 0.8 | 0.15 | 0.5
PWM_CTRL_4B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback4B = 1.6 | 0.15 | 0.5
PWM_CTRL_4B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback4B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_4B = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_09 = 1 : NULL : WAIT = 0.5

PWM_CTRL_5A = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback5A = 0.8 | 0.15 | 0.5
PWM_CTRL_5A = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback5A = 1.6 | 0.15 | 0.5
PWM_CTRL_5A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback5A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_5A = 0 : NULL : WAIT = 0.5
J2_09 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_10 = 1 : NULL : WAIT = 0.5

PWM_CTRL_5B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback5B = 0.8 | 0.15 | 0.5
PWM_CTRL_5B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback5B = 1.6 | 0.15 | 0.5
PWM_CTRL_5B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback5B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_5B = 0 : NULL : WAIT = 0.5
J2_10 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_11 = 1 : NULL : WAIT = 0.5

PWM_CTRL_6A = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback6A = 0.8 | 0.15 | 0.5
PWM_CTRL_6A = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback6A = 1.6 | 0.15 | 0.5
PWM_CTRL_6A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback6A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_6A = 0 : NULL : WAIT = 0.5
J2_11 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_12 = 1 : NULL : WAIT = 0.5

PWM_CTRL_6B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback6B = 0.8 | 0.15 | 0.5
PWM_CTRL_6B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback6B = 1.6 | 0.15 | 0.5
PWM_CTRL_6B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback6B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_6B = 0 : NULL : WAIT = 0.5
J2_12 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5

PWM_CTRL_7A = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback7A = 0.8 | 0.15 | 0.5
PWM_CTRL_7A = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback7A = 1.6 | 0.15 | 0.5
PWM_CTRL_7A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback7A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_7A = 0 : NULL : WAIT = 0.5
J3_01 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5

PWM_CTRL_7B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback7B = 0.8 | 0.15 | 0.5
PWM_CTRL_7B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback7B = 1.6 | 0.15 | 0.5
PWM_CTRL_7B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback7B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_7B = 0 : NULL : WAIT = 0.5
J3_02 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5

PWM_CTRL_8A = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback8A = 0.8 | 0.15 | 0.5
PWM_CTRL_8A = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback8A = 1.6 | 0.15 | 0.5
PWM_CTRL_8A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback8A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_8A = 0 : NULL : WAIT = 0.5
J3_03 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5

PWM_CTRL_8B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback8B = 0.8 | 0.15 | 0.5
PWM_CTRL_8B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback8B = 1.6 | 0.15 | 0.5
PWM_CTRL_8B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback8B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_8B = 0 : NULL : WAIT = 0.5
J3_04 = 0 : NULL : WAIT = 0.5
Command = 82, FREQ1 = 500, SaveSettings = 1 : NULL
#switch in scope
J4_03 = 1 : NULL : WAIT = 0.2
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

PWM_CTRL_1B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback1B = 0.8 | 0.15 | 0.5
PWM_CTRL_1B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback1B = 1.6 | 0.15 | 0.5
PWM_CTRL_1B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback1B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_1B = 0 : NULL : WAIT = 0.5
J2_02 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2A = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback2A = 0.8 | 0.15 | 0.5
PWM_CTRL_2A = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback2A = 1.6 | 0.15 | 0.5
PWM_CTRL_2A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback2A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_2A = 0 : NULL : WAIT = 0.5
J2_03 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback2B = 0.8 | 0.15 | 0.5
PWM_CTRL_2B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback2B = 1.6 | 0.15 | 0.5
PWM_CTRL_2B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback2B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_2B = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

PWM_CTRL_3B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback3B = 0.8 | 0.15 | 0.5
PWM_CTRL_3B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback3B = 1.6 | 0.15 | 0.5
PWM_CTRL_3B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback3B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_3B = 0 : NULL : WAIT = 0.5
J2_06 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4A = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback4A = 0.8 | 0.15 | 0.5
PWM_CTRL_4A = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback4A = 1.6 | 0.15 | 0.5
PWM_CTRL_4A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback4A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_4A = 0 : NULL : WAIT = 0.5
J2_07 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback4B = 0.8 | 0.15 | 0.5
PWM_CTRL_4B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback4B = 1.6 | 0.15 | 0.5
PWM_CTRL_4B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback4B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_4B = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_09 = 1 : NULL : WAIT = 0.5

PWM_CTRL_5A = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback5A = 0.8 | 0.15 | 0.5
PWM_CTRL_5A = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback5A = 1.6 | 0.15 | 0.5
PWM_CTRL_5A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback5A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_5A = 0 : NULL : WAIT = 0.5
J2_09 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_10 = 1 : NULL : WAIT = 0.5

PWM_CTRL_5B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback5B = 0.8 | 0.15 | 0.5
PWM_CTRL_5B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback5B = 1.6 | 0.15 | 0.5
PWM_CTRL_5B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback5B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_5B = 0 : NULL : WAIT = 0.5
J2_10 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_11 = 1 : NULL : WAIT = 0.5

PWM_CTRL_6A = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback6A = 0.8 | 0.15 | 0.5
PWM_CTRL_6A = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback6A = 1.6 | 0.15 | 0.5
PWM_CTRL_6A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback6A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_6A = 0 : NULL : WAIT = 0.5
J2_11 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_12 = 1 : NULL : WAIT = 0.5

PWM_CTRL_6B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback6B = 0.8 | 0.15 | 0.5
PWM_CTRL_6B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback6B = 1.6 | 0.15 | 0.5
PWM_CTRL_6B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback6B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_6B = 0 : NULL : WAIT = 0.5
J2_12 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5

PWM_CTRL_7A = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback7A = 0.8 | 0.15 | 0.5
PWM_CTRL_7A = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback7A = 1.6 | 0.15 | 0.5
PWM_CTRL_7A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback7A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_7A = 0 : NULL : WAIT = 0.5
J3_01 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5

PWM_CTRL_7B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback7B = 0.8 | 0.15 | 0.5
PWM_CTRL_7B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback7B = 1.6 | 0.15 | 0.5
PWM_CTRL_7B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback7B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_7B = 0 : NULL : WAIT = 0.5
J3_02 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5

PWM_CTRL_8A = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback8A = 0.8 | 0.15 | 0.5
PWM_CTRL_8A = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback8A = 1.6 | 0.15 | 0.5
PWM_CTRL_8A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback8A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_8A = 0 : NULL : WAIT = 0.5
J3_03 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5

PWM_CTRL_8B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback8B = 0.8 | 0.15 | 0.5
PWM_CTRL_8B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback8B = 1.6 | 0.15 | 0.5
PWM_CTRL_8B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback8B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_8B = 0 : NULL : WAIT = 0.5
J3_04 = 0 : NULL : WAIT = 0.5
Command = 82, FREQ1 = 1200, SaveSettings = 1 : NULL
#switch in scope
J4_03 = 1 : NULL : WAIT = 0.2
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_02 = 1 : NULL : WAIT = 0.5

PWM_CTRL_1B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback1B = 0.8 | 0.15 | 0.5
PWM_CTRL_1B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback1B = 1.6 | 0.15 | 0.5
PWM_CTRL_1B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback1B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_1B = 0 : NULL : WAIT = 0.5
J2_02 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_03 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2A = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback2A = 0.8 | 0.15 | 0.5
PWM_CTRL_2A = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback2A = 1.6 | 0.15 | 0.5
PWM_CTRL_2A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback2A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_2A = 0 : NULL : WAIT = 0.5
J2_03 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_04 = 1 : NULL : WAIT = 0.5

PWM_CTRL_2B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback2B = 0.8 | 0.15 | 0.5
PWM_CTRL_2B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback2B = 1.6 | 0.15 | 0.5
PWM_CTRL_2B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback2B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_2B = 0 : NULL : WAIT = 0.5
J2_04 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_06 = 1 : NULL : WAIT = 0.5

PWM_CTRL_3B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback3B = 0.8 | 0.15 | 0.5
PWM_CTRL_3B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback3B = 1.6 | 0.15 | 0.5
PWM_CTRL_3B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback3B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_3B = 0 : NULL : WAIT = 0.5
J2_06 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_07 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4A = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback4A = 0.8 | 0.15 | 0.5
PWM_CTRL_4A = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback4A = 1.6 | 0.15 | 0.5
PWM_CTRL_4A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback4A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_4A = 0 : NULL : WAIT = 0.5
J2_07 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_08 = 1 : NULL : WAIT = 0.5

PWM_CTRL_4B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback4B = 0.8 | 0.15 | 0.5
PWM_CTRL_4B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback4B = 1.6 | 0.15 | 0.5
PWM_CTRL_4B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback4B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_4B = 0 : NULL : WAIT = 0.5
J2_08 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_09 = 1 : NULL : WAIT = 0.5

PWM_CTRL_5A = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback5A = 0.8 | 0.15 | 0.5
PWM_CTRL_5A = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback5A = 1.6 | 0.15 | 0.5
PWM_CTRL_5A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback5A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_5A = 0 : NULL : WAIT = 0.5
J2_09 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_10 = 1 : NULL : WAIT = 0.5

PWM_CTRL_5B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback5B = 0.8 | 0.15 | 0.5
PWM_CTRL_5B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback5B = 1.6 | 0.15 | 0.5
PWM_CTRL_5B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback5B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_5B = 0 : NULL : WAIT = 0.5
J2_10 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_11 = 1 : NULL : WAIT = 0.5

PWM_CTRL_6A = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback6A = 0.8 | 0.15 | 0.5
PWM_CTRL_6A = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback6A = 1.6 | 0.15 | 0.5
PWM_CTRL_6A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback6A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_6A = 0 : NULL : WAIT = 0.5
J2_11 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J2_12 = 1 : NULL : WAIT = 0.5

PWM_CTRL_6B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback6B = 0.8 | 0.15 | 0.5
PWM_CTRL_6B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback6B = 1.6 | 0.15 | 0.5
PWM_CTRL_6B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback6B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_6B = 0 : NULL : WAIT = 0.5
J2_12 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_01 = 1 : NULL : WAIT = 0.5

PWM_CTRL_7A = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback7A = 0.8 | 0.15 | 0.5
PWM_CTRL_7A = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback7A = 1.6 | 0.15 | 0.5
PWM_CTRL_7A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback7A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_7A = 0 : NULL : WAIT = 0.5
J3_01 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_02 = 1 : NULL : WAIT = 0.5

PWM_CTRL_7B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback7B = 0.8 | 0.15 | 0.5
PWM_CTRL_7B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback7B = 1.6 | 0.15 | 0.5
PWM_CTRL_7B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback7B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_7B = 0 : NULL : WAIT = 0.5
J3_02 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_03 = 1 : NULL : WAIT = 0.5

PWM_CTRL_8A = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback8A = 0.8 | 0.15 | 0.5
PWM_CTRL_8A = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback8A = 1.6 | 0.15 | 0.5
PWM_CTRL_8A = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback8A = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_8A = 0 : NULL : WAIT = 0.5
J3_03 = 0 : NULL : WAIT = 0.5
J4_01 = 1, J4_03 = 1 : NULL : WAIT = 0.2
#switch in load line, set current
J3_04 = 1 : NULL : WAIT = 0.5

PWM_CTRL_8B = 250 : NULL : WAIT = 0.2
NULL : MeterAmps = 0.8 | 0.15 | 0.5
NULL : Feedback8B = 0.8 | 0.15 | 0.5
PWM_CTRL_8B = 500 : NULL : WAIT = 0.2
NULL : MeterAmps = 1.6 | 0.15 | 0.5
NULL : Feedback8B = 1.6 | 0.15 | 0.5
PWM_CTRL_8B = 1000 : NULL : WAIT = 0.2
NULL : MeterAmps = 3.3 | 0.15 | 0.5
NULL : Feedback8B = 3.3 | 0.15 | 0.5
#switch out load line, switch coil
PWM_CTRL_8B = 0 : NULL : WAIT = 0.5
J3_04 = 0 : NULL : WAIT = 0.5
SAVE
END
