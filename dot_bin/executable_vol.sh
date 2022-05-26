#!/usr/bin/env bash

TAG="vol.sh"
APP="vol.sh"

info()    { amixer -c 0 get Master; }
set()     { amixer -c 0 set Master "$@" > /dev/null; }
toggler() { amixer -D pulse sset Master toggle > /dev/null; }
vol()     { info | tail -1 | awk '{print $4}' | sed 's/[^0-9]*//g'; }
status()  { info | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g'; }

muted() {
    dunstify \
        -u low \
        -i "$1" \
        -a "$APP" \
        -h string:x-dunst-stack-tag:$TAG "Volume muted"
}

volbar() {
    dunstify \
        -u low \
        -i "$1" \
        -a "$APP" \
        -h string:x-dunst-stack-tag:$TAG \
        -h int:value:"$(vol)" "Volume: $(vol)%"
}

if [[ "$@" == "toggle" ]]; then toggler; else set "$@"; fi

if [[ $(vol) == 0 || "$(status)" == "off" ]]; then
    muted "notification-audio-volume-muted"
else
    if [[ $(vol) -gt 0 && $(vol) -le 33 ]]; then
        volbar "notification-audio-volume-low"
    elif [[ $(vol) -gt 33 && $(vol) -le 66 ]]; then
        volbar "notification-audio-volume-medium"
    elif [[ $(vol) -gt 66 && $(vol) -le 100 ]]; then
        volbar "notification-audio-volume-high"
    fi
fi
