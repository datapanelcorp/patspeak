#!/home/j/roi/bin/python
# roie_updated_v5.py

import can
import serial
import subprocess
import threading
import time
import pyvisa
import sys
import struct
from gpiozero import LED
import fnmatch
from typing import Optional

# --- Rich (pretty, flicker-free TUI) ---
try:
    from rich.console import Console
    from rich.live import Live
    from rich.panel import Panel
    from rich.table import Table
    from rich.layout import Layout
    from rich.text import Text
    from rich.align import Align
    from rich import box
    HAVE_RICH = True
    console = Console(highlight=False)
except Exception:
    HAVE_RICH = False
    console = None

# --- Constants ---
# Hardware identifiers
MULTI_METER_PATH = '/dev/ttyUSB0'
MULTI_METER_BAUD = 38400  # 38.4k confirmed by user

# VISA Resource IDs
ELOAD_VISA_ID = "USB0::11975::34816::*::0::INSTR"
AFG_VISA_ID   = "ASRL/dev/ttyACM0::INSTR" 

# CAN bus configuration
CAN_CHANNEL = "can1"
CAN_BITRATE = 250000

# CAN IDs (Control)
# DBC: CTRL_LOAD (0x0CFF0400)
LOAD_CTRL_ID    = 0x0CFF0400
# DBC: CTRL_RLY (0x0CFF0500)
RLY_CTRL_ID     = 0x0CFF0500
# DBC: CTRL_METER (0x0CFF0600) -> Byte 0=METER_MODE, Byte 1=METER_RANGE
MMETER_CTRL_ID  = 0x0CFF0600 
# DBC: CTRL_AFG (0x0CFF0700)
AFG_CTRL_ID     = 0x0CFF0700
# DBC: CTRL_AFG_EXT (0x0CFF0701)
AFG_CTRL_EXT_ID = 0x0CFF0701

# CAN IDs (Readback/Status)
# DBC: STAT_METER (0x0CFF0003) -> Contains E-Load Volts/Amps
ELOAD_READ_ID   = 0x0CFF0003
# DBC: STAT_AMPS (0x0CFF0004) -> Contains Multimeter Reading (MeterAmps)
MMETER_READ_ID  = 0x0CFF0004 
# DBC: STAT_METER_INFO (0x0CFF0008) -> NEW: MeterModeSts, MeterRangeSts
MMETER_STAT_ID  = 0x0CFF0008 
# DBC: STAT_AFG (0x0CFF0005)
AFG_READ_ID     = 0x0CFF0005
# DBC: STAT_AFG_EXT (0x0CFF0006)
AFG_READ_EXT_ID = 0x0CFF0006

# --- Relay Configuration ---
K1_PIN_BCM = 26
RELAY_ACTIVE_LOW = False 
GPIO_K1 = LED(K1_PIN_BCM, active_high=not RELAY_ACTIVE_LOW, initial_value=False)

