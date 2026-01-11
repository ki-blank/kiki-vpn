#!/usr/bin/env bash
set -euo pipefail

LIC_DIR="/etc/kiki"
LIC_FILE="$LIC_DIR/license"

mkdir -p "$LIC_DIR"

# If license already exists, do not overwrite it during install.
if [ -f "$LIC_FILE" ]; then
  exit 0
fi

# Create a safe default license file when none exists.
cat > "$LIC_FILE" <<EOF
LICENSE=UNREGISTERED
EXPIRED=none
EOF
