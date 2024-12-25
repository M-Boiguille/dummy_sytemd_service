#!/bin/bash

# check sudo
if ! sudo -v > /dev/null 2>&1; then
    echo "Error: You must have sudo privileges to run this script." >&2
    exit 1
fi

dummy_script="/usr/bin/dummy.sh"
dummy_service="/etc/systemd/system/dummy.service"
dummy_symlink="/etc/systemd/system/multi-user.target.wants/dummy.service"

# delete files
echo "Delete files: $dummy_script and $dummy_service"
    sudo systemctl disable dummy > /dev/null 2>&1
    sudo systemctl stop dummy > /dev/null 2>&1
    rm -f "$dummy_script" "$dummy_service"

# check and delete symslink create at installation
echo "Delete symlink: $dummy_symlink"
if [[ -L "$dummy_symlink" ]]; then
    echo "Removing symlink $dummy_symlink..."
    rm -f "$dummy_symlink"
fi

# Reload
echo "Reload systemd daemon"
sudo systemctl daemon-reload

echo "Dummy service has been uninstalled."
