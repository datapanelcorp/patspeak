#43009-1
#Version 0.1
#Low Voltage Hold AD2/AD3 clear check using INPUT-ALL relay method at 2.5V
#Per input: verify normal 2.5V reading, force low-voltage-hold, verify AD2/AD3 ports clear to 0
UUT_DBC = 43009-560.dbc
UUT_DATANAME = 43009-1-LOW-VOLTAGE-HOLD-AD23-SWEEP

#cycle IGN to clean slate
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

#-----setup PAT fixture-----
LdRemote = 1 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 1 : NULL : WAIT = 1

#keep PAT bench supply path off (Rigol provides battery/input voltages)
PwrRemote = 1 : NULL : WAIT = 0.1
PwrSetCurrent = 0 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 0 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1

#initialize Rigol channels
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 1 --voltage 13.00 --current 2.000 --output on --settle 0.300 --retries 8 --retry-delay 0.500
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 2 --voltage 0.00 --current 1.000 --output off --settle 0.050 --retries 8 --retry-delay 0.500

#initialize relays
J4_03 = 1 : NULL : WAIT = 0.2
J4_01 = 0 : NULL : WAIT = 0.1
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2

#one-time enable of telemetry; then switch to Command=0 polling for the rest of the test
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.30
NULL : Response = 0 | 0.1 | 0.3
Command = 1, Enable_DIGIN = 1, Enable_AD2 = 1, Enable_AD3 = 1, Enable_AD4 = 1, Enable_DPLF2 = 1, Enable_FAULT = 1 : NULL : WAIT = 0.5
NULL : Response = 1 | 0.1 | 0.5
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.40
NULL : Response = 0 | 0.1 | 0.3

#-----Port_1A (AD2) low-voltage-hold clear check-----
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.1
J1_01 = 1 : NULL : WAIT = 0.1
J4_01 = 1 : NULL : WAIT = 0.1
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 2 --voltage 2.50 --current 1.000 --output on --settle 0.050 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.40
NULL : Response = 0 | 0.1 | 0.3
NULL : MeterVolts = 2.50 | 0.050 | 0.2
NULL : Port_1A = 2.50 | 0.150 | 0.2
NULL : Input_1A = 1 | 0.1 | 0.2

#enter low-voltage hold (<8V for >=8s) while continuously polling Command=0
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 1 --voltage 7.80 --current 2.000 --output on --settle 0.100 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
#fault and input-clear checks during hold
NULL : Active_Fault_Code = 21 | 0.1 | 0.6
NULL : Port_1A = 0.00 | 0.150 | 0.2
NULL : Input_1A = 0 | 0.1 | 0.2
NULL : Port_1B = 0.00 | 0.150 | 0.2
NULL : Input_1B = 0 | 0.1 | 0.2
NULL : Port_2A = 0.00 | 0.150 | 0.2
NULL : Input_2A = 0 | 0.1 | 0.2
NULL : Port_2B = 0.00 | 0.150 | 0.2
NULL : Input_2B = 0 | 0.1 | 0.2
NULL : Port_3A = 0.00 | 0.150 | 0.2
NULL : Input_3A = 0 | 0.1 | 0.2
NULL : Port_3B = 0.00 | 0.150 | 0.2
NULL : Input_3B = 0 | 0.1 | 0.2
NULL : Port_4A = 0.00 | 0.150 | 0.2
NULL : Input_4A = 0 | 0.1 | 0.2
NULL : Port_4B = 0.00 | 0.150 | 0.2
NULL : Input_4B = 0 | 0.1 | 0.2

#recover battery and verify selected input resumes normal reporting
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 1 --voltage 13.00 --current 2.000 --output on --settle 0.250 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.60
NULL : Response = 0 | 0.1 | 0.3
NULL : Port_1A = 2.50 | 0.150 | 0.3
NULL : Input_1A = 1 | 0.1 | 0.3

#clear relay routing before next input
J1_01 = 0 : NULL : WAIT = 0.1
J4_01 = 0 : NULL : WAIT = 0.1
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 2 --voltage 0.00 --current 1.000 --output off --settle 0.050 --retries 8 --retry-delay 0.500

#-----Port_1B (AD2) low-voltage-hold clear check-----
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.1
J1_02 = 1 : NULL : WAIT = 0.1
J4_01 = 1 : NULL : WAIT = 0.1
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 2 --voltage 2.50 --current 1.000 --output on --settle 0.050 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.40
NULL : Response = 0 | 0.1 | 0.3
NULL : MeterVolts = 2.50 | 0.050 | 0.2
NULL : Port_1B = 2.50 | 0.150 | 0.2
NULL : Input_1B = 1 | 0.1 | 0.2

