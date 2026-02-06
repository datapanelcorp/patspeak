echo off
@REM python pat.py RESET.pat -v 
@REM python pat.py 43019-1-INPUT-GLOBAL.pat -v 

python pat.py RESET.pat -v 
python pat.py 43019-1-INPUT-RATIO-12.pat -v 

python pat.py RESET.pat -v 
python pat.py 43019-1-INPUT-RATIO-14_5.pat -v 

python pat.py RESET.pat -v 
python pat.py 43019-1-INPUT-ALL.pat -v 

python pat.py RESET.pat -v
python pat.py 43019-1-INPUT-ENCODER.pat -v

python pat.py RESET.pat -v
python pat.py 43019-1-INPUT-420MA.pat -v

python pat.py RESET.pat -v 
python pat.py 43019-1-SENSOR-POWER.pat -v 

python pat.py RESET.pat -v 
python pat.py 43019-1-SENSOR-POWER-XTRA.pat -v 

python pat.py RESET.pat -v 
python pat.py 43019-1-INPUT-FREQ.pat -v 

python pat.py RESET.pat -v 
python pat.py 43019-1-INPUT-COUNT.pat -v 


@REM python pat.py 43019-1-INPUT-ISR-LOCKUP.pat -v

exit /b 0

::**********************
@REM echo Please connect the 4-20ma simulator to J4-5
@REM pause
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-INPUT-420MA.pat -v 


@REM ::**********************
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-OUTPUT-DIGITAL-NORMAL.pat -v 

exit /b 0
::**********************
echo Connect 'red coil' 6.4 ohm inductive load
pause
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-OUTPUT-PWMI-NORMAL.pat -v 

::**********************
echo Connect and set resisitive load to 5.1 Ohms  (Up, Dn)
pause
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-OUTPUT-PWM-NORMAL-MODE-51.pat -v 

::**********************
echo Switch to resisitive load and set to 2.3 Ohms (Dn, Up)
pause
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-OUTPUT-PWMI-NORMAL-OVERCURRENT.pat -v 

::**********************
echo Set resisitive load to 5.1 Ohms  (Up, Dn)
echo ****************************************************
echo * All tests from now on will not need interaction! *
echo ****************************************************
pause
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-OUTPUT-PWM-NORMAL-MODE-34.pat -v 

::**********************
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-INPUT-FREQ.pat -v 

::**********************
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-OUTPUT-DIGITAL-NORMAL.pat -v 

::**********************
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-INPUT-ENCODER_0.pat -v 

::**********************
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-INPUT-ENCODER_1.pat -v 

::**********************
@REM python pat.py RESET.pat -v 
@REM python pat.py 39009-1-INPUT-ADC.pat -v 






