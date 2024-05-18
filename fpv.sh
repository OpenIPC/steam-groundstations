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

sudo systemctl start wifibroadcast@gs

#Restart gstreamer if it crashes.
while true
do
gst-launch-1.0 udpsrc port=5600 ! tee name=t t. ! queue ! application/x-rtp,payload=97, clock-rate=90000, encoding-name=H265 ! rtpjitterbuffer latency=1 ! rtph265depay ! vaapih265dec ! videoconvert ! videoscale ! videorate ! video/x-raw,framerate=144/1 ! fpsdisplaysink fps-update-interval=200 video-sink=xvimagesink sync=false t. ! queue leaky=1 ! application/x-rtp, payload=98, encoding-name=OPUS ! rtpjitterbuffer latency=1 ! rtpopusdepay ! opusdec ! audioconvert ! audioresample ! jackaudiosink low-latency=true sync=false async=false
echo "GST crashed with exit code:$?" >> fpv.log
sleep 1
done
