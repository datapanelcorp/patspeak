
#!/home/j/roi/bin/python
# pscp .\roie.py j@picando:/home/j

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
    # If you prefer to force color even in non-TTY contexts, set force_terminal=True
    console = Console(highlight=False)
except Exception:
    HAVE_RICH = False
    console = None

# --- Constants ---
# Hardware identifiers
MULTI_METER_PATH = '/dev/ttyUSB0'
MULTI_METER_BAUD = 38400
#ELOAD_VISA_ID = "USB0::11975::34816::802197042747610014::0::INSTR"
#ELOAD_VISA_ID = "USB0::11975::34816::802197042787270012::0::INSTR"
ELOAD_VISA_ID = "USB0::11975::34816::*::0::INSTR"

# CAN bus configuration
CAN_CHANNEL = "can1"
CAN_BITRATE = 250000
LOAD_CTRL_ID = 0x0CFF0400
MMETER_CTRL_ID = 0x0CFF0600  # could this be 0x0CFF0200?
RLY_CTRL_ID = 0x0CFF0500
ELOAD_READ_ID = 0x0CFF0003
MMETER_READ_ID = 0x0CFF0004

# Pin configuration
K1_PIN_BCM = 26
Initial_Value = False
GPIO_K1 = LED(K1_PIN_BCM, initial_value=Initial_Value)

