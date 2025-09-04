@echo off
echo switch in 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
pause
python pat.py RESET.pat
python pat.py 37000-3-CANOPEN-OUTPUT-PWM-NORMAL-MODE-X-34.pat
echo switch in 2.1 Ohm resistive load. (6.9 amps @ 14.5 VDC)
pause
python pat.py RESET.pat
python pat.py 37000-3-CANOPEN-OUTPUT-PWMI-OVERCURRENT.pat
echo switch in 3.9 Ohm resistive load. (3.72 amps @ 14.5 VDC)
pause
python pat.py RESET.pat
python pat.py 37000-3-CANOPEN-OUTPUT-PWM-NORMAL-MODE-X-51.pat
echo switch in 'red coil' 6.4 ohm inductive load. (2.27 amps @ 14.5 VDC)
echo no further interaction is needed
pause
python pat.py RESET.pat
python pat.py 37000-3-CANOPEN-OUTPUT-PWMI-NORMAL.pat
python pat.py RESET.pat
python pat.py 37000-3-CANOPEN-OUTPUT-10A-FAULT-RESET.pat
python pat.py RESET.pat
python pat.py 37000-3-CANOPEN-OUTPUT-DIGITAL-NORMAL.pat
