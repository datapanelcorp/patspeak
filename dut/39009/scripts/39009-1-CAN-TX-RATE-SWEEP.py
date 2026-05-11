import argparse
import os
import time
from decimal import Decimal, ROUND_HALF_UP
from time import sleep

import can

try:
    import curses
except ImportError:
    curses = None

LastTimeStamp = 0
OutCommand = 0
PassTime = 0
LastPassTime = 0
TimeOfPass = 0
KickCounts = 0
ThisSetting = 250
PrevSetting = 0

TestStart = 0

Tx10Settings = [
    ThisSetting,
    ThisSetting,
    ThisSetting,
    ThisSetting,
    ThisSetting,
    ThisSetting,
    ThisSetting,
    ThisSetting,
    ThisSetting,
    ThisSetting,
    ThisSetting,
]

Tx10LastRx = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

# TODO NEED TO VERIFY T2, T3 and T4 mirrors T1
Tx10PGNs = [
    0x18FF15E0,
    0x18FF16E0,
    0x18FF17E0,
    0x18FF18E0,
    0x18FF1AE0,
    0x18FF1BE0,
    0x18EFD1E0,
    0x18FFF3E0,
    0x18FFFBE0,
    0x18FFFCE0,
    0x18FFE6E0,
]

Tx10NAMESs = [
    "MSG_DIGIN",
    "MSG_AD2",
    "MSG_AD3",
    "MSG_AD4",
    "MSG_FREQ1",
    "MSG_FREQ2",
    "MSG_STAT",
    "MSG_DPL_Tx",
    "MSG_DPLF1",
    "MSG_DPLF2",
    "MSG_FAULT",
]

Tx10Maths = [10, 10, 10, 10, 10, 10, 20, 20, 20, 20, 20]

Tx10RxTime = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Tx10Error = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]


class TestPassComplete(Exception):
    """Raised when the timing sweep reaches pass criteria."""


class PlainScreen:
    def __init__(self, min_refresh_sec=0.25):
        self._lines = {}
        self._min_refresh_sec = min_refresh_sec
        self._last_refresh = 0.0
        self._last_line = ""

    def clear(self):
        self._lines.clear()

    def addstr(self, line, _col, text):
        self._lines[int(line)] = str(text).rstrip("\n")

    def refresh(self):
        now = time.time()
        if (now - self._last_refresh) < self._min_refresh_sec:
            return
        self._last_refresh = now

        if not self._lines:
            return
        latest = self._lines[max(self._lines.keys())]
        if latest != self._last_line:
            print("\r" + latest.ljust(140), end="", flush=True)
            self._last_line = latest

    def finalize(self):
        if self._last_line:
            print("")


def safe_addstr(screen, line, col, text):
    try:
        screen.addstr(line, col, text)
    except Exception:
        pass


def format_error(exc):
    return f"{type(exc).__name__}: {exc}"


def emit_result(passed):
    if passed:
        print("PATSPEAK_RESULT=PASS")
        return 0
    print("PATSPEAK_RESULT=FAIL")
    return 1


def _parse_can_channel(value):
    text = str(value).strip()
    if text == "":
        return text
    if text.lower().startswith("0x"):
        try:
            return int(text, 16)
        except ValueError:
            return text
    if text.isdigit():
        return int(text)
    return text


def parse_args():
    default_interface = str(os.environ.get("PATSPEAK_CAN_INTERFACE", "kvaser")).strip().lower() or "kvaser"
    default_channel = os.environ.get("PATSPEAK_CAN_CH0", "0")
    default_bitrate = int(os.environ.get("PATSPEAK_CAN_BITRATE", "250000"))

    parser = argparse.ArgumentParser(
        description="39009 TX timing sweep test using python-can."
    )
    parser.add_argument(
        "--interface",
        default=default_interface,
        help="python-can interface (default: kvaser).",
    )
    parser.add_argument("--channel", default=default_channel, help="python-can channel (default: 0).")
    parser.add_argument("--bitrate", type=int, default=default_bitrate, help="CAN bitrate (default: 250000).")
    parser.add_argument("--rx-timeout", type=float, default=0.02, help="CAN receive timeout in seconds.")

    args = parser.parse_args()
    args.interface = str(args.interface).strip().lower()
    args.channel = _parse_can_channel(args.channel)

    if args.bitrate <= 0:
        raise ValueError("--bitrate must be > 0")
    if args.rx_timeout <= 0:
        raise ValueError("--rx-timeout must be > 0")
    return args


def open_can_bus(interface, channel, bitrate):
    try:
        return can.Bus(interface=interface, channel=channel, bitrate=bitrate)
    except TypeError:
        return can.Bus(bustype=interface, channel=channel, bitrate=bitrate)


