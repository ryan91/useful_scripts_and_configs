#!/bin/bash
BACKLIGHT=$(which xbacklight)
# check if backlight is installed (which returns a non-empty string)
if [ -n "$BACKLIGHT" ]; then
	if [ "$1" == "inc" ]; then
		xbacklight -inc 10
	elif [ "$1" == "dec" ]; then
		xbacklight -dec 10
	else
		echo "unkown parameter. Do nothing"
	fi
else
	echo "no xbacklight detected. Going to exit"
	exit 0
fi
