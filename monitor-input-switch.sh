#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Switch Personal & Work computer
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🧑‍💻

# Documentation:
# @raycast.description Switch monitor, keyboard, mouse from Personal to Work computer
# @raycast.author Rob Gilkes

#Hidapitester https://github.com/todbot/hidapitester (Special thanks to #Marcelhoffs https://github.com/marcelhoffs/input-switcher/)
#BetterDisplay https://github.com/waydabber/BetterDisplay

## Add hidapitester to sudoers
# ALL ALL=(ALL) NOPASSWD:/Users/{username}/Scripts/monitor-input-switch/hidapitester //replace username

# MX MASTER 3 // 046D:B034
# MX KEY S // 046D:B378
# MONTIOR // Personal (HDMI 1) = 17 // Work (DisplayPort 1) = 15

hostname=$(hostname | cut -d '.' -f1)

if [ "$hostname" = "RG-Mac-Studio" ]; then
    #Switch keyboard (2)
    sudo /Users/robertgilkes/Scripts/monitor-input-switch/hidapitester --vidpid 046D:B378 --usage 0x0202 --usagePage 0xff43 --open --length 20 --send-output 0x11,0x00,0x0A,0x1E,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
    #Switch mouse (2)
    /Users/robertgilkes/Scripts/monitor-input-switch/hidapitester --vidpid 046D:B034 --usage 0x0202 --usagePage 0xff43 --open --length 20 --send-output 0x11,0x00,0x0A,0x1E,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
    #Switch monitor input (DisplayPort 1)
    /Applications/BetterDisplay.app/Contents/MacOS/BetterDisplay set -namelike=dell -feature=ddc -vcp=inputSelect -value=15
    echo "Switched to Work computer"
elif [ "$hostname" = "JWL5C29JFW-Robert-Gilkes" ]; then
    #Switch keyboard (1)
    sudo /Users/robertgilkes/Scripts/monitor-input-switch/hidapitester --vidpid 046D:B378 --usage 0x0202 --usagePage 0xff43 --open --length 20 --send-output 0x11,0x00,0x0A,0x1E,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
    #Switch mouse (1)
    /Users/robertgilkes/Scripts/monitor-input-switch/hidapitester --vidpid 046D:B034 --usage 0x0202 --usagePage 0xff43 --open --length 20 --send-output 0x11,0x00,0x0A,0x1E,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
    #Switch monitor input (HDMI 1)
    /Applications/BetterDisplay.app/Contents/MacOS/BetterDisplay set -namelike=dell -feature=ddc -vcp=inputSelect -value=17
    echo "Switch to Personal computer"
fi