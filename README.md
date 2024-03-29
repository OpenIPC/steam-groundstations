# steam-groundstations
OpenIPC Steam Deck Groundstation

## Table of contents
Overview
Installing OpenIPC software on camera module
Unlocking Steam Deck & installing dependencies
Acquiring/compiling wfb_ng binaries & libraries
Share key pairs betsween gs/drone
Launch gst-launch1.0 command to decode stream
Streamline usage on Steam Deck
Latency test methodology & result
TODO

## Overview
### Caveats
If Steam Deck performs a system update, some or all changes may be lost and have to be redone (to be tested).
To overcome this, rwfus can be used: https://github.com/ValShaped/rwfus (not tested)


### Supported and/or tested devices
Steam Deck LCD with rtl8822ce (tested working, show rssi in wfb-cli gs)
Ugreen rtl8812bu (tested, working. Does not show rssi in wfb-cli gs)
ssc338q+imx415 (NOR16MB)
GK7205V300+IMX335 to be tested

## Installing OpenIPC software on camera module
- Setup viable majestic configuration
- Setup viable wfb_ng configuration

## Unlocking Steam Deck & installing dependencies
- unlock rootfs
- unlocking 70hz screen
- 
## Acquiring/compiling wfb_ng binaries & libraries

## Share key pairs betsween gs/drone

## Launch gst-launch1.0 command to decode stream

## Streamline usage on Steam Deck
- Launch in Desktop Mode
- Launch in Game Mode

## Latency test methodology & result
### Equipment
144hz arzopa portable monitor https://www.arzopa.com/products/z1fc-16-1-fhd-144hz-portable-monitor
100hz Asus external monitor
70hz overclocked Steam Deck LCD
60hz Steam Deck LCD 
Samsung S22 SUPERSLOWMO capture (960fps according to samsung)
OpenIPC high resolution timer (https://openipc.org/tools/high-resolution-timer)
### Settings
majestic.yaml
iq.ini
imx415_fpv.bin
wifibroadcast

### Test schedule
|Test description|GS|CAM|WiFi|Resolution|FPS|Monitor&HZ|Frame1|Frame2|Frame3|Frame4|Frame5|AVG|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|Nice resolution 1|SD|ssc338q+imx415|Drone@rtl8812au->GS@rtl8812bu|1920x1080|30|Steamdeck 60hz|x1|x2|x3|x4|x5|avg|
|Nice resolution 2|SD|ssc338q+imx415|Drone@rtl8812au->GS@rtl8812bu|1920x1080|30|Steamdeck 70hz|x1|x2|x3|x4|x5|avg|
|Nice resolution 3|SD|ssc338q+imx415|Drone@rtl8812au->GS@rtl8812bu|1920x1080|60|Asus 100hz 60hz|x1|x2|x3|x4|x5|avg|
|Nice resolution 4|SD|ssc338q+imx415|Drone@rtl8812au->GS@rtl8812bu|1920x1080|60|Arzopa Z1FC 144hz|x1|x2|x3|x4|x5|avg|
|FPV 1|SD|ssc338q+imx415|Drone@rtl8812au->GS@rtl8812bu|1280x720|90|Steamdeck 60hz|x1|x2|x3|x4|x5|avg|
|FPV 2|SD|ssc338q+imx415|Drone@rtl8812au->GS@rtl8812bu|1280x720|90|Steamdeck 70hz|x1|x2|x3|x4|x5|avg|
|FPV 3|SD|ssc338q+imx415|Drone@rtl8812au->GS@rtl8812bu|1280x720|90|Asus 100hz|x1|x2|x3|x4|x5|avg|
|FPV 4|SD|ssc338q+imx415|Drone@rtl8812au->GS@rtl8812bu|1280x720|90|Arzopa Z1FC 144hz|x1|x2|x3|x4|x5|avg|

## Resources, Command library & explanation
https://github.com/OpenIPC/wiki/blob/master/en/gpio-settings.md
gpio set/clear/toggle 23/24
https://github.com/OpenIPC/mavfwd
https://github.com/OpenIPC/wiki/blob/master/en/fpv-step-by-step-guide.md
https://openipc.org/majestic-endpoints
https://docs.qgroundcontrol.com/master/en/qgc-user-guide/getting_started/download_and_install.html

https://wiki.archlinux.org/title/Arch_User_Repository
https://aur.archlinux.org/packages/qgroundcontrol

pacman -S
...
iwconfig
...
ifconfig
...
nw
...
systemctl
daemon-reload
start/stop wifibroadcast@gs
...
wfb-cli gs

## TODO
Include the option to use external USB rtl8812au network card
Connect directional antenna (Eachine Stingpad) to steamdeck network card (will not do this, but theoretically possible)
Create script to facilitate wfb_ng installation
Someone need to test on OLED Steam Deck

