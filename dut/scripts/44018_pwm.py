# Global setup
version = "3.0-DIRECT-100"
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

freq_test_points            = {50, 125, 250}
current_ma_test_points      = {1000, 5000, 13000}
duty_cycle_test_points      = {1, 50, 99}
number_of_channels          = 12

# for an abbriviated test
#   1 freq, 1 duty cycle, 3 test points per port
freq_test_points            = {50, 125, 250}
current_ma_test_points      = {1000, 5000, 9000}
duty_cycle_test_points      = {100}

dut_feedback_tolerance      = 0.25 #0.55
meter_feedback_tolerance    = 0.25 #0.55
short_wait_s                = 0.1
wait_time_s                 = 0.5
long_wait_s                 = 0.5

# Generate test sections for each output channel  
for channel in range(1, number_of_channels + 1):
    outstr += f"#**** OUT{channel} START\n"
    outstr += f"# --> Switch in dut\n"
    outstr += f"J2_{channel:02d} = 1 : NULL : WAIT = {long_wait_s}\n"
    
    for freq in sorted(freq_test_points):
        outstr += f"# --> Frequency {freq} hz\n"
        outstr += f"Command = 220, ParamId = 457, Port1PwmFreq = {freq} : NULL : WAIT = {short_wait_s}\n"
        outstr += f"Command = 0, ParamId = 0, Port1PwmFreq = 0 : NULL : NULL\n"

        for duty in sorted(duty_cycle_test_points): 
            
            for ma in sorted(current_ma_test_points):             
                outstr += f"# --> Duty: {duty}% Load: {ma}ma\n"

                # outstr += f"# Set current and turn on output and verify feedback\n"
                outstr += f"LdCurrentSet = {ma}, Pwm{channel}DutyCmd = {duty} : NULL : WAIT = {wait_time_s}\n"
                    
                # Verify readings
                current_A = ma / 1000.0
                
                # calculate tolerance
                # tol_percent                 = 0.8 # 80%
                meter_value = current_A  #(duty / 100.0) * current_A
                dut_value   = current_A  #(duty / 100.0) * current_A
                # m_tol       = meter_feedback_tolerance if duty == 100 else 2.5 #tol_percent * meter_value
                # d_tol       = dut_feedback_tolerance if duty == 100 else 2.5 #tol_percent * dut_value
                
                # outstr += f"# verify reading from load\n"
                outstr += f"NULL : PwmOut{channel}Current = {dut_value:.1f} | {dut_feedback_tolerance:.2f} | {wait_time_s}\n"
                # outstr += f"NULL : MeterCurrent = {meter_value:.1f} | {meter_feedback_tolerance:.2f} | {wait_time_s}\n"
            
    # Turn off DUT
    outstr += f"J2_{channel:02d} = 0, Pwm{channel}DutyCmd = 0 : NULL : WAIT = {wait_time_s}\n"
    outstr += f"#**** OUT{channel} END\n\n"

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

