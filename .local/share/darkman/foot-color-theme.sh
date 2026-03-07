#!/usr/bin/env sh

CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/foot/foot.ini"

case "$1" in
light) sed -i 's/initial-color-theme=.*/initial-color-theme=light/' "$CONFIG" ;;
dark) sed -i 's/initial-color-theme=.*/initial-color-theme=dark/' "$CONFIG" ;;
default) exit 1 ;;
esac

pkill -u "$USER" --signal=SIGUSR1 ^foot$