# --- Class for Hardware Management ---
class HardwareManager:
    """Manages communication and state for the e-load, multimeter, and AFG."""
    def __init__(self):
        # e-load state
        self.e_load_remote: int = 0
        self.e_load_enabled: int = 0
        self.e_load_mode: int = 0
        self.e_load_short: int = 0
        self.e_load_csetting: int = 0
        self.e_load_rsetting: int = 0
        self.pload_volts: float = 0.0
        self.pload_current: float = 0.0
        
        # multimeter state
        self.multi_meter = None
        self.mmeter_id = None
        self.mmeter_mode_str: str = "---"
        
        # AFG state
        self.afg = None
        self.afg_id = None
        self.afg_output: bool = False
        self.afg_shape: int = 0 
        self.afg_freq: int = 1000
        self.afg_ampl: int = 1000 
        self.afg_offset: int = 0
        self.afg_duty: int = 50

        # VISA Shared Manager
        self.resource_manager = None
        self.e_load = None

        # Locks
        self.eload_lock = threading.Lock()
        self.mmeter_lock = threading.Lock()
        self.afg_lock = threading.Lock()

    def initialize_devices(self) -> None:
        """Initializes the multi-meter, e-load, and AFG."""
        self._initialize_multimeter()
        self._initialize_visa_devices()

    def _initialize_multimeter(self) -> None:
        try:
            (console.log if HAVE_RICH else print)(f"Connecting to Multimeter at {MULTI_METER_PATH} (38400)...")
            # Added dsrdtr=True for optical cable power
            mmeter = serial.Serial(MULTI_METER_PATH, MULTI_METER_BAUD, timeout=1.0, dsrdtr=True)
            
            # Clear buffers
            mmeter.reset_input_buffer()
            mmeter.reset_output_buffer()
            mmeter.write(b'\n') 
            time.sleep(0.1)

            # Non-blocking ID check
            try:
                mmeter.write(b'*IDN?\n')
                resp = mmeter.readline().decode().strip()
                if resp:
                    self.mmeter_id = resp
                    (console.log if HAVE_RICH else print)(f"MULTI-METER FOUND: {self.mmeter_id}")
                else:
                    (console.log if HAVE_RICH else print)("MULTI-METER: Connected (No IDN response).")
                    self.mmeter_id = "Generic/NoID"
            except Exception:
                self.mmeter_id = "ErrorRead"
            
            # Ensure Remote Mode
            mmeter.write(b'SYST:REM\n')
            
            self.multi_meter = mmeter

        except (serial.SerialException, IOError) as e:
            (console.log if HAVE_RICH else print)(f"Failed to open multi-meter port: {e}")
            self.multi_meter = None

    def _initialize_visa_devices(self) -> None:
        try:
            self.resource_manager = pyvisa.ResourceManager()
            
            # --- 1. E-LOAD ---
            try:
                available_resources = list(self.resource_manager.list_resources())
                for resource_id in available_resources:
                    if fnmatch.fnmatch(resource_id, ELOAD_VISA_ID):
                        try:
                            dev = self.resource_manager.open_resource(resource_id)
                            dev.timeout = 2000
                            dev_id = dev.query('*IDN?').strip()
                            (console.log if HAVE_RICH else print)(f"E-LOAD FOUND: {dev_id}")
                            dev.write('*RST')
                            dev.write('SYST:CLE')
                            self.e_load = dev
                            break
                        except Exception as e:
                            (console.log if HAVE_RICH else print)(f"Skip E-LOAD ({resource_id}): {e}")
            except Exception as e:
                (console.log if HAVE_RICH else print)(f"E-Load Scan Error: {e}")

            # --- 2. AFG-2125 ---
            try:
                afg_dev = self.resource_manager.open_resource(AFG_VISA_ID)
                afg_dev.baud_rate = 115200 
                afg_dev.read_termination = '\n'
                afg_dev.write_termination = '\n'
                
                dev_id = afg_dev.query('*IDN?').strip()
                (console.log if HAVE_RICH else print)(f"AFG FOUND: {dev_id}")
                self.afg = afg_dev
                self.afg_id = dev_id
            except Exception as e:
                (console.log if HAVE_RICH else print)(f"AFG Connection Failed: {e}")

        except Exception as e:
            (console.log if HAVE_RICH else print)(f"Critical VISA Error: {e}")

    def close_devices(self) -> None:
        if self.multi_meter:
            try:
                self.multi_meter.write(b'SYST:LOC\n') 
            except: pass
            self.multi_meter.close()
        if self.e_load:
            self.e_load.close()
        if self.afg:
            self.afg.close()
        if self.resource_manager:
            self.resource_manager.close()

# --- Rich dashboard builder ---
def _badge(ok: bool, true_label="ON", false_label="OFF"):
    return f"[bold {'green' if ok else 'red'}]{true_label if ok else false_label}[/]"

