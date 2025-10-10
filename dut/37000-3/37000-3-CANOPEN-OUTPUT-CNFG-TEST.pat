#37000-3
#Verion 0.0
#digital normal test using the E-LOAD
UUT_EDS = 37000-563.eds
UUT_DATANAME = 37000-3-CANOPEN-OUTPUT-CNFG-TEST

PRE_OPERATIONAL
#-----setup PAT-----
#setup load
J4_01 = 1 : NULL : WAIT = 0.2
J4_03 = 1 : NULL : WAIT = 0.2
OPERATIONAL
#-----setup 34044-----
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0 : NULL
#disable global modes
sdo[0x2000][3] = 0 : NULL
sdo[0x2000][4] = 0 : NULL
sdo[0x2000][1] = 0 : NULL
#switch in load line, set current
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0, sdo[0x2000][3] = 0 : NULL
sdo[0x2001][1] = 68 : NULL
#switch in load line, set current
J2_02 = 1 : NULL

#TESING Output1B
sdo[0x6411][2] = 0 : sdo[0x5003][2] = 0.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output1B
#verify reading from load

#TESING Output1B
sdo[0x6411][2] = 100 : sdo[0x5003][2] = 1.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output1B
#verify reading from load

#TESING Output1B
sdo[0x6411][2] = 200 : sdo[0x5003][2] = 2.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output1B
#verify reading from load

#TESING Output1B
sdo[0x6411][2] = 300 : sdo[0x5003][2] = 3.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output1B
#verify reading from load

#TESING Output1B
sdo[0x6411][2] = 400 : sdo[0x5003][2] = 4.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output1B
#verify reading from load

#TESING Output1B
sdo[0x6411][2] = 500 : sdo[0x5003][2] = 5.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output1B
#verify reading from load

#TESING Output1B
sdo[0x6411][2] = 600 : sdo[0x5003][2] = 6.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output1B
#verify reading from load

#TESING Output1B
sdo[0x6411][2] = 700 : sdo[0x5003][2] = 7.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output1B
#verify reading from load

#TESING Output1B
sdo[0x6411][2] = 800 : sdo[0x5003][2] = 8.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output1B
#verify reading from load

#TESING Output1B
sdo[0x6411][2] = 900 : sdo[0x5003][2] = 9.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output1B
#verify reading from load

#TESING Output1B
sdo[0x6411][2] = 1000 : sdo[0x5003][2] = 10.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output1B
#verify reading from load

#TESING Output1B
sdo[0x6411][2] = 1100 : sdo[0x5003][2] = 11.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output1B
#verify reading from load

#TESING Output1B
sdo[0x6411][2] = 1200 : sdo[0x5003][2] = 12.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output1B
#verify reading from load

#TESING Output1B
sdo[0x6411][2] = 1300 : sdo[0x5003][2] = 13.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output1B
#verify reading from load

#TESING Output1B
sdo[0x6411][2] = 1400 : sdo[0x5003][2] = 14.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output1B
#verify reading from load

#TESING Output1B
sdo[0x6411][2] = 1500 : sdo[0x5003][2] = 15.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output1B
#verify reading from load

#switch out load line, clear current
sdo[0x6411][2] = 0 : NULL : WAIT = 0.1
J2_02 = 0 : NULL : WAIT = 0.5
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0, sdo[0x2000][3] = 0 : NULL
sdo[0x2001][2] = 68 : NULL
#switch in load line, set current
J2_03 = 1 : NULL

#TESING Output2A
sdo[0x6411][3] = 0 : sdo[0x5003][3] = 0.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2A
#verify reading from load

#TESING Output2A
sdo[0x6411][3] = 100 : sdo[0x5003][3] = 1.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2A
#verify reading from load

#TESING Output2A
sdo[0x6411][3] = 200 : sdo[0x5003][3] = 2.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2A
#verify reading from load

#TESING Output2A
sdo[0x6411][3] = 300 : sdo[0x5003][3] = 3.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2A
#verify reading from load

#TESING Output2A
sdo[0x6411][3] = 400 : sdo[0x5003][3] = 4.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2A
#verify reading from load

#TESING Output2A
sdo[0x6411][3] = 500 : sdo[0x5003][3] = 5.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2A
#verify reading from load

#TESING Output2A
sdo[0x6411][3] = 600 : sdo[0x5003][3] = 6.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2A
#verify reading from load

