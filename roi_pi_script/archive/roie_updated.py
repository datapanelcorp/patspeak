#!/home/j/roi/bin/python
# pscp .\roie.py j@picando:/home/j

import can
import serial
import subprocess
import threading
import time
import pyvisa
import sys
import struct
from gpiozero import LED
import shutil
import os
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
    from rich.errors import NotRenderableError

    HAVE_RICH = True
    console = Console(highlight=False)
except Exception:
    HAVE_RICH = False
    console = None

# --- Constants ---
# Hardware identifiers
MULTI_METER_PATH = '/dev/ttyUSB0'
MULTI_METER_BAUD = 38400

# VISA Resource IDs
ELOAD_VISA_ID = "USB0::11975::34816::*::0::INSTR"
AFG_VISA_ID   = "ASRL/dev/ttyACM0::INSTR" 

# CAN bus configuration
CAN_CHANNEL = "can1"
CAN_BITRATE = 250000

# CAN IDs
LOAD_CTRL_ID    = 0x0CFF0400
RLY_CTRL_ID     = 0x0CFF0500
MMETER_CTRL_ID  = 0x0CFF0600

# AFG Control
AFG_CTRL_ID     = 0x0CFF0700  # Enable, Shape, Freq, Ampl
AFG_CTRL_EXT_ID = 0x0CFF0701  # Offset, Duty Cycle

