# Global setup
version = "1.0"
TestName = "44018-1-PWM-"+version
datafile = TestName + ".pat"

outstr = ""

# Header
outstr += f"#44018-1\n"
outstr += f"#Verion {version}\n"
outstr += f"UUT_DBC = 44018-560.dbc\n"
outstr += f"UUT_DATANAME = {TestName}\n"
outstr += "#-----setup PAT-----\n"

# Load setup
outstr += "#setup load\n"
outstr += "LdRemote = 1 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 1 : NULL : WAIT = 0.1\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "#switch in load line, set current\n"
outstr += "J0_08_METER_LOAD = 1 : NULL : WAIT = 1\n\n"

freq_test_points            = {50, 100, 250}
current_ma_test_points      = {1000, 5000, 13000}
duty_cycle_test_points      = {10, 500, 990}
number_of_channels          = 12

dut_feedback_tolerance      = 0.25
meter_feedback_tolerance    = 0.25

# Generate test sections for each output channel  
for channel in range(1, number_of_channels + 1):
    outstr += f"#### OUT{channel} START\n"
    outstr += f"# switch in dut\n"
    outstr += f"J2_{channel:02d} = 1 : NULL : WAIT = 0.5\n"
    
    for freq in freq_test_points:
        outstr += f"# Frequency {freq} hz\n"
        outstr += f"Command = 220, ParamId = 457, Port1PwmFreq = {freq} : NULL : NULL\n"
        outstr += f"Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL\n"

        for duty in duty_cycle_test_points:    
            
            for ma in current_ma_test_points:
                outstr += f"## Duty: {duty}% Load: {ma}ma\n"

                outstr += f"#set current and turn on output and verify feedback\n"
                outstr += f"LdCurrentSet = {ma}, Pwm{channel}DutyCmd = {duty} : NULL : WAIT = 0.1\n"
                    
                # Verify readings
                current_A = ma / 1000.0
                outstr += f"#verify reading from load\n"
                outstr += f"NULL : PwmOut{channel}Current = {current_A:.1f} | {dut_feedback_tolerance} | 0.1\n"
                outstr += f"NULL : MeterCurrent = {current_A:.1f} | {dut_feedback_tolerance} | 0.1\n"
                outstr += f"LdCurrentSet = {ma}, Pwm{channel}DutyCmd = 0 : NULL : WAIT = 0.1\n"
            
    # Turn off DUT
    outstr += f"J2_{channel:02d} = 0 : NULL : WAIT = 0.1\n"
    outstr += f"#### OUT{channel} END\n\n"

# Cleanup and shutdown
outstr += "#switch out load line, clear current\n"
outstr += "LdCurrentSet = 0 : NULL : WAIT = 0.1\n"
outstr += "LdRemote = 0 : NULL : WAIT = 0.1\n"
outstr += "LdEnable = 0 : NULL : WAIT = 0.1\n"
outstr += "J0_08_METER_LOAD = 0 : NULL : WAIT = 1\n"
outstr += "SAVE\n"
outstr += "END\n"

def write_to_file(content, filename):
    """Write content to file"""
    with open(filename, 'w') as f:
        f.write(content)

write_to_file(outstr, datafile)
print(f"Script written to {datafile}")

