#!/bin/sh

# Install snapd
yaourt -Syuu snapd --noconfirm
sudo systemctl enable --now snapd.socket

# Enable apps auto-update
sudo systemctl enable --now snapd.refresh.timer
