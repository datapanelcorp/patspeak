#!/home/j/roi/bin/python

#blacklist
#sudo nano /etc/modprobe.d/nousbtmc.conf
#blacklist usbtmc
#sudo update-initramfs -u

#lsusb
#Bus 003 Device 002: ID 2ec7:8800 B&K Precision. 8600

#create udev rule
#sudo nano /etc/udev/rules.d/99-usbtmc.rules
#SUBSYSTEM=="usb", ATTR{idVendor}=="2ec7", ATTR{idProduct}=="8800", MODE="0666", GROUP="j"

import pyvisa
import time

e_load = '/dev/usbtmc0'
eload_id = "USB0::11975::34816::802197042787270012::0::INSTR"
eload = ""

try:
    rm = pyvisa.ResourceManager()
    eload = rm.open_resource(eload_id)  # Replace with actual ID
    print("ELOAD:", eload.query("*IDN?"))
    print("Setting load function to SHORT...")
    eload.write("FUNC SHORT")

    # Enable the load input to activate the short
    print("Enabling load input...")
    eload.write("INP ON")

    print("The short feature is now active.")
    print("Wait 5 seconds for demonstration...")
    time.sleep(5)

    # Disable the load input when done
    print("Disabling load input...")
    eload.write("INP OFF")

    # Set the function back to CC or another mode for safety
    print("Setting function back to Constant Current (CC) mode...")
    eload.write("FUNC CC")

    print("Operation complete. Closing connection.")
    
except Exception as e:
    print(f"An error occurred with the Resource Manager: {e}")
    
if(eload):
    eload.close()