def main(stdscr, args):
    global OutCommand, ThisSetting, PrevSetting, HeartbeatTick, TestStart, LastPassTime, KickCounts

    bus = open_can_bus(
        args.interface,
        args.channel,
        args.bitrate,
    )

    # Clear screen
    stdscr.clear()

    def SendMessage(*payload):
        global OutCommand
        data = [0] * 8
        for idx, value in enumerate(payload[:7]):
            data[idx] = int(value) & 0xFF

        newMsg = can.Message(
            arbitration_id=0x0CEFE0D1,
            is_extended_id=True,
            data=data,
        )

        while OutCommand:
            bus.send(newMsg)
            sleep(0.1)
            rx_msg = bus.recv(timeout=args.rx_timeout)
            if rx_msg is not None:
                ProcessMessage(rx_msg)

    # Processes a received message, in order to show it in the Message-ListView
    def ProcessMessage(frame):
        global OutCommand, LastTimeStamp, Tx10Settings, ThisSetting, PassTime, TimeOfPass, TestStart, LastPassTime, KickCounts
        TotalError = 0
        line_number = 0
        msg_id = frame.arbitration_id & 0x1FFFFFFF
        msg_data = frame.data
        timestamp_us = int(frame.timestamp * 1000000)

        TotalTime = round(time.time() - TestStart, 1)
        WaitTime = round(time.time() - LastPassTime, 1)

        for i, IDs in enumerate(Tx10PGNs):
            ExpectedTime = round((Tx10Settings[i] * Tx10Maths[i]), 2)

            Tx10Error[i] = ExpectedTime - Tx10RxTime[i]
            if Tx10Error[i] < 0:
                Tx10Error[i] *= -1

            if Tx10RxTime[i]:
                safe_addstr(
                    stdscr,
                    line_number,
                    0,
                    Tx10NAMESs[i]
                    + f" Rx: {round(Tx10RxTime[i]/1000, 2)}, Expected: {round(ExpectedTime/1000,2)}, Setting: {Tx10Settings[i]}, Error: {Tx10Error[i]}\n",
                )
                line_number += 1
                TotalError += Tx10Error[i]

            stdscr.refresh()

            if msg_id == IDs:
                if Tx10LastRx[i]:
                    delta = (timestamp_us - Tx10LastRx[i]) / 1000
                    sample = Decimal(delta).quantize(Decimal("0"), rounding=ROUND_HALF_UP)
                    Tx10RxTime[i] = sample
                else:
                    Tx10RxTime[i] = 0
                Tx10LastRx[i] = timestamp_us

        data0 = msg_data[0] if len(msg_data) > 0 else 0
        data6 = msg_data[6] if len(msg_data) > 6 else 0
        data7 = msg_data[7] if len(msg_data) > 7 else 0

        if msg_id == 0x18EFD1E0:
            if data0 == OutCommand:
                OutCommand = 0
            if (OutCommand == 0x52) and (data6 == 0x01):
                OutCommand = 0
            if (OutCommand == 0x53) and (data6 == 0x04):
                OutCommand = 0
            if (OutCommand == 0x54) and (data6 == 0x10):
                OutCommand = 0
            if (OutCommand == 0x55) and (data6 == 0x40):
                OutCommand = 0
            if (OutCommand == 0x57) and (data7 == 0x14):
                OutCommand = 0

        if TotalError:
            PassTime = 0
            TimeOfPass = 0
        else:
            if TimeOfPass == 0:
                TimeOfPass = time.time()
            else:
                PassTime = round(time.time() - TimeOfPass, 1)

            WaitToPass = round(((Tx10Settings[i] * Tx10Maths[i]) / 1000) * 3, 2)  # wait 3 times the Tx rate

            if PassTime > WaitToPass:
                ThisSetting -= 1
                LastPassTime = time.time()
                if ThisSetting <= 1:
                    print(f"TEST PASS!!! STEP: {ThisSetting}, TOTAL: {TotalTime}, KICKS: {KickCounts}\n")
                    raise TestPassComplete

                for i, _ in enumerate(Tx10Settings):
                    Tx10Settings[i] = ThisSetting

        safe_addstr(
            stdscr,
            line_number,
            0,
            f"STEP: {ThisSetting}, LONG: {round(ExpectedTime/1000,2)}, WAIT: {WaitTime}, TOTAL: {TotalTime}, KICKS: {KickCounts}, PASS: {PassTime}\n",
        )

    SleepTime = 0.0001
    HeartbeatStart = time.time()
    HeartbeatTick = 0
    TestStart = time.time()

    try:
        while 1:
            # ThisSetting gets stuck because the nature of MSG_STAT
            if PrevSetting != ThisSetting:
                HeartbeatStart = time.time()  # reset kickstart

                # PGN_CTRL2 (Command 0x5E): STAT, DPL_Tx, spare, DPL_F1, DPL_F2, FAULT
                OutCommand = 0x5E
                SendMessage(
                    OutCommand,
                    Tx10Settings[6],
                    Tx10Settings[7],
                    0x00,
                    Tx10Settings[8],
                    Tx10Settings[9],
                    Tx10Settings[10],
                )

                # PGN_CTRL1 (Command 0x5B): DIGIN, AD2, AD3, AD4, FREQ1, FREQ2
                OutCommand = 0x5B
                SendMessage(
                    OutCommand,
                    Tx10Settings[0],
                    Tx10Settings[1],
                    Tx10Settings[2],
                    Tx10Settings[3],
                    Tx10Settings[4],
                    Tx10Settings[5],
                )

                PrevSetting = ThisSetting

            result = bus.recv(timeout=args.rx_timeout)
            if result is not None:
                ProcessMessage(result)

            HeartbeatTick = time.time() - HeartbeatStart
            if HeartbeatTick > 60:
                PrevSetting = 0
                KickCounts += 1
                HeartbeatStart = time.time()

            sleep(SleepTime)
    except TestPassComplete:
        return True
    finally:
        bus.shutdown()


if __name__ == "__main__":
    try:
        parsed_args = parse_args()
        print(
            f"Opening CAN bus interface={parsed_args.interface} channel={parsed_args.channel} bitrate={parsed_args.bitrate}"
        )
        if curses is None:
            print("curses module is not available; using plain console output.")
            plain_screen = PlainScreen()
            try:
                passed = bool(main(plain_screen, parsed_args))
            finally:
                plain_screen.finalize()
        else:
            passed = bool(curses.wrapper(main, parsed_args))
        raise SystemExit(emit_result(passed))
    except (RuntimeError, OSError, can.CanError, TimeoutError, ValueError, argparse.ArgumentTypeError) as exc:
        print(f"[FAIL] {format_error(exc)}")
        print("PATSPEAK_RESULT=FAIL")
        raise SystemExit(2)
