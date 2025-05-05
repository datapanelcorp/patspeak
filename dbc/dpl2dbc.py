import cantools
import sys
from cantools.database.can import Message, Signal

#****************************************
#NOTE: NOT TESTED YET, TAKE EXTREME CAUATION

#usage:     python dpl2dbc.py [dpn filename]
#output:    [dpn filename].dbc

#****************************************

#****************************************
#*  translate_dpn_iso
#*  converts dpn iso parameters to dbc start / length
#****************************************
def translate_dpn_iso(iso_type, iso_para, iso_parb):
    start = -1
    length = 1
    if(iso_type == 1): #DPL_ISOLATION_TYPE_1_BIT
        length = -1
        start = -1
    if(iso_type == 2): #DPL_ISOLATION_TYPE_2_BIT
        length = 2
        start = iso_parb * length + (iso_para*8)
    if(iso_type == 3): #DPL_ISOLATION_TYPE_4_BIT
        length = 4
        start = iso_parb * length + (iso_para*8)
    if(iso_type == 4): #DPL_ISOLATION_TYPE_8_BIT
        length = 8
        start = (iso_para*8)
    if(iso_type == 5): #DPL_ISOLATION_TYPE_10_BIT_1
        start = (iso_para*8)+5
        length = 10
    if(iso_type == 6): #DPL_ISOLATION_TYPE_10_BIT_2
        start = (iso_para*8)
        length = 10
    if(iso_type == 7): #DPL_ISOLATION_TYPE_16_BIT
        start = (iso_para*8)
        length = 16
    
    return start, length
    
#****************************************
#*  parse_dpn_file
#*  read dpn file and return contents in messages[]
#****************************************
def parse_dpn_file(file_path):
    messages = []
    current_message = None

    with open(file_path, 'r') as file:
        for line in file:
            if not line.strip():
                continue
            key, value = line.strip().split('=')
            parts = key.split('.')
            
            if len(parts) == 2:
                msg_index, attribute = parts
                msg_index = int(msg_index.split('_')[1])
                
                if current_message is None or current_message['index'] != msg_index:
                    current_message = {
                        'index': msg_index,
                        'name': '',
                        'type': 0,
                        'timeout': 0,
                        'id': [0, 0, 0, 0],
                        'isos': []
                    }
                    messages.append(current_message)
                
                if attribute.startswith('id'):
                    id_index = int(attribute[2])
                    current_message['id'][id_index] = int(value)
                else:
                    current_message[attribute] = value if attribute == 'name' else int(value)

            elif len(parts) == 3:
                msg_index, iso_index, attribute = parts
                msg_index = int(msg_index.split('_')[1])
                iso_index = int(iso_index.split('_')[1])
                
                while len(current_message['isos']) <= iso_index:
                    current_message['isos'].append({
                        'name': '',
                        'type': 0,
                        'para': 0,
                        'parb': 0
                    })
                current_message['isos'][iso_index][attribute] = value if attribute == 'name' or 'color' else int(value)
                    
    return messages
    
#****************************************
#*  parse_dpn_file
#*  convert dpn messages[] to dbc format
#****************************************
def create_cantools_database(messages):
    db = cantools.database.Database()
    
    for msg in messages:
        signals = []
        for iso in msg['isos']:
            #filter bad names, might need tweaking
            name=iso['name'].replace("-","_")
            if (name[0].isdigit()):
                name = "n" + name
            #
            dbc_start, dbc_length = translate_dpn_iso(int(iso['type']), int(iso['para']), int(iso['parb']))
            if(dbc_start>-1):
                signal = Signal(
                    name=name,
                    start=dbc_start,
                    length=dbc_length,
                    is_signed=bool(True)
                )
                signals.append(signal)
            else:
                print("Cant create signal name", name)
        
        frame_id = (msg['id'][0] << 24) | (msg['id'][1] << 16) | (msg['id'][2] << 8) | msg['id'][3]
        #filter bad names, might need tweaking
        name=msg['name'].replace("-","_")
        if (name[0].isdigit()):
            name = "n" + name
        #
        message = Message(
            frame_id=frame_id,
            name=name,
            length=8,
            is_extended_frame=bool(True),
            signals=signals
        )
        db.messages.append(message)
    
    return db

#****************************************
#*  "main" 
#****************************************
n = len(sys.argv)
if (n >= 2):
    dpn_file_path = sys.argv[1].strip()
    if(dpn_file_path.endswith(".dpn")):
        print("\nLoading", dpn_file_path + "...")
    else:
        print("\nNot a DPN file...")
        quit()
else:
    print("\nNo DPN file specified...")
    quit()

#read dpn file
parsed_messages = parse_dpn_file(dpn_file_path)
cantools_db = create_cantools_database(parsed_messages)

# Save the database to a DBC file
dbc_file_path = dpn_file_path.split(".")
dbc_file_path = dbc_file_path[0] + '.dbc'
cantools.database.dump_file(cantools_db, dbc_file_path)

# Print the database for verification
for message in cantools_db.messages:
    print(message)