#TESING Output2A
sdo[0x6411][3] = 700 : sdo[0x5003][3] = 7.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2A
#verify reading from load

#TESING Output2A
sdo[0x6411][3] = 800 : sdo[0x5003][3] = 8.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2A
#verify reading from load

#TESING Output2A
sdo[0x6411][3] = 900 : sdo[0x5003][3] = 9.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2A
#verify reading from load

#TESING Output2A
sdo[0x6411][3] = 1000 : sdo[0x5003][3] = 10.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2A
#verify reading from load

#TESING Output2A
sdo[0x6411][3] = 1100 : sdo[0x5003][3] = 11.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2A
#verify reading from load

#TESING Output2A
sdo[0x6411][3] = 1200 : sdo[0x5003][3] = 12.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2A
#verify reading from load

#TESING Output2A
sdo[0x6411][3] = 1300 : sdo[0x5003][3] = 13.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2A
#verify reading from load

#TESING Output2A
sdo[0x6411][3] = 1400 : sdo[0x5003][3] = 14.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2A
#verify reading from load

#TESING Output2A
sdo[0x6411][3] = 1500 : sdo[0x5003][3] = 15.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2A
#verify reading from load

#switch out load line, clear current
sdo[0x6411][3] = 0 : NULL : WAIT = 0.1
J2_03 = 0 : NULL : WAIT = 0.5
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0, sdo[0x2000][3] = 0 : NULL
sdo[0x2001][2] = 68 : NULL
#switch in load line, set current
J2_04 = 1 : NULL

#TESING Output2B
sdo[0x6411][4] = 0 : sdo[0x5003][4] = 0.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2B
#verify reading from load

#TESING Output2B
sdo[0x6411][4] = 100 : sdo[0x5003][4] = 1.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2B
#verify reading from load

#TESING Output2B
sdo[0x6411][4] = 200 : sdo[0x5003][4] = 2.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2B
#verify reading from load

#TESING Output2B
sdo[0x6411][4] = 300 : sdo[0x5003][4] = 3.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2B
#verify reading from load

#TESING Output2B
sdo[0x6411][4] = 400 : sdo[0x5003][4] = 4.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2B
#verify reading from load

#TESING Output2B
sdo[0x6411][4] = 500 : sdo[0x5003][4] = 5.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2B
#verify reading from load

#TESING Output2B
sdo[0x6411][4] = 600 : sdo[0x5003][4] = 6.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2B
#verify reading from load

#TESING Output2B
sdo[0x6411][4] = 700 : sdo[0x5003][4] = 7.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2B
#verify reading from load

#TESING Output2B
sdo[0x6411][4] = 800 : sdo[0x5003][4] = 8.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2B
#verify reading from load

#TESING Output2B
sdo[0x6411][4] = 900 : sdo[0x5003][4] = 9.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2B
#verify reading from load

#TESING Output2B
sdo[0x6411][4] = 1000 : sdo[0x5003][4] = 10.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2B
#verify reading from load

#TESING Output2B
sdo[0x6411][4] = 1100 : sdo[0x5003][4] = 11.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2B
#verify reading from load

#TESING Output2B
sdo[0x6411][4] = 1200 : sdo[0x5003][4] = 12.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2B
#verify reading from load

#TESING Output2B
sdo[0x6411][4] = 1300 : sdo[0x5003][4] = 13.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2B
#verify reading from load

#TESING Output2B
sdo[0x6411][4] = 1400 : sdo[0x5003][4] = 14.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2B
#verify reading from load

#TESING Output2B
sdo[0x6411][4] = 1500 : sdo[0x5003][4] = 15.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output2B
#verify reading from load

#switch out load line, clear current
sdo[0x6411][4] = 0 : NULL : WAIT = 0.1
J2_04 = 0 : NULL : WAIT = 0.5
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0, sdo[0x2000][3] = 0 : NULL
sdo[0x2001][3] = 68 : NULL
#switch in load line, set current
J2_06 = 1 : NULL

#TESING Output3B
sdo[0x6411][6] = 0 : sdo[0x5003][6] = 0.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output3B
#verify reading from load

#TESING Output3B
sdo[0x6411][6] = 100 : sdo[0x5003][6] = 1.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output3B
#verify reading from load

#TESING Output3B
sdo[0x6411][6] = 200 : sdo[0x5003][6] = 2.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output3B
#verify reading from load

#TESING Output3B
sdo[0x6411][6] = 300 : sdo[0x5003][6] = 3.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output3B
#verify reading from load

