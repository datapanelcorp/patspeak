import subprocess
import time
import winsound
# Frequency in Hertz (e.g., 1000 Hz)
frequency = 500
# Duration in milliseconds (e.g., 500 ms)
duration = 1000


start_time = time.time()

venv_python = r"C:\data\projects\37000\python\canopen\Scripts\python.exe"


#**********************
winsound.Beep(frequency, duration)
print("Please set power supply to 12.0VDC")
input("Press Enter to continue...")
process = subprocess.Popen(
    [venv_python, "-u", "pat.py", "37000-1-CANOPEN-INPUT-RATIO-12.pat"],
    stdout=subprocess.PIPE,
    stderr=subprocess.STDOUT,
    text=True
)
for line in process.stdout:
    print(line, end="", flush=True)

#**********************
winsound.Beep(frequency, duration)
print("Please set power supply to 14.5VDC")
input("Press Enter to continue...")
process = subprocess.Popen(
    [venv_python, "-u", "pat.py", "37000-1-CANOPEN-INPUT-RATIO-14_5.pat"],
    stdout=subprocess.PIPE,
    stderr=subprocess.STDOUT,
    text=True
)
for line in process.stdout:
    print(line, end="", flush=True)
    
#**********************
winsound.Beep(frequency, duration)
process = subprocess.Popen(
    [venv_python, "-u", "pat.py", "37000-1-CANOPEN-INPUT-FREQ.pat"],
    stdout=subprocess.PIPE,
    stderr=subprocess.STDOUT,
    text=True
)
for line in process.stdout:
    print(line, end="", flush=True)
    

#**********************
winsound.Beep(frequency, duration)
print("Please connect the 4-20ma simulator to J4-5")
input("Press Enter to continue...")
process = subprocess.Popen(
    [venv_python, "-u", "pat.py", "37000-1-CANOPEN-INPUT-420MA.pat"],
    stdout=subprocess.PIPE,
    stderr=subprocess.STDOUT,
    text=True
)
for line in process.stdout:
    print(line, end="", flush=True)
    
#**********************
winsound.Beep(frequency, duration)
print("Connect 'red coil' 6.4 ohm inductive load")
input("Press Enter to continue...")
process = subprocess.Popen(
    [venv_python, "-u", "pat.py", "37000-1-CANOPEN-OUTPUT-PWMI-NORMAL.pat"],
    stdout=subprocess.PIPE,
    stderr=subprocess.STDOUT,
    text=True
)
for line in process.stdout:
    print(line, end="", flush=True)
    
#**********************
winsound.Beep(frequency, duration)
print("Switch to resisitive load and set to 2.1 Ohms")
input("Press Enter to continue...")
process = subprocess.Popen(
    [venv_python, "-u", "pat.py", "37000-1-CANOPEN-OUTPUT-PWMI-OVERCURRENT.pat"],
    stdout=subprocess.PIPE,
    stderr=subprocess.STDOUT,
    text=True
)
for line in process.stdout:
    print(line, end="", flush=True)

    
#**********************
winsound.Beep(frequency, duration)
print("Set resisitive load to 3.9 Ohms")
print("****************************************************")
print("* All tests from now on will not need interaction! *")
print("****************************************************")
input("Press Enter to continue...")
process = subprocess.Popen(
    [venv_python, "-u", "pat.py", "37000-1-CANOPEN-OUTPUT-PWM-NORMAL-MODE-51.pat"],
    stdout=subprocess.PIPE,
    stderr=subprocess.STDOUT,
    text=True
)
for line in process.stdout:
    print(line, end="", flush=True)
    
#**********************
process = subprocess.Popen(
    [venv_python, "-u", "pat.py", "37000-1-CANOPEN-OUTPUT-PWM-NORMAL-MODE-34.pat"],
    stdout=subprocess.PIPE,
    stderr=subprocess.STDOUT,
    text=True
)
for line in process.stdout:
    print(line, end="", flush=True)

#**********************
process = subprocess.Popen(
    [venv_python, "-u", "pat.py", "37000-1-CANOPEN-OUTPUT-DIGITAL-NORMAL.pat"],
    stdout=subprocess.PIPE,
    stderr=subprocess.STDOUT,
    text=True
)
for line in process.stdout:
    print(line, end="", flush=True)

#**********************
process = subprocess.Popen(
    [venv_python, "-u", "pat.py", "37000-1-CANOPEN-INPUT-ADC.pat"],
    stdout=subprocess.PIPE,
    stderr=subprocess.STDOUT,
    text=True
)
for line in process.stdout:
    print(line, end="", flush=True)

#**********************
process = subprocess.Popen(
    [venv_python, "-u", "pat.py", "37000-1-CANOPEN-INPUT-ENCODER.pat"],
    stdout=subprocess.PIPE,
    stderr=subprocess.STDOUT,
    text=True
)
for line in process.stdout:
    print(line, end="", flush=True)

#**********************
process = subprocess.Popen(
    [venv_python, "-u", "pat.py", "37000-1-CANOPEN-INPUT-COUNT.pat"],
    stdout=subprocess.PIPE,
    stderr=subprocess.STDOUT,
    text=True
)
for line in process.stdout:
    print(line, end="", flush=True)



# Calculate and print duration
end_time = time.time()
duration = end_time - start_time
print(f"Total Test Time: {duration:.2f} seconds.")

