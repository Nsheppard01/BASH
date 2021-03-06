#!/bin/bash
#Stolen from https://bbs.archlinux.org/viewtopic.php?id=154094

#Give a name to the terminal window.
TITLE="Wallterm2"
#HxW size given in # of charactors. Example: 25x60
DIMENSIONS=107x35
#X+Y position given in pixels. Example: 100+200
POSITION=639+400
TERMOPTS="--hide-borders --hide-toolbar --hide-menubar --title=$TITLE"

if [[ -z $DIMENSIONS || -z $POSITION ]] || [[ -z $TITLE ]] ; then
	echo "wallterm has not been configured! Please edit this script before running it."
	exit 1
fi

xfce4-terminal $TERMOPTS --geometry=$DIMENSIONS+$POSITION &
#gnome-terminal $TERMOPTS --geometry=$DIMENSIONS+$POSITION &

opt1="-r "$TITLE" -b add,below,sticky"
opt2="-r "$TITLE" -b add,skip_taskbar,skip_pager"

while true 
do
	if [[ "$(wmctrl -l | grep -o "$TITLE")" = $TITLE ]] ; then 
		wmctrl $opt1 && wmctrl $opt2
		echo 'done!'
		break
	fi
done
