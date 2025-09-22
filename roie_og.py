#!/home/j/roi/bin/python
#pscp .\roie.py j@picando:/home/j
import can
import serial
import subprocess
import threading
import time
import pyvisa
import sys
from gpiozero import LED
import shutil
import os
# --- Constants ---
# Hardware identifiers
MULTI_METER_PATH = '/dev/ttyUSB0'
MULTI_METER_BAUD = 38400
#ELOAD_VISA_ID = "USB0::11975::34816::802197042747610014::0::INSTR"
ELOAD_VISA_ID = "USB0::11975::34816::802197042787270012::0::INSTR"
#Data Panel E-Load has BOID v1.10
#MULTI-METER ID: 5491B  Multimeter,Ver1.1.11.11.23,124E12115

# CAN bus configuration
CAN_CHANNEL = "can1"
CAN_BITRATE = 250000
LOAD_CTRL_ID = 0x0CFF0400
MMETER_CTRL_ID = 0x0CFF0600 #could this be 0x0CFF0200?
RLY_CTRL_ID = 0x0CFF0500
ELOAD_READ_ID = 0x0CFF0003
MMETER_READ_ID = 0x0CFF0004

# Pin configuration
K1_PIN_BCM = 26
GPIO_K1 = LED(K1_PIN_BCM)

# --- Class for Hardware Management ---
class HardwareManager:
    """Manages communication and state for the e-load and multimeter."""

    def __init__(self):
        self.e_load_remote: int = 0
        self.e_load_enabled: int = 0
        self.e_load_mode: int = 0
        self.e_load_short: int = 0
        self.e_load_csetting: int = 0
        self.e_load_rsetting: int = 0
        self.pload_volts: float = 0.0
        self.pload_current: float = 0.0
        self.multi_meter = None
        self.multi_meter_mode: int = 0
        self.multi_meter_range: int = 0
        self.e_load = None
        self.resource_manager = None
        self.eload_lock = threading.Lock()
        self.can_lock = threading.Lock()
        self.mmeter_lock = threading.Lock()
        
    def initialize_devices(self) -> None:
        """Initializes the multi-meter and e-load."""
        self._initialize_multimeter()
        self._initialize_eload()

    def _initialize_multimeter(self) -> None:
        """Initializes the multimeter via serial connection."""
        try:
            mmeter = serial.Serial(MULTI_METER_PATH, MULTI_METER_BAUD, timeout=1)
            mmeter.write(b'*IDN?\n')
            response = mmeter.readline().decode().strip()
            print(f"MULTI-METER ID: {response}")
            self.multi_meter = mmeter
        except (serial.SerialException, IOError) as e:
            print(f"Failed to communicate with multi-meter: {e}")
            self.multi_meter = None

    def _initialize_eload(self) -> None:
        """Initializes the e-load via pyvisa."""
        try:
            self.resource_manager = pyvisa.ResourceManager()
            # Get a list of all detected VISA resources
            available_resources = self.resource_manager.list_resources()
            
            if not available_resources:
                print("No VISA resources found.")
                return

            print("Available VISA resource IDs:")
            for resource_id in available_resources:
                print(f"- {resource_id}")
                
            eload = self.resource_manager.open_resource(ELOAD_VISA_ID)
            print(f"E-LOAD ID: {eload.query('*IDN?')}")
            print(f"Resetting {ELOAD_VISA_ID}")
            eload.write('*RST')
            eload.write('SYST:CLE')
            self.e_load = eload
        except Exception as e:
            print(f"An error occurred with the e-load via Resource Manager: {e}")
            self.e_load = None

    def close_devices(self) -> None:
        """Closes connections to all hardware devices."""
        if self.multi_meter:
            print("Closing multi-meter connection...")
            self.multi_meter.close()
        if self.e_load:
            print("Closing e-load connection...")
            self.e_load.close()
        if self.resource_manager:
            print("Closing resource manager...")
            self.resource_manager.close()

