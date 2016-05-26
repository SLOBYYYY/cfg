
HDMI_LINES=$(xrandr -q | egrep -A1 '^HDMI[0-9] connected')
HDMI_NAME=$(echo $HDMI_LINES | head -n 1 | awk '{ print $1 }')
HDMI_RESOLUTION=$(echo "$HDMI_LINES" | tail -n 1 | egrep -o '[0-9]{3,4}x[0-9]{3,4}')

DVI_LINES=$(xrandr -q | egrep -A1 '^DVI-[0-9]-[0-9] connected')
DVI_NAME=$(echo $DVI_LINES | head -n 1 | awk '{ print $1 }')
DVI_RESOLUTION=$(echo "$DVI_LINES" | tail -n 1 | egrep -o '[0-9]{3,4}x[0-9]{3,4}')

if [ "$DVI_LINES" = "" ] && [ "$HDMI_LINES" = "" ]; then
	# only laptop
	echo "Only laptop"
	xrandr --output LVDS1 --mode 1366x768 --pos 0x0 --auto --primary  \
		--output VIRTUAL1 --off \
		--output DP1 --off \
		--output VGA-1-1 --off \
		--output VGA2 --off 
elif [ "$HDMI_LINES" != "" ] && [ "$DVI_LINES" = "" ]; then
	# laptop + HDMI
	echo "Laptop + HDMI"
	xrandr --output LVDS1 --mode 1366x768 --right-of ${HDMI_NAME} --auto \
		--output ${HDMI_NAME} --mode ${HDMI_RESOLUTION} --auto --primary \
		--output VIRTUAL1 --off \
		--output DP1 --off  \
		--output VGA-1-1 --off  \
		--output VGA2 --off 
elif [ "$HDMI_LINES" = "" ] && [ "$DVI_LINES" != "" ]; then
	# laptop + HDMI
	echo "Laptop + DVI"
	xrandr --output LVDS1 --mode 1366x768 --right-of ${DVI_NAME} --auto \
		--output ${DVI_NAME} --rotate normal --mode ${DVI_RESOLUTION} --auto --primary \
		--output VIRTUAL1 --off \
		--output DP1 --off  \
		--output VGA-1-1 --off  \
		--output VGA2 --off 
else
	# laptop + HDMI + DVI
	echo "Laptop + HDMI + DVI"
	xrandr --output LVDS1 --rotate normal --mode 1366x768 --right-of ${HDMI_NAME} \
		--output ${DVI_NAME} --rotate normal --mode ${DVI_RESOLUTION} --left-of ${HDMI_NAME} \
		--output ${HDMI_NAME} --mode ${HDMI_RESOLUTION} --rotate normal --primary \
		--output VIRTUAL1 --off \
		--output DP1 --off \
		--output VGA-1-1 --off  \
		--output VGA2 --off
fi
