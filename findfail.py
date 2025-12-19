import os
FailCount = 0

for dirpath, dirnames, filenames in os.walk('.'):
    #print(f"Searching in: {dirpath}")
    for filename in filenames:
        #print(f"Found file: {os.path.join(dirpath, filename)}")
        if filename.endswith('.log'):
            filepath = os.path.join(dirpath, filename)
            try:
                with open(filepath, 'r', encoding='utf-8', errors='ignore') as file:
                    for line_number, line in enumerate(file, start=1):
                        if 'FAIL:' in line:
                            print(f"[{filepath}]")
                            print(f"Line {line_number}: {line.strip()}")
                            FailCount += 1
                            
            except Exception as e:
                print(f"Could not read {filepath}: {e}")
                
print("Total Failures:", FailCount)