#enter low-voltage hold (<8V for >=8s) while continuously polling Command=0
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 1 --voltage 7.80 --current 2.000 --output on --settle 0.100 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
#fault and input-clear checks during hold
NULL : Active_Fault_Code = 21 | 0.1 | 0.6
NULL : Port_1A = 0.00 | 0.150 | 0.2
NULL : Input_1A = 0 | 0.1 | 0.2
NULL : Port_1B = 0.00 | 0.150 | 0.2
NULL : Input_1B = 0 | 0.1 | 0.2
NULL : Port_2A = 0.00 | 0.150 | 0.2
NULL : Input_2A = 0 | 0.1 | 0.2
NULL : Port_2B = 0.00 | 0.150 | 0.2
NULL : Input_2B = 0 | 0.1 | 0.2
NULL : Port_3A = 0.00 | 0.150 | 0.2
NULL : Input_3A = 0 | 0.1 | 0.2
NULL : Port_3B = 0.00 | 0.150 | 0.2
NULL : Input_3B = 0 | 0.1 | 0.2
NULL : Port_4A = 0.00 | 0.150 | 0.2
NULL : Input_4A = 0 | 0.1 | 0.2
NULL : Port_4B = 0.00 | 0.150 | 0.2
NULL : Input_4B = 0 | 0.1 | 0.2

#recover battery and verify selected input resumes normal reporting
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 1 --voltage 13.00 --current 2.000 --output on --settle 0.250 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.60
NULL : Response = 0 | 0.1 | 0.3
NULL : Port_1B = 2.50 | 0.150 | 0.3
NULL : Input_1B = 1 | 0.1 | 0.3

#clear relay routing before next input
J1_02 = 0 : NULL : WAIT = 0.1
J4_01 = 0 : NULL : WAIT = 0.1
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 2 --voltage 0.00 --current 1.000 --output off --settle 0.050 --retries 8 --retry-delay 0.500

#-----Port_2A (AD2) low-voltage-hold clear check-----
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.1
J1_03 = 1 : NULL : WAIT = 0.1
J4_01 = 1 : NULL : WAIT = 0.1
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 2 --voltage 2.50 --current 1.000 --output on --settle 0.050 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.40
NULL : Response = 0 | 0.1 | 0.3
NULL : MeterVolts = 2.50 | 0.050 | 0.2
NULL : Port_2A = 2.50 | 0.150 | 0.2
NULL : Input_2A = 1 | 0.1 | 0.2

#enter low-voltage hold (<8V for >=8s) while continuously polling Command=0
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 1 --voltage 7.80 --current 2.000 --output on --settle 0.100 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
#fault and input-clear checks during hold
NULL : Active_Fault_Code = 21 | 0.1 | 0.6
NULL : Port_1A = 0.00 | 0.150 | 0.2
NULL : Input_1A = 0 | 0.1 | 0.2
NULL : Port_1B = 0.00 | 0.150 | 0.2
NULL : Input_1B = 0 | 0.1 | 0.2
NULL : Port_2A = 0.00 | 0.150 | 0.2
NULL : Input_2A = 0 | 0.1 | 0.2
NULL : Port_2B = 0.00 | 0.150 | 0.2
NULL : Input_2B = 0 | 0.1 | 0.2
NULL : Port_3A = 0.00 | 0.150 | 0.2
NULL : Input_3A = 0 | 0.1 | 0.2
NULL : Port_3B = 0.00 | 0.150 | 0.2
NULL : Input_3B = 0 | 0.1 | 0.2
NULL : Port_4A = 0.00 | 0.150 | 0.2
NULL : Input_4A = 0 | 0.1 | 0.2
NULL : Port_4B = 0.00 | 0.150 | 0.2
NULL : Input_4B = 0 | 0.1 | 0.2

#recover battery and verify selected input resumes normal reporting
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 1 --voltage 13.00 --current 2.000 --output on --settle 0.250 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.60
NULL : Response = 0 | 0.1 | 0.3
NULL : Port_2A = 2.50 | 0.150 | 0.3
NULL : Input_2A = 1 | 0.1 | 0.3

#clear relay routing before next input
J1_03 = 0 : NULL : WAIT = 0.1
J4_01 = 0 : NULL : WAIT = 0.1
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 2 --voltage 0.00 --current 1.000 --output off --settle 0.050 --retries 8 --retry-delay 0.500