#TESING Output3B
sdo[0x6411][6] = 400 : sdo[0x5003][6] = 4.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output3B
#verify reading from load

#TESING Output3B
sdo[0x6411][6] = 500 : sdo[0x5003][6] = 5.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output3B
#verify reading from load

#TESING Output3B
sdo[0x6411][6] = 600 : sdo[0x5003][6] = 6.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output3B
#verify reading from load

#TESING Output3B
sdo[0x6411][6] = 700 : sdo[0x5003][6] = 7.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output3B
#verify reading from load

#TESING Output3B
sdo[0x6411][6] = 800 : sdo[0x5003][6] = 8.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output3B
#verify reading from load

#TESING Output3B
sdo[0x6411][6] = 900 : sdo[0x5003][6] = 9.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output3B
#verify reading from load

#TESING Output3B
sdo[0x6411][6] = 1000 : sdo[0x5003][6] = 10.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output3B
#verify reading from load

#TESING Output3B
sdo[0x6411][6] = 1100 : sdo[0x5003][6] = 11.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output3B
#verify reading from load

#TESING Output3B
sdo[0x6411][6] = 1200 : sdo[0x5003][6] = 12.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output3B
#verify reading from load

#TESING Output3B
sdo[0x6411][6] = 1300 : sdo[0x5003][6] = 13.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output3B
#verify reading from load

#TESING Output3B
sdo[0x6411][6] = 1400 : sdo[0x5003][6] = 14.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output3B
#verify reading from load

#TESING Output3B
sdo[0x6411][6] = 1500 : sdo[0x5003][6] = 15.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output3B
#verify reading from load

#switch out load line, clear current
sdo[0x6411][6] = 0 : NULL : WAIT = 0.1
J2_06 = 0 : NULL : WAIT = 0.5
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0, sdo[0x2000][3] = 0 : NULL
sdo[0x2001][4] = 68 : NULL
#switch in load line, set current
J2_07 = 1 : NULL

#TESING Output4A
sdo[0x6411][7] = 0 : sdo[0x5003][7] = 0.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4A
#verify reading from load

#TESING Output4A
sdo[0x6411][7] = 100 : sdo[0x5003][7] = 1.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4A
#verify reading from load

#TESING Output4A
sdo[0x6411][7] = 200 : sdo[0x5003][7] = 2.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4A
#verify reading from load

#TESING Output4A
sdo[0x6411][7] = 300 : sdo[0x5003][7] = 3.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4A
#verify reading from load

#TESING Output4A
sdo[0x6411][7] = 400 : sdo[0x5003][7] = 4.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4A
#verify reading from load

#TESING Output4A
sdo[0x6411][7] = 500 : sdo[0x5003][7] = 5.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4A
#verify reading from load

#TESING Output4A
sdo[0x6411][7] = 600 : sdo[0x5003][7] = 6.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4A
#verify reading from load

#TESING Output4A
sdo[0x6411][7] = 700 : sdo[0x5003][7] = 7.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4A
#verify reading from load

#TESING Output4A
sdo[0x6411][7] = 800 : sdo[0x5003][7] = 8.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4A
#verify reading from load

#TESING Output4A
sdo[0x6411][7] = 900 : sdo[0x5003][7] = 9.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4A
#verify reading from load

#TESING Output4A
sdo[0x6411][7] = 1000 : sdo[0x5003][7] = 10.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4A
#verify reading from load

#TESING Output4A
sdo[0x6411][7] = 1100 : sdo[0x5003][7] = 11.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4A
#verify reading from load

#TESING Output4A
sdo[0x6411][7] = 1200 : sdo[0x5003][7] = 12.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4A
#verify reading from load

#TESING Output4A
sdo[0x6411][7] = 1300 : sdo[0x5003][7] = 13.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4A
#verify reading from load

#TESING Output4A
sdo[0x6411][7] = 1400 : sdo[0x5003][7] = 14.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4A
#verify reading from load

#TESING Output4A
sdo[0x6411][7] = 1500 : sdo[0x5003][7] = 15.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4A
#verify reading from load

#switch out load line, clear current
sdo[0x6411][7] = 0 : NULL : WAIT = 0.1
J2_07 = 0 : NULL : WAIT = 0.5
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0, sdo[0x2000][3] = 0 : NULL
sdo[0x2001][4] = 68 : NULL
#switch in load line, set current
J2_08 = 1 : NULL

