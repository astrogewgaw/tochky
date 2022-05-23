#!/usr/bin/env bash

THEME="$HOME/.config/rofi/apps/timekeeper/style.rasi"
ROFI_CMD="rofi -theme $THEME"

# Get the current time and date, in terms of day, month
# and year. I prefer the DD-MM-YYYY format when it comes
# to the date, and the 12-hour AM/PM format when it comes
# to the time.

TIME="$(date +"%I:%M %p")"
DAY="$(date +"%A")"
D="$(date +"%d")"
M="$(date +"%m")"
Y="$(date +"%Y")"

OUTPUT="$D\n$M\n$Y"

## Main
CHOSEN="$(echo -e "$OUTPUT" | $ROFI_CMD -p " : $DAY, $TIME" -dmenu -selected-row 1)"