#-----Port_2B (AD2) low-voltage-hold clear check-----
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.1
J1_04 = 1 : NULL : WAIT = 0.1
J4_01 = 1 : NULL : WAIT = 0.1
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 2 --voltage 2.50 --current 1.000 --output on --settle 0.050 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.40
NULL : Response = 0 | 0.1 | 0.3
NULL : MeterVolts = 2.50 | 0.050 | 0.2
NULL : Port_2B = 2.50 | 0.150 | 0.2
NULL : Input_2B = 1 | 0.1 | 0.2

#enter low-voltage hold (<8V for >=8s) while continuously polling Command=0
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 1 --voltage 7.80 --current 2.000 --output on --settle 0.100 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
#fault and input-clear checks during hold
NULL : Active_Fault_Code = 21 | 0.1 | 0.6
NULL : Port_1A = 0.00 | 0.150 | 0.2
NULL : Input_1A = 0 | 0.1 | 0.2
NULL : Port_1B = 0.00 | 0.150 | 0.2
NULL : Input_1B = 0 | 0.1 | 0.2
NULL : Port_2A = 0.00 | 0.150 | 0.2
NULL : Input_2A = 0 | 0.1 | 0.2
NULL : Port_2B = 0.00 | 0.150 | 0.2
NULL : Input_2B = 0 | 0.1 | 0.2
NULL : Port_3A = 0.00 | 0.150 | 0.2
NULL : Input_3A = 0 | 0.1 | 0.2
NULL : Port_3B = 0.00 | 0.150 | 0.2
NULL : Input_3B = 0 | 0.1 | 0.2
NULL : Port_4A = 0.00 | 0.150 | 0.2
NULL : Input_4A = 0 | 0.1 | 0.2
NULL : Port_4B = 0.00 | 0.150 | 0.2
NULL : Input_4B = 0 | 0.1 | 0.2

#recover battery and verify selected input resumes normal reporting
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 1 --voltage 13.00 --current 2.000 --output on --settle 0.250 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.60
NULL : Response = 0 | 0.1 | 0.3
NULL : Port_2B = 2.50 | 0.150 | 0.3
NULL : Input_2B = 1 | 0.1 | 0.3

#clear relay routing before next input
J1_04 = 0 : NULL : WAIT = 0.1
J4_01 = 0 : NULL : WAIT = 0.1
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 2 --voltage 0.00 --current 1.000 --output off --settle 0.050 --retries 8 --retry-delay 0.500

#-----Port_3A (AD3) low-voltage-hold clear check-----
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.1
J1_05 = 1 : NULL : WAIT = 0.1
J4_01 = 1 : NULL : WAIT = 0.1
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 2 --voltage 2.50 --current 1.000 --output on --settle 0.050 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.40
NULL : Response = 0 | 0.1 | 0.3
NULL : MeterVolts = 2.50 | 0.050 | 0.2
NULL : Port_3A = 2.50 | 0.150 | 0.2
NULL : Input_3A = 1 | 0.1 | 0.2

#enter low-voltage hold (<8V for >=8s) while continuously polling Command=0
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 1 --voltage 7.80 --current 2.000 --output on --settle 0.100 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
#fault and input-clear checks during hold
NULL : Active_Fault_Code = 21 | 0.1 | 0.6
NULL : Port_1A = 0.00 | 0.150 | 0.2
NULL : Input_1A = 0 | 0.1 | 0.2
NULL : Port_1B = 0.00 | 0.150 | 0.2
NULL : Input_1B = 0 | 0.1 | 0.2
NULL : Port_2A = 0.00 | 0.150 | 0.2
NULL : Input_2A = 0 | 0.1 | 0.2
NULL : Port_2B = 0.00 | 0.150 | 0.2
NULL : Input_2B = 0 | 0.1 | 0.2
NULL : Port_3A = 0.00 | 0.150 | 0.2
NULL : Input_3A = 0 | 0.1 | 0.2
NULL : Port_3B = 0.00 | 0.150 | 0.2
NULL : Input_3B = 0 | 0.1 | 0.2
NULL : Port_4A = 0.00 | 0.150 | 0.2
NULL : Input_4A = 0 | 0.1 | 0.2
NULL : Port_4B = 0.00 | 0.150 | 0.2
NULL : Input_4B = 0 | 0.1 | 0.2

#recover battery and verify selected input resumes normal reporting
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 1 --voltage 13.00 --current 2.000 --output on --settle 0.250 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.60
NULL : Response = 0 | 0.1 | 0.3
NULL : Port_3A = 2.50 | 0.150 | 0.3
NULL : Input_3A = 1 | 0.1 | 0.3

#clear relay routing before next input
J1_05 = 0 : NULL : WAIT = 0.1
J4_01 = 0 : NULL : WAIT = 0.1
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 2 --voltage 0.00 --current 1.000 --output off --settle 0.050 --retries 8 --retry-delay 0.500

