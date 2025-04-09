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
            if(channel_number == 0):
                msg = globals.uut_db.get_message_by_id(can_frame.id, kvadblib.MessageFlag.EXT)
                for s in msg.signals():
                    value = s.phys_from(can_frame.data)
                    globals.UUT_Fdbk[s.name] = value
            else:
                msg = globals.pat_db.get_message_by_id(can_frame.id, kvadblib.MessageFlag.EXT)
                for s in msg.signals():
                    value = s.phys_from(can_frame.data)
                    globals.PAT_Fdbk[s.name] = value
        except:
            ErrorTrap(0)

        #transmit control messages
        if(TxTime >= 0.01):
            TxTime = 0        
            if(channel_number == 0):    
                for frame in globals.uut_framebox_out.frames():
                    ch.write(frame)                 
            else:
                for frame in globals.pat_framebox_out.frames():
                    ch.write(frame)
    close_channel(ch)