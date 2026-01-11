#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

clear
echo "======================================="
echo "     KIKI VPN INSTALLER"
echo "     Ubuntu 20.04"
echo "======================================="

apt update -y
apt upgrade -y

apt install -y \
curl wget git unzip \
iptables iptables-persistent \
ca-certificates gnupg lsb-release \
locales tzdata \
msmtp msmtp-mta mailutils \
rclone

timedatectl set-timezone Asia/Jakarta
locale-gen en_US.UTF-8

mkdir -p /usr/local/kiki/{core,menu}
mkdir -p /etc/kiki

REPO="https://raw.githubusercontent.com/ki-blank/kiki-vpn/main"

for f in sysctl.sh iptables.sh service.sh license.sh cleanup.sh; do
  wget -qO /usr/local/kiki/core/$f $REPO/core/$f
done

for f in kiki account.sh backup.sh clear-expired.sh vps-info.sh domain.sh bot.sh license-update.sh update.sh uninstall.sh; do
  wget -qO /usr/local/kiki/menu/$f $REPO/menu/$f
done

wget -qO /etc/systemd/system/kikivpn.service $REPO/service/kikivpn.service

chmod +x /usr/local/kiki/core/*
chmod +x /usr/local/kiki/menu/*

bash /usr/local/kiki/core/sysctl.sh
bash /usr/local/kiki/core/iptables.sh
bash /usr/local/kiki/core/license.sh
bash /usr/local/kiki/core/service.sh
bash /usr/local/kiki/core/cleanup.sh

ln -sf /usr/local/kiki/menu/kiki /usr/local/bin/kiki
echo "kiki" >> /root/.bash_profile

clear
echo "======================================="
echo " INSTALLATION COMPLETE"
echo " Type: kiki"
echo "======================================="
