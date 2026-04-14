t = 0
i = 0
Frequancy = 200
Kp = 0.7
Ki = 0.3

PinMode1_3 = str(1)
PinMode = str(1)

PortMode = 2

#global setup
TestName = "34044-3-DIGITAL-BRIDGE-DIRECTION-HIGH"
datafile = TestName + ".pat"

outstr = ""
outstr += "#34044-3\n"
outstr += "#Verion 0.0\n"

outstr += "UUT_DBC = 34044-563.dbc\n"
outstr += "#Digital h-bridge test with 2.1 Ohm resistive load. (6.9 amps @ 14.5 VDC)\n"
outstr += "UUT_DATANAME = " + TestName + "\n"
outstr += "\n"

outstr += "#-----setup 34044-----\n"
outstr += "#disable global modes\n"

outstr += "#configure PWMi\n"
outstr += "Command = 83, MODE1A = " + PinMode1_3 + ", MODE1B = " + PinMode1_3 + ", MODE2A = " + PinMode + ", MODE2B = " + PinMode + ", MODE3A = " + PinMode1_3 + ", MODE3B = " + PinMode1_3 + ", MODE4A = " + PinMode + ", MODE4B = " + PinMode + ", MODE5A = " + PinMode + ", MODE5B = " + PinMode + ", MODE6A = " + PinMode + ", MODE6B = " + PinMode + ", MODE7A = " + PinMode + ", MODE7B = " + PinMode + " : NULL : WAIT = 0.5\n"
outstr += "Command = 84, MODE8A = " + PinMode + ", MODE8B = " + PinMode + " : NULL : WAIT = 0.5\n"
outstr += "Command = 93, PORT1_MODE = " + str(PortMode) + ", PORT2_MODE = " + str(PortMode) + ", PORT3_MODE = " + str(PortMode) + ", PORT4_MODE = " + str(PortMode) + ", PORT5_MODE = " + str(PortMode) + ", PORT6_MODE = " + str(PortMode) + ", PORT7_MODE = " + str(PortMode) + ", PORT8_MODE = " + str(PortMode) + " : NULL : WAIT = 0.5\n"
outstr += "Command = 82, FREQ1 = " + str(Frequancy) + ", MODE1 = 0, MODE2 = 0, Enable_Fault_Reset = 0, Enable_DPLTx = 1, Enable_DPLF1 = 1, Enable_DPLF2 = 1 : NULL\n"
outstr += "Command = 82, SaveSettings = 1 : NULL\n"

outstr += "#clean DBC signals\n"
outstr += "Command = 0 : NULL : WAIT = 0.5\n"
outstr += "MODE1 = 0, MODE2 = 0, MODE1A = 0, MODE1B = 0, MODE2A = 0, MODE2B = 0, MODE3A = 0, MODE3B = 0, MODE4A = 0, MODE4B = 0, MODE5A = 0, MODE5B = 0, MODE6A = 0, MODE6B = 0, MODE7A = 0, MODE7B = 0, MODE8A = 0, MODE8B = 0 : NULL : WAIT = 0.5\n"
outstr += "PORT1_MODE = 0, PORT2_MODE = 0, PORT3_MODE = 0, PORT4_MODE = 0, PORT5_MODE = 0, PORT6_MODE = 0, PORT7_MODE = 0, PORT8_MODE = 0 : NULL : WAIT = 0.5\n"
outstr += "\n"


