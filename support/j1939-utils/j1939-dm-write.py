#!/usr/bin/env python3
import sys
import time
from enum import Enum
import struct

import can

def rol32(x, shift):
    return ((x << (shift & 31)) | (x >> ((-shift) & 31))) & 0xFFFFFFFF

def murmur3(a, h):
    a = a * 0xCC9E2D51 & 0xFFFFFFFF
    a = rol32(a, 17)
    a = a * 0x1b873593 & 0xFFFFFFFF
    h ^= a
    h = rol32(h, 19)
    return (h * 5 + 0xe6546b64) & 0xFFFFFFFF


def key_from_seed(seed, userlevel=0):
    secret = 0x89df7e03
    seed &= 0xFFFF
    v1 = ((userlevel & 7) * 0x49249249) & 0xFFFFFFFF
    v2 = seed * 0x00010001 & 0xFFFFFFFF
    return murmur3(secret, murmur3(v1, v2)) & 0xFFFF



def id_from_pgn(pf, ps, pri, sa):
    return (pri << 26) | (pf << 16) | (ps << 8) | sa

def pgn_from_id(id):
    pf = (id >> 16) & 0xff
    ps = (id >> 8) & 0xff

    if pf < 240:
        ps = 0

    return (pf << 8) | ps


# Memory Access Request
PF_DM14 = 217
# Memory Access Response
PF_DM15 = 216
# Binary Data Transfer
PF_DM16 = 215

PGN_DM14 = PF_DM14 << 8
PGN_DM15 = PF_DM15 << 8
PGN_DM16 = PF_DM16 << 8

def pf_from_id(can_id):
    return (can_id & 0x00FF0000) >> 16

def build_id(pf, ps, sa, pri=7):
    return (pri << 26) | (pf << 16) | (ps << 8) | sa

J1939_TP_CM_RTS = 16
J1939_TP_CM_CTS = 17
J1939_TP_CM_EOM_ACK = 19
J1939_TP_CM_BAM = 32
J1939_TP_CM_ABORT = 255

PF_TP_CM = 0xEC
PF_TP_DT = 0xEB

J1939_TP_MAX_BYTES = 255 * 7


class DM14Command(Enum):
    ERASE = 0
    READ = 1
    WRITE = 2
    STATUS_REQUEST = 3
    OPERATION_COMPLETE = 4
    OPERATION_FAILED = 5
    BOOT_LOAD = 6
    EDCP_GENERATION = 7

class DM15Status(Enum):
    PROCEED = 0
    BUSY = 1
    OPERATION_COMPLETED = 4
    OPERATION_FAILED = 5

class DM15ErrorIndicator(Enum):
    NO_ERROR = 0
    NOT_IDENTIFIED = 1
    BUSY = 2
    PROCESS_ERASE = 0x10
    PROCESS_READ = 0x11
    PROCESS_WRITE = 0x12
    PROCESS_STATUS = 0x13
    PROCESS_BOOT_LOAD = 0x16
    PROCESS_EDCP = 0x17
    PROCESS_UNSPECIFIED = 0x1f
    EDC_NOT_CORRECT = 0x20
    BAD_WRITE_RAM = 0x21
    BAD_WRITE_FLASH = 0x22
    BAD_WRITE_PROM = 0x23
    INTERNAL = 0x24
    ADDRESS_DATA_GENERAL = 0x100
    ADDRESS_ALIGN = 0x101
    ADDRESS_LENGTH = 0x102
    ADDRESS_NOMEM = 0x103
    ADDRESS_ERASE_DATA = 0x104
    ADDRESS_ERASE_PROGRAM = 0x105
    ADDRESS_BOOT_TRANSFER = 0x106
    ADDRESS_BOOT_NOEXEC = 0x107
    ADDRESS_BOOT_ALIGN = 0x108
    ADDRESS_DATA_RANGE = 0x109
    DATA_NAME = 0x10a
    SECURITY_GENERAL = 0x1000
    SECURITY_INVALID_PASSWORD = 0x1001
    SECURITY_INVALID_USERLEVEL = 0x1002
    SECURITY_INVALID_KEY = 0x1003
    SECURITY_NOT_DIAGNOSTIC = 0x1004
    SECURITY_NOT_ENG_DEV = 0x1005
    SECURITY_ENGINE_RUNNING = 0x1006
    SECURITY_VEHICLE_MOVING = 0x1007
    ABORT = 0x10000
    ABORT_TOO_MANY_RETRIES = 0x10001
    TIMEOUT = 0x10002
    TP_NOT_INIT = 0x10003
    TP_NOT_COMPLETE = 0x10004
    NO_INFO = 0xFFFFFF


def dm14_data(cmd: DM14Command, pointer, pointer_extension=0, length=1, pointer_type='spatial', key_user_level=0xFFFF):
    """

    length is bytes for pointer_type == 'memory' and objects for pointer_type == 'spatial'
    """
    if pointer_type not in ('memory', 'spatial'):
        raise ValueError("pointer_type must be 'memory' or 'spatial'")
    data = bytearray(8)

    data[0] = length & 0xFF
    data[1] = (((length >> 8) & 0x7) << 6) + ((1 << 4) if pointer_type == 'spatial' else 0) + (cmd.value << 1) + 1
    data[2] = pointer & 0xFF
    data[3] = (pointer >> 8) & 0xFF
    data[4] = (pointer >> 16) & 0xFF
    data[5] = pointer_extension
    data[6] = key_user_level & 0xFF
    data[7] = (key_user_level >> 8) & 0xFF

    return data

