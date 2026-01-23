from canlib import kvadblib
from canlib import canlib
from canlib import Frame
import time
import support.globals as globals


def ErrorTrap(error):
    sink = error #sink errors for now
    
def open_channel(channel):
    ch = canlib.openChannel(channel, canlib.canOPEN_ACCEPT_VIRTUAL)
    ch.setBusOutputControl(canlib.canDRIVER_NORMAL)
    ch.setBusParams(canlib.canBITRATE_250K)
    ch.busOn()
    return ch

def close_channel(ch):
    ch.busOff()
    ch.close()

def CANThread(i):

    print("Ch", i)
    channel_number = i
    
    ch = open_channel(channel_number)
    tracker_time = 0
    tracker_last_time = 0    
    TxTime = 0
    
    while not globals.finished:
        time_delta = 0      
        tracker_time = time.time()
        if(tracker_last_time):
            time_delta = tracker_time - tracker_last_time
        tracker_last_time = tracker_time    
        TxTime += time_delta
        #receive status messages
        try:
            can_frame = ch.read(timeout=100)
            # Track raw UUT-originated traffic (per DBC Tx Node tagging)
            if(channel_number == 0):
                try:
                    if hasattr(globals, 'UUT_TxMsgIds') and globals.UUT_TxMsgIds:
                        # Normalize IDs (DBC exports may include SocketCAN flag bits; Kvaser exposes arbitration_id).
                        arb_id = int(can_frame.id) & 0x1FFFFFFF
                        key = (arb_id, True)
                        if (key in globals.UUT_TxMsgIds) or (arb_id in globals.UUT_TxMsgIds):
                            globals.UUT_TxSeenCount += 1
                            globals.UUT_TxLastSeen = time.time()
                            globals.UUT_TxLastSeenId = arb_id
                except:
                    pass
            if(channel_number == 0):
                msg = globals.uut_db.get_message_by_id(can_frame.id, kvadblib.MessageFlag.EXT)
                for s in msg.signals():
                    value = s.phys_from(can_frame.data)
                    globals.UUT_Fdbk[s.name] = value
            else:
                if globals.SuppressPatSupport == 'False': # skip if suppressed
                    msg = globals.pat_db.get_message_by_id(can_frame.id, kvadblib.MessageFlag.EXT)
                    for s in msg.signals():
                        value = s.phys_from(can_frame.data)
                        globals.PAT_Fdbk[s.name] = value
        except:
            ErrorTrap(0)

        #transmit control messages
        if(TxTime >= 0.01): 
            TxTime = 0        
            
            try:
                if(channel_number == 0):    
                    for frame in globals.uut_framebox_out.frames():
                        ch.write(frame)                 
                else:
                    if globals.SuppressPatSupport == 'False': 
                        for frame in globals.pat_framebox_out.frames():
                            ch.write(frame)
                            
            except Exception:
                # FIX 2: FLUSH THE TOILET
                # The bus is dead. Clear the stuck messages immediately.
                try:
                    if hasattr(ch, 'flush_tx_buffer'):
                        ch.flush_tx_buffer()
                except:
                    pass
                pass
    close_channel(ch)