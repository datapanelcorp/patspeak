@echo off

::**********************
echo prepare for 39009-1-INPUT-ENCODER.pat
pause
python pat.py RESET.pat
python pat.py 39009-1-INPUT-ENCODER.pat
::**********************
::**********************
@REM echo prepare for 39009-1-INPUT-ADC.pat
@REM pause
@REM python pat.py RESET.pat
@REM python pat.py 39009-1-INPUT-ADC.pat
::**********************
::**********************
@REM echo prepare for 39009-1-OUTPUT-PWM-NORMAL-MODE-51.pat
@REM pause
@REM python pat.py RESET.pat
@REM python pat.py 39009-1-OUTPUT-PWM-NORMAL-MODE-51.pat
::**********************
::**********************
@REM echo prepare for 39009-1-OUTPUT-PWM-NORMAL-MODE-34.pat
@REM pause
@REM python pat.py RESET.pat
@REM python pat.py 39009-1-OUTPUT-PWM-NORMAL-MODE-34.pat
::**********************
::**********************
@REM echo prepare for 39009-1-OUTPUT-PWMI-NORMAL-OVERCURRENT.pat
@REM pause
@REM python pat.py RESET.pat
@REM python pat.py 39009-1-OUTPUT-PWMI-NORMAL-OVERCURRENT.pat
::**********************
@REM echo prepare for 39009-1-OUTPUT-PWMI-NORMAL.pat
@REM pause
@REM python pat.py RESET.pat
@REM python pat.py 39009-1-OUTPUT-PWMI-NORMAL.pat
::**********************
::**********************
@REM echo prepare for 39009-1-OUTPUT-DIGITAL-NORMAL.pat
@REM pause
@REM python pat.py RESET.pat
@REM python pat.py 39009-1-OUTPUT-DIGITAL-NORMAL.pat
::**********************