#-----Port_3B (AD3) low-voltage-hold clear check-----
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.1
J1_06 = 1 : NULL : WAIT = 0.1
J4_01 = 1 : NULL : WAIT = 0.1
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 2 --voltage 2.50 --current 1.000 --output on --settle 0.050 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.40
NULL : Response = 0 | 0.1 | 0.3
NULL : MeterVolts = 2.50 | 0.050 | 0.2
NULL : Port_3B = 2.50 | 0.150 | 0.2
NULL : Input_3B = 1 | 0.1 | 0.2

#enter low-voltage hold (<8V for >=8s) while continuously polling Command=0
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 1 --voltage 7.80 --current 2.000 --output on --settle 0.100 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
#fault and input-clear checks during hold
NULL : Active_Fault_Code = 21 | 0.1 | 0.6
NULL : Port_1A = 0.00 | 0.150 | 0.2
NULL : Input_1A = 0 | 0.1 | 0.2
NULL : Port_1B = 0.00 | 0.150 | 0.2
NULL : Input_1B = 0 | 0.1 | 0.2
NULL : Port_2A = 0.00 | 0.150 | 0.2
NULL : Input_2A = 0 | 0.1 | 0.2
NULL : Port_2B = 0.00 | 0.150 | 0.2
NULL : Input_2B = 0 | 0.1 | 0.2
NULL : Port_3A = 0.00 | 0.150 | 0.2
NULL : Input_3A = 0 | 0.1 | 0.2
NULL : Port_3B = 0.00 | 0.150 | 0.2
NULL : Input_3B = 0 | 0.1 | 0.2
NULL : Port_4A = 0.00 | 0.150 | 0.2
NULL : Input_4A = 0 | 0.1 | 0.2
NULL : Port_4B = 0.00 | 0.150 | 0.2
NULL : Input_4B = 0 | 0.1 | 0.2

#recover battery and verify selected input resumes normal reporting
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 1 --voltage 13.00 --current 2.000 --output on --settle 0.250 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.60
NULL : Response = 0 | 0.1 | 0.3
NULL : Port_3B = 2.50 | 0.150 | 0.3
NULL : Input_3B = 1 | 0.1 | 0.3

#clear relay routing before next input
J1_06 = 0 : NULL : WAIT = 0.1
J4_01 = 0 : NULL : WAIT = 0.1
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 2 --voltage 0.00 --current 1.000 --output off --settle 0.050 --retries 8 --retry-delay 0.500

#-----Port_4A (AD3) low-voltage-hold clear check-----
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.1
J1_07 = 1 : NULL : WAIT = 0.1
J4_01 = 1 : NULL : WAIT = 0.1
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 2 --voltage 2.50 --current 1.000 --output on --settle 0.050 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.40
NULL : Response = 0 | 0.1 | 0.3
NULL : MeterVolts = 2.50 | 0.050 | 0.2
NULL : Port_4A = 2.50 | 0.150 | 0.2
NULL : Input_4A = 1 | 0.1 | 0.2

#enter low-voltage hold (<8V for >=8s) while continuously polling Command=0
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 1 --voltage 7.80 --current 2.000 --output on --settle 0.100 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
#fault and input-clear checks during hold
NULL : Active_Fault_Code = 21 | 0.1 | 0.6
NULL : Port_1A = 0.00 | 0.150 | 0.2
NULL : Input_1A = 0 | 0.1 | 0.2
NULL : Port_1B = 0.00 | 0.150 | 0.2
NULL : Input_1B = 0 | 0.1 | 0.2
NULL : Port_2A = 0.00 | 0.150 | 0.2
NULL : Input_2A = 0 | 0.1 | 0.2
NULL : Port_2B = 0.00 | 0.150 | 0.2
NULL : Input_2B = 0 | 0.1 | 0.2
NULL : Port_3A = 0.00 | 0.150 | 0.2
NULL : Input_3A = 0 | 0.1 | 0.2
NULL : Port_3B = 0.00 | 0.150 | 0.2
NULL : Input_3B = 0 | 0.1 | 0.2
NULL : Port_4A = 0.00 | 0.150 | 0.2
NULL : Input_4A = 0 | 0.1 | 0.2
NULL : Port_4B = 0.00 | 0.150 | 0.2
NULL : Input_4B = 0 | 0.1 | 0.2

#recover battery and verify selected input resumes normal reporting
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 1 --voltage 13.00 --current 2.000 --output on --settle 0.250 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.60
NULL : Response = 0 | 0.1 | 0.3
NULL : Port_4A = 2.50 | 0.150 | 0.3
NULL : Input_4A = 1 | 0.1 | 0.3

