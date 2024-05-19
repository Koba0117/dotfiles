#!/bin/bash
PARAM1=$1
PARAM2=$2
APP_NAME=''
REPLACE_ID=0
APP_ICON=''
SUMMARY=''
BODY=''
ACTIONS='[]'
HINT='{"urgency": <1>}'
EXPIRE_TIMEOUT=5000
if [ $PARAM1 -eq 0 ]; then
	if [ $PARAM2 -eq 0 ]; then
		pactl set-sink-volume @DEFAULT_SINK@ +5%
		VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1)
		SUMMARY='Volume Raised'
		BODY="The volume is raised to $VOLUME"
	elif [ $PARAM2 -eq 1 ]; then
		pactl set-sink-volume @DEFAULT_SINK@ -5%
		VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1)
		SUMMARY='Volume Lowered'
		BODY="The volume is lowered to $VOLUME"
	elif [ $PARAM -eq 2 ]; then
		pactl set-sink-mute @DEFAULT_SINK@ toggle
		SUMMARY='Speaker Toggled'
		BODY='The speaker/headphone is toggled'
	fi
elif [ $PARAM1 -eq 1 ]; then
	if [ $PARAM2 -eq 0 ]; then
		ddcutil setvcp -d 1 10 + 5 && ddcutil setvcp -d 2 10 + 5
		BRIGHTNESS=$(ddcutil getvcp 10 | grep -Po '\d+(?=,)' | head -n 1)
		SUMMARY='Brightness Increased'
		BODY="The monitor brightness is increased to $BRIGHTNESS"
	elif [ $PARAM2 -eq 1 ]; then
		ddcutil setvcp -d 1 10 - 5 && ddcutil setvcp -d 2 10 - 5
		BRIGHTNESS=$(ddcutil getvcp 10 | grep -Po '\d+(?=,)' | head -n 1)
		SUMMARY='Brightness Decreased'
		BODY="The monitor brightness is decreased to $BRIGHTNESS"
	fi
fi

gdbus call --session \
	--dest=org.freedesktop.Notifications \
	--object-path=/org/freedesktop/Notifications \
	--method=org.freedesktop.Notifications.Notify \
	"$APP_NAME" $REPLACE_ID "$APP_ICON" "$SUMMARY" "$BODY" "$ACTIONS" "$HINT" $EXPIRE_TIMEOUT
