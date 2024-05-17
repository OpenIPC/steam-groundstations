#!/bin/bash

echo "start: $(date)" >> fpv.log

onExit() {
    echo "stop: $(date)" >> fpv.log

    sudo systemctl stop wifibroadcast@gs
    # sleep 0.1

    sudo modprobe -r rtw88_8822ce
    # sleep 0.1

    sudo modprobe rtw88_8822ce
}

trap "onExit" EXIT
trap "exit 2" HUP INT QUIT TERM

sudo systemctl stop wifibroadcast@gs
# sleep 0.1

sudo systemctl start wifibroadcast@gs
# sleep 0.1

gst-launch-1.0 udpsrc port=5600 buffer-size=65536 ! application/x-rtp, clock-rate=90000, encoding-name=H265 ! rtpjitterbuffer ! rtph265depay ! vaapih265dec ! xvimagesink async=false sync=false