#TESING Output4B
sdo[0x6411][8] = 0 : sdo[0x5003][8] = 0.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4B
#verify reading from load

#TESING Output4B
sdo[0x6411][8] = 100 : sdo[0x5003][8] = 1.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4B
#verify reading from load

#TESING Output4B
sdo[0x6411][8] = 200 : sdo[0x5003][8] = 2.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4B
#verify reading from load

#TESING Output4B
sdo[0x6411][8] = 300 : sdo[0x5003][8] = 3.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4B
#verify reading from load

#TESING Output4B
sdo[0x6411][8] = 400 : sdo[0x5003][8] = 4.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4B
#verify reading from load

#TESING Output4B
sdo[0x6411][8] = 500 : sdo[0x5003][8] = 5.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4B
#verify reading from load

#TESING Output4B
sdo[0x6411][8] = 600 : sdo[0x5003][8] = 6.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4B
#verify reading from load

#TESING Output4B
sdo[0x6411][8] = 700 : sdo[0x5003][8] = 7.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4B
#verify reading from load

#TESING Output4B
sdo[0x6411][8] = 800 : sdo[0x5003][8] = 8.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4B
#verify reading from load

#TESING Output4B
sdo[0x6411][8] = 900 : sdo[0x5003][8] = 9.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4B
#verify reading from load

#TESING Output4B
sdo[0x6411][8] = 1000 : sdo[0x5003][8] = 10.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4B
#verify reading from load

#TESING Output4B
sdo[0x6411][8] = 1100 : sdo[0x5003][8] = 11.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4B
#verify reading from load

#TESING Output4B
sdo[0x6411][8] = 1200 : sdo[0x5003][8] = 12.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4B
#verify reading from load

#TESING Output4B
sdo[0x6411][8] = 1300 : sdo[0x5003][8] = 13.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4B
#verify reading from load

#TESING Output4B
sdo[0x6411][8] = 1400 : sdo[0x5003][8] = 14.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4B
#verify reading from load

#TESING Output4B
sdo[0x6411][8] = 1500 : sdo[0x5003][8] = 15.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output4B
#verify reading from load

#switch out load line, clear current
sdo[0x6411][8] = 0 : NULL : WAIT = 0.1
J2_08 = 0 : NULL : WAIT = 0.5
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0, sdo[0x2000][3] = 0 : NULL
sdo[0x2001][5] = 68 : NULL
#switch in load line, set current
J2_09 = 1 : NULL

#TESING Output5A
sdo[0x6411][9] = 0 : sdo[0x5003][9] = 0.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5A
#verify reading from load

#TESING Output5A
sdo[0x6411][9] = 100 : sdo[0x5003][9] = 1.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5A
#verify reading from load

#TESING Output5A
sdo[0x6411][9] = 200 : sdo[0x5003][9] = 2.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5A
#verify reading from load

#TESING Output5A
sdo[0x6411][9] = 300 : sdo[0x5003][9] = 3.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5A
#verify reading from load

#TESING Output5A
sdo[0x6411][9] = 400 : sdo[0x5003][9] = 4.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5A
#verify reading from load

#TESING Output5A
sdo[0x6411][9] = 500 : sdo[0x5003][9] = 5.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5A
#verify reading from load

#TESING Output5A
sdo[0x6411][9] = 600 : sdo[0x5003][9] = 6.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5A
#verify reading from load

#TESING Output5A
sdo[0x6411][9] = 700 : sdo[0x5003][9] = 7.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5A
#verify reading from load

#TESING Output5A
sdo[0x6411][9] = 800 : sdo[0x5003][9] = 8.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5A
#verify reading from load

#TESING Output5A
sdo[0x6411][9] = 900 : sdo[0x5003][9] = 9.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5A
#verify reading from load

#TESING Output5A
sdo[0x6411][9] = 1000 : sdo[0x5003][9] = 10.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5A
#verify reading from load

#TESING Output5A
sdo[0x6411][9] = 1100 : sdo[0x5003][9] = 11.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5A
#verify reading from load

#TESING Output5A
sdo[0x6411][9] = 1200 : sdo[0x5003][9] = 12.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5A
#verify reading from load

#TESING Output5A
sdo[0x6411][9] = 1300 : sdo[0x5003][9] = 13.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5A
#verify reading from load

#TESING Output5A
sdo[0x6411][9] = 1400 : sdo[0x5003][9] = 14.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5A
#verify reading from load

