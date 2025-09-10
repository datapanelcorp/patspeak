import pyvisa
import time

# --- Configuration ---
# Set the VISA address of your BK8600 Eload.
VISA_ADDRESS = "USB0::11975::34816::802197042747610014::0::INSTR"#"USB0::11975::34816::802197042787270012::0::INSTR"
# Set the desired resistance value in ohms.
RESISTANCE_OHMS = 50 
CURRENT_AMPS = 0.500
def main():
    rm = pyvisa.ResourceManager('@py')
    eload = None

    try:
        eload = rm.open_resource(VISA_ADDRESS)

        print(f"Connected to: {eload.query('*IDN?')}")

        # 1. Clear any pending errors and reset to a known state
        eload.write('*CLS')
        print("Resetting instrument to default settings...")
        eload.write('*RST')
        time.sleep(2)

        # 2. Ensure the load input is OFF before changing settings
        print("Ensuring load input is OFF...")
        eload.write("INP OFF")
        time.sleep(1)

        # 3. Set the load function to Constant Resistance (CR)
        print("Setting load function to Constant Resistance (RES)...")
        eload.write("FUNC RES")
        # 4. Set the resistance value
        print(f"Setting resistance to {RESISTANCE_OHMS} ohms...")
        eload.write(f"RES {RESISTANCE_OHMS}")
        # 5. Check the current function and resistance to confirm changes
        current_func = eload.query("FUNC?").strip()
        print(f"function is: {current_func}")
        current_res = eload.query("RES?").strip()
        print(f"resistance is: {current_res} ohms")

        
        # 5. Check the current function and resistance to confirm changes
        current_func = eload.query("FUNC?").strip()
        print(f"function is: {current_func}")
        
        current_short = eload.query("INP:SHOR?").strip()
        print(f"short is: {current_short}")
        
        current_res = eload.query("MEAS:VOLT?").strip()
        print(f"voltage is: {current_res} volts")
        
        current_res = eload.query("MEAS:CURR?").strip()
        print(f"current is: {current_res} volts")

        # 6. Enable the load input to apply the resistance
        print("Enabling load input...")
        eload.write("INP ON")
        print("The constant resistance load is now active.")
        time.sleep(2)
        print("Disabling load input...")
        eload.write("INP OFF")
        
        # 6. Enable the short input
        print("Enabling short input...")
        eload.write("INP:SHOR ON")
        eload.write("INP ON")
        print("The short is now active.")
        current_short = eload.query("INP:SHOR?").strip()
        print(f"Current short is: {current_short}")
        time.sleep(2)
        eload.write("INP OFF")
        eload.write('*RST')
        time.sleep(2)
        
        # 3. Set the load function to Constant Current (CURR)
        print("Setting load function to Constant Current (CURR)...")
        #eload.write("FUNC CURRent")
        print(f"Setting current to {CURRENT_AMPS} amps...")
        eload.write(f"CURR {CURRENT_AMPS}")
        error = eload.query("SYSTem:ERRor?").strip()
        print(f"ERROR: {error}")
        
    except pyvisa.errors.VisaIOError as e:
        print(f"An error occurred during communication: {e}")
        print("Please check the connection and VISA address.")

    except Exception as e:
        print(f"An unexpected error occurred: {e}")

    finally:
        if eload is not None:
            # 7. Always disable the load input and clean up
            print("Disabling load input and cleaning up...")
            try:
                eload.write("INP OFF")
                #eload.write("FUNC CC") # Return to a default mode
            except pyvisa.errors.VisaIOError:
                print("Could not reset the instrument gracefully. Connection may have been lost.")
            eload.close()
        print("Script finished.")

if __name__ == "__main__":
    main()
