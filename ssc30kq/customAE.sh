#!/bin/sh

sleep 5
echo stopAE 1 | nc localhost 4000
sleep 0.1
killall -1 majestic
sleep 2
echo customAE 25,7 | nc localhost 4000