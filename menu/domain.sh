#!/bin/bash
read -p "Input domain: " d
echo "$d" > /etc/kiki/domain
kiki
