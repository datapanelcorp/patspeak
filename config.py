import canopen
import time

# Start with creating a network representing one CAN bus
network = canopen.Network()

# Connect to the CAN bus
# Arguments are passed to python-can's can.Bus() constructor
# (see https://python-can.readthedocs.io/en/latest/bus.html).
#network.connect(bustype='kvaser', channel=0, bitrate=250000)
pcan_channel = f'PCAN_USBBUS{1}'
network.connect(bustype='pcan', channel=pcan_channel, bitrate=250000)
# Add some nodes with corresponding Object Dictionaries
#node = canopen.RemoteNode(6, '37000-561.eds')
#network.add_node(node)

# This will attempt to read an SDO from nodes 1 - 127
network.scanner.search()
# We may need to wait a short while here to allow all nodes to respond
time.sleep(0.05)

for node_id in network.scanner.nodes:
    print("Found node %d!" % node_id)

node = network.add_node(1, 'eds\\37000-563.eds')

node.nmt.state = 'PRE-OPERATIONAL'

for obj in node.object_dictionary.values():
    print('0x%X: %s' % (obj.index, obj.name))
    if isinstance(obj, canopen.objectdictionary.Record):
        for subobj in obj.values():
            print('  %d: %s' % (subobj.subindex, subobj.name))


node.nmt.wait_for_heartbeat()

node.nmt.state == 'OPERATIONAL'

network.send_message(0x0, [0x2, 1]) #FORCE NODE ID #1 TO STOP MODE

# Disconnect from CAN bus
network.sync.stop()
network.disconnect()