#TESING Output5A
sdo[0x6411][9] = 1500 : sdo[0x5003][9] = 15.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5A
#verify reading from load

#switch out load line, clear current
sdo[0x6411][9] = 0 : NULL : WAIT = 0.1
J2_09 = 0 : NULL : WAIT = 0.5
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0, sdo[0x2000][3] = 0 : NULL
sdo[0x2001][5] = 68 : NULL
#switch in load line, set current
J2_10 = 1 : NULL

#TESING Output5B
sdo[0x6411][10] = 0 : sdo[0x5003][10] = 0.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5B
#verify reading from load

#TESING Output5B
sdo[0x6411][10] = 100 : sdo[0x5003][10] = 1.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5B
#verify reading from load

#TESING Output5B
sdo[0x6411][10] = 200 : sdo[0x5003][10] = 2.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5B
#verify reading from load

#TESING Output5B
sdo[0x6411][10] = 300 : sdo[0x5003][10] = 3.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5B
#verify reading from load

#TESING Output5B
sdo[0x6411][10] = 400 : sdo[0x5003][10] = 4.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5B
#verify reading from load

#TESING Output5B
sdo[0x6411][10] = 500 : sdo[0x5003][10] = 5.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5B
#verify reading from load

#TESING Output5B
sdo[0x6411][10] = 600 : sdo[0x5003][10] = 6.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5B
#verify reading from load

#TESING Output5B
sdo[0x6411][10] = 700 : sdo[0x5003][10] = 7.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5B
#verify reading from load

#TESING Output5B
sdo[0x6411][10] = 800 : sdo[0x5003][10] = 8.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5B
#verify reading from load

#TESING Output5B
sdo[0x6411][10] = 900 : sdo[0x5003][10] = 9.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5B
#verify reading from load

#TESING Output5B
sdo[0x6411][10] = 1000 : sdo[0x5003][10] = 10.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5B
#verify reading from load

#TESING Output5B
sdo[0x6411][10] = 1100 : sdo[0x5003][10] = 11.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5B
#verify reading from load

#TESING Output5B
sdo[0x6411][10] = 1200 : sdo[0x5003][10] = 12.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5B
#verify reading from load

#TESING Output5B
sdo[0x6411][10] = 1300 : sdo[0x5003][10] = 13.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5B
#verify reading from load

#TESING Output5B
sdo[0x6411][10] = 1400 : sdo[0x5003][10] = 14.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5B
#verify reading from load

#TESING Output5B
sdo[0x6411][10] = 1500 : sdo[0x5003][10] = 15.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output5B
#verify reading from load

#switch out load line, clear current
sdo[0x6411][10] = 0 : NULL : WAIT = 0.1
J2_10 = 0 : NULL : WAIT = 0.5
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0, sdo[0x2000][3] = 0 : NULL
sdo[0x2001][6] = 68 : NULL
#switch in load line, set current
J2_11 = 1 : NULL

#TESING Output6A
sdo[0x6411][11] = 0 : sdo[0x5003][11] = 0.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6A
#verify reading from load

#TESING Output6A
sdo[0x6411][11] = 100 : sdo[0x5003][11] = 1.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6A
#verify reading from load

#TESING Output6A
sdo[0x6411][11] = 200 : sdo[0x5003][11] = 2.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6A
#verify reading from load

#TESING Output6A
sdo[0x6411][11] = 300 : sdo[0x5003][11] = 3.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6A
#verify reading from load

#TESING Output6A
sdo[0x6411][11] = 400 : sdo[0x5003][11] = 4.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6A
#verify reading from load

#TESING Output6A
sdo[0x6411][11] = 500 : sdo[0x5003][11] = 5.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6A
#verify reading from load

#TESING Output6A
sdo[0x6411][11] = 600 : sdo[0x5003][11] = 6.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6A
#verify reading from load

#TESING Output6A
sdo[0x6411][11] = 700 : sdo[0x5003][11] = 7.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6A
#verify reading from load

#TESING Output6A
sdo[0x6411][11] = 800 : sdo[0x5003][11] = 8.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6A
#verify reading from load

#TESING Output6A
sdo[0x6411][11] = 900 : sdo[0x5003][11] = 9.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6A
#verify reading from load

#TESING Output6A
sdo[0x6411][11] = 1000 : sdo[0x5003][11] = 10.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6A
#verify reading from load

#TESING Output6A
sdo[0x6411][11] = 1100 : sdo[0x5003][11] = 11.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6A
#verify reading from load

