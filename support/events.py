import pygame
import support.globals as globals

mouse_pos = [[0,0],[0,0]]
mouse_dn = 0
mouse_up = 0

def ProcessEvents():
    global mouse_pos, mouse_dn, mouse_up
    global finished 
    
    for event in pygame.event.get():
    
        if event.type == pygame.QUIT:     
            globals.finished = 1
            
        if event.type == pygame.KEYDOWN:
            globals.finished = 1
            
        if event.type == pygame.MOUSEBUTTONDOWN:
            mouse_pos = [[0,0],[0,0]]
            mouse_pos[0] = event.pos

        elif event.type == pygame.MOUSEBUTTONUP:
        
            edge_swipe_min = 10
            edge_swipe_length = 75
            X_swipe_length = 200
            Y_swipe_length = 100
            
            mouse_pos[1] = event.pos
            Xdiff = mouse_pos[0][0] - mouse_pos[1][0];
            Ydiff = mouse_pos[0][1] - mouse_pos[1][1];
            
            if (mouse_pos[0][0] < edge_swipe_min) and (mouse_pos[1][0] > edge_swipe_length):
                print("edge right")      
            elif (mouse_pos[0][1] < edge_swipe_min) and (mouse_pos[1][1] > edge_swipe_length):
                print("edge down")
            elif (Xdiff < X_swipe_length * -1):
                print("swipe right")
            elif (Xdiff > X_swipe_length):
                print("swipe left")
            elif (Ydiff > Y_swipe_length):
                print("swipe up")
            elif (Ydiff < Y_swipe_length * -1):
                print("swipe down")
            else:
                print("click", mouse_pos)

            mouse_pos = [[0,0],[0,0]]
            
        if event.type == pygame.MOUSEMOTION:
            None
            #mouse_pos[1] = event.pos