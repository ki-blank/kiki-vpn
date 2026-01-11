#!/usr/bin/env bash
set -euo pipefail

# Update script: run local setup if present, otherwise fetch fresh copy from GitHub and run it.
REPO_RAW="https://raw.githubusercontent.com/ki-blank/kiki-vpn/main"
LOCAL_SETUP="/usr/local/kiki/setup.sh"
TMP_SETUP="/tmp/kiki-setup.sh"

if [ -f "$LOCAL_SETUP" ]; then
  echo "Menjalankan setup dari $LOCAL_SETUP ..."
  bash "$LOCAL_SETUP"
  exit 0
fi

echo "Setup lokal tidak ditemukan, mengunduh setup dari repo..."
if curl -fsSL "$REPO_RAW/setup.sh" -o "$TMP_SETUP"; then
  chmod +x "$TMP_SETUP"
  bash "$TMP_SETUP"
  rm -f "$TMP_SETUP"
else
  echo "Gagal mengunduh setup dari $REPO_RAW"
  read -p "Tekan Enter untuk kembali..." _
  kiki
fi