#TESING Output6A
sdo[0x6411][11] = 1200 : sdo[0x5003][11] = 12.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6A
#verify reading from load

#TESING Output6A
sdo[0x6411][11] = 1300 : sdo[0x5003][11] = 13.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6A
#verify reading from load

#TESING Output6A
sdo[0x6411][11] = 1400 : sdo[0x5003][11] = 14.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6A
#verify reading from load

#TESING Output6A
sdo[0x6411][11] = 1500 : sdo[0x5003][11] = 15.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6A
#verify reading from load

#switch out load line, clear current
sdo[0x6411][11] = 0 : NULL : WAIT = 0.1
J2_11 = 0 : NULL : WAIT = 0.5
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0, sdo[0x2000][3] = 0 : NULL
sdo[0x2001][6] = 68 : NULL
#switch in load line, set current
J2_12 = 1 : NULL

#TESING Output6B
sdo[0x6411][12] = 0 : sdo[0x5003][12] = 0.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6B
#verify reading from load

#TESING Output6B
sdo[0x6411][12] = 100 : sdo[0x5003][12] = 1.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6B
#verify reading from load

#TESING Output6B
sdo[0x6411][12] = 200 : sdo[0x5003][12] = 2.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6B
#verify reading from load

#TESING Output6B
sdo[0x6411][12] = 300 : sdo[0x5003][12] = 3.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6B
#verify reading from load

#TESING Output6B
sdo[0x6411][12] = 400 : sdo[0x5003][12] = 4.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6B
#verify reading from load

#TESING Output6B
sdo[0x6411][12] = 500 : sdo[0x5003][12] = 5.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6B
#verify reading from load

#TESING Output6B
sdo[0x6411][12] = 600 : sdo[0x5003][12] = 6.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6B
#verify reading from load

#TESING Output6B
sdo[0x6411][12] = 700 : sdo[0x5003][12] = 7.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6B
#verify reading from load

#TESING Output6B
sdo[0x6411][12] = 800 : sdo[0x5003][12] = 8.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6B
#verify reading from load

#TESING Output6B
sdo[0x6411][12] = 900 : sdo[0x5003][12] = 9.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6B
#verify reading from load

#TESING Output6B
sdo[0x6411][12] = 1000 : sdo[0x5003][12] = 10.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6B
#verify reading from load

#TESING Output6B
sdo[0x6411][12] = 1100 : sdo[0x5003][12] = 11.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6B
#verify reading from load

#TESING Output6B
sdo[0x6411][12] = 1200 : sdo[0x5003][12] = 12.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6B
#verify reading from load

#TESING Output6B
sdo[0x6411][12] = 1300 : sdo[0x5003][12] = 13.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6B
#verify reading from load

#TESING Output6B
sdo[0x6411][12] = 1400 : sdo[0x5003][12] = 14.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6B
#verify reading from load

#TESING Output6B
sdo[0x6411][12] = 1500 : sdo[0x5003][12] = 15.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output6B
#verify reading from load

#switch out load line, clear current
sdo[0x6411][12] = 0 : NULL : WAIT = 0.1
J2_12 = 0 : NULL : WAIT = 0.5
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0, sdo[0x2000][3] = 0 : NULL
sdo[0x2001][7] = 68 : NULL
#switch in load line, set current
J3_01 = 1 : NULL

#TESING Output7A
sdo[0x6411][13] = 0 : sdo[0x5003][13] = 0.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7A
#verify reading from load

#TESING Output7A
sdo[0x6411][13] = 100 : sdo[0x5003][13] = 1.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7A
#verify reading from load

#TESING Output7A
sdo[0x6411][13] = 200 : sdo[0x5003][13] = 2.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7A
#verify reading from load

#TESING Output7A
sdo[0x6411][13] = 300 : sdo[0x5003][13] = 3.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7A
#verify reading from load

#TESING Output7A
sdo[0x6411][13] = 400 : sdo[0x5003][13] = 4.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7A
#verify reading from load

#TESING Output7A
sdo[0x6411][13] = 500 : sdo[0x5003][13] = 5.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7A
#verify reading from load

#TESING Output7A
sdo[0x6411][13] = 600 : sdo[0x5003][13] = 6.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7A
#verify reading from load

#TESING Output7A
sdo[0x6411][13] = 700 : sdo[0x5003][13] = 7.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7A
#verify reading from load

