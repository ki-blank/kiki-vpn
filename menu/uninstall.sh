#!/bin/bash
systemctl disable --now kikivpn
rm -rf /usr/local/kiki /etc/kiki
rm -f /usr/local/bin/kiki
rm -f /etc/systemd/system/kikivpn.service
systemctl daemon-reload
echo "Uninstalled"
exit
