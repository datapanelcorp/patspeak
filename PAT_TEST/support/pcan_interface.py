from canlib import kvadblib
from canlib import canlib
from canlib import Frame
import can
import time
import support.globals as globals


def ErrorTrap(error):
    sink = error #sink errors for now
    
def open_channel(channel):
    # PEAK-System uses 'PCAN_USBBUS1', 'PCAN_USBBUS2', etc.
    pcan_channel = f'PCAN_USBBUS{channel + 1}'
    
    try:
        bus = can.Bus(interface='pcan', channel=pcan_channel, bitrate=250000)
        return bus
    except can.CanError as e:
        ErrorTrap(e)
        return None
    # ch = canlib.openChannel(channel, canlib.canOPEN_ACCEPT_VIRTUAL)
    # ch.setBusOutputControl(canlib.canDRIVER_NORMAL)
    # ch.setBusParams(canlib.canBITRATE_250K)
    # ch.busOn()
    # return ch

def close_channel(bus):
    bus.shutdown()
# def close_channel(ch):
    # ch.busOff()
    # ch.close()

def CANThread(i):

    print("Ch", i)
    channel_number = i
    
    ch = open_channel(channel_number)
    
    if not ch:
        print(f"Failed to open channel {channel_number}")
        return
    
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
            # can_frame = ch.read(timeout=100)
            can_frame = ch.recv(timeout=0.1)  # Timeout in seconds
            
            can_id = can_frame.arbitration_id
            data = can_frame.data
            
            if(channel_number == 0):
                msg = globals.uut_db.get_message_by_id(can_id, kvadblib.MessageFlag.EXT)
                for s in msg.signals():
                    value = s.phys_from(data)
                    globals.UUT_Fdbk[s.name] = value
            else:
                if globals.SuppressPatSupport == 'False': # skip if suppressed
                    msg = globals.pat_db.get_message_by_id(can_id, kvadblib.MessageFlag.EXT)
                    for s in msg.signals():
                        value = s.phys_from(data)
                        globals.PAT_Fdbk[s.name] = value
        except:
            ErrorTrap(0)

        #transmit control messages
        if(TxTime >= 0.01):
            TxTime = 0        
            if(channel_number == 0):    
                for frame in globals.uut_framebox_out.frames():
                    message = can.Message(arbitration_id=frame.id, data=frame.data, is_extended_id=True)
                    ###### This is a hack way to keep certain messages from being sent continuously, and send on command only.
                    # if not(message.arbitration_id == 0x18ef6027 and message.data[0] == 0): #TODO: implement way to do oneshot messages outside of main can thread
                        # ch.send(message)                 
                    ch.send(message)
            else:
                if globals.SuppressPatSupport == 'False': # skip if suppressed
                    for frame in globals.pat_framebox_out.frames():
                        message = can.Message(arbitration_id=frame.id, data=frame.data, is_extended_id=True)
                        ch.send(message)
    close_channel(ch)