# Readback IDs
ELOAD_READ_ID   = 0x0CFF0003
MMETER_READ_ID  = 0x0CFF0004
AFG_READ_ID     = 0x0CFF0005  # Status: Enable, Freq, Ampl
AFG_READ_EXT_ID = 0x0CFF0006  # Status: Offset, Duty Cycle

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
        self.multi_meter_mode: int = 0
        self.multi_meter_range: int = 0
        self.mmeter_id = None

        # AFG state
        self.afg = None
        self.afg_id = None
        self.afg_output: bool = False
        self.afg_shape: int = 0  # 0=SIN, 1=SQU, 2=TRI
        self.afg_freq: int = 1000
        self.afg_ampl: int = 1000 # mVpp
        self.afg_offset: int = 0   # mV (signed)
        self.afg_duty: int = 50    # % (1-99)

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
            mmeter = serial.Serial(MULTI_METER_PATH, MULTI_METER_BAUD, timeout=1)
            mmeter.write(b'*IDN?\n')
            self.mmeter_id = mmeter.readline().decode().strip()
            (console.log if HAVE_RICH else print)(f"MULTI-METER ID: {self.mmeter_id}")
            self.multi_meter = mmeter
        except (serial.SerialException, IOError) as e:
            (console.log if HAVE_RICH else print)(f"Failed to communicate with multi-meter: {e}")
            self.multi_meter = None

    def _initialize_visa_devices(self) -> None:
        """Initializes both E-Load and AFG via PyVISA."""
        try:
            self.resource_manager = pyvisa.ResourceManager()
            
            # --- 1. E-LOAD (Scan for USBTMC) ---
            try:
                available_resources = list(self.resource_manager.list_resources())
                (console.log if HAVE_RICH else print)(f"Scanning for E-Load in: {available_resources}")
                
                for resource_id in available_resources:
                    if fnmatch.fnmatch(resource_id, ELOAD_VISA_ID):
                        try:
                            dev = self.resource_manager.open_resource(resource_id)
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

            # --- 2. AFG-2125 (Direct Connect to /dev/ttyACM0) ---
            try:
                (console.log if HAVE_RICH else print)(f"Attempting AFG connection at {AFG_VISA_ID}...")
                afg_dev = self.resource_manager.open_resource(AFG_VISA_ID)
                afg_dev.baud_rate = 115200 
                afg_dev.read_termination = '\n'
                afg_dev.write_termination = '\n'
                
                dev_id = afg_dev.query('*IDN?').strip()
                (console.log if HAVE_RICH else print)(f"AFG FOUND: {dev_id}")
                self.afg = afg_dev
                self.afg_id = dev_id

            except Exception as e:
                (console.log if HAVE_RICH else print)(f"AFG Connection Failed ({AFG_VISA_ID}): {e}")
                (console.log if HAVE_RICH else print)("Hint: Ensure user has permission (sudo usermod -aG dialout $USER)")

            if not self.e_load:
                (console.log if HAVE_RICH else print)("WARNING: E-LOAD not found.")
            if not self.afg:
                (console.log if HAVE_RICH else print)("WARNING: AFG not found.")

        except Exception as e:
            (console.log if HAVE_RICH else print)(f"Critical VISA Error: {e}")

    def close_devices(self) -> None:
        if self.multi_meter:
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
                    meter_current_mA: int,
                    load_volts_mV: int,
                    load_current_mA: int,
                    load_stat_func: str,
                    load_stat_curr: str,
                    load_stat_res: str,
                    load_stat_imp: str,
                    load_stat_short: str,
                    afg_freq_read: str,
                    afg_ampl_read: str,
                    afg_offset_read: str,
                    afg_duty_read: str,
                    afg_out_read: str,
                    afg_shape_read: str,
                    can_channel: str,
                    can_bitrate: int,
                    status_poll_period: float):
    
    if not HAVE_RICH:
        return f"E-Load V: {load_volts_mV}mV | AFG Freq: {afg_freq_read} | Meter I: {meter_current_mA}mA"

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
        visa_id = hardware.e_load.resource_name
        eload_table.add_row("ID", f"[white]{visa_id}[/]")
        el_on = str(load_stat_imp or '').strip().upper() in ['ON', '1']
        eload_table.add_row("Enable", f"{_badge(el_on)}")
        eload_table.add_row("Mode", f"[white]{load_stat_func or ''}[/]")
        if load_stat_func and load_stat_func.strip().upper().startswith("CURR"):
            eload_table.add_row("Set (I)", f"[yellow]{load_stat_curr or ''}[/]")
        else:
            eload_table.add_row("Set", f"[yellow]{(load_stat_curr or load_stat_res or '').strip()}[/]")
    else:
        eload_table.add_row("Status", "[red]NOT DETECTED[/]")

    # AFG Panel
    afg_table = Table.grid(padding=(0, 1))
    afg_table.add_column(justify="right", style="bold green")
    afg_table.add_column()
    if hardware.afg:
        afg_table.add_row("ID", f"[white]{hardware.afg_id or 'Unknown'}[/]")
        
        # FIX: Check for '1' as well as 'ON'
        is_on = str(afg_out_read).strip().upper() in ['ON', '1']
        afg_table.add_row("Output", _badge(is_on))
        
        afg_table.add_row("Freq", f"[yellow]{afg_freq_read} Hz[/]")
        afg_table.add_row("Ampl", f"[yellow]{afg_ampl_read} Vpp[/]")
        afg_table.add_row("Offset", f"[cyan]{afg_offset_read} V[/]")
        
        duty_style = "yellow" if "SQU" in str(afg_shape_read).upper() else "dim white"
        afg_table.add_row("Duty", f"[{duty_style}]{afg_duty_read} %[/]")
        
        afg_table.add_row("Shape", f"[white]{afg_shape_read}[/]")
    else:
        afg_table.add_row("Status", "[red]NOT DETECTED[/]")

    # Multimeter Panel
    meter_table = Table.grid(padding=(0, 1))
    meter_table.add_column(justify="right", style="bold magenta")
    meter_table.add_column()
    meter_table.add_row("ID", f"[white]{hardware.mmeter_id or '—'}[/]")
    meter_table.add_row("Range", f"[white]{hardware.multi_meter_range}[/]")

    top_grid = Table.grid(expand=True)
    top_grid.add_column(ratio=1)
    top_grid.add_column(ratio=1)
    top_grid.add_column(ratio=1)
    top_grid.add_row(
        Panel(eload_table, title="[bold]E-Load[/]", border_style="cyan", box=box.ROUNDED),
        Panel(afg_table, title="[bold]AFG-2125[/]", border_style="green", box=box.ROUNDED),
        Panel(meter_table, title="[bold]Multimeter[/]", border_style="magenta", box=box.ROUNDED),
    )
    layout["top"].update(top_grid)

    # --- MIDDLE: Measurements ---
    meas_eload = Table(title="[bold]E-Load Meas[/]", box=box.SIMPLE_HEAVY, expand=True)
    meas_eload.add_column("Metric", style="bold cyan", no_wrap=True)
    meas_eload.add_column("Value", justify="right")
    meas_eload.add_row("Voltage", f"[green]{load_volts_mV/1000:.3f} V[/]")
    meas_eload.add_row("Current", f"[green]{load_current_mA/1000:.3f} A[/]")

    meas_meter = Table(title="[bold]Meter Meas[/]", box=box.SIMPLE_HEAVY, expand=True)
    meas_meter.add_column("Metric", style="bold magenta", no_wrap=True)
    meas_meter.add_column("Value", justify="right")
    meas_meter.add_row("Current", f"[yellow]{meter_current_mA/1000:.3f} A[/]")

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
        (" AFG: ", "bold"), (f"{'Connected' if hardware.afg else 'Missing'}", "green" if hardware.afg else "red")
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
    
    SHAPE_MAP = {0: "SIN", 1: "SQU", 2: "RAMP"}

    while not stop_event.is_set():
        message = cbus.recv(timeout=1.0)
        if not message:
            continue

        # Relay control
        if message.arbitration_id == RLY_CTRL_ID:
            should_be_on = (message.data[0] & 0x01) == 0x01
            if should_be_on: GPIO_K1.on()
            else: GPIO_K1.off()
            continue

        # AFG Control (Primary)
        # 0x0CFF0700: Enable, Shape, Freq, Ampl
        if message.arbitration_id == AFG_CTRL_ID and hardware.afg:
            # FIX: Accept any non-zero as True to be safer with various CAN inputs
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

        # AFG Control (Extended)
        # 0x0CFF0701: Offset (mV, I16), Duty (%, U8)
        if message.arbitration_id == AFG_CTRL_EXT_ID and hardware.afg:
            offset_mV = struct.unpack('<h', bytes(message.data[0:2]))[0]
            offset_V = offset_mV / 1000.0
            
            duty_cycle = message.data[2] if message.dlc > 2 else 50
            if duty_cycle < 1: duty_cycle = 1
            if duty_cycle > 99: duty_cycle = 99

            try:
                with hardware.afg_lock:
                    if hardware.afg_offset != offset_mV:
                        hardware.afg.write(f"SOUR1:VOLT:OFFS {offset_V}")
                        hardware.afg_offset = offset_mV
                    
                    if hardware.afg_duty != duty_cycle:
                        hardware.afg.write(f"SOUR1:SQU:DCYC {duty_cycle}")
                        hardware.afg_duty = duty_cycle
            except Exception as e:
                (console.log if HAVE_RICH else print)(f"AFG Ext Error: {e}")
            continue