#TESING Output7A
sdo[0x6411][13] = 800 : sdo[0x5003][13] = 8.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7A
#verify reading from load

#TESING Output7A
sdo[0x6411][13] = 900 : sdo[0x5003][13] = 9.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7A
#verify reading from load

#TESING Output7A
sdo[0x6411][13] = 1000 : sdo[0x5003][13] = 10.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7A
#verify reading from load

#TESING Output7A
sdo[0x6411][13] = 1100 : sdo[0x5003][13] = 11.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7A
#verify reading from load

#TESING Output7A
sdo[0x6411][13] = 1200 : sdo[0x5003][13] = 12.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7A
#verify reading from load

#TESING Output7A
sdo[0x6411][13] = 1300 : sdo[0x5003][13] = 13.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7A
#verify reading from load

#TESING Output7A
sdo[0x6411][13] = 1400 : sdo[0x5003][13] = 14.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7A
#verify reading from load

#TESING Output7A
sdo[0x6411][13] = 1500 : sdo[0x5003][13] = 15.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7A
#verify reading from load

#switch out load line, clear current
sdo[0x6411][13] = 0 : NULL : WAIT = 0.1
J3_01 = 0 : NULL : WAIT = 0.5
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0, sdo[0x2000][3] = 0 : NULL
sdo[0x2001][7] = 68 : NULL
#switch in load line, set current
J3_02 = 1 : NULL

#TESING Output7B
sdo[0x6411][14] = 0 : sdo[0x5003][14] = 0.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7B
#verify reading from load

#TESING Output7B
sdo[0x6411][14] = 100 : sdo[0x5003][14] = 1.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7B
#verify reading from load

#TESING Output7B
sdo[0x6411][14] = 200 : sdo[0x5003][14] = 2.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7B
#verify reading from load

#TESING Output7B
sdo[0x6411][14] = 300 : sdo[0x5003][14] = 3.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7B
#verify reading from load

#TESING Output7B
sdo[0x6411][14] = 400 : sdo[0x5003][14] = 4.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7B
#verify reading from load

#TESING Output7B
sdo[0x6411][14] = 500 : sdo[0x5003][14] = 5.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7B
#verify reading from load

#TESING Output7B
sdo[0x6411][14] = 600 : sdo[0x5003][14] = 6.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7B
#verify reading from load

#TESING Output7B
sdo[0x6411][14] = 700 : sdo[0x5003][14] = 7.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7B
#verify reading from load

#TESING Output7B
sdo[0x6411][14] = 800 : sdo[0x5003][14] = 8.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7B
#verify reading from load

#TESING Output7B
sdo[0x6411][14] = 900 : sdo[0x5003][14] = 9.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7B
#verify reading from load

#TESING Output7B
sdo[0x6411][14] = 1000 : sdo[0x5003][14] = 10.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7B
#verify reading from load

#TESING Output7B
sdo[0x6411][14] = 1100 : sdo[0x5003][14] = 11.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7B
#verify reading from load

#TESING Output7B
sdo[0x6411][14] = 1200 : sdo[0x5003][14] = 12.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7B
#verify reading from load

#TESING Output7B
sdo[0x6411][14] = 1300 : sdo[0x5003][14] = 13.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7B
#verify reading from load

#TESING Output7B
sdo[0x6411][14] = 1400 : sdo[0x5003][14] = 14.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7B
#verify reading from load

#TESING Output7B
sdo[0x6411][14] = 1500 : sdo[0x5003][14] = 15.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output7B
#verify reading from load

#switch out load line, clear current
sdo[0x6411][14] = 0 : NULL : WAIT = 0.1
J3_02 = 0 : NULL : WAIT = 0.5
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0, sdo[0x2000][3] = 0 : NULL
sdo[0x2001][8] = 68 : NULL
#switch in load line, set current
J3_03 = 1 : NULL

#TESING Output8A
sdo[0x6411][15] = 0 : sdo[0x5003][15] = 0.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8A
#verify reading from load

#TESING Output8A
sdo[0x6411][15] = 100 : sdo[0x5003][15] = 1.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8A
#verify reading from load

#TESING Output8A
sdo[0x6411][15] = 200 : sdo[0x5003][15] = 2.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8A
#verify reading from load

#TESING Output8A
sdo[0x6411][15] = 300 : sdo[0x5003][15] = 3.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8A
#verify reading from load

#TESING Output8A
sdo[0x6411][15] = 400 : sdo[0x5003][15] = 4.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8A
#verify reading from load

