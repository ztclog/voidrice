#!/usr/bin/env sh

CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/foot/foot.ini"

case "$1" in
light) sed -i 's/initial-color-theme=[0-9]*/initial-color-theme=1/' "$CONFIG" ;;
dark) sed -i 's/initial-color-theme=[0-9]*/initial-color-theme=2/' "$CONFIG" ;;
default) exit 1 ;;
esac

pkill -u "$USER" --signal=SIGUSR1 ^foot$