t = 0
while t <= 15:

    if(t == 0):
        OutputName = "Output1A"
        FeedbackName = "Feedback1A"
        DirectionCtrl = "BRIDGE1_DIR"
        OutputStatus = "OutStat1A"
        DirectionValue = 1
    if(t == 1):
        OutputName = "Output1B"
        FeedbackName = "Feedback1B"
        DirectionCtrl = "BRIDGE1_DIR"
        OutputStatus = "OutStat1B"
        DirectionValue = 2
    if(t == 2):
        OutputName = "Output2A"
        FeedbackName = "Feedback2A"
        DirectionCtrl = "BRIDGE2_DIR"
        OutputStatus = "OutStat2A"
        DirectionValue = 1
    if(t == 3):
        OutputName = "Output2B"
        FeedbackName = "Feedback2B"
        DirectionCtrl = "BRIDGE2_DIR"
        OutputStatus = "OutStat2B"
        DirectionValue = 2
    if(t == 4):
        OutputName = "Output3A"
        FeedbackName = "Feedback3A"
        DirectionCtrl = "BRIDGE3_DIR"
        OutputStatus = "OutStat3A"
        DirectionValue = 1
    if(t == 5):
        OutputName = "Output3B"
        FeedbackName = "Feedback3B"
        DirectionCtrl = "BRIDGE3_DIR"
        OutputStatus = "OutStat3B"
        DirectionValue = 2
    if(t == 6):
        OutputName = "Output4A"
        FeedbackName = "Feedback4A"
        DirectionCtrl = "BRIDGE4_DIR"
        OutputStatus = "OutStat4A"
        DirectionValue = 1
    if(t == 7):
        OutputName = "Output4B"
        FeedbackName = "Feedback4B"
        DirectionCtrl = "BRIDGE4_DIR"
        OutputStatus = "OutStat4B"
        DirectionValue = 2
    if(t == 8):
        OutputName = "Output5A"
        FeedbackName = "Feedback5A"
        DirectionCtrl = "BRIDGE5_DIR"
        OutputStatus = "OutStat5A"
        DirectionValue = 1
    if(t == 9):
        OutputName = "Output5B"
        FeedbackName = "Feedback5B"
        DirectionCtrl = "BRIDGE5_DIR"
        OutputStatus = "OutStat5B"
        DirectionValue = 2
    if(t == 10):
        OutputName = "Output6A"
        FeedbackName = "Feedback6A"
        DirectionCtrl = "BRIDGE6_DIR"
        OutputStatus = "OutStat6A"
        DirectionValue = 1
    if(t == 11):
        OutputName = "Output6B"
        FeedbackName = "Feedback6B"
        DirectionCtrl = "BRIDGE6_DIR"
        OutputStatus = "OutStat6B"
        DirectionValue = 2
    if(t == 12):
        OutputName = "Output7A"
        FeedbackName = "Feedback7A"
        DirectionCtrl = "BRIDGE7_DIR"
        OutputStatus = "OutStat7A"
        DirectionValue = 1
    if(t == 13):
        OutputName = "Output7B"
        FeedbackName = "Feedback7B"
        DirectionCtrl = "BRIDGE7_DIR"
        OutputStatus = "OutStat7B"
        DirectionValue = 2
    if(t == 14):
        OutputName = "Output8A"
        FeedbackName = "Feedback8A"
        DirectionCtrl = "BRIDGE8_DIR"
        OutputStatus = "OutStat8A"
        DirectionValue = 1
    if(t == 15):
        OutputName = "Output8B"
        FeedbackName = "Feedback8B"
        DirectionCtrl = "BRIDGE8_DIR"
        OutputStatus = "OutStat8B"
        DirectionValue = 2
        
    if t % 2 == 0:
        outstr += "#prompt user to switch\n"
        outstr += "PAUSE-please verify load connection " + DirectionCtrl + "\n"
    
    if((t == 0)|(t == 1)|(t == 4)|(t == 5)):    
        outstr += "#turn on output\n"
        outstr += "Command = 81, " + OutputName + " = 1, " + DirectionCtrl + " = " + str(DirectionValue) + " : " + FeedbackName + " = 6.9 | 0.2 | 0.5\n"
        outstr += "#turn off output\n"
        outstr += OutputName + " = 0 : NULL : WAIT = 1\n"
    else:
        outstr += "#turn on output\n"
        outstr += "Command = 81, " + OutputName + " = 1, " + DirectionCtrl + " = " + str(DirectionValue) + " : " + OutputStatus + " = 2 | 0 | 0.5\n"
        outstr += "#turn off output\n"
        outstr += OutputName + " = 0 : NULL : WAIT = 1\n"

    t += 1



outstr += "SAVE\n"
#shut down test
outstr += "END\n"
    
f = open(datafile, 'w')
f.write(outstr)
f.close()    
print(outstr)



