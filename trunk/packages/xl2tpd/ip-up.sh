#!/bin/sh
/usr/bin/logger "*** L2TP client connected [$*]"
iptables -I INPUT 1 -i $1 -j ACCEPT
iptables -I FORWARD 1 -i $1 -j ACCEPT
iptables -t nat -A POSTROUTING -o $1 -j MASQUERADE