def build_dashboard(hardware, *,
                    meter_val: float,
                    meter_mode_str: str,
                    meter_alive: bool,
                    load_volts_mV: int,
                    load_current_mA: int,
                    load_stat_func: str,
                    load_stat_curr: str,
                    load_stat_imp: str,
                    afg_freq_read: str,
                    afg_ampl_read: str,
                    afg_out_read: str,
                    afg_shape_read: str,
                    can_channel: str,
                    can_bitrate: int,
                    status_poll_period: float):
    
    if not HAVE_RICH:
        return f"METER: {meter_val} | E-LOAD: {load_volts_mV}mV"

    layout = Layout()
    layout.split(
        Layout(name="top", size=11),
        Layout(name="middle", ratio=1),
        Layout(name="bottom", size=3),
    )

    # --- TOP: Instrument Status ---
    # E-LOAD Panel
    eload_table = Table.grid(padding=(0, 1))
    eload_table.add_column(justify="right", style="bold cyan")
    eload_table.add_column()
    if hardware.e_load:
        el_on = str(load_stat_imp or '').strip().upper() in ['ON', '1']
        eload_table.add_row("ID", f"[white]{hardware.e_load.resource_name}[/]")
        eload_table.add_row("Enable", f"{_badge(el_on)}")
        eload_table.add_row("Mode", f"[white]{load_stat_func or ''}[/]")
        eload_table.add_row("Set", f"[yellow]{(load_stat_curr or '').strip()}[/]")
    else:
        eload_table.add_row("Status", "[red]NOT DETECTED[/]")

    # AFG Panel
    afg_table = Table.grid(padding=(0, 1))
    afg_table.add_column(justify="right", style="bold green")
    afg_table.add_column()
    if hardware.afg:
        afg_table.add_row("ID", f"[white]{hardware.afg_id or 'Unknown'}[/]")
        is_on = str(afg_out_read).strip().upper() in ['ON', '1']
        afg_table.add_row("Output", _badge(is_on))
        afg_table.add_row("Freq", f"[yellow]{afg_freq_read} Hz[/]")
        afg_table.add_row("Ampl", f"[yellow]{afg_ampl_read} Vpp[/]")
        afg_table.add_row("Shape", f"[white]{afg_shape_read}[/]")
    else:
        afg_table.add_row("Status", "[red]NOT DETECTED[/]")

    # Multimeter Panel
    meter_table = Table.grid(padding=(0, 1))
    meter_table.add_column(justify="right", style="bold magenta")
    meter_table.add_column()
    
    if hardware.multi_meter:
        meter_table.add_row("ID", f"[white]{hardware.mmeter_id}[/]")
        # Indicates valid data reception
        meter_table.add_row("Status", _badge(meter_alive, "LIVE", "TIMEOUT"))
        meter_table.add_row("Mode", f"[yellow]{meter_mode_str}[/]")
    else:
        meter_table.add_row("Status", "[red]PORT FAILED[/]")

    top_grid = Table.grid(expand=True)
    top_grid.add_column(ratio=1)
    top_grid.add_column(ratio=1)
    top_grid.add_column(ratio=1)
    top_grid.add_row(
        Panel(eload_table, title="[bold]E-Load[/]", border_style="cyan", box=box.ROUNDED),
        Panel(afg_table, title="[bold]AFG-2125[/]", border_style="green", box=box.ROUNDED),
        Panel(meter_table, title="[bold]Multimeter 5491B[/]", border_style="magenta", box=box.ROUNDED),
    )
    layout["top"].update(top_grid)

    # --- MIDDLE: Measurements ---
    meas_eload = Table(title="[bold]E-Load (STAT_METER)[/]", box=box.SIMPLE_HEAVY, expand=True)
    meas_eload.add_column("Metric", style="bold cyan", no_wrap=True)
    meas_eload.add_column("Value", justify="right")
    meas_eload.add_row("Voltage", f"[green]{load_volts_mV/1000:.3f} V[/]")
    meas_eload.add_row("Current", f"[green]{load_current_mA/1000:.3f} A[/]")

    meas_meter = Table(title="[bold]Meter (STAT_AMPS)[/]", box=box.SIMPLE_HEAVY, expand=True)
    meas_meter.add_column("Metric", style="bold magenta", no_wrap=True)
    meas_meter.add_column("Value", justify="right")
    
    unit = "V" if "VOLT" in meter_mode_str else ("A" if "CURR" in meter_mode_str else ("Ω" if "RES" in meter_mode_str else ""))
    meas_meter.add_row("Reading", f"[yellow]{meter_val:.5f} {unit}[/]")

    # GPIO Status
    badge_text = Text.from_markup(_badge(GPIO_K1.is_lit, "CLOSED", "OPEN"))
    gpio_panel = Panel(
        Align.center(Text.assemble(("K1 Relay\n", "bold"), badge_text), vertical="middle"),
        border_style="yellow", box=box.ROUNDED, title="[bold]GPIO[/]",
    )

    mid = Table.grid(expand=True)
    mid.add_column(ratio=2)
    mid.add_column(ratio=2)
    mid.add_column(ratio=1)
    mid.add_row(meas_eload, meas_meter, gpio_panel)
    layout["middle"].update(mid)

    # --- BOTTOM: Status Bar ---
    status = Text.assemble(
        (" CAN: ", "bold"), (f"{can_channel}@{can_bitrate//1000}k ", "cyan"),
        (" Poll: ", "bold"), (f"{status_poll_period:.2f}s ", "cyan"),
        (" Meter: ", "bold"), (f"{'Available' if hardware.multi_meter else 'Missing'}", "green" if hardware.multi_meter else "red")
    )
    layout["bottom"].update(Panel(status, box=box.SQUARE, border_style="blue"))
    return layout