# --- Main Functions ---
def update_display(lines):
    """
    Clears the entire terminal and prints the new content, filling all rows.
    Hides the cursor during the update to prevent flickering.

    Args:
        lines (list): A list of strings to print.
    """
    # Get the current terminal size
    try:
        size = os.get_terminal_size()
    except OSError:
        size = os.terminal_size((80, 24))

    # --- Start of flicker-prevention logic ---
    # Hide the cursor
    sys.stdout.write("\033[?25l")
    
    # --- The existing display update logic ---
    # Reset and clear the screen
    sys.stdout.write("\033[0m\033[H\033[2J")
    
    # Print the provided lines
    for line in lines:
        sys.stdout.write(str(line) + "\n")

    # Pad the remaining rows with blank lines
    for _ in range(size.lines - len(lines) - 1):
        sys.stdout.write("\n")
    
    # Show the cursor again
    sys.stdout.write("\033[?25h")
    # --- End of flicker-prevention logic ---
    
    sys.stdout.flush()


def setup_can_interface(channel: str, bitrate: int) -> can.BusABC | None:
    """Configures and brings up the CAN interface."""
    try:
        subprocess.run(
            ["sudo", "ip", "link", "set", channel, "up", "type", "can", f"bitrate", f"{bitrate}"],
            check=True
        )
        print(f"CAN interface {channel} is up with bitrate {bitrate}.")
        return can.interface.Bus(interface='socketcan', channel=channel, bitrate=bitrate)
    except subprocess.CalledProcessError as e:
        print(f"Failed to bring up CAN interface: {e}")
        return None
    except can.CanError as e:
        print(f"Failed to connect to CAN bus: {e}")
        return None

def shutdown_can_interface(channel: str) -> None:
    """Brings down the CAN interface."""
    try:
        subprocess.run(["sudo", "ip", "link", "set", channel, "down"], check=True)
        print(f"CAN interface {channel} is now down.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to bring down CAN interface: {e}")

