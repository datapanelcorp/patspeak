@echo off

::**********************
@REM echo prepare for 39009-1-OUTPUT-DIGITAL-NORMAL.pat -v 
@REM pause
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-OUTPUT-DIGITAL-NORMAL.pat -v 
::**********************

::**********************
echo prepare for 39009-1-INPUT-ENCODER.pat
pause
python pat.py RESET.pat -v 
python pat.py 39009-1-INPUT-ENCODER.pat -v 
::**********************
::**********************
@REM echo prepare for 39009-1-INPUT-COUNT.pat -v 
@REM pause
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-INPUT-COUNT.pat -v 
::**********************
::**********************
@REM echo prepare for 39009-1-INPUT-420MA.pat -v 
@REM pause
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-INPUT-420MA.pat -v 
::**********************
::**********************
@REM echo prepare for 39009-1-INPUT-ADC.pat -v 
@REM pause
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-INPUT-ADC.pat -v 
::**********************
::**********************
@REM echo prepare for 39009-1-OUTPUT-PWM-NORMAL-MODE-51.pat -v 
@REM pause
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-OUTPUT-PWM-NORMAL-MODE-51.pat -v 
::**********************
::**********************
@REM echo prepare for 39009-1-OUTPUT-PWM-NORMAL-MODE-34.pat -v 
@REM pause
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-OUTPUT-PWM-NORMAL-MODE-34.pat -v 
::**********************
::**********************
@REM echo prepare for 39009-1-OUTPUT-PWMI-NORMAL-OVERCURRENT.pat -v 
@REM pause
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-OUTPUT-PWMI-NORMAL-OVERCURRENT.pat -v 
::**********************
@REM echo prepare for 39009-1-OUTPUT-PWMI-NORMAL.pat -v 
@REM pause
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-OUTPUT-PWMI-NORMAL.pat -v 
::**********************