# --- CAN setup ---
def setup_can_interface(channel: str, bitrate: int) -> Optional[can.BusABC]:
    try:
        subprocess.run(["sudo", "ip", "link", "set", channel, "up", "type", "can", f"bitrate", f"{bitrate}"], check=True)
        return can.interface.Bus(interface='socketcan', channel=channel, bitrate=bitrate)
    except Exception:
        return None

def shutdown_can_interface(channel: str) -> None:
    subprocess.run(["sudo", "ip", "link", "set", channel, "down"], check=False)

# --- CAN receiver thread ---
def receive_can_messages(cbus: can.BusABC, hardware: HardwareManager, stop_event: threading.Event) -> None:
    (console.log if HAVE_RICH else print)("Receiver thread started.")
    
    # DBC: CTRL_METER -> METER_MODE Values
    # 0=DCV, 1=ACV, 2=DCA, 3=ACA, 4=RES
    METER_MODES = {
        0: b'FUNC VOLT:DC\n',
        1: b'FUNC VOLT:AC\n',
        2: b'FUNC CURR:DC\n',
        3: b'FUNC CURR:AC\n',
        4: b'FUNC RES\n',
        5: b'FUNC FREQ\n'
    }

    SHAPE_MAP = {0: "SIN", 1: "SQU", 2: "RAMP"}

    while not stop_event.is_set():
        message = cbus.recv(timeout=1.0)
        if not message:
            continue

        # Relay control (CTRL_RLY)
        if message.arbitration_id == RLY_CTRL_ID:
            should_be_on = (message.data[0] & 0x01) == 0x01
            if should_be_on: GPIO_K1.on()
            else: GPIO_K1.off()
            continue
        
        # --- Multimeter Control (CTRL_METER) ---
        if message.arbitration_id == MMETER_CTRL_ID and hardware.multi_meter:
            req_mode = message.data[0] # Signal: METER_MODE
            cmd = METER_MODES.get(req_mode)
            if cmd:
                try:
                    with hardware.mmeter_lock:
                        hardware.multi_meter.write(cmd)
                        time.sleep(0.05)
                        hardware.multi_meter.reset_input_buffer()
                except Exception as e:
                    (console.log if HAVE_RICH else print)(f"Meter Ctrl Error: {e}")
            continue

        # --- AFG Control (CTRL_AFG) ---
        if message.arbitration_id == AFG_CTRL_ID and hardware.afg:
            enable = (message.data[0] != 0)
            shape_idx = message.data[1]
            freq = struct.unpack('<I', bytes(message.data[2:6]))[0]
            ampl_mV = struct.unpack('<H', bytes(message.data[6:8]))[0]
            ampl_V = ampl_mV / 1000.0

            try:
                with hardware.afg_lock:
                    if hardware.afg_output != enable:
                        hardware.afg.write(f"SOUR1:OUTP {'ON' if enable else 'OFF'}")
                        hardware.afg_output = enable
                    
                    if hardware.afg_shape != shape_idx:
                        shape_str = SHAPE_MAP.get(shape_idx, "SIN")
                        hardware.afg.write(f"SOUR1:FUNC {shape_str}")
                        hardware.afg_shape = shape_idx
                    
                    if hardware.afg_freq != freq:
                        hardware.afg.write(f"SOUR1:FREQ {freq}")
                        hardware.afg_freq = freq
                    
                    if hardware.afg_ampl != ampl_mV:
                        hardware.afg.write(f"SOUR1:AMPL {ampl_V}")
                        hardware.afg_ampl = ampl_mV
            except Exception as e:
                (console.log if HAVE_RICH else print)(f"AFG Control Error: {e}")
            continue

        # --- E-load control (CTRL_LOAD) ---
        if message.arbitration_id == LOAD_CTRL_ID and hardware.e_load:
            first_byte = message.data[0]
            new_enable = 1 if first_byte & 0x0C == 0x04 else 0
            if hardware.e_load_enabled != new_enable:
                hardware.e_load_enabled = new_enable
                with hardware.eload_lock:
                    hardware.e_load.write("INP ON" if new_enable else "INP OFF")

            val_c = (message.data[3] << 8) | message.data[2]
            if hardware.e_load_csetting != val_c:
                hardware.e_load_csetting = val_c
                with hardware.eload_lock:
                    hardware.e_load.write(f"CURR {val_c/1000}")