def receive_can_messages(cbus: can.BusABC, hardware: HardwareManager, stop_event: threading.Event) -> None:
    """Continuously receives CAN messages and updates hardware state."""
    print("Receiver thread started. Listening for CAN messages...")
    while not stop_event.is_set():
        with hardware.can_lock:
            message = cbus.recv(timeout=1.0)
        
        if not message:
            continue

        if message.arbitration_id == RLY_CTRL_ID:
            GPIO_K1.on() if message.data[0] & 0x03 == 0x01 else GPIO_K1.off()
            continue
            
        if message.arbitration_id == MMETER_CTRL_ID:
            meter_mode = message.data[0]
            meter_range = message.data[1]
            if(hardware.multi_meter_mode != meter_mode):
                hardware.multi_meter_mode = meter_mode
                if hardware.multi_meter:
                    with hardware.mmeter_lock:
                        if(meter_mode == 0):
                            hardware.multi_meter.write(b'FUNC VOLT:DC\n')
                            response = hardware.multi_meter.readline().decode().strip()
                        elif(meter_mode == 1):
                            hardware.multi_meter.write(b'FUNC CURR:DC\n')
                            response = hardware.multi_meter.readline().decode().strip()  
                            hardware.multi_meter.write(b'CURR:DC:RANG 5\n')
                            response = hardware.multi_meter.readline().decode().strip()  
            if(hardware.multi_meter_range != meter_range):
                hardware.multi_meter_range = meter_range

            continue

        if message.arbitration_id == LOAD_CTRL_ID and hardware.e_load:
            first_byte = message.data[0]

            # Update remote control state
            new_remote_state = 1 if first_byte & 0x03 == 0x01 else 0
            if hardware.e_load_remote != new_remote_state:
                hardware.e_load_remote = new_remote_state

            # Update enable state and send command
            new_enable_state = 1 if first_byte & 0x0C == 0x04 else 0
            if hardware.e_load_enabled != new_enable_state:
                hardware.e_load_enabled = new_enable_state
                command = "INP ON" if hardware.e_load_enabled else "INP OFF"
                #print(f"E-load cmd: {command}" + " " * 40, flush=True)
                if hardware.e_load:
                    with hardware.eload_lock:
                        hardware.e_load.write(command)

            # Update enable state and send command
            new_mode = 1 if first_byte & 0x30 == 0x10 else 0
            if hardware.e_load_mode != new_mode:
                hardware.e_load_mode = new_mode
                command = "FUNC RES" if hardware.e_load_mode else "FUNC CURR"
                #print(f"E-load cmd: {command}" + " " * 40, flush=True)
                if hardware.e_load:
                    with hardware.eload_lock:
                        hardware.e_load.write(command)

            # Update enable state and send command
            new_mode = 1 if first_byte & 0xC0 == 0x40 else 0
            if hardware.e_load_short != new_mode:
                hardware.e_load_short = new_mode
                command = "INP:SHOR ON" if hardware.e_load_short else "INP:SHOR OFF"
                #print(f"E-load cmd: {command}" + " " * 40, flush=True)
                if hardware.e_load:
                    with hardware.eload_lock:
                        hardware.e_load.write(command)
                        
            # Update current setting
            in_value = (message.data[3] * 256) + message.data[2]
            if hardware.e_load_csetting != in_value:
                hardware.e_load_csetting = in_value
                if hardware.e_load:
                    command = f"CURR {hardware.e_load_csetting / 1000}"
                    #print(f"E-load cmd: {command}")
                    with hardware.eload_lock:
                        hardware.e_load.write(command)
                        
            # Update resistance setting
            in_value = (message.data[5] * 256) + message.data[4]
            if hardware.e_load_rsetting != in_value:
                hardware.e_load_rsetting = in_value
                if hardware.e_load:
                    command = f"RES {hardware.e_load_rsetting / 1000}"
                    #print(f"E-load cmd: {command}")
                    with hardware.eload_lock:
                        hardware.e_load.write(command)
                        
def is_number(value: str) -> bool:
    """Checks if a string can be converted to a float."""
    try:
        float(value)
        return True
    except ValueError:
        return False

    
