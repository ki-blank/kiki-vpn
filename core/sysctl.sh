#!/bin/bash
cat > /etc/sysctl.d/99-kiki.conf <<EOF
net.ipv4.ip_forward=1
net.ipv4.conf.all.rp_filter=0
EOF
sysctl --system
