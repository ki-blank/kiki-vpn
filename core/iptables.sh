#!/usr/bin/env bash
set -euo pipefail

# Determine default outbound interface
IFACE=$(ip route 2>/dev/null | awk '/default/ {print $5; exit}')
if [ -z "$IFACE" ]; then
  echo "No default interface found, skipping iptables MASQUERADE"
  exit 0
fi

iptables -t nat -A POSTROUTING -o "$IFACE" -j MASQUERADE

# Ensure directory exists for iptables-persistent
mkdir -p /etc/iptables
if command -v iptables-save >/dev/null 2>&1; then
  iptables-save > /etc/iptables/rules.v4 || true
fi
