#!/bin/bash

set -e 

pacman -S --noconfirm bluez bluez-utils networkmanager-openvpn nmap openssh 

git clone https://aur.archlinux.org/yay-bin.git || {
	echo "Error: Failed to clone yay-bin"
	exit 1
}
cd yay-bin || {
	echo "Error: Failed to cd yay-bin"
	exit 1
}
makepkg -si || {
	echo "Error: Failed to make yay-bin"
	exit 1
}
echo "Installation yay successfully."

yay -S awesome-git rofi-git picom-jonaburg-git ttf-meslo-nerd-font-powerlevel10k ttf-jetbrains-mono
yay -S wezterm rofi acpi acpid acpi_call lxappearance-gtk3 jq polkit-gnome xdotool xclip gpick ffmpeg redshift pipewire pipewire-alsa pipewire-pulse alsa-utils brightnessctl feh maim mpv mpd mpc mpdris2 python-mutagen ncmpcpp playerctl --needed

pacman -S papirus-icon-theme upower bluez bluez-utils blueman xorg-setxkbmap xfce4-power-manager playerctl light-locker alacritty thunar flameshot

systemctl enable bluetooth.service

yay -S --needed --noconfirm --asdeps bcompare brave-bin cloudflare-warp-bin mongodb-compass postman-bin visual-studio-code-bin zoom  || {
	echo "Error: Failed to install app from AUR"
	exit 1
}