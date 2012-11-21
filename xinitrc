#!/bin/zsh
# ~/.xinitrc

###########################################
# STUFF TO RUN ON STARTUP
###########################################

export DESKTOP_WALLPAPER="~/Pictures/wallpapers/New\ York\ City\ Madness.jpg"
feh --bg-scale $(echo $DESKTOP_WALLPAPER) &
exec volumeicon &
exec skype &
exec xscreensaver -nosplash &
xrdb -merge .Xresources
setxkbmap -layout "gb,ee" \ -option "grp:alt_shift_toggle"
xmodmap ~/.xmodmaprc

xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 8 2
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 8 6 7 4 5


###########################################
# START WINDOW MANAGER
###########################################
#exec ck-launch-session dbus-launch xmonad
#exec ck-launch-session /home/karl/dev/dwm-5.9/dwm
exec ck-launch-session dbus-launch i3
