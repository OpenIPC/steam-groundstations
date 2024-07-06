#!/bin/sh


if [ $2 -lt 1020 ];then
	iw dev wlan0 set txpower fixed 500

elif [ $2 -gt 1050 ] && [ $2 -lt 1070 ];then
	iw dev wlan0 set txpower fixed 2000

elif [ $2 -gt 1110 ] && [ $2 -lt 1130 ];then
	iw dev wlan0 set txpower fixed 2250

# ----------------------------------------------

elif [ $2 -gt 1150 ] && [ $2 -lt 1190 ];then
	kill -9 $(pidof wfb_tx)
	sed -i 's/^mcs_index=.*/mcs_index='1'/' /etc/wfb.conf	
	wifibroadcast start
	sleep 0.2

elif [ $2 -gt 1210 ] && [ $2 -lt 1250 ];then
	kill -9 $(pidof wfb_tx)
	sed -i 's/^mcs_index=.*/mcs_index='3'/' /etc/wfb.conf	
	wifibroadcast start
	sleep 0.2

elif [ $2 -gt 1270 ] && [ $2 -lt 1310 ];then
	kill -9 $(pidof wfb_tx)
	sed -i 's/^mcs_index=.*/mcs_index='4'/' /etc/wfb.conf	
	wifibroadcast start
	sleep 0.2


# ----------------------------------------------


elif [ $2 -gt 1330 ] && [ $2 -lt 1370 ];then   
	curl localhost/api/v1/set?video0.bitrate=1024
	sleep 0.2

elif [ $2 -gt 1390 ] && [ $2 -lt 1430 ];then
	curl localhost/api/v1/set?video0.bitrate=2048
	sleep 0.2
	
elif [ $2 -gt 1450 ] && [ $2 -lt 1480 ];then   
	curl localhost/api/v1/set?video0.bitrate=3196
	sleep 0.2

# ----------------------------------------------

elif [ $2 -gt 1500 ] && [ $2 -lt 1550 ];then   
	curl localhost/api/v1/set?video0.bitrate=4096

elif [ $2 -gt 1570 ] && [ $2 -lt 1610 ];then   
	curl localhost/api/v1/set?video0.bitrate=6196
	
elif [ $2 -gt 1630 ] && [ $2 -lt 1670 ];then   
	curl localhost/api/v1/set?video0.bitrate=10240

# ----------------------------------------------

elif [ $2 -gt 1690 ] && [ $2 -lt 1720 ];then                                               
	curl localhost/api/v1/set?video0.bitrate=12288

elif [ $2 -gt 1750 ] && [ $2 -lt 1780 ];then
	curl localhost/api/v1/set?video0.bitrate=14336

elif [ $2 -gt 1800 ] && [ $2 -lt 1850 ];then
	curl localhost/api/v1/set?video0.bitrate=16384

# ----------------------------------------------


elif [ $2 -gt 1870 ] && [ $2 -lt 1900 ];then
	kill -9 $(pidof wfb_tx)
	sed -i 's/^mcs_index=.*/mcs_index='1'/' /etc/wfb.conf	
	wifibroadcast start
	sleep 0.2
	yaml-cli -s .video0.size 1456x816
	yaml-cli -s .video0.gopSize 0.25
	yaml-cli -s .video0.fps 90
	yaml-cli -s .video0.bitrate 8192
	yaml-cli -s .isp.exposure 7
	killall -1 majestic
	sleep 0.2

elif [ $2 -gt 1920 ] && [ $2 -lt 1960 ];then
	kill -9 $(pidof wfb_tx)
	sed -i 's/^mcs_index=.*/mcs_index='3'/' /etc/wfb.conf	
	wifibroadcast start
	sleep 0.2
	yaml-cli -s .video0.size 1456x816
	yaml-cli -s .video0.gopSize 1
	yaml-cli -s .video0.fps 90
	yaml-cli -s .video0.bitrate 12384
	yaml-cli -s .isp.exposure 7
	killall -1 majestic
	sleep 0.2

elif [ $2 -gt 1980 ];then
	kill -9 $(pidof wfb_tx)
	sed -i 's/^mcs_index=.*/mcs_index='4'/' /etc/wfb.conf	
	wifibroadcast start
	sleep 0.2
	yaml-cli -s .video0.size 1456x816
	yaml-cli -s .video0.gopSize 1
	yaml-cli -s .video0.fps 90
	yaml-cli -s .video0.bitrate 14262
	yaml-cli -s .isp.exposure 7
	killall -1 majestic
	sleep 0.2
	
fi

exit 1