#!/usr/bin/env python3
import sys
import time
import math
import struct

import can


PF_TP_CM = 236
PF_TP_DT = 235

if __name__ == '__main__':
    pri = 7
    sa = 0x27
    da = int(sys.argv[1], 0)
    pgn = int(sys.argv[2], 0)
    try:
        payload = bytes.fromhex(sys.argv[3])
    except ValueError:
        payload = sys.argv[3].encode('utf-8')
    nbytes = len(payload)
    npackets = math.floor((nbytes-1)/7)+1
    if len(payload) > 1785:
        print(f"payload must be less than 1785 bytes")

    if da != 0xFF:
        print(f"Destination-specific not supported")
        sys.exit(1)

    tp_cm_id = (pri << 26) | (PF_TP_CM << 16) | (da << 8) | sa
    tp_dt_id = (pri << 26) | (PF_TP_DT << 16) | (da << 8) | sa

    payload = payload.ljust(npackets * 7, b'\xff')

    with can.Bus(channel='can0', interface='socketcan') as bus:
        data = struct.pack('<BHBx3s', 32, nbytes, npackets, pgn.to_bytes(length=3, byteorder='little'))
        bam = can.Message(arbitration_id=tp_cm_id,
                          data=data,
                          is_extended_id=True)
        bus.send(bam)
        expiry = time.time() + 0.5
        sequence = 0
        while npackets > 0:
            data = struct.pack('<B7s', sequence + 1, payload[sequence*7:sequence*7+7])
            sequence += 1
            npackets -= 1
            dt = can.Message(arbitration_id=tp_dt_id,
                          data=data,
                          is_extended_id=True)
            bus.send(dt)
            time.sleep(0.001)