# Multimeter control
        if message.arbitration_id == MMETER_CTRL_ID:
            meter_mode = message.data[0]
            meter_range = message.data[1]
            
            if hardware.multi_meter and (hardware.multi_meter_mode != meter_mode):
                with hardware.mmeter_lock:
                    if meter_mode == 0:
                        hardware.multi_meter.write(b'FUNC VOLT:DC\n')
                    elif meter_mode == 1:
                        # 1. Switch Mode
                        hardware.multi_meter.write(b'FUNC CURR:DC\n')
                        
                        # 2. Wait for relay click
                        time.sleep(0.5)
                        
                        # 3. Force 20A Range
                        hardware.multi_meter.write(b'CURR:DC:RANG 5\n')

                    hardware.multi_meter_mode = meter_mode
            
            hardware.multi_meter_range = meter_range
            continue

        # E-load control
        if message.arbitration_id == LOAD_CTRL_ID and hardware.e_load:
            first_byte = message.data[0]
            new_remote = 1 if first_byte & 0x03 == 0x01 else 0
            new_enable = 1 if first_byte & 0x0C == 0x04 else 0
            new_mode = 1 if first_byte & 0x30 == 0x10 else 0
            new_short = 1 if first_byte & 0xC0 == 0x40 else 0
            
            if hardware.e_load_enabled != new_enable:
                hardware.e_load_enabled = new_enable
                with hardware.eload_lock:
                    hardware.e_load.write("INP ON" if new_enable else "INP OFF")
            
            if hardware.e_load_mode != new_mode:
                hardware.e_load_mode = new_mode
                with hardware.eload_lock:
                    hardware.e_load.write("FUNC RES" if new_mode else "FUNC CURR")

            if hardware.e_load_short != new_short:
                hardware.e_load_short = new_short
                with hardware.eload_lock:
                    hardware.e_load.write("INP:SHOR ON" if new_short else "INP:SHOR OFF")

            val_c = (message.data[3] << 8) | message.data[2]
            if hardware.e_load_csetting != val_c:
                hardware.e_load_csetting = val_c
                with hardware.eload_lock:
                    hardware.e_load.write(f"CURR {val_c/1000}")
            
            val_r = (message.data[5] << 8) | message.data[4]
            if hardware.e_load_rsetting != val_r:
                hardware.e_load_rsetting = val_r
                with hardware.eload_lock:
                    hardware.e_load.write(f"RES {val_r/1000}")

