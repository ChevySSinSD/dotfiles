#!/bin/bash
EXTERNAL_OUTPUT="HDMI-1"
INTERNAL_OUTPUT="LVDS-1"

# If EXTERNAL_OUTPUT is connected, check list monitors, 
# If not on list monitors, activate it, if active, turn it off
if xrandr -q | grep -q $EXTERNAL_OUTPUT" connected"; then
# External monitor is connected
	if xrandr --listmonitors | grep -q $EXTERNAL_OUTPUT; then
		if xrandr --listmonitors | grep -q $INTERNAL_OUTPUT; then
			# Both external and interal on, turn off internal
				xrandr --output $INTERNAL_OUTPUT --off
		else
			# External on, internal off, turn on internal
			xrandr --output $INTERNAL_OUTPUT --auto --right-of $EXTERNAL_OUTPUT
		fi
	else
		# External monitor is off, turn it on
		xrandr --output $EXTERNAL_OUTPUT --auto --primary
	fi
else
# No external monitor connected, make internal on and primary
	xrandr --output $INTERNAL_OUTPUT --auto --primary
fi

# Restart i3
i3-msg restart
