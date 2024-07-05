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
Set your password using 'passwd'

Unlock 70hz: https://github.com/ryanrudolfoba/SteamDeck-RefreshRateUnlocker

sudo steamos-readonly disable

sudo touch /etc/pacman.d/gnupg/gpg.conf

sudo bash -lic 'echo "keyserver hkps://keyserver.ubuntu.com" >> /etc/pacman.d/gnupg/gpg.conf'

sudo pacman-key --init

sudo pacman-key --populate

sudo pacman-key --populate archlinux

sudo pacman-key --refresh-keys

sudo pacman --sync --noconfirm base-devel glibc linux-api-headers libpcap libsodium python-setuptools python-pip python-pyroute2 python-future python-twisted python-pyserial iw  python-virtualenv net-tools python-msgpack bc linux-neptune-61 linux-neptune-61-headers dkms

#build rtl8812au
cd

git clone https://github.com/svpcom/rtl8812au.git

cd rtl8812au

make

sudo ./dkms-install.sh


cd

git clone https://github.com/svpcom/wfb-ng.git

cd wfb-ng

make bdist

cd dist

tar -xvf *

sudo cp -rf etc /

sudo cp -rf usr /

sudo cp -rf lib/systemd/system/* /lib/systemd/system/

sudo systemctl daemon-reload

get default gs.key

wget https://github.com/OpenIPC/steam-groundstations/blob/master/gs.key

sudo mv gs.key /etc/

wget https://github.com/OpenIPC/steam-groundstations/blob/master/master.cfg

sudo mv -rf master.cfg /usr/lib/python3.11/site-packages/wfb_ng/conf/

sudo systemctl start wifibroadcast@gs

sudo systemctl status wifibroadcast@gs

## Launch gst-launch1.0 command to decode stream
fpv.sh contains some examples of helper functions for launching gstreamer directly from Steam gamemode. The gstreamer command will work with both audio and video.

## Streamline usage on Steam Deck
How to add a non-steam game to steam deck: https://www.dexerto.com/tech/how-to-add-non-steam-games-to-steam-deck-2082992/

## Resources, Command library & explanation
https://github.com/OpenIPC/wiki/blob/master/en/gpio-settings.md
gpio set/clear/toggle 23/24
https://github.com/OpenIPC/mavfwd
https://github.com/OpenIPC/wiki/blob/master/en/fpv-step-by-step-guide.md
https://openipc.org/majestic-endpoints
https://docs.qgroundcontrol.com/master/en/qgc-user-guide/getting_started/download_and_install.html

https://wiki.archlinux.org/title/Arch_User_Repository
https://aur.archlinux.org/packages/qgroundcontrol

