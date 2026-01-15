@echo off
::**********************
python pat.py RESET.pat -v 
python pat.py 39009-1-SENSOR-POWER.pat -v 
exit /b 0

::**********************
python pat.py RESET.pat -v 
python pat.py 39009-1-INPUT-FREQ.pat -v 

::**********************
python pat.py RESET.pat -v 
python pat.py 39009-1-OUTPUT-DIGITAL-NORMAL.pat -v 

::**********************
python pat.py RESET.pat -v 
python pat.py 39009-1-INPUT-ENCODER_0.pat -v 

::**********************
python pat.py RESET.pat -v 
python pat.py 39009-1-INPUT-ENCODER_1.pat -v 

::**********************
python pat.py RESET.pat -v 
python pat.py 39009-1-INPUT-ADC.pat -v 

python pat.py RESET.pat -v 
python pat.py 39009-1-OUTPUT-SHORT.pat -v 
exit /b 0

::**********************
echo Please connect the 4-20ma simulator to J4-5
pause
python pat.py RESET.pat -v 
python pat.py 39009-1-INPUT-420MA.pat -v 

::**********************
echo Connect 'red coil' 6.4 ohm inductive load
pause
python pat.py RESET.pat -v 
python pat.py 39009-1-OUTPUT-PWMI-NORMAL.pat -v 

::**********************
echo Connect and set resisitive load to 5.1 Ohms  (Up, Dn)
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
python pat.py RESET.pat -v 
python pat.py 39009-1-INPUT-FREQ.pat -v 

::**********************
python pat.py RESET.pat -v 
python pat.py 39009-1-OUTPUT-DIGITAL-NORMAL.pat -v 

::**********************
python pat.py RESET.pat -v 
python pat.py 39009-1-OUTPUT-SHORT.pat -v 

::**********************
python pat.py RESET.pat -v 
python pat.py 39009-1-INPUT-ENCODER_0.pat -v 

::**********************
python pat.py RESET.pat -v 
python pat.py 39009-1-INPUT-ENCODER_1.pat -v 

::**********************
python pat.py RESET.pat -v 
python pat.py 39009-1-INPUT-ADC.pat -v 






