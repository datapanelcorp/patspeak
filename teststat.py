import glob
from datetime import datetime, timedelta
import os

# The format code for parsing the datetime strings
datetime_format = "%Y-%m-%d-%H:%M:%S"

# Initialize a total duration of zero
total_runtime = timedelta()
FailCount = 0
PassCount = 0
# Use glob to find all files ending with .log in the current directory
log_files = glob.glob('*.log')

# Iterate through each log file found
for filename in log_files:
    #print(f"Processing file: {filename}")
    start_time = None
    
    with open(filename, 'r') as f:
        for line in f:
            if line.startswith("Started on:"):
                # Extract and parse the start time string
                start_time_str = line.replace("Started on: ", "").strip()
                start_time = datetime.strptime(start_time_str, datetime_format)
            
            elif line.startswith("Finished on:"):
                # Extract and parse the finish time string
                finish_time_str = line.replace("Finished on: ", "").strip()
                finish_time = datetime.strptime(finish_time_str, datetime_format)
                
            elif 'FAIL:' in line:
                print(f"Line {line.strip()}")
                FailCount += 1
                
            elif 'PASS:' in line:
                PassCount += 1

        # If a start time was found, calculate the duration and add it
        if start_time:
            duration = finish_time - start_time
            total_runtime += duration
            
        # If both start and finish times were found for the file, calculate and print the duration
        if start_time and finish_time:
            duration = finish_time - start_time
            print(f"{filename}: {duration}")

            # Reset the start_time for the next run within this file
            start_time = None

# Print the total runtime from all log files
print("\n--- Summary ---")
print(f"fail: {FailCount}")
print(f"pass: {PassCount}")
print(f"time: {total_runtime}")
