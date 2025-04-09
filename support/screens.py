import pygame
import psutil
import os
import support.globals as globals

cpu_avg = []

def ErrorTrap(error):
    sink = error #sink errors for now
    
def DrawScreen(screen, ScreenMode):
    white = (255, 255, 255)
    #print(psutil.virtual_memory())
    free_mem = psutil.virtual_memory().available * 100 / psutil.virtual_memory().total
    cpu_avg.append(psutil.cpu_percent())
    #print(len(cpu_avg))
    if(len(cpu_avg) > 100):
        cpu_avg.pop(0)
    cpu_use = sum(cpu_avg) / len(cpu_avg)
    #print(free_mem, cpu_use)
    t = os.popen('/opt/vc/bin/vcgencmd measure_temp')
    cputemp = t.read()
    cputemp = cputemp.replace('temp=','')
    cputemp = cputemp[:-1]
    
    font_button = pygame.font.Font('freesansbold.ttf', 33)
            
    text = font_button.render("CPU: " + str(int(cpu_use)) + " % used", True, white)
    textRect = text.get_rect()
    text_x = 0
    text_y = 0
    screen.blit(text, dest=(text_x,text_y))
    
    text = font_button.render("MEM: " + str(int(free_mem)) + " % free", True, white)
    textRect = text.get_rect()
    text_x = 0
    text_y = 50
    screen.blit(text, dest=(text_x,text_y))
    
    
    try:
        Voltage = globals.PAT_Fdbk["MeterVolts"]
    except:
        Voltage = 0
        
    text = font_button.render("VOLT: " + str(Voltage), True, white)
    textRect = text.get_rect()
    text_x = 0
    text_y = 100
    screen.blit(text, dest=(text_x,text_y))
    
    text = font_button.render("TEMP: " +str((cputemp)), True, white)
    textRect = text.get_rect()
    text_x = 0
    text_y = 150
    screen.blit(text, dest=(text_x,text_y))