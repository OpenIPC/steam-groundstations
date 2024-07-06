## My ssc30kq setup

335-415_greg12wdr.bin: One of gregs custom bins

8812eu.ko: Precompiled rtl8812eu adapter driver

modules.dep: added necessary row for rtl8812eu driver.

mavfwd: tipomans updated mavfwd

channels.sh: run custom commands with rc channel 8

sigmastar.so: tipomans sigmastar driver adjusted for customAE.sh

customAE.sh: script to run to enable custom AE

// expects two numbers separated by comma, first is FPS to read, second is max percent change.
// customAE 20,5 means 20fps, max 10 percent exposure change per frame.
echo customAE 20,5 | nc localhost 4000

#To install 
#First enable plugin support 
cli -s .system.plugins true
#Copy .so file to /usr/lib

#To start, when majestic is running
echo stopAE 1 | nc localhost 4000
echo customAE 25,7 | nc localhost 4000

#To reload majestic and apply CustomAE
echo stopAE 1 | nc localhost 4000
sleep 0.1
killall -1 majestic
sleep 2
echo customAE 25,7 | nc localhost 4000
#To install 
#First enable plugin support 
cli -s .system.plugins true
#Copy sigmastar.so file to /usr/lib
#Copy customAE.sh to /etc and make it executable
#add the following line to /etc/rc.local (to apply at startup)
/etc/customAE.sh

