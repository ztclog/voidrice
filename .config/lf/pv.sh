#!/bin/zsh
case "$(file --dereference --brief --mime-type -- "$1")" in
	text/*) highlight -O ansi "$1";;
	*)      mediainfo $1;;
esac
