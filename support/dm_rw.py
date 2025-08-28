#wrapper for j1939-utils
import subprocess
import os


#this is an ugly workaround for subprocess w/ venv
venv_python = r"C:\venv\canopen\Scripts\python.exe"

def get_last_line(text):
    lines = text.strip().split('\n')
    return lines[-1] if lines else ''

def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False


def dm_write(device_sa, space, address, value):
    current_dir = os.path.dirname(__file__)
    script_b_path = os.path.join(current_dir, "j1939-utils", "j1939-dm-write.py")
    result = subprocess.run(
        [venv_python, script_b_path, str(device_sa), str(space), str(address), str(value)],
        capture_output=True,
        text=True
    )

def dm_read(device_sa, space, address):
    current_dir = os.path.dirname(__file__)
    script_b_path = os.path.join(current_dir, "j1939-utils", "j1939-dm-read.py")
    result = subprocess.run(
        [venv_python, script_b_path, str(device_sa), str(space), str(address)],
        capture_output=True,
        text=True
    )
    #parse out value
    results = result.stdout
    values = get_last_line(results).split(" ")
    if is_number(values[0]):
        value = int(values[0])
    else:
        value = -1
    return value