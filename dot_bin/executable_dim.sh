#!/usr/bin/env bash

TAG="dim.sh"
APP="dim.sh"

info() { brightnessctl i; }
set()  { brightnessctl s "$@" > /dev/null; }
dim()  { info | grep "Current" | awk '{print $4}' | sed 's/[^0-9]*//g'; }

dimbar() {
    dunstify \
        -u low \
        -a "$APP" \
        -h string:x-dunst-stack-tag:$TAG \
        -i notification-display-brightness \
        -h int:value:"$(dim)" "Brightness: $(dim)%"
}

set "$@"; dimbar;