# --- Class for Hardware Management ---
class HardwareManager:
    """Manages communication and state for the e-load and multimeter."""
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

        # VISA
        self.e_load = None
        self.resource_manager = None

        # Locks (only for SCPI instruments). Drop CAN lock entirely.
        self.eload_lock = threading.Lock()
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
            self.mmeter_id = mmeter.readline().decode().strip()
            (console.log if HAVE_RICH else print)(f"MULTI-METER ID: {self.mmeter_id}")
            self.multi_meter = mmeter
        except (serial.SerialException, IOError) as e:
            (console.log if HAVE_RICH else print)(f"Failed to communicate with multi-meter: {e}")
            self.multi_meter = None

    def _initialize_eload(self) -> None:
        """Initializes the e-load via pyvisa."""
        try:
            self.resource_manager = pyvisa.ResourceManager()
            available_resources = self.resource_manager.list_resources()
            if not available_resources:
                (console.log if HAVE_RICH else print)("No VISA resources found.")
                return

            (console.log if HAVE_RICH else print)("Available VISA resource IDs:")
            for resource_id in available_resources:
                (console.log if HAVE_RICH else print)(f"- {resource_id}")

            for resource_id in available_resources:
                if fnmatch.fnmatch(resource_id, ELOAD_VISA_ID):
                    eload = self.resource_manager.open_resource(resource_id)
                    (console.log if HAVE_RICH else print)(f"E-LOAD ID: {eload.query('*IDN?')}")
                    (console.log if HAVE_RICH else print)(f"Resetting {ELOAD_VISA_ID}")
                    eload.write('*RST')
                    eload.write('SYST:CLE')
                    self.e_load = eload
                    break

            if not self.e_load:
                (console.log if HAVE_RICH else print)("No matching e-load VISA resource opened.")
        except Exception as e:
            (console.log if HAVE_RICH else print)(f"An error occurred with the e-load via Resource Manager: {e}")
            self.e_load = None

    def close_devices(self) -> None:
        """Closes connections to all hardware devices."""
        if self.multi_meter:
            (console.log if HAVE_RICH else print)("Closing multi-meter connection...")
            self.multi_meter.close()
        if self.e_load:
            (console.log if HAVE_RICH else print)("Closing e-load connection...")
            self.e_load.close()
        if self.resource_manager:
            (console.log if HAVE_RICH else print)("Closing resource manager...")
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
                    can_channel: str,
                    can_bitrate: int,
                    status_poll_period: float):
    """Return a Rich renderable for the current state (or a plain text fallback)."""
    if not HAVE_RICH:
        lines = []
        sep = "*" * 60
        lines.append(sep)
        if hardware.e_load:
            visa_id = hardware.e_load.resource_name
            lines += [
                f"* ELOAD ID - {visa_id}",
                f"* ENABLE: {load_stat_imp or ''}",
                f"* MODE: {load_stat_func or ''}",
                f"* CURRENT SETTING: {load_stat_curr or ''}",
                f"* RESISTANCE SETTING: {load_stat_res or ''}",
                f"* SHORT ENABLED: {load_stat_short or ''}",
                f"* VOLTS: {load_volts_mV/1000:.3f} V",
                f"* CURRENT: {load_current_mA/1000:.3f} A",
                f"* METER ID - {hardware.mmeter_id or ''}",
                f"* CURRENT: {meter_current_mA/1000:.3f} A",
                f"* K1: {GPIO_K1.is_lit}",
                sep,
            ]
        else:
            lines += [
                "* ELOAD - NOT DETECTED",
                f"* METER - CURRENT: {meter_current_mA/1000:.3f} A",
                sep,
            ]
        return "\n".join(lines)

    # Rich layout
    layout = Layout()
    layout.split(
        Layout(name="top", size=7),
        Layout(name="middle", ratio=1),
        Layout(name="bottom", size=3),
    )

    # --- TOP: instrument IDs and e-load state ---
    eload_table = Table.grid(padding=(0, 1))
    eload_table.add_column(justify="right", style="bold cyan")
    eload_table.add_column()
    if hardware.e_load:
        visa_id = hardware.e_load.resource_name
        eload_table.add_row("E-LOAD", f"[white]{visa_id}[/]")
        eload_table.add_row("Enable", f"[white]{load_stat_imp or ''}[/]  {_badge('ON' in (load_stat_imp or '').upper())}")
        eload_table.add_row("Mode", f"[white]{load_stat_func or ''}[/]")
        eload_table.add_row("Short", f"[white]{load_stat_short or ''}[/]  {_badge('ON' in (load_stat_short or '').upper())}")
        if load_stat_func and load_stat_func.strip().upper().startswith("CURR"):
            eload_table.add_row("Set (I)", f"[yellow]{load_stat_curr or ''}[/]")
        elif load_stat_func and load_stat_func.strip().upper().startswith("RES"):
            eload_table.add_row("Set (R)", f"[yellow]{load_stat_res or ''}[/]")
        else:
            eload_table.add_row("Set", f"[yellow]{(load_stat_curr or load_stat_res or '').strip()}[/]")
    else:
        eload_table.add_row("E-LOAD", "[red]NOT DETECTED[/]")

    meter_table = Table.grid(padding=(0, 1))
    meter_table.add_column(justify="right", style="bold cyan")
    meter_table.add_column()
    meter_table.add_row("MULTIMETER", f"[white]{hardware.mmeter_id or '—'}[/]")

    # ✅ Build the grid first, then update the layout with the grid itself
    top_grid = Table.grid(expand=True)
    top_grid.add_row(
        Panel(eload_table, title="[bold]E-Load[/]", border_style="cyan", box=box.ROUNDED),
        Panel(meter_table, title="[bold]Multimeter[/]", border_style="magenta", box=box.ROUNDED),
    )
    layout["top"].update(top_grid)


    # --- MIDDLE: live measurements + GPIO ---
    meas_eload = Table(title="[bold]E-Load Measurements[/]", box=box.SIMPLE_HEAVY, expand=True)
    meas_eload.add_column("Metric", style="bold cyan", no_wrap=True)
    meas_eload.add_column("Value", justify="right")
    meas_eload.add_row("Voltage", f"[green]{load_volts_mV/1000:.3f} V[/]")
    meas_eload.add_row("Current", f"[green]{load_current_mA/1000:.3f} A[/]")

    meas_meter = Table(title="[bold]Multimeter[/]", box=box.SIMPLE_HEAVY, expand=True)
    meas_meter.add_column("Metric", style="bold magenta", no_wrap=True)
    meas_meter.add_column("Value", justify="right")
    meas_meter.add_row("Current", f"[yellow]{meter_current_mA/1000:.3f} A[/]")

    # ✅ Parse badge markup so it renders as styled text (no literal "[bold ...]")
    badge_text = Text.from_markup(_badge(GPIO_K1.is_lit, "CLOSED", "OPEN"))

    gpio_panel = Panel(
        Align.center(
            Text.assemble(
                ("K1 Relay\n", "bold"),
                badge_text,  # This is now a Text object with parsed styles
            ),
            vertical="middle",
        ),
        border_style="yellow",
        box=box.ROUNDED,
        width=20,
        title="[bold]GPIO[/]",
    )

    mid = Table.grid(expand=True)
    mid.add_column(ratio=2)
    mid.add_column(ratio=2)
    mid.add_column(ratio=1)
    mid.add_row(meas_eload, meas_meter, gpio_panel)
    layout["middle"].update(mid)


    # --- BOTTOM: status bar ---
    status = Text.assemble(
        (" CAN: ", "bold"),
        (f"{can_channel}@{can_bitrate//1000}k", "cyan"),
        ("    Status Poll: ", "bold"),
        (f"{status_poll_period:.2f}s", "cyan"),
        ("    Screen: ", "bold"),
        ("Rich Live (alt screen)", "green" if HAVE_RICH else "red"),
    )
    layout["bottom"].update(Panel(status, box=box.SQUARE, border_style="blue"))
    return layout