def dm15_data(status: DM15Status, length=1, error=0, edcp_extension=0, seed=0):
    data = bytearray(8)
    data[0] = length & 0xFF
    data[1] = (((length >> 8) & 0x7) << 6) + (status.value << 1)
    data[2] = error & 0xFF
    data[3] = (error >> 8) & 0xFF
    data[4] = (error >> 16) & 0xFF
    data[5] = edcp_extension & 0xFF
    data[6] = seed & 0xFF
    data[7] = (seed >> 8) & 0xFF

    return data


if __name__ == '__main__':
    pri = 6
    tool_sa = 44
    device_sa = int(sys.argv[1], 0)
    space = int(sys.argv[2], 0)
    address = int(sys.argv[3], 0)
    value = int(sys.argv[4], 0)
    length = 1

    dm14_id = id_from_pgn(PF_DM14, device_sa, pri, tool_sa)
    dm15_id = id_from_pgn(PF_DM15, tool_sa, pri, device_sa)
    dm16_id = id_from_pgn(PF_DM16, device_sa, pri, tool_sa)
    tp_cm_rx_id = id_from_pgn(PF_TP_CM, tool_sa, pri, device_sa)
    tp_cm_tx_id = id_from_pgn(PF_TP_CM, device_sa, pri, tool_sa)
    tp_dt_id = id_from_pgn(PF_TP_DT, device_sa, pri, tool_sa)


    with can.Bus(channel='PCAN_USBBUS1', interface='pcan', bitrate=250000) as bus:
        payload = dm14_data(DM14Command.WRITE, address, key_user_level=0x7, pointer_extension=space)
        request = can.Message(arbitration_id=dm14_id,
                          data=payload,
                          is_extended_id=True)
        bus.send(request)
        expiry = time.time() + 0.5
        sequence = 0
        bus.set_filters(
            [
                {'can_id': dm15_id, 'can_mask': 0x03FFFFFF, 'extended': True},
                {'can_id': dm16_id, 'can_mask': 0x03FFFFFF, 'extended': True},
                {'can_id': tp_cm_rx_id, 'can_mask': 0x03FFFFFF, 'extended': True},
            ]
        )
        response = bus.recv(0.150)
        if not response:
            raise TimeoutError("Timeout waiting for response")

        length_allowed = response.data[0] + (response.data[1] >> 5)
        status = DM15Status((response.data[1] >> 1) & 0x7)
        error_indicator = DM15ErrorIndicator(response.data[2] + (response.data[3] << 8) + (response.data[4] << 16))
        edcp_extension = response.data[5]
        seed = response.data[6] + (response.data[7] << 8)
        print(f"DM15 received! length_allowed={length_allowed} status={status.name} error_indicator={error_indicator.name} edcp_extension={edcp_extension} seed={seed}")
        if status != DM15Status.PROCEED:
            raise RuntimeError(f"expected PROCEED, but got {status.name}")
        if seed != 0xFFFF:
            # Need to generate key from seed and authenticate with it
            key = key_from_seed(seed, 7)
            print(f"Using key {key:#04x} for seed {seed:#04x}")

            payload = dm14_data(DM14Command.WRITE, address, key_user_level=key)
            request = can.Message(arbitration_id=dm14_id,
                                  data=payload,
                                  is_extended_id=True)
            bus.send(request)
            response = bus.recv(0.15)
            if not response:
                raise TimeoutError("Timeout waiting for response")

            length_allowed = response.data[0] + (response.data[1] >> 5)
            status = DM15Status((response.data[1] >> 1) & 0x7)
            error_indicator = DM15ErrorIndicator(response.data[2] + (response.data[3] << 8) + (response.data[4] << 16))
            edcp_extension = response.data[5]
            seed = response.data[6] + (response.data[7] << 8)
            print(f"DM15 received! length_allowed={length_allowed} status={status.name} error_indicator={error_indicator.name} edcp_extension={edcp_extension} seed={seed}")
            if status != DM15Status.PROCEED or length_allowed != 1:
                raise RuntimeError(f"expected PROCEED, but got {status.name}")

        payload = struct.pack('<BL3x', 4, value)
        msg = can.Message(arbitration_id=dm16_id, data=payload)
        bus.send(msg)

        response = bus.recv(0.5)
        if not response:
            raise TimeoutError("Timeout waiting for response")

        status = DM15Status((response.data[1] >> 1) & 0x7)
        error_indicator = DM15ErrorIndicator(response.data[2] + (response.data[3] << 8) + (response.data[4] << 16))
        edcp_extension = response.data[5]
        seed = response.data[6] + (response.data[7] << 8)
        print(f"DM15 received! status={status.name} error_indicator={error_indicator.name} edcp_extension={edcp_extension} seed={seed}")
        if status != DM15Status.OPERATION_COMPLETED:
            raise RuntimeError(f"expected OPERATION_COMPLETED, but got {status.name}")


        payload = dm14_data(DM14Command.OPERATION_COMPLETE, address)
        msg = can.Message(arbitration_id=dm14_id, data=payload)
        bus.send(msg)

