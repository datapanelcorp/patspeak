PATSpeak is a collection of scripts allowing the automation of the PAT test fixture
Updated 05/02/25

Setup Requirements:
	Run prerequisite_setup.py to install necessary python libraries and CAN drivers

Test Execution: 
	Run pat.py, passing the name of the .pat test file as an argument. Executable test files are stored within the /dut folder.

	Example command line: python pat.py '44018-PWM-100-DUTY.pat'

Test Script Syntax:

[Output Commands] : [Input Commands] : [Optional Flags]

Required Commands:
	UUT_DBC		filename of DBC file to be used by the UUT
		Example:	UUT_DBC = 34044-564.dbc

Output Commands:
	UUT_DATANAME	name to be used for the data files
	SingalName	set equal to desired values. (J1_01 = 0)
	NULL		no change
	
Input Commands:
	SingalName	requires 1 of 2 paramerters. 
				1. Value, Tolerance and Time - (Port_3B = 1000 | 10 | 0.5)
				2. Datalog without critria - (Port_3B = DATALOG) *12/29/21 - DATALOG might be broken
	NULL		no change

Optional Flags:
	TIMEOUT		set to the number of second to override the default 5 second timeout
	HOLD		set to 1 to create a breakpoint for debugging
	WAIT		set to the number of second to wait before processing the input
	MESSAGE		shows user a message and pauses the test
	TAG  		used to change the data collection file name. Example: Port1A can save 5VDC and 10VDC data in seperate files.
	
Single Commands:
	END			REQUIRED - Ends the test and triggers saving the collected data
	SAVE		saves the collected data without ending the test

	
Note: multipule SingalName's can set on a single line seperated by comma.

Examples:

	Check if the main power supply is 14.5 volts +/- 14.5 volts for 500ms.
		J0_10_MAIN_SUPPLY = 1, J0_08_METER_LOAD = 1 : MeterVolts = 14.5 | 0.5 | 0.5
	
	turn on a PAT pin and wait 2 seconds
		J1_08 = 1 : NULL : WAIT = 2
		
	turn off outputs and wait 300ms.
		J0_08_METER_LOAD = 0, J0_09_TEST_SUPPLY = 0, PwrRemote = 0, PwrSetVoltage = 0, PwrSetCurrent = 0 : NULL : WAIT = 0.300
	
	wait for voltmeter to read 1.0v +/- 0.5 for 500ms
		NULL : MeterVolts = 1.0 | 0.5 | 0.5
		
		

Ideas:
	setup a command called before a test to look at additial items during a test. (like shorted inputs / outputs)

