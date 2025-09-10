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

#pscp .\roi.py j@picando:/home/j

#pip install pyserial python-can gpiozero

#sudo ip link set can0 up type can bitrate 250000
#sudo ip link set can1 up type can bitrate 250000

import serial
import can
import threading
import subprocess
import time
from gpiozero import LED
import pyvisa

multi_meter = '/dev/ttyUSB0'
multi_meter_id = "5491B  Multimeter,Ver1.1.11.11.23,124E12115"

e_load = '/dev/usbtmc0'
eload_id = "USB0::11975::34816::802197042747610014::0::INSTR"#"USB0::11975::34816::802197042787270012::0::INSTR"

can_channel = "can1"

e_load_remote = 0
e_load_enabled = 0
e_load_setting = 0

# Pin configuration
k1_pin = LED(26) # LED object for BCM pin 23
LOAD_CTRL_ID = 0x0CFF0400
RLY_CTRL_ID = 0x0CFF0500

# Create a stop event for clean thread shutdown
stop_event = threading.Event()

# Function to continuously receive CAN messages in a thread
def receive_can_messages():
    global e_load_remote, e_load_enabled, e_load_setting
    print("Receiver thread started. Listening for CAN messages...")
    while not stop_event.is_set():
        message = cbus.recv(timeout=1.0)
        if(message and message.arbitration_id == RLY_CTRL_ID):
            first_byte = message.data[0]
            if(first_byte & 0x03 == 0x01):
                k1_pin.on()
            else:
                k1_pin.off()

        if(message and message.arbitration_id == LOAD_CTRL_ID):
            first_byte = message.data[0]
            #LdRemote
            if(first_byte & 0x03 == 0x01):
                if(e_load_remote == 0):
                    e_load_remote = 1
            else:
                if(e_load_remote == 1):
                    e_load_remote = 0
            #LdEnable
            if(first_byte & 0x0C == 0x04):
                if(e_load_enabled == 0):
                    print("INP ON")
                    e_load_enabled = 1
                    eload.write("INP ON")
            else:
                if(e_load_enabled == 1):
                    print("INP OFF")
                    e_load_enabled = 0
                    eload.write("INP OFF")
                    
            in_value = ((message.data[3]*256) + message.data[2]) & 0xFFF;
            if(e_load_setting != in_value):
                e_load_setting = in_value
                print(f"CURR {e_load_setting / 1000}")
                eload.write(f"CURR {e_load_setting / 1000}")
                
def is_number(value):
    try:
        float(value)  # Try converting to float
        return True
    except ValueError:
        return False

try:
    subprocess.run(
        ["sudo", "ip", "link", "set", can_channel, "up", "type", "can", "bitrate", "250000"],
        check=True
    )
    print("CAN interface " + can_channel + " is up with bitrate 250000.")
    
except subprocess.CalledProcessError as e:
    print(f"Failed to bring up CAN interface: {e}")

baud=38400
response = ""
try:
    mmeter = serial.Serial(multi_meter, baud)
    mmeter.write(b'*IDN?\n')
    while(response == ""):
        time.sleep(0.15)
        response = mmeter.readline().decode().strip()
        print("METER:", response)
except:
    mmeter = ""
if not (mmeter):
     print("Failed to communcate with multi meter")


try:
    rm = pyvisa.ResourceManager()
    eload = rm.open_resource(eload_id)  # Replace with actual ID
    print("ELOAD:", eload.query("*IDN?"))
    print("Resetting ", eload_id)
    eload.write('*RST')
    eload.write('SYST:CLE')

except Exception as e:
    print(f"An error occurred with the Resource Manager: {e}")
        
#cbus = can.interface.Bus(interface='pcan', bitrate=250000)
cbus = can.interface.Bus(interface='socketcan', channel=can_channel, bitrate=250000)
receiver_thread = threading.Thread(target=receive_can_messages, daemon=True)
receiver_thread.start()

try:
    pload_volts = 0
    pload_current = 0
    while(1):
        if (mmeter):
            mmeter.write(b'FETC?\n')
            response = ""
            while(response == ""):
                time.sleep(0.15)
                response = mmeter.readline().decode().strip()
            if is_number(response):
                value = float(response)
                print(f"meter current {value} A")
                if(value<0):
                    value = 0
                ivalue = value*1000
                HB = int(ivalue % 256)
                LB = int(ivalue / 256)
                msg = can.Message (
                    arbitration_id=0x0CFF0004,
                    data=[HB, LB, 0, 0, 0, 0, 0, 0],
                    is_extended_id=True
                )
                try:
                    cbus.send(msg)
                except can.CanError:
                    print("Message NOT sent")
                    
        if (eload):
            time.sleep(0.15)
            load_volts = float(eload.query("MEAS:VOLT?").strip())
            print(f"eload voltage {load_volts} V")
            load_current = float(eload.query("MEAS:CURR?").strip())
            print(f"eload current {load_current} A")
            #go = 0
            if is_number(load_current):
                load_current = (load_current * 1000)
            #go = 1
            if is_number(load_volts): 
                load_volts = (load_volts * 1000)
            #go = 1
            # if(go):
            if((pload_volts != load_volts) or (pload_current != load_current)):
                pload_volts = load_volts
                pload_current = load_current
                msg = can.Message (
                    arbitration_id=0x0CFF0003,
                    data=[int(load_volts % 256), int(load_volts / 256), int(load_current % 256), int(load_current / 256), 0, 0, 0, 0],
                    is_extended_id=True
                )
                try:
                    #print(msg)
                    cbus.send(msg)
                except can.CanError:
                    print("Message NOT sent")

except KeyboardInterrupt:
    print("\nInterrupted by user.")
    
finally:
    print("stop receiver thread...")
    stop_event.set()
    receiver_thread.join()
    if(cbus):
        print("shutdown canbus...")
        cbus.shutdown()  # Properly closes the interface
    if (mmeter):
        print("close meter...")
        mmeter.close()
    if (eload):  
        print("close eload...")
        eload.close()
    if (rm):
        print("close resourcemanager...")
        rm.close()
    print("bring down CAN interface...")
    try:
        subprocess.run(["sudo", "ip", "link", "set", can_channel, "down"], check=True)
        print(can_channel + " interface " + can_channel + " is now down.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to bring down CAN interface: {e}")
    exit(0)


