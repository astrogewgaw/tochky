#!/usr/bin/env bash

# The files with the themes we will use for
# the powermenu. Like all configuration in
# rofi, this is also a `.rasi` file. Just
# to be sure, we specify an absolute path.
MSG_THEME="$HOME/.config/rofi/apps/core/message.rasi"
CONFIRM_THEME="$HOME/.config/rofi/apps/core/confirm.rasi"
MAIN_THEME="$HOME/.config/rofi/apps/powermenu/style.rasi"

# The modified version of the rofi command
# that we will use to launch the powermenu.
# This is just a prefix though, with the
# right theme file specified.
ROFI_CMD="rofi -theme $MAIN_THEME"


# The amount of time the system has been up
# and about for. Using `sed` to chop of the
# part we need.
UPTIME=$(uptime -p | sed -e 's/up //g')


# The logos used for each powermenu command.
LOCK=""
REBOOT=""
LOGOUT=""
SUSPEND="⏾"
POWEROFF=""


# All the options.
OPTIONS="$POWEROFF\n$REBOOT\n$LOCK\n$LOGOUT\n$SUSPEND"


# COnfirmation dialog.
confirm() {
    rofi -i \
         -dmenu \
         -no-fixed-num-lines \
         -theme "$CONFIRM_THEME" \
         -p "Are you sure, $USER?"
}


# Message dialog.
msg() {
    rofi -theme "$MSG_THEME" \
        -e "Available options: (y)es/(n)o."
}


# Choose between "yes" or "no".
choose() {
    if [[
        $1 == "Y" ||
        $1 == "y" ||
        $1 == "yes" ||
        $1 == "YES"
    ]]; then
		$2
	elif [[
        $1 == "N" ||
        $1 == "n" ||
        $1 == "no" ||
        $1 == "NO"
    ]]; then
		exit 0
    else
	    msg
    fi
}


# Main loop.

CHOSEN="$(echo -e "$OPTIONS" | $ROFI_CMD -p "has been up for: $UPTIME." -dmenu -selected-row 2)"

case $CHOSEN in
    $POWEROFF)
        ANSWER=$(confirm &)
        COMMAND="poweroff"
        choose $ANSWER $COMMAND
        ;;
    $REBOOT)
        ANSWER=$(confirm &)
        COMMAND="reboot"
        choose $ANSWER $COMMAND
        ;;
    $LOCK)
        ANSWER=$(confirm &)
        COMMAND="i3lock"
        choose $ANSWER $COMMAND
        ;;
    $LOGOUT)
        ANSWER=$(confirm &)
        COMMAND="i3-msg exit"
        choose $ANSWER $COMMAND
        ;;
    $SUSPEND)
        ANSWER=$(confirm &)
        COMMAND="playectl pause && \
                 amixer set Master mute && \
                 systemctl suspend"
        choose $ANSWER $COMMAND
        ;;
esac
