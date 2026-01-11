#!/bin/bash
set -e
clear
echo "Downloading KIKI VPN installer..."
wget -qO /root/setup.sh https://raw.githubusercontent.com/ki-blank/kiki-vpn/main/setup.sh
chmod +x /root/setup.sh
bash /root/setup.sh
