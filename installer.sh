#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.

mkfs.ext4 /dev/nvme1n1p2 || {
	echo "Error: unable to format nvme1n1p2"
	exit 1
}
mkfs.fat -F 32 /dev/nvme1n1p1  || {
	echo "Error: unable to format nvme1n1p1"
	exit 1
}
mount /dev/nvme1n1p2 /mnt || {
    echo "Error: unable to mount root path"
	exit 1
}
mount --mkdir /dev/nvme1n1p1 /mnt/boot || {
    echo "Error: unable to mount boot path"
	exit 1
}
mount --mkdir /dev/nvme1n1p3 /mnt/do || {
    echo "Error: unable to mount do path"
	exit 1
}

pacman -S --needed --noconfirm reflector || {
	echo "Error: Failed to install reflector"
	exit 1
}

reflector -c ID,SG -l 7 -f 7 -p https --sort rate --save /mnt/etc/pacman.d/mirrorlist || {
	echo "Error: Failed to update mirrorlist"
	exit 1
}
pacstrap -K /mnt base linux-zen linux-firmware nvidia-dkms amd-ucode nvim fish || {
    echo "Error: unable to pacstrap"
	exit 1
}
genfstab -U /mnt >> /mnt/etc/fstab || {
    echo "Error: unable to genfstab"
	exit 1
}
arch-chroot /mnt || {
    echo "Error: unable arch-chroot"
	exit 1
}

{ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime; hwclock --systohc} || {
    echo "Error ln -s Timezone to Jakarta"
    exit 1
}

cat > /etc/locale.conf << EOF
LANG=en_US.UTF-8
LC_ADDRESS=id_ID.UTF-8
LC_IDENTIFICATION=id_ID.UTF-8
LC_MEASUREMENT=id_ID.UTF-8
LC_MONETARY=id_ID.UTF-8
LC_NAME=id_ID.UTF-8
LC_NUMERIC=id_ID.UTF-8
LC_PAPER=id_ID.UTF-8
LC_TELEPHONE=id_ID.UTF-8
LC_TIME=id_ID.UTF-8
EOF

cat > /etc/vconsole.conf << EOF
KEYMAP=us
EOF

cat > /etc/hostname << EOF
fhtuf
EOF

mkinitcpio -P || {
    echo "Error: unable to mkinitcpio"
	exit 1
}

bootctl --path=/boot install || {
    echo "Error: unable to install bootctl"
    exit 1
}

useradd -m -G wheel -s /usr/bin/fish feridev
passwd feridev

pacman -S --noconfirm xorg gdm gnome
pacman -S --noconfirm bluez bluez-utils base-devel dhclient dnsmasq fish hdparm less nano networkmanager networkmanager-openvpn nmap openssh openvpn sudo xfce4-terminal

systemctl enable NetworkManager.service
systemctl enable gdm

# YAY
# sudo pacman -S --needed --noconfirm base-devel || {
# 	echo "Error: Failed to install yay"
# 	exit 1
# }
# git clone https://aur.archlinux.org/yay-bin.git || {
# 	echo "Error: Failed to clone yay-bin"
# 	exit 1
# }
# cd yay-bin || {
# 	echo "Error: Failed to cd yay-bin"
# 	exit 1
# }
# makepkg -si || {
# 	echo "Error: Failed to make yay-bin"
# 	exit 1
# }
# echo "Installation yay successfully."

# yay -S --needed --noconfirm --asdeps asusctl bcompare brave-bin clickhouse cloudflare-warp-bin cpu-x gcc11 gcc11-libs miniconda3 mongodb-bin mongodb-compass mongodb-tools mongosh-bin optimus-manager optimus-manager-qt postman-bin spotify visual-studio-code-bin zoom  || {
# 	echo "Error: Failed to install app from AUR"
# 	exit 1
# }

# passwd