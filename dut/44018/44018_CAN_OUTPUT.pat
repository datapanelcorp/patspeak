#44018
#Verion 0.0
UUT_DBC = 44018-560.dbc
UUT_DATANAME = 44018_CAN_OUTPUT
SUPPRESS_PAT_SUPPORT = True

#-----setup 44018-----
# no port CNFG needed.  Reasonable defaults are in place for all configuration parameters.

# CMND all outputs off
PWM1DutyCmd = 0, PWM2DutyCmd = 0, PWM3DutyCmd = 0, PWM4DutyCmd = 0 : NULL 
PWM5DutyCmd = 0, PWM6DutyCmd = 0, PWM7DutyCmd = 0, PWM8DutyCmd = 0 : NULL 
PWM9DutyCmd = 0, PWM10DutyCmd = 0, PWM11DutyCmd = 0, PWM12DutyCmd = 0: NULL 

#Set PWM Frequency to 250Hz
Port1PwmFreq = 250 : NULL 

#------generic output no feedback check -------
#Turn output on to 100% & prompt user to proceed
#  PWM1DutyCmd = 100 : NULL : MESSAGE = "PAUSED WAITING FOR USER"
#Turn output off & prompt user to proceed
#  PWM1DutyCmd = 0 : NULL : MESSAGE = "PAUSED WAITING FOR USER"

#------generic output with feedback check -------------
#Turn on output to 100%, read current feedback, prompt user to proceed -------
#  PWM1DutyCmd = 100 : PwmOut1Current = 0 : MESSAGE = "PAUSED WAITING FOR USER"


#------System Test------------------

#Test DO 2 - Turns output on
PWM1DutyCmd = 100 : PwmOut1Current = 0.0 | 0.25 | 1 : MESSAGE = "Check that LED is on"

#Test DO 4 - Turns output off
PWM1DutyCmd = 0 : NULL : MESSAGE = "Apply 1 Amp load"

#Test DO 5 - Measure feedback with 1 Amp Load
PWM1DutyCmd = 100 : PwmOut1Current = 1 | 0.25 | 1 : MESSAGE = "Apply 5 Amp load "

#Test DO 6 - Measure feedback with 5 Amp Load
PWM1DutyCmd = 100 : PwmOut1Current = 5 | 1.25 | 1 : MESSAGE = "Apply 13 Amp load"

#Test DO 7 - Measure feedback with 13 Amp Load
PWM1DutyCmd = 100 : PwmOut1Current = 13 | 1.25 | 1 : MESSAGE = "Increase load till LED blinks"

#Test DO 10 - Increase load until faulted
NULL : ActiveFaultCode = 130 : MESSAGE = "Ready to turn output off?"

#Reset output to off
PWM1DutyCmd = 0 : NULL : MESSAGE = "Decrease applied load below 13"

#Test DO 12 - Turn output on & short
PWM1DutyCmd = 100 : NULL : MESSAGE = "Short to GND. Enter when ready to reset"

#Reset output to off
PWM1DutyCmd = 0 : NULL : MESSAGE = "Apply 100Ohm load"

#Test DO 13 - 50hz 1% DC
Port1PwmFreq = 50, PWM1DutyCmd = 1 : PwmOut1LedStat = 1 : MESSAGE = "Proceed?"

#Test DO 14 - 50hz 50% DC
Port1PwmFreq = 50, PWM1DutyCmd = 50 : PwmOut1LedStat = 1 : MESSAGE = "Proceed?"

#Test DO 15 - 50hz 99% DC
Port1PwmFreq = 50, PWM1DutyCmd = 99 : PwmOut1LedStat = 1 : MESSAGE = "Proceed?"

#Test DO 16 - 250hz 1% DC
Port1PwmFreq = 250, PWM1DutyCmd = 1 : PwmOut1LedStat = 1 : MESSAGE = "Proceed?"

#Test DO 17 - 250hz 50% DC
Port1PwmFreq = 250, PWM1DutyCmd = 50 : PwmOut1LedStat = 1 : MESSAGE = "Proceed?"

#Test DO 18 - 250hz 99% DC
Port1PwmFreq = 250, PWM1DutyCmd = 99 : PwmOut1LedStat = 1 : MESSAGE = "Proceed?"

#Test DO 19 - 125hz 100% DC
Port1PwmFreq = 125, PWM1DutyCmd = 100 : PwmOut1LedStat = 1 : MESSAGE = "Connect 5 Amp Load"

#Test DO 20 - Drive to 50% at 250Hz and measure current
Port1PwmFreq = 250, PWM1DutyCmd = 50 : PwmOut1Current = 2.5 | 0.625 | .5
NULL : PwmOut1LedStat = 1 : MESSAGE = "Next steps are conducted in chamber"

#Reset output - Turn output off
PWM1DutyCmd = 0 : NULL : MESSAGE = "Proceed?"

#Test DO 21 - Connect 1 Amp Load
PWM1DutyCmd = 100 : PwmOut1Current = 1 | 0.25 | 1 : MESSAGE = "PAUSED WAITING FOR USER"

#Test DO 22 - Connect 5 Amp Load
PWM1DutyCmd = 100 : PwmOut1Current = 5 | 1.25 | 1 : MESSAGE = "PAUSED WAITING FOR USER"

#Test DO 23 - Connect 13 Amp Load
PWM1DutyCmd = 100 : PwmOut1Current = 13 | 1.25 | 1 : MESSAGE = "PAUSED WAITING FOR USER"

#Test DO 24 - Connect 1 Amp Load
PWM1DutyCmd = 100 : PwmOut1Current = 1 | 0.25 | 1 : MESSAGE = "PAUSED WAITING FOR USER"

#Test DO 25 - Connect 5 Amp Load
PWM1DutyCmd = 100 : PwmOut1Current = 5 | 1.25 | 1 : MESSAGE = "PAUSED WAITING FOR USER"

#Test DO 26 - Connect 13 Amp Load
PWM1DutyCmd = 100 : PwmOut1Current = 13 | 1.25 | 1 : MESSAGE = "PAUSED WAITING FOR USER"

SAVE
END
