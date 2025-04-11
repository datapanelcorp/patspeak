#44018
#Verion 0.0
UUT_DBC = 44018-560.dbc
UUT_DATANAME = 44018_CAN_OUTPUT

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
#  PWM1DutyCmd = 100 : NULL : MESSAGE
#Turn output off & prompt user to proceed
#  PWM1DutyCmd = 0 : NULL : MESSAGE

#------generic output with feedback check -------------
#Turn on output to 100%, read current feedback, prompt user to proceed -------
#  PWM1DutyCmd = 100 : PwmOut1Current = 0 : MESSAGE


#------System Test------------------

#Test DO 2 - Turn output on
PWM1DutyCmd = 100 : PwmOut1Current = 0 : MESSAGE

#Test DO 3 - Turn output off
PWM1DutyCmd = 0 : NULL : MESSAGE

#Test DO 5 - Connect 1 Amp Load
PWM1DutyCmd = 100 : PwmOut1Current = 1 | 0.25 | 1 : MESSAGE

#Test DO 6 - Connect 5 Amp Load
PWM1DutyCmd = 100 : PwmOut1Current = 5 | 1.25 | 1 : MESSAGE

#Test DO 7 - Connect 13 Amp Load
PWM1DutyCmd = 100 : PwmOut1Current = 13 | 1.25 | 1 : MESSAGE

#Test DO 10 - Increase load until faulted
NULL : ActiveFaultCode = 130 : MESSAGE

#Reset output to off
PWM1DutyCmd = 0 : NULL : MESSAGE

#Test DO 12 - Turn output on & short
PWM1DutyCmd = 100 : NULL : MESSAGE

#Reset output to off
PWM1DutyCmd = 0 : NULL : MESSAGE

#Test DO 13 - 50hz 1% DC
Port1PwmFreq = 50, PWM1DutyCmd = 1 : PwmOut1LedStat = 1 : MESSAGE

#Test DO 14 - 50hz 50% DC
Port1PwmFreq = 50, PWM1DutyCmd = 50 : PwmOut1LedStat = 1 : MESSAGE

#Test DO 15 - 50hz 99% DC
Port1PwmFreq = 50, PWM1DutyCmd = 99 : PwmOut1LedStat = 1 : MESSAGE

#Test DO 16 - 250hz 1% DC
Port1PwmFreq = 250, PWM1DutyCmd = 1 : PwmOut1LedStat = 1 : MESSAGE

#Test DO 17 - 250hz 50% DC
Port1PwmFreq = 250, PWM1DutyCmd = 50 : PwmOut1LedStat = 1 : MESSAGE

#Test DO 18 - 250hz 99% DC
Port1PwmFreq = 250, PWM1DutyCmd = 99 : PwmOut1LedStat = 1 : MESSAGE

#Test DO 19 - 125hz 100% DC
Port1PwmFreq = 125, PWM1DutyCmd = 100 : PwmOut1LedStat = 1 : MESSAGE

#Test DO 20 - Drive to 50% at 250Hz and measure current
Port1PwmFreq = 250, PWM1DutyCmd = 50 : PwmOut1Current = 2.5 | 0.625 | .5
NULL : PwmOut1LedStat = 1 : MESSAGE

#Reset output - Turn output off
PWM1DutyCmd = 0 : NULL : MESSAGE

#Test DO 21 - Connect 1 Amp Load
PWM1DutyCmd = 100 : PwmOut1Current = 1 | 0.25 | 1 : MESSAGE

#Test DO 22 - Connect 5 Amp Load
PWM1DutyCmd = 100 : PwmOut1Current = 5 | 1.25 | 1 : MESSAGE

#Test DO 23 - Connect 13 Amp Load
PWM1DutyCmd = 100 : PwmOut1Current = 13 | 1.25 | 1 : MESSAGE

#Test DO 24 - Connect 1 Amp Load
PWM1DutyCmd = 100 : PwmOut1Current = 1 | 0.25 | 1 : MESSAGE

#Test DO 25 - Connect 5 Amp Load
PWM1DutyCmd = 100 : PwmOut1Current = 5 | 1.25 | 1 : MESSAGE

#Test DO 26 - Connect 13 Amp Load
PWM1DutyCmd = 100 : PwmOut1Current = 13 | 1.25 | 1 : MESSAGE

SAVE
END
