#!/bin/sh
/usr/bin/logger "*** L2TP client disconnected [$*]"
iptables -D INPUT -i $1 -j ACCEPT
iptables -D FORWARD -i $1 -j ACCEPT
iptables -t nat -D POSTROUTING -o $1 -j MASQUERADE
