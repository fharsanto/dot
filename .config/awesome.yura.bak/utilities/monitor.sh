#!/usr/bin/env bash

function run {
    if ! pgrep $1 ; then
        $@&
    fi
}
# trackpad tap
xinput set-prop "ASUP1205:00 093A:2008 Touchpad" "libinput Tapping Enabled" 1

if xrandr | grep 'HDMI-1-0 connected' ; then
    xrandr --output eDP-2 --mode 1920x1080 --rate 144.00 --primary --output HDMI-1-0 --right-of eDP-2 --mode 1920x1080 --rate 60
    echo "trying connect HDMI"
fi

