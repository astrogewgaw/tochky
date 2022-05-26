#!/usr/bin/env bash

THEMES="$HOME/.bin/assets/themes"

MSGTHEME="$THEMES/msg.rasi"
MAINTHEME="$THEMES/main.rasi"
CFMTHEME="$THEMES/confirm.rasi"

LOCK=""
REBOOT=""
LOGOUT=""
SUSPEND="⏾"
POWEROFF=""

mtime()   { uptime -p | sed -e 's/up //g'; }
mrofi()   { rofi -dmenu -no-fixed-num-lines "$@"; }
opts()    { echo -e "$POWEROFF\n$REBOOT\n$LOCK\n$LOGOUT"; }
confirm() { mrofi -i -theme "$CFMTHEME" -p "Are you sure, ${USER^}?"; }
msg()     { rofi -theme "$MSGTHEME" -e "Available options: (y)es/(n)o."; }


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


main() {
    case "$(opts | mrofi -theme "$MAINTHEME")" in
        $LOCK) choose "$(confirm &)" "i3lock" ;;
        $REBOOT) choose "$(confirm &)" "reboot" ;;
        $POWEROFF) choose "$(confirm &)" "poweroff" ;;
        $LOGOUT) choose "$(confirm &)" "i3-msg exit" ;;
    esac
}

main
