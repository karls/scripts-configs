#!/bin/sh
# ~/.xinitrc

###########################################
# STUFF TO RUN ON STARTUP
###########################################

# Start a dbus session, if one isn't already running.
if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
						eval `dbus-launch --sh-syntax --exit-with-session`
fi

eval $(gnome-keyring-daemon)
export GNOME_KEYRING_PID
export GNOME_KEYRING_SOCKET

#feh --bg-scale ~/Pictures/wallpapers/hello_world.png &
xsetroot -cursor_name left_ptr &
exec trayer --edge top --align right --widthtype percent \
						--width 10 --height 15 --SetDockType true --SetPartialStrut true \
						--tint 0x000000 --transparent true --alpha 0 &
#exec wicd-client &
#exec google-chrome &
exec nm-applet &
exec pidgin &
exec skype &
exec dropbox &
exec thunar --daemon &
exec thunar &
exec xscreensaver -nosplash &
exec xrdb -merge .Xresources &
#exec rhythmbox &
setxkbmap -layout ee
xmodmap ~/.xmodmaprc

#xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1
#xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 8 2
#xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 8 6 7 4 5

###########################################
# START WINDOW MANAGER
###########################################
exec ck-launch-session xmonad

kill $GNOME_KEYRING_PID
