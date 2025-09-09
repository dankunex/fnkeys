#!/bin/bash

SERVICE_FILE="/etc/systemd/system/FnKeys_patch.service"
SCRIPT_FILE="/usr/local/sbin/FnKeysFix.sh"

if [ "$(id -u)" -ne 0 ]; then
    sudo -v
fi

if [ -f "$SERVICE_FILE" ] && [ -f "$SCRIPT_FILE" ]; then

    sudo systemctl disable FnKeys_patch.service
    sudo rm -f "$SERVICE_FILE"
    sudo rm -f "$SCRIPT_FILE"
    sudo systemctl daemon-reload

    if [ -e /sys/module/hid_apple/parameters/fnmode ]; then
        echo -n 1 | sudo tee /sys/module/hid_apple/parameters/fnmode > /dev/null
    fi

    echo "FnKeys patch uninstalled (auto-uninstall)."
else
    sudo mkdir -p /usr/local/sbin

    cat << 'EOF' | sudo tee "$SCRIPT_FILE" > /dev/null
#!/bin/bash
echo -n 0 | tee /sys/module/hid_apple/parameters/fnmode
EOF

    sudo chmod +x "$SCRIPT_FILE"

    cat << 'EOF' | sudo tee "$SERVICE_FILE" > /dev/null
[Unit]
Description=Function Keys Fix - ivandfx 2025
After=multi-user.target

[Service]
Type=simple
ExecStart=/usr/local/sbin/FnKeysFix.sh

[Install]
WantedBy=multi-user.target
EOF

    sudo systemctl daemon-reload
    sudo systemctl enable FnKeys_patch.service
    sudo "$SCRIPT_FILE"

    echo "FnKeys has been installed (auto-install)."
fi

echo "Run FnKeys again to install."