# --- Main ---
def main() -> None:
    hardware = HardwareManager()
    stop_event = threading.Event()
    
    # measurements
    meter_current_mA = 0
    load_volts_mV = 0
    load_current_mA = 0

    # status strings
    load_stat_func = ""
    load_stat_curr = ""
    load_stat_imp = ""
    load_stat_res = ""
    load_stat_short = ""
    
    afg_freq_str = ""
    afg_ampl_str = ""
    afg_out_str = ""
    afg_shape_str = ""
    afg_offset_str = "0"
    afg_duty_str = "50"

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
                    # --- Polling & Measurement Loop ---
                    now = time.time()
                    
                    # 1. Multimeter
                    if hardware.multi_meter:
                        try:
                            with hardware.mmeter_lock:
                                hardware.multi_meter.write(b'FETC?\n')
                                resp = hardware.multi_meter.readline().decode().strip()
                            if resp:
                                val = float(resp)
                                meter_current_mA = int(round(val * 1000))
                                # Send CAN update
                                msg = can.Message(arbitration_id=MMETER_READ_ID, 
                                                  data=list(meter_current_mA.to_bytes(2, 'little')) + [0]*6, 
                                                  is_extended_id=True)
                                cbus.send(msg)
                        except Exception: pass

                    # 2. E-Load Meas
                    if hardware.e_load:
                        try:
                            with hardware.eload_lock:
                                v_str = hardware.e_load.query("MEAS:VOLT?").strip()
                                i_str = hardware.e_load.query("MEAS:CURR?").strip()
                            if v_str and i_str:
                                load_volts_mV = int(float(v_str)*1000)
                                load_current_mA = int(float(i_str)*1000)
                                # Send CAN update
                                data = list(load_volts_mV.to_bytes(2, 'little')) + \
                                       list(load_current_mA.to_bytes(2, 'little')) + [0]*4
                                msg = can.Message(arbitration_id=ELOAD_READ_ID, data=data, is_extended_id=True)
                                cbus.send(msg)
                        except Exception: pass

                    # 3. Low Frequency Status Poll (E-Load + AFG)
                    if now - last_status_poll >= STATUS_POLL_PERIOD:
                        last_status_poll = now
                        
                        # Poll E-Load Settings
                        if hardware.e_load:
                            try:
                                with hardware.eload_lock:
                                    load_stat_func = hardware.e_load.query("FUNC?").strip()
                                    load_stat_curr = hardware.e_load.query("CURR?").strip()
                                    load_stat_imp = hardware.e_load.query("INP?").strip()
                                    load_stat_res = hardware.e_load.query("RES?").strip()
                            except Exception: pass

                        # Poll AFG Settings
                        if hardware.afg:
                            try:
                                with hardware.afg_lock:
                                    afg_freq_str = hardware.afg.query("SOUR1:FREQ?").strip()
                                    afg_ampl_str = hardware.afg.query("SOUR1:AMPL?").strip()
                                    afg_out_str = hardware.afg.query("SOUR1:OUTP?").strip()
                                    
                                    # FIX: Sync the shadow variable 'hardware.afg_output' with actual status
                                    # This prevents the control loop from thinking it's ON when it's actually OFF.
                                    is_actually_on = (afg_out_str.strip().upper() in ['ON', '1'])
                                    if hardware.afg_output != is_actually_on:
                                        hardware.afg_output = is_actually_on

                                    afg_shape_str = hardware.afg.query("SOUR1:FUNC?").strip()
                                    afg_offset_str = hardware.afg.query("SOUR1:VOLT:OFFS?").strip()
                                    afg_duty_str = hardware.afg.query("SOUR1:SQU:DCYC?").strip()
                                    
                                    # Send Extended Status CAN Message (Offset + Duty)
                                    if afg_offset_str and afg_duty_str:
                                        off_mv = int(float(afg_offset_str) * 1000)
                                        duty_pct = int(float(afg_duty_str))
                                        
                                        # Pack: [Offset(2)] [Duty(1)] [Reserved(5)]
                                        payload = bytearray(struct.pack('<h', off_mv))
                                        payload.append(duty_pct & 0xFF)
                                        payload.extend([0]*5)
                                        
                                        msg = can.Message(arbitration_id=AFG_READ_EXT_ID, data=payload, is_extended_id=True)
                                        cbus.send(msg)

                            except Exception: pass

                    # Update Dashboard
                    renderable = build_dashboard(
                        hardware,
                        meter_current_mA=meter_current_mA,
                        load_volts_mV=load_volts_mV,
                        load_current_mA=load_current_mA,
                        load_stat_func=load_stat_func,
                        load_stat_curr=load_stat_curr,
                        load_stat_res=load_stat_res,
                        load_stat_imp=load_stat_imp,
                        load_stat_short=load_stat_short,
                        afg_freq_read=afg_freq_str,
                        afg_ampl_read=afg_ampl_str,
                        afg_offset_read=afg_offset_str,
                        afg_duty_read=afg_duty_str,
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