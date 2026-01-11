#!/usr/bin/env bash
set -euo pipefail

# Interactive license updater
LIC_DIR="/etc/kiki"
LIC_FILE="$LIC_DIR/license"

mkdir -p "$LIC_DIR"

echo "===== Update License ====="
read -rp "Masukkan License (mis. IDUDPZI): " NEW_LICENSE
read -rp "Masukkan tanggal Expiry (YYYY-MM-DD) atau kosong untuk 'none': " NEW_EXP

if [ -z "$NEW_LICENSE" ]; then
  echo "License kosong — dibatalkan."
  sleep 1
  kiki
fi

if [ -n "$NEW_EXP" ]; then
  # Validate date
  if ! date -d "$NEW_EXP" >/dev/null 2>&1; then
    echo "Format tanggal tidak valid. Gunakan YYYY-MM-DD."
    sleep 2
    kiki
  fi
else
  NEW_EXP="none"
fi

cat > "$LIC_FILE" <<EOF
LICENSE=$NEW_LICENSE
EXPIRED=$NEW_EXP
EOF

echo "License diperbarui:"
cat "$LIC_FILE"
sleep 1
kiki
