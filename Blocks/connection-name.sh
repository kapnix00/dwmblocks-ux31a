#!/bin/sh
SSID="$(iw dev wlan0 info | awk '/ssid/ {print $2}')"
STAT="$(cat /sys/class/net/wlan0/operstate)"
#STATi set during stat check
if [ -z "$SSID" ] #If unset
then
    SSID="Disconnected"
    STATi=""
fi
if [ $STAT == "up" ] #If set
then
    STATi="ﯱ"
fi
echo -e "$STATi $SSID"
