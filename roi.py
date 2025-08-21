#pscp .\roi.py j@picando:/home/j
#pip install pyserial python-can

import serial
import time
import can
import threading
import subprocess
import time
#import RPi.GPIO as GPIO

can_channel = "can1"

# Pin configuration
K1_PIN = 26

# Setup
#GPIO.setmode(GPIO.BCM)  # Use BCM pin numbering
#GPIO.setup(K1_PIN, GPIO.OUT)
#GPIO.output(K1_PIN, GPIO.HIGH)   # Turn LED off

RLY_CTRL_ID = 0x0CFF0500
K1State = 0

# Create a stop event for clean thread shutdown
stop_event = threading.Event()


# Function to continuously receive CAN messages in a thread
def receive_can_messages():
    print("Receiver thread started. Listening for CAN messages...")
    while not stop_event.is_set():
        message = cbus.recv(timeout=1.0)
        if(message and message.arbitration_id == RLY_CTRL_ID):
            first_byte = message.data[0]
            if(first_byte & 0x03 == 0x01):
                K1State = 1
            else:
                K1State = 0
            if(K1State):
                d=1#GPIO.output(K1_PIN, GPIO.LOW)  # Turn LED on
            else:
                d=0#GPIO.output(K1_PIN, GPIO.HIGH)   # Turn LED off

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
    
#cbus = can.interface.Bus(interface='pcan', bitrate=250000)
cbus = can.interface.Bus(interface='socketcan', channel=can_channel, bitrate=250000)
baud=38400
ser = serial.Serial('/dev/ttyUSB0', baud)
time.sleep(2)

receiver_thread = threading.Thread(target=receive_can_messages, daemon=True)
receiver_thread.start()

try:
    while(1):
        ser.write(b'FETC?\n')
        #response = ser.readline().decode().strip()
        response = ""
        while(response == ""):
            time.sleep(0.15)
            response = ser.readline().decode().strip()
        if is_number(response):
            value = float(response)
            print(value)
            if(value<0):
                value = 0
            ivalue = value*1000
            HB = int(ivalue % 256)
            LB = int(ivalue / 256)
            msg = can.Message(
                arbitration_id=0x0CFF0004,
                data=[HB, LB, 0, 0, 0, 0, 0, 0],
                is_extended_id=True
            )
            try:
                cbus.send(msg)
            except can.CanError:
                print("Message NOT sent")

except KeyboardInterrupt:
    print("Interrupted by user.")
    
finally:
    print("stop receiver thread...")
    stop_event.set()
    receiver_thread.join()
    print("shutdown canbus...")
    cbus.shutdown()  # Properly closes the interface
    print("close serial...")
    ser.close()
    print("bring down CAN interface...")
    try:
        subprocess.run(["sudo", "ip", "link", "set", can_channel, "down"], check=True)
        print("CAN interface " + can_channel + " is now down.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to bring down CAN interface: {e}")
    exit(0)


