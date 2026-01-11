#!/bin/bash
IFACE=$(ip route | awk '/default/ {print $5}')
iptables -t nat -A POSTROUTING -o $IFACE -j MASQUERADE
iptables-save > /etc/iptables/rules.v4
