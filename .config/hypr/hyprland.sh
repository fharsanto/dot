#!/bin/sh

cd ~

export _JAVA_AWT_WM_NONREPARENTING=1
export XCURSOR_SIZE=24

# fix nvidia
export LIBVA_DRIVER_NAME=nvidia
export XDG_SESSION_TYPE=wayland
# export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export WLR_NO_HARDWARE_CURSORS=1
export QT_QPA_PLATFORM="wayland;xcb"

export SDL_VIDEODRIVER=wayland
export MOZ_ENABLE_WAYLAND=1

# silences seat socket errors in the log
# https://wiki.archlinux.org/title/Sway#Starting
# https://unix.stackexchange.com/a/657578
export LIBSEAT_BACKEND=logind

exec Hyprland
