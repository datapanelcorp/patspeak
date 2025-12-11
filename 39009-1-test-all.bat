@echo off
::**********************
echo Please set power supply to 12.0VDC
pause
python pat.py RESET.pat
python pat.py 37000-1-CANOPEN-INPUT-RATIO-12.pat
::**********************

::**********************
echo Please set power supply to 14.5VDC
pause
python pat.py RESET.pat
python pat.py 37000-1-CANOPEN-INPUT-RATIO-14_5.pat
::**********************

::**********************
python pat.py RESET.pat
python pat.py 37000-1-CANOPEN-INPUT-FREQ.pat
::**********************

::**********************
echo Please connect the 4-20ma simulator to J4-5
pause
python pat.py RESET.pat
python pat.py 37000-1-CANOPEN-INPUT-420MA.pat
::**********************

::**********************
echo Connect 'red coil' 6.4 ohm inductive load
pause
python pat.py RESET.pat
python pat.py 37000-1-CANOPEN-OUTPUT-PWMI-NORMAL.pat
::**********************

::**********************
echo Switch to resisitive load and set to 2.1 Ohms
pause
python pat.py RESET.pat
python pat.py 37000-1-CANOPEN-OUTPUT-PWMI-OVERCURRENT.pat
::**********************

::**********************
echo Set resisitive load to 3.9 Ohms
echo ****************************************************
echo * All tests from now on will not need interaction! *
echo ****************************************************
pause
python pat.py RESET.pat
python pat.py 37000-1-CANOPEN-OUTPUT-PWM-NORMAL-MODE-51.pat
::**********************

::**********************
python pat.py RESET.pat
python pat.py 37000-1-CANOPEN-OUTPUT-PWM-NORMAL-MODE-34.pat
::**********************

::**********************
python pat.py RESET.pat
python pat.py 37000-1-CANOPEN-OUTPUT-DIGITAL-NORMAL.pat
::**********************

::**********************
python pat.py RESET.pat
python pat.py 37000-1-CANOPEN-INPUT-ADC.pat
::**********************

::**********************
python pat.py RESET.pat
python pat.py 37000-1-CANOPEN-INPUT-ENCODER.pat
::**********************

::**********************
python pat.py RESET.pat
python pat.py 37000-1-CANOPEN-INPUT-COUNT.pat
::**********************

::**********************
echo Set E-LOAD to Manual Mode
python pat.py RESET.pat
python pat.py 37000-1-CANOPEN-OUTPUT-SHORT.pat
::**********************