#!/bin/bash

echo "start: $(date)" >> fpv.log

onExit() {
    echo "stop: $(date)" >> fpv.log

    sudo systemctl stop wifibroadcast@gs
    # sleep 0.1

    sudo modprobe -r rtw88_8822ce
    #sudo modprobe -r 88XXau_wfb
    #sudo modprobe -r 88x2bu
    #sudo modprobe -r 8812eu
    # sleep 0.1

    sudo modprobe rtw88_8822ce
    #sudo modprobe 88XXau_wfb
    #sudo modprobe 88x2bu
    #sudo modprobe 8812eu
}

trap "onExit" EXIT
trap "exit 2" HUP INT QUIT TERM

sudo systemctl stop wifibroadcast@gs

#Pull all available NICS to WFB_NG
echo 'WFB_NICS="'"$(ifconfig | grep -o '\bwlan\w*' | paste -s -d ' ')"'"' | sudo tee /etc/default/wifibroadcast

sudo systemctl start wifibroadcast@gs

#Restart gstreamer if it crashes.
while true
do
#Only video
gst-launch-1.0 udpsrc port=5600 ! queue max-size-time=2600000 ! application/x-rtp,payload=97, clock-rate=90000, encoding-name=H265 ! rtpjitterbuffer drop-on-latency=true latency=26 do-lost=true ! rtph265depay ! vaapih265dec ! videoconvert ! videoscale ! videorate max-rate=100 average-period=100 ! fpsdisplaysink video-sink=xvimagesink sync=false

#Vido + Audio
#gst-launch-1.0 udpsrc port=5600 ! tee name=t t. ! queue max-size-time=2600000 ! application/x-rtp,payload=97, clock-rate=90000, encoding-name=H265 ! rtpjitterbuffer latency=26 ! rtph265depay ! vaapih265dec ! xvimagesink async=false sync=false t. ! queue leaky=1 ! application/x-rtp, payload=98, encoding-name=OPUS ! rtpjitterbuffer latency=10 ! rtpopusdepay ! opusdec ! audioconvert ! audioresample ! jackaudiosink low-latency=true sync=false async=false
echo "GST crashed with exit code:$?" >> fpv.log
sleep 1
done
