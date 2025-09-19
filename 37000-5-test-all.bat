@echo off
::**********************
python pat.py RESET.pat
python pat.py 37000-5-CANOPEN-OUTPUT-DIGITAL-NORMAL.pat
::**********************

::**********************
python pat.py RESET.pat
python pat.py 37000-5-CANOPEN-OUTPUT-SHORT.pat
::**********************

::**********************
python pat.py RESET.pat
python pat.py 37000-5-CANOPEN-OUTPUT-10A-FAULT-RESET.pat
::**********************
