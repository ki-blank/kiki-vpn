#!/bin/bash
cat > /usr/local/bin/kiki-core <<EOF
#!/bin/bash
while true; do sleep 60; done
EOF
chmod +x /usr/local/bin/kiki-core

systemctl daemon-reload
systemctl enable --now kikivpn