def main() -> None:
    """Main execution function."""
    hardware = HardwareManager()
    stop_event = threading.Event()
    cbus = None
    receiver_thread = None
    load_volts = 0
    load_current = 0
    meter_current = 0
    meter_volts = 0
    load_volts_str = ""
    load_current_str = ""
    load_stat_func = ""
    load_stat_curr = ""
    load_stat_imp = ""
    load_stat_res = ""
    load_stat_short = ""
    
    meter_mode_str = ""
    meter_range_str = ""
    
    try:
        hardware.initialize_devices()
        quit()
        cbus = setup_can_interface(CAN_CHANNEL, CAN_BITRATE)
        if not cbus:
            print("Exiting due to CAN interface setup failure.")
            return

        receiver_thread = threading.Thread(
            target=receive_can_messages,
            args=(cbus, hardware, stop_event),
            daemon=True
        )
        receiver_thread.start()

        while True:
            # Read from multi-meter and send to CAN
            if hardware.multi_meter:
                response = ""
                with hardware.mmeter_lock:
                    hardware.multi_meter.write(b'FETC?\n')
                    response = hardware.multi_meter.readline().decode().strip()
                if is_number(response):
                    meter_volts = 0 #TODO:
                    value = float(response)
                    value = max(0, value)
                    meter_current = int(value * 1000)
                    hb = meter_current % 256
                    lb = meter_current // 256
                    msg = can.Message(
                        arbitration_id=MMETER_READ_ID,
                        data=[hb, lb, 0, 0, 0, 0, 0, 0],
                        is_extended_id=True
                    )
                    try:
                        with hardware.can_lock:
                            cbus.send(msg)
                        #print(f"MMeter current: {meter_current:.3f} A", end='\r', flush=True)
                    except can.CanError:
                        print("Message NOT sent")
                # with hardware.mmeter_lock:
                    # hardware.multi_meter.write(b'FUNC?\n')
                    # meter_mode_str = hardware.multi_meter.readline().decode().strip()
                    # hardware.multi_meter.write(b'CURR:DC:RANG?\n')
                    # meter_range_str = hardware.multi_meter.readline().decode().strip()

            # Read from e-load and send to CAN
            if hardware.e_load:
                try:
                    with hardware.eload_lock:
                        load_volts_str = hardware.e_load.query("MEAS:VOLT?").strip()
                        load_current_str = hardware.e_load.query("MEAS:CURR?").strip()
                        load_stat_func = hardware.e_load.query("FUNC?").strip()
                        load_stat_curr = hardware.e_load.query("CURR?").strip()
                        load_stat_imp = hardware.e_load.query("INP?").strip()
                        load_stat_res = hardware.e_load.query("RES?").strip()
                        load_stat_short = hardware.e_load.query("INP:SHOR?").strip()
                        
                except pyvisa.VisaIOError as e:
                    print(f"PyVISA communication error: {e}", file=sys.stderr)
                    time.sleep(1)
                    continue

                if is_number(load_volts_str) and is_number(load_current_str):
                    load_volts = float(load_volts_str) * 1000
                    load_current = float(load_current_str) * 1000
                    msg = can.Message(
                        arbitration_id=ELOAD_READ_ID,
                        data=[int(load_volts % 256), int(load_volts / 256),
                              int(load_current % 256), int(load_current / 256),
                              0, 0, 0, 0],
                        is_extended_id=True
                    )
                    try:
                        with hardware.can_lock:
                            cbus.send(msg)
                    except can.CanError:
                        print("Message NOT sent")
                else:
                    print("Recevied NAN")

            # Prepare new strings
            new_line0 = "*" * 60
            new_line1 = f"* ELOAD - NOT DETECTED"
            new_line2 = f"* METER - CURRENT: {meter_current/1000:.3f} A"
            new_line3 = f"* METER - MODE: {meter_mode_str} {meter_range_str}"
            new_line4 = "*" * 60
            dis_lines = [new_line0,new_line1,new_line2,new_line3,new_line4]
            # change if e_load is connected
            if hardware.e_load:
                new_line0 = "*" * 60
                new_line1 = "* ELOAD - ENABLE: " + load_stat_imp
                new_line2 = "* ELOAD - MODE: " + load_stat_func
                new_line3 = "* ELOAD - CURRENT SETTING: " + load_stat_curr 
                new_line4 = "* ELOAD - RESISTANCE SETTING: " + load_stat_res
                new_line5 = "* ELOAD - SHORT ENABLED: " + load_stat_short
                new_line6 = f"* ELOAD - VOLTS: {load_volts/1000:.3f} V"
                new_line7 = f"* ELOAD - CURRENT: {load_current/1000:.3f} A"
                new_line8 = f"* METER - CURRENT: {meter_current/1000:.3f} A"
                new_line9 = f"* METER - MODE: {meter_mode_str} {meter_range_str}"
                new_line10 = "*" * 60
                dis_lines = [new_line0,new_line1,new_line2,new_line3,new_line4,new_line5,new_line6,new_line7,new_line8,new_line9,new_line10]
            update_display(dis_lines)
            # Call the update function
            #update_display(new_line1, new_line2, new_line3, new_line4, new_line5)      
            time.sleep(0.02)

    except KeyboardInterrupt:
        print("\nInterrupted by user. Starting graceful shutdown...")
    finally:
        stop_event.set()
        if receiver_thread:
            receiver_thread.join()
            print("Receiver thread stopped.")
        if cbus:
            cbus.shutdown()
            print("CAN bus shut down.")
        hardware.close_devices()
        shutdown_can_interface(CAN_CHANNEL)
        print("Shutdown complete. Exiting.")

if __name__ == "__main__":
    main()