# --- CAN setup ---
def setup_can_interface(channel: str, bitrate: int) -> Optional[can.BusABC]:
    """Configures and brings up the CAN interface."""
    try:
        subprocess.run(
            ["sudo", "ip", "link", "set", channel, "up", "type", "can", f"bitrate", f"{bitrate}"],
            check=True
        )
        (console.log if HAVE_RICH else print)(f"CAN interface {channel} is up with bitrate {bitrate}.")
        return can.interface.Bus(interface='socketcan', channel=channel, bitrate=bitrate)
    except subprocess.CalledProcessError as e:
        (console.log if HAVE_RICH else print)(f"Failed to bring up CAN interface: {e}")
        return None
    except can.CanError as e:
        (console.log if HAVE_RICH else print)(f"Failed to connect to CAN bus: {e}")
        return None

def shutdown_can_interface(channel: str) -> None:
    """Brings down the CAN interface."""
    try:
        subprocess.run(["sudo", "ip", "link", "set", channel, "down"], check=True)
        (console.log if HAVE_RICH else print)(f"CAN interface {channel} is now down.")
    except subprocess.CalledProcessError as e:
        (console.log if HAVE_RICH else print)(f"Failed to bring down CAN interface: {e}")

# --- CAN receiver thread ---
def receive_can_messages(cbus: can.BusABC, hardware: HardwareManager, stop_event: threading.Event) -> None:
    """Continuously receives CAN messages and updates hardware state."""
    (console.log if HAVE_RICH else print)("Receiver thread started. Listening for CAN messages...")
    while not stop_event.is_set():
        message = cbus.recv(timeout=1.0)
        if not message:
            continue

        # Relay control
        if message.arbitration_id == RLY_CTRL_ID:
            if(Initial_Value):
                GPIO_K1.off() if message.data[0] & 0x03 == 0x01 else GPIO_K1.on()
            else:
                GPIO_K1.on() if message.data[0] & 0x03 == 0x01 else GPIO_K1.off()
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
                        hardware.multi_meter.write(b'FUNC CURR:DC\n')
                    hardware.multi_meter.write(b'CURR:DC:RANG 5\n')
                    hardware.multi_meter_mode = meter_mode
            hardware.multi_meter_range = meter_range
            continue

        # E-load control
        if message.arbitration_id == LOAD_CTRL_ID and hardware.e_load:
            first_byte = message.data[0]
            new_remote_state = 1 if first_byte & 0x03 == 0x01 else 0
            if hardware.e_load_remote != new_remote_state:
                hardware.e_load_remote = new_remote_state

            new_enable_state = 1 if first_byte & 0x0C == 0x04 else 0
            if hardware.e_load_enabled != new_enable_state:
                hardware.e_load_enabled = new_enable_state
                command = "INP ON" if hardware.e_load_enabled else "INP OFF"
                with hardware.eload_lock:
                    hardware.e_load.write(command)

            new_mode = 1 if first_byte & 0x30 == 0x10 else 0
            if hardware.e_load_mode != new_mode:
                hardware.e_load_mode = new_mode
                command = "FUNC RES" if hardware.e_load_mode else "FUNC CURR"
                with hardware.eload_lock:
                    hardware.e_load.write(command)

            new_short = 1 if first_byte & 0xC0 == 0x40 else 0
            if hardware.e_load_short != new_short:
                hardware.e_load_short = new_short
                command = "INP:SHOR ON" if hardware.e_load_short else "INP:SHOR OFF"
                with hardware.eload_lock:
                    hardware.e_load.write(command)

            in_value_c = (message.data[3] << 8) | message.data[2]
            if hardware.e_load_csetting != in_value_c:
                hardware.e_load_csetting = in_value_c
                with hardware.eload_lock:
                    hardware.e_load.write(f"CURR {hardware.e_load_csetting / 1000}")

            in_value_r = (message.data[5] << 8) | message.data[4]
            if hardware.e_load_rsetting != in_value_r:
                hardware.e_load_rsetting = in_value_r
                with hardware.eload_lock:
                    hardware.e_load.write(f"RES {hardware.e_load_rsetting / 1000}")

# --- Helpers ---
def is_number(value: str) -> bool:
    """Checks if a string can be converted to a float."""
    try:
        float(value)
        return True
    except ValueError:
        return False

