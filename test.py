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

def query_usbtmc_device_ids():
    """
    Connects to all available USBTMC devices and queries their identification string.
    """
    try:
        # Initialize the Resource Manager
        rm = pyvisa.ResourceManager()
        
        # List all available resources
        resources = rm.list_resources()
        
        if not resources:
            print("No VISA resources found. Is your device connected?")
            return

        print("Available VISA resources:")
        for resource_name in resources:
            print(f"- {resource_name}")
        
        print("\n--- Querying USBTMC devices ---")
        found_device = False
        
        # Iterate through all resources to find USB devices
        for resource_name in resources:
            # Check if the resource string corresponds to a USB device
            print(resource_name)
            if resource_name.startswith("USB"):
                found_device = True
                try:
                    # Open the device resource
                    print(f"Connecting to device at: {resource_name}")
                    instrument = rm.open_resource(resource_name)
                    
                    # Query the device for its ID
                    # The `query()` method sends the command and then reads the response
                    identification = instrument.query("*IDN?")
                    
                    # Print the identification string
                    print(f"  -> Device ID: {identification.strip()}")
                    
                    # Close the resource
                    instrument.close()
                    
                except pyvisa.VisaIOError as e:
                    print(f"  -> Failed to query device {resource_name}: {e}")
                except Exception as e:
                    print(f"  -> An unexpected error occurred with device {resource_name}: {e}")
        
        if not found_device:
            print("No USBTMC devices found in the available resources.")

    except Exception as e:
        print(f"An error occurred with the Resource Manager: {e}")

if __name__ == "__main__":
    query_usbtmc_device_ids()