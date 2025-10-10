import os
import subprocess

# Get the directory where this script is located
script_dir = os.path.dirname(os.path.abspath(__file__))

# Loop through all files in the same directory
for filename in os.listdir(script_dir):
    if filename.endswith('.py') and filename != os.path.basename(__file__):
        file_path = os.path.join(script_dir, filename)
        print(f'Running {file_path}...')
        subprocess.run(['python', file_path])