if cat /proc/acpi/button/lid/LID/state | grep -q closed; then
	xrandr --output LVDS-1 --off
fi
