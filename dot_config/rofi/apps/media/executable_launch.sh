#!/usr/bin/env bash

# The files with the themes we will use for
# the powermenu. Like all configuration in
# rofi, this is also a `.rasi` file. Just
# to be sure, we specify an absolute path.
MSG_THEME="$HOME/.config/rofi/apps/core/message.rasi"
MAIN_THEME="$HOME/.config/rofi/apps/media/style.rasi"


# The modified version of the rofi command
# that we will use to launch the powermenu.
# This is just a prefix though, with the
# right theme file specified.
ROFI_CMD="rofi -theme $MAIN_THEME"


# The logos used for each operation.
PLAY="  "
STOP="  "
PAUSE="  "
NEXT=" 怜 "
PREV=" 玲 "


# The logos used for each player.
VLC="嗢"
CMUS=""
FIREFOX=""
SPOTIFYD=""

# The status flags for playerctl.
PLAY_FLAG="Playing"
PAUSE_FLAG="Paused"
STOP_FLAG="Stopped"


# The current status.
CURRENT_STATUS="$(playerctl status 2>&1)"


# The current players.
IFS=$'\n' read -d "" -ra PLAYERS <<< "$(playerctl --list-all 2>&1)"


# Message dialog.
msg() {
    rofi -theme "$MSG_THEME" -e "$1"
}


# Select a player to act on.
select_player() {
    # Make a list of icons based on players currently active.
    PLAYER_ICONS=""
    for PLAYER in "${PLAYERS[@]}"; do
        if [[ $PLAYER =~ "vlc" ]]; then
            PLAYER_ICONS="$VLC\n$PLAYER_ICONS"
        fi

        if [[ $PLAYER =~ "spotifyd" ]]; then
            PLAYER_ICONS="$SPOTIFYD\n$PLAYER_ICONS"
        fi

        if [[ $PLAYER =~ "firefox" ]]; then
            PLAYER_ICONS="$FIREFOX\n$PLAYER_ICONS"
        fi
    done
    PLAYER_ICONS="$(echo -ne "$PLAYER_ICONS")"

    # Allow the user to choose a player to act on.
    CHOSEN="$(echo -e "$PLAYER_ICONS" | $ROFI_CMD -p "Current players : " -dmenu -selected-row 1)"
    case $CHOSEN in
        $VLC)
            printf "vlc" ;;
        $CMUS)
            printf "cmus" ;;
        $FIREFOX)
            printf "firefox" ;;
        $SPOTIFYD)
            printf "spotifyd" ;;
    esac
}

# Main loop.
main() {

    OPTIONS="$PLAY\n$PAUSE\n$STOP\n$PREV\n$NEXT"
    COMMAND="playerctl --player=$(select_player)"

    NOW_PLAYING="$($COMMAND metadata xesam:title)"

    CHOSEN="$(echo -e "$OPTIONS" | $ROFI_CMD -p "Playing: $NOW_PLAYING" -dmenu -selected-row 1)"
    case $CHOSEN in
        $PLAY)
            $COMMAND play
            ;;
        $PAUSE)
            $COMMAND pause
            ;;
        $STOP)
            $COMMAND stop
            ;;
        $NEXT)
            $COMMAND next
            ;;
        $PREV)
            $COMMAND previous && $COMMAND previous
            ;;
    esac
}

if [[ $CURRENT_STATUS =~ "No players found" ]]; then
    msg "There were no players found."
else
    main
fi
