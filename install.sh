#!/usr/bin/env sh
set -eu
install_script_dir="$(cd -- "$(dirname -- "${0}")" && pwd -P)"
## pacman
sudo pacman -Syu
sudo pacman -S \
# firmware
amd_ucode fwupd \
# GNOME
gdm gnome-control-center gnome-logs \
# base
firefox gnome-disk-utility keepassxc less ufw \
# audio
easyeffects gnome-music qtractor \
# dev
base-devel cmake git osv-scanner shellcheck shfmt
## systemctl
sudo systemctl enable --now gdm ufw
sudo systemctl mask --now avahi-daemon avahi-daemon.socket iptables ip6tables sshd
## ufw
sudo ufw enable
## yay
(
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
)
yay -S visual-studio-code-bin
## rootfs
sudo cp -frT "${install_script_dir}/rootfs" /
## HOME
cp -frT "${install_script_dir}/home" "${HOME}"
## fwupdmgr
fwupdmgr refresh
fwupdmgr update
fwupdmgr security
## Epilogue
printf 'Restart to apply changes\n'
