import subprocess



# Start the process
process = subprocess.Popen(
    ["python", "pat.py", "37000-1-CANOPEN-OUTPUT-DIGITAL-NORMAL.pat"],
    stdout=subprocess.PIPE,
    stderr=subprocess.STDOUT,
    text=True
)

# Read and print output line by line as it appears
for line in process.stdout:
    print(line, end="")  # 'end=""' avoids double newlines

print("ALL DONE! What's next?")

# Define the command and parameters
#command = ["python", "pat.py", "37000-1-CANOPEN-OUTPUT-DIGITAL-NORMAL.pat"]
# Run the command
#result = subprocess.run(command, capture_output=True, text=True)
# Print the output
#print(result.stdout)