#TESING Output8A
sdo[0x6411][15] = 500 : sdo[0x5003][15] = 5.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8A
#verify reading from load

#TESING Output8A
sdo[0x6411][15] = 600 : sdo[0x5003][15] = 6.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8A
#verify reading from load

#TESING Output8A
sdo[0x6411][15] = 700 : sdo[0x5003][15] = 7.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8A
#verify reading from load

#TESING Output8A
sdo[0x6411][15] = 800 : sdo[0x5003][15] = 8.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8A
#verify reading from load

#TESING Output8A
sdo[0x6411][15] = 900 : sdo[0x5003][15] = 9.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8A
#verify reading from load

#TESING Output8A
sdo[0x6411][15] = 1000 : sdo[0x5003][15] = 10.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8A
#verify reading from load

#TESING Output8A
sdo[0x6411][15] = 1100 : sdo[0x5003][15] = 11.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8A
#verify reading from load

#TESING Output8A
sdo[0x6411][15] = 1200 : sdo[0x5003][15] = 12.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8A
#verify reading from load

#TESING Output8A
sdo[0x6411][15] = 1300 : sdo[0x5003][15] = 13.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8A
#verify reading from load

#TESING Output8A
sdo[0x6411][15] = 1400 : sdo[0x5003][15] = 14.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8A
#verify reading from load

#TESING Output8A
sdo[0x6411][15] = 1500 : sdo[0x5003][15] = 15.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8A
#verify reading from load

#switch out load line, clear current
sdo[0x6411][15] = 0 : NULL : WAIT = 0.1
J3_03 = 0 : NULL : WAIT = 0.5
sdo[0x2000][1] = 0, sdo[0x2000][2] = 0, sdo[0x2000][3] = 0 : NULL
sdo[0x2001][8] = 68 : NULL
#switch in load line, set current
J3_04 = 1 : NULL

#TESING Output8B
sdo[0x6411][16] = 0 : sdo[0x5003][16] = 0.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8B
#verify reading from load

#TESING Output8B
sdo[0x6411][16] = 100 : sdo[0x5003][16] = 1.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8B
#verify reading from load

#TESING Output8B
sdo[0x6411][16] = 200 : sdo[0x5003][16] = 2.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8B
#verify reading from load

#TESING Output8B
sdo[0x6411][16] = 300 : sdo[0x5003][16] = 3.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8B
#verify reading from load

#TESING Output8B
sdo[0x6411][16] = 400 : sdo[0x5003][16] = 4.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8B
#verify reading from load

#TESING Output8B
sdo[0x6411][16] = 500 : sdo[0x5003][16] = 5.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8B
#verify reading from load

#TESING Output8B
sdo[0x6411][16] = 600 : sdo[0x5003][16] = 6.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8B
#verify reading from load

#TESING Output8B
sdo[0x6411][16] = 700 : sdo[0x5003][16] = 7.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8B
#verify reading from load

#TESING Output8B
sdo[0x6411][16] = 800 : sdo[0x5003][16] = 8.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8B
#verify reading from load

#TESING Output8B
sdo[0x6411][16] = 900 : sdo[0x5003][16] = 9.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8B
#verify reading from load

#TESING Output8B
sdo[0x6411][16] = 1000 : sdo[0x5003][16] = 10.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8B
#verify reading from load

#TESING Output8B
sdo[0x6411][16] = 1100 : sdo[0x5003][16] = 11.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8B
#verify reading from load

#TESING Output8B
sdo[0x6411][16] = 1200 : sdo[0x5003][16] = 12.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8B
#verify reading from load

#TESING Output8B
sdo[0x6411][16] = 1300 : sdo[0x5003][16] = 13.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8B
#verify reading from load

#TESING Output8B
sdo[0x6411][16] = 1400 : sdo[0x5003][16] = 14.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8B
#verify reading from load

#TESING Output8B
sdo[0x6411][16] = 1500 : sdo[0x5003][16] = 15.0 | 1 | 0.5 : WAIT = 0.5
#verify reading  Output8B
#verify reading from load

#switch out load line, clear current
sdo[0x6411][16] = 0 : NULL : WAIT = 0.1
J3_04 = 0 : NULL : WAIT = 0.5
J4_01 = 0 : NULL : WAIT = 0.2
J4_03 = 0 : NULL : WAIT = 0.2
PRE_OPERATIONAL
SAVE
END