# --- Main ---
def main() -> None:
    """Main execution function."""
    hardware = HardwareManager()
    stop_event = threading.Event()
    cbus = None
    receiver_thread = None

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
    meter_mode_str = ""
    meter_range_str = ""

    # query pacing
    last_status_poll = 0.0
    STATUS_POLL_PERIOD = 0.5  # seconds; reduce SCPI spam

    try:
        hardware.initialize_devices()
        cbus = setup_can_interface(CAN_CHANNEL, CAN_BITRATE)
        if not cbus:
            (console.log if HAVE_RICH else print)("Exiting due to CAN interface setup failure.")
            return

        receiver_thread = threading.Thread(
            target=receive_can_messages,
            args=(cbus, hardware, stop_event),
            daemon=True
        )
        receiver_thread.start()

        # Use context manager for clean entry/exit of alternate screen
        if HAVE_RICH:
            with Live(console=console, screen=True, refresh_per_second=20) as live:
                while True:
                    # Read from multimeter and send to CAN
                    if hardware.multi_meter:
                        with hardware.mmeter_lock:
                            hardware.multi_meter.write(b'FETC?\n')
                            response = hardware.multi_meter.readline().decode().strip()
                        if is_number(response):
                            value = float(response)
                            if value < 0:
                                value = 0.0
                            meter_current_mA = int(round(value * 1000))
                            lo = meter_current_mA & 0xFF
                            hi = (meter_current_mA >> 8) & 0xFF
                            msg = can.Message(
                                arbitration_id=MMETER_READ_ID,
                                data=[lo, hi, 0, 0, 0, 0, 0, 0],
                                is_extended_id=True
                            )
                            try:
                                cbus.send(msg)
                            except can.CanError:
                                (console.log if HAVE_RICH else print)("MMeter message NOT sent")

                    # Read from e-load and send to CAN
                    load_volts_str = "nan"
                    load_current_str = "nan"
                    if hardware.e_load:
                        try:
                            with hardware.eload_lock:
                                load_volts_str = hardware.e_load.query("MEAS:VOLT?").strip()
                                load_current_str = hardware.e_load.query("MEAS:CURR?").strip()
                        except pyvisa.VisaIOError as e:
                            (console.log if HAVE_RICH else print)(f"PyVISA communication error: {e}")
                            time.sleep(0.1)

                        now = time.time()
                        if now - last_status_poll >= STATUS_POLL_PERIOD:
                            last_status_poll = now
                            try:
                                with hardware.eload_lock:
                                    load_stat_func = hardware.e_load.query("FUNC?").strip()
                                    load_stat_curr = hardware.e_load.query("CURR?").strip()
                                    load_stat_imp = hardware.e_load.query("INP?").strip()
                                    load_stat_res = hardware.e_load.query("RES?").strip()
                                    load_stat_short = hardware.e_load.query("INP:SHOR?").strip()
                            except pyvisa.VisaIOError as e:
                                (console.log if HAVE_RICH else print)(f"PyVISA status poll error: {e}")

                    if is_number(load_volts_str) and is_number(load_current_str):
                        load_volts = float(load_volts_str) * 1000.0
                        load_current = float(load_current_str) * 1000.0
                        load_volts_mV = int(round(load_volts))
                        load_current_mA = int(round(load_current))
                        data = [
                            load_volts_mV & 0xFF,
                            (load_volts_mV >> 8) & 0xFF,
                            load_current_mA & 0xFF,
                            (load_current_mA >> 8) & 0xFF,
                            0, 0, 0, 0
                        ]
                        msg = can.Message(
                            arbitration_id=ELOAD_READ_ID,
                            data=data,
                            is_extended_id=True
                        )
                        try:
                            cbus.send(msg)
                        except can.CanError:
                            (console.log if HAVE_RICH else print)("E-Load message NOT sent")
                    else:
                        (console.log if HAVE_RICH else print)("Received NaN from e-load measurements")

                    # Build and update dashboard
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
                        can_channel=CAN_CHANNEL,
                        can_bitrate=CAN_BITRATE,
                        status_poll_period=STATUS_POLL_PERIOD,
                    )
                    try:
                        live.update(renderable, refresh=True)
                    except NotRenderableError as e:
                        (console.log if HAVE_RICH else print)(f"Render error: {e}")
                    time.sleep(0.05)
        else:
            # Plain text fallback loop
            while True:
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
                    can_channel=CAN_CHANNEL,
                    can_bitrate=CAN_BITRATE,
                    status_poll_period=STATUS_POLL_PERIOD,
                )
                sys.stdout.write("\033[H\033[2J"); sys.stdout.flush()
                print(renderable)
                time.sleep(0.05)

    except KeyboardInterrupt:
        (console.log if HAVE_RICH else print)("\nInterrupted by user. Starting graceful shutdown...")
    finally:
        stop_event.set()
        if receiver_thread:
            receiver_thread.join()
        (console.log if HAVE_RICH else print)("Receiver thread stopped.")
        if cbus:
            cbus.shutdown()
        (console.log if HAVE_RICH else print)("CAN bus shut down.")
        hardware.close_devices()
        shutdown_can_interface(CAN_CHANNEL)
        (console.log if HAVE_RICH else print)("Shutdown complete. Exiting.")

if __name__ == "__main__":
    main()
