#!/bin/bash
BACKLIGHT=$(which xbacklight)
# check if backlight is installed (which returns a non-empty string)
if [ -n "$BACKLIGHT" ]; then
	INTENSITY=$(xbacklight -get)
	# cast float to integer
	INTENSITY=${INTENSITY/.*}
	echo $INTENSITY
	if [ "$INTENSITY" -ge "1" ]; then
		xbacklight -set 0
	else
		xbacklight -set 5
	fi
else
	echo "no xbacklight detected. Going to exit"
	exit 0
fi
