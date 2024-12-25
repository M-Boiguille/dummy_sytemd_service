#!/bin/bash

# Check sudo
if ! sudo -v > /dev/null 2>&1; then
    echo "Error: You must have sudo privileges to run this script." >&2
    exit 1
fi

dummy_script="/usr/bin/dummy.sh"
dummy_service="/etc/systemd/system/dummy.service"

# Handle forced option (-f)
if [[ $# -eq 1 && "$1" == "-f" ]]; then
    echo "Forcing overwrite: $dummy_script and $dummy_service"
    sudo systemctl disable dummy > /dev/null 2>&1
    sudo systemctl stop dummy > /dev/null 2>&1
    rm -f "$dummy_script" "$dummy_service"
fi

# Create dummy script
if [[ -f "$dummy_script" ]]; then
    echo "Error: $dummy_script already exists | use -f to force"
    exit 1
else
    cat <<EOF >"$dummy_script"
#!/bin/bash

while true; do
  echo "Dummy service is running..." >> /var/log/dummy-service.log
  sleep 10
done
EOF
    chmod +x "$dummy_script"
    echo "$dummy_script is created"
fi

# Create dummy service
if [[ -f "$dummy_service" ]]; then
    echo "Error: $dummy_service already exists | use -f to force"
    exit 2
else
    cat <<EOF >"$dummy_service"
# Dummy Systemd Service
# Roadmapsh

[Unit]
Description=Dummy Systemd Service

[Service]
ExecStart=$dummy_script
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
    echo "$dummy_service is created"
fi

# Reload systemd and start service
sudo systemctl daemon-reload
sudo systemctl enable dummy
sudo systemctl start dummy

echo "Dummy service has been installed and started successfully."
