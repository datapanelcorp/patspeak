#!/usr/bin/env python3
import time
import sys
import struct

import can

def pgn_from_id(can_id):
    return (can_id & 0x00FFFF00) >> 8

def pf_from_id(can_id):
    return (can_id & 0x00FF0000) >> 16

def build_id(pf, ps, sa, pri=7):
    return (pri << 26) | (pf << 16) | (ps << 8) | sa

J1939_TP_CM_RTS = 16
J1939_TP_CM_CTS = 17
J1939_TP_CM_EOM_ACK = 19
J1939_TP_CM_BAM = 32
J1939_TP_CM_ABORT = 255

J1939_PF_TP_CM = 0xEC
J1939_PF_TP_DT = 0xEB

J1939_TP_MAX_BYTES = 255*7


if __name__ == '__main__':
    pri = 6
    sa = 0x27
    da = int(sys.argv[1], 0)
    pgn = int(sys.argv[2], 0)
    can_id = (pri << 26) | (0xEA << 16) | (da << 8) | sa
    pgn_bytes = pgn.to_bytes(length=3, byteorder='little', signed=False)

    buffer = bytearray(J1939_TP_MAX_BYTES)

    packets_remaining = set()
    total_bytes = 0
    total_packets = 0

    with can.Bus(channel='can0', interface='socketcan') as bus:
        msg = can.Message(arbitration_id=build_id(0xEA, da, sa),
                          data=pgn_bytes,
                          is_extended_id=True)
        bus.send(msg)

        expiry = time.time() + 0.5
        while time.time() < expiry:
            msg = bus.recv(0.05)
            if msg is None:
                continue
            if pgn_from_id(msg.arbitration_id) == pgn:
                total_bytes = len(msg.data)
                buffer = msg.data
                break
            elif pf_from_id(msg.arbitration_id) == J1939_PF_TP_CM:
                expiry += 1.25
                if msg.data[0] == J1939_TP_CM_RTS:
                    total_bytes, total_packets, max_chunk, rts_pgn_bytes  = struct.unpack_from('<HBB3s', msg.data, 1)
                    print(f"{msg.timestamp} Incoming TP.CM RTS bytes={total_bytes} packets={total_packets} max_chunk={max_chunk} pgn={int.from_bytes(rts_pgn_bytes, byteorder='little', signed=False)}")
                    if rts_pgn_bytes != pgn_bytes:
                        print("Received RTS for unrequested PGN?")
                        sys.exit(1)

                    packets_remaining = set(range(1, total_packets+1))
                    cts = struct.pack('<BBBH3s', J1939_TP_CM_CTS, 16, 1, 0xFFFF, pgn_bytes)
                    bus.send(can.Message(arbitration_id=build_id(0xEC, da, sa), data=cts, is_extended_id=True))
            elif pf_from_id(msg.arbitration_id) == J1939_PF_TP_DT:
                seq = msg.data[0]
                offset = (seq - 1) * 7
                struct.pack_into('<7s', buffer, offset, msg.data[1:])
                packets_remaining.remove(seq)
                print(f"{msg.timestamp} TP_DT seq={seq}")

                expiry += 0.2

                if len(packets_remaining) == 0:
                    buffer = buffer[:total_bytes]

                    # Send EOM ACK
                    eom_ack = struct.pack('<BHBB3s', J1939_TP_CM_EOM_ACK, total_bytes, total_packets, 0xFF, pgn_bytes )
                    bus.send(can.Message(arbitration_id=build_id(0xEC, da, sa), data=eom_ack, is_extended_id=True))
                    break

    if len(packets_remaining) == 0:
        try:
            text = buffer.decode('utf-8')
        except UnicodeDecodeError:
            text = buffer.hex(sep=' ')
        print(f"Received {len(buffer)} bytes. {text}")
    else:
        print(f"Did not receive all data. missing {packets_remaining}")
