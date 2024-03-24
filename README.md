# steam-groundstations
OpenIPC Steam Deck Groundstation

Table of contents
installing OpenIPC software on camera module
- Setup viable majestic configuration
- Setup viable wfb_ng configuration
Unlocking Steam Deck & installing dependencies
- unlock rootfs
- unlocking 70hz screen
Acquiring/compiling wfb_ng binaries & libraries
Share key pairs betsween gs/drone
Launch gst-launch1.0 command to decode stream
Streamline usage on Steam Deck
- Launch in Desktop Mode
- Launch in Game Mode

Caveats
If Steam Deck performs a system update, some or all changes may be lost and have to be redone (to be tested).


Command library & explanation
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
wfb-cli
gs

Supported and/or tested devices
Steam Deck LCD with rtl8822ce
ssc338q+imx415 (NOR16MB)

Latency test methodology & result
100hz external monitor
70hz Steam Deck monitor
Samsung S22 SUPERSLOWMO capture (960fps according to samsung)
OpenIPC high resolution timer (https://openipc.org/tools/high-resolution-timer)

TODO
Include the option to use external USB rtl8812au network card (tried using rtl8812bu but buggy)
Connect directional antenna (Eachine Stingpad) to steamdeck network card
Goke GK7205V300 (to be tested)
Create script to facilitate installation
Someone need to test on OLED Steam Deck