#clear relay routing before next input
J1_07 = 0 : NULL : WAIT = 0.1
J4_01 = 0 : NULL : WAIT = 0.1
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 2 --voltage 0.00 --current 1.000 --output off --settle 0.050 --retries 8 --retry-delay 0.500

#-----Port_4B (AD3) low-voltage-hold clear check-----
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.1
J1_08 = 1 : NULL : WAIT = 0.1
J4_01 = 1 : NULL : WAIT = 0.1
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 2 --voltage 2.50 --current 1.000 --output on --settle 0.050 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.40
NULL : Response = 0 | 0.1 | 0.3
NULL : MeterVolts = 2.50 | 0.050 | 0.2
NULL : Port_4B = 2.50 | 0.150 | 0.2
NULL : Input_4B = 1 | 0.1 | 0.2

#enter low-voltage hold (<8V for >=8s) while continuously polling Command=0
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 1 --voltage 7.80 --current 2.000 --output on --settle 0.100 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 1.90
NULL : Response = 0 | 0.1 | 0.3
#fault and input-clear checks during hold
NULL : Active_Fault_Code = 21 | 0.1 | 0.6
NULL : Port_1A = 0.00 | 0.150 | 0.2
NULL : Input_1A = 0 | 0.1 | 0.2
NULL : Port_1B = 0.00 | 0.150 | 0.2
NULL : Input_1B = 0 | 0.1 | 0.2
NULL : Port_2A = 0.00 | 0.150 | 0.2
NULL : Input_2A = 0 | 0.1 | 0.2
NULL : Port_2B = 0.00 | 0.150 | 0.2
NULL : Input_2B = 0 | 0.1 | 0.2
NULL : Port_3A = 0.00 | 0.150 | 0.2
NULL : Input_3A = 0 | 0.1 | 0.2
NULL : Port_3B = 0.00 | 0.150 | 0.2
NULL : Input_3B = 0 | 0.1 | 0.2
NULL : Port_4A = 0.00 | 0.150 | 0.2
NULL : Input_4A = 0 | 0.1 | 0.2
NULL : Port_4B = 0.00 | 0.150 | 0.2
NULL : Input_4B = 0 | 0.1 | 0.2

#recover battery and verify selected input resumes normal reporting
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 1 --voltage 13.00 --current 2.000 --output on --settle 0.250 --retries 8 --retry-delay 0.500
SEND_CAN CH0 0x18EFD9D1 0 0 0 0 0 0 0 0
Command = 0 : NULL : WAIT = 0.60
NULL : Response = 0 | 0.1 | 0.3
NULL : Port_4B = 2.50 | 0.150 | 0.3
NULL : Input_4B = 1 | 0.1 | 0.3

#clear relay routing before next input
J1_08 = 0 : NULL : WAIT = 0.1
J4_01 = 0 : NULL : WAIT = 0.1
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 2 --voltage 0.00 --current 1.000 --output off --settle 0.050 --retries 8 --retry-delay 0.500

#-----teardown-----
J1_01 = 0, J1_02 = 0, J1_03 = 0, J1_04 = 0, J1_05 = 0, J1_06 = 0, J1_07 = 0, J1_08 = 0 : NULL : WAIT = 0.2
J4_01 = 0 : NULL : WAIT = 0.1
J4_03 = 0 : NULL : WAIT = 0.2
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 2 --voltage 0.00 --current 1.000 --output off --settle 0.050 --retries 8 --retry-delay 0.500
PAT dp800/rigol_dp800_set_ch.py --resource TCPIP0::192.168.45.178::INSTR --channel 1 --voltage 13.00 --current 2.000 --output on --settle 0.200 --retries 8 --retry-delay 0.500

LdRemote = 0 : NULL : WAIT = 0.1
LdEnable = 0 : NULL : WAIT = 0.1
LdCurrentSet = 0 : NULL : WAIT = 0.1
J0_08_METER_LOAD = 0 : NULL : WAIT = 0.1
PwrSetCurrent = 0 : NULL : WAIT = 0.1
PwrSetVoltage = 0 : NULL : WAIT = 0.1
PwrEnable = 0 : NULL : WAIT = 0.1
J0_09_TEST_SUPPLY = 0 : NULL : WAIT = 1
PwrRemote = 0 : NULL : WAIT = 0.1

#cycle IGN to clean slate
RLY_K1 = 0 : NULL : WAIT = 1
RLY_K1 = 1 : NULL : WAIT = 2
RLY_K1 = 0 : NULL : WAIT = 1

SAVE
END