# --- Main ---
def main() -> None:
    hardware = HardwareManager()
    stop_event = threading.Event()
    
    # measurements
    meter_val = 0.0
    meter_alive = False
    load_volts_mV = 0
    load_current_mA = 0

    # status strings
    load_stat_func = ""
    load_stat_curr = ""
    load_stat_imp = ""
    
    afg_freq_str = ""
    afg_ampl_str = ""
    afg_out_str = ""
    afg_shape_str = ""

    last_status_poll = 0.0
    STATUS_POLL_PERIOD = 1.0

    try:
        hardware.initialize_devices()
        cbus = setup_can_interface(CAN_CHANNEL, CAN_BITRATE)
        if not cbus: return

        receiver_thread = threading.Thread(target=receive_can_messages, args=(cbus, hardware, stop_event), daemon=True)
        receiver_thread.start()

        if HAVE_RICH:
            with Live(console=console, screen=True, refresh_per_second=10) as live:
                while True:
                    now = time.time()
                    
                    # 1. Multimeter Measurement (STAT_AMPS 0x04)
                    if hardware.multi_meter:
                        try:
                            with hardware.mmeter_lock:
                                hardware.multi_meter.write(b'FETC?\n')
                                resp = hardware.multi_meter.readline().decode().strip()
                            if resp:
                                try:
                                    meter_val = float(resp)
                                    meter_alive = True
                                    # Send CAN update (0x0CFF0004 -> STAT_AMPS)
                                    # Signal: MeterAmps (Signed 16-bit)
                                    val_milli = int(meter_val * 1000)
                                    if val_milli > 32767: val_milli = 32767
                                    if val_milli < -32768: val_milli = -32768
                                    
                                    msg = can.Message(arbitration_id=MMETER_READ_ID, 
                                                      data=list(val_milli.to_bytes(2, 'little', signed=True)) + [0]*6, 
                                                      is_extended_id=True)
                                    cbus.send(msg)
                                except ValueError:
                                    pass
                            else:
                                meter_alive = False
                        except Exception: 
                            meter_alive = False

                    # 2. E-Load Meas (STAT_METER 0x03)
                    if hardware.e_load:
                        try:
                            with hardware.eload_lock:
                                v_str = hardware.e_load.query("MEAS:VOLT?").strip()
                                i_str = hardware.e_load.query("MEAS:CURR?").strip()
                            if v_str and i_str:
                                load_volts_mV = int(float(v_str)*1000)
                                load_current_mA = int(float(i_str)*1000)
                                # Send CAN update (0x0CFF0003 -> STAT_METER)
                                # Signals: MeterVolts, MeterCurrent
                                data = list(load_volts_mV.to_bytes(2, 'little')) + \
                                       list(load_current_mA.to_bytes(2, 'little')) + [0]*4
                                msg = can.Message(arbitration_id=ELOAD_READ_ID, data=data, is_extended_id=True)
                                cbus.send(msg)
                        except Exception: pass

                    # 3. Status Poll (Low Frequency)
                    if now - last_status_poll >= STATUS_POLL_PERIOD:
                        last_status_poll = now
                        
                        # Poll Multimeter Info (STAT_METER_INFO 0x08)
                        if hardware.multi_meter:
                            try:
                                with hardware.mmeter_lock:
                                    hardware.multi_meter.write(b'FUNC?\n')
                                    m_mode = hardware.multi_meter.readline().decode().strip()
                                    if m_mode: 
                                        hardware.mmeter_mode_str = m_mode
                                    
                                    # Send CAN Status (0x0CFF0008 -> STAT_METER_INFO)
                                    # Signal: MeterModeSts (Byte 0)
                                    mode_id = 0
                                    s = hardware.mmeter_mode_str.upper()
                                    if "VOLT" in s: mode_id = 0 if "DC" in s else 1
                                    elif "CURR" in s: mode_id = 2 if "DC" in s else 3
                                    elif "RES" in s: mode_id = 4
                                    
                                    stat_msg = can.Message(arbitration_id=MMETER_STAT_ID, 
                                                           data=[mode_id, 0, 0, 0, 0, 0, 0, 0], 
                                                           is_extended_id=True)
                                    cbus.send(stat_msg)
                            except Exception: pass

                        # Poll E-Load Settings
                        if hardware.e_load:
                            try:
                                with hardware.eload_lock:
                                    load_stat_func = hardware.e_load.query("FUNC?").strip()
                                    load_stat_curr = hardware.e_load.query("CURR?").strip()
                                    load_stat_imp = hardware.e_load.query("INP?").strip()
                            except Exception: pass

                        # Poll AFG Settings
                        if hardware.afg:
                            try:
                                with hardware.afg_lock:
                                    afg_freq_str = hardware.afg.query("SOUR1:FREQ?").strip()
                                    afg_ampl_str = hardware.afg.query("SOUR1:AMPL?").strip()
                                    afg_out_str = hardware.afg.query("SOUR1:OUTP?").strip()
                                    afg_shape_str = hardware.afg.query("SOUR1:FUNC?").strip()
                            except Exception: pass

                    # Update Dashboard
                    renderable = build_dashboard(
                        hardware,
                        meter_val=meter_val,
                        meter_mode_str=hardware.mmeter_mode_str,
                        meter_alive=meter_alive,
                        load_volts_mV=load_volts_mV,
                        load_current_mA=load_current_mA,
                        load_stat_func=load_stat_func,
                        load_stat_curr=load_stat_curr,
                        load_stat_imp=load_stat_imp,
                        afg_freq_read=afg_freq_str,
                        afg_ampl_read=afg_ampl_str,
                        afg_out_read=afg_out_str,
                        afg_shape_read=afg_shape_str,
                        can_channel=CAN_CHANNEL,
                        can_bitrate=CAN_BITRATE,
                        status_poll_period=STATUS_POLL_PERIOD,
                    )
                    live.update(renderable)
                    time.sleep(0.1)

    except KeyboardInterrupt:
        pass
    finally:
        stop_event.set()
        if receiver_thread: receiver_thread.join()
        if cbus: cbus.shutdown()
        hardware.close_devices()
        shutdown_can_interface(CAN_CHANNEL)

if __name__ == "__main__":
    main()