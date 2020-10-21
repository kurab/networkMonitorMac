#!/bin/bash
speed_info=`/usr/local/bin/speedtest-cli --simple | grep load | sed -e 's/^.*: //g;s/ M.*$//g'`

ext_info=`curl --silent api.ipify.org --max-time 5`

en0_info=`ifconfig en0 | grep inet | grep netmask | grep -v 127.0.0.1 | awk '{print $2}'`
en2_info=`ifconfig en2 | grep inet | grep netmask | grep -v 127.0.0.1 | awk '{print $2}'`

wait

if [ -n "$speed_info" ];
then
    dl_speed=`echo $speed_info | awk '{print $1}'`
    ul_speed=`echo $speed_info | awk '{print $2}'`

    echo "Download   : $dl_speed Mbps"
    echo "Upload     : $ul_speed Mbps"

    unset speed_info
    unset dl_speed
    unset ul_speed
else
    echo "Download   : -"
    echo "Upload     : -"
fi

echo ""

if [ -n "$ext_info" ];
then
    echo "External   : $ext_info"
else
    echo "External   : OFFLINE"
fi

unset ext_info

if [ -n "$en0_info" ];
then
    wifi_network=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | awk -F: '/ SSID: / {print $2}' | sed -e 's/.*SSID: //'`


    echo "Wi-Fi      : $en0_info"
    echo "- SSID     :$wifi_network"

    unset wifi_network
else
    echo "Wi-Fi      : INACTIVE"
fi

unset en0_info

if [ -n "$en2_info" ];
then
    echo "Ethernet   : $en2_info"
else
    echo "Ethernet   : INACTIVE"
fi

unset en2_info
