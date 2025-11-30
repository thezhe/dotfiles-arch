#!/usr/bin/env sh
set -eu
(
	# shellcheck disable=SC2312
	cd "$(cd -- "$(dirname -- "${0}")" pwd -P)"
	# pacman
	sudo pacman -Syu
	sudo pacman -S amd_ucode firefox gdm git gnome-control-center gnome-logs gnome-disk-utility keepassxc less podman podman-docker shellcheck shfmt ufw
	sudo systemctl mask --now avahi-daemon.service avahi-daemon.socket avahi-dnsconfd.service bluetooth.service bluetooth.target iptables.service ip6tables.service passim.service printer.target ssh-access.target sshd.service sshd@.service sshd-unix-local.socket
	sudo systemctl enable --now gdm ufw
	sudo ufw enable
	# yay
	(
		cd /tmp
		git clone https://aur.archlinux.org/yay-bin.git
		cd yay-bin
		makepkg -si
	)
	yay -S visual-studio-code-bin
	# rootfs
	sudo cp -frT src/rootfs /
	reboot
)
