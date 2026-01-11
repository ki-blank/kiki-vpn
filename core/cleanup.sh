#!/usr/bin/env bash
set -euo pipefail

# Move the downloaded setup.sh into /usr/local/kiki so update menu can run it later.
if [ -f /root/setup.sh ]; then
  mkdir -p /usr/local/kiki
  mv -f /root/setup.sh /usr/local/kiki/setup.sh
  chmod +x /usr/local/kiki/setup.sh
fi

# Remove common temporary artifacts if present (do not remove persistent files).
rm -f /root/.wget-hsts || true
