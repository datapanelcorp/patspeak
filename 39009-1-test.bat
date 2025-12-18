echo off
::**********************
@REM echo Please connect the 4-20ma simulator to J4-5
@REM pause
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-INPUT-420MA.pat -v 

::**********************
@REM echo Connect 'red coil' 6.4 ohm inductive load
@REM pause
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-OUTPUT-PWMI-NORMAL.pat -v 

::**********************
echo Set resisitive load to 5.1 Ohms  (Up, Dn)
pause
python pat.py RESET.pat -v 
python pat.py 39009-1-OUTPUT-PWM-NORMAL-MODE-51.pat -v 

::**********************
echo Switch to resisitive load and set to 2.3 Ohms (Dn, Up)
pause
python pat.py RESET.pat -v 
python pat.py 39009-1-OUTPUT-PWMI-NORMAL-OVERCURRENT.pat -v 

::**********************
echo Set resisitive load to 5.1 Ohms  (Up, Dn)
echo ****************************************************
echo * All tests from now on will not need interaction! *
echo ****************************************************
pause
python pat.py RESET.pat -v 
python pat.py 39009-1-OUTPUT-PWM-NORMAL-MODE-34.pat -v 

::**********************
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-INPUT-FREQ.pat -v 

::**********************
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-OUTPUT-DIGITAL-NORMAL.pat -v 

::**********************
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-INPUT-ENCODER.pat -v 

::**********************
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-INPUT-ADC.pat -v 






