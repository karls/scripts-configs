#!/bin/zsh
# ~/.xinitrc

###########################################
# STUFF TO RUN ON STARTUP
###########################################

# Start a dbus session, if one isn't already running.
#if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
#						eval `dbus-launch --sh-syntax --exit-with-session`
#fi
#
#eval $(gnome-keyring-daemon)
#export GNOME_KEYRING_PID
#export GNOME_KEYRING_SOCKET

feh --bg-scale ~/Pictures/wallpapers/New\ York\ City\ Madness.jpg &
#xsetroot -cursor_name left_ptr &
#xsetroot -solid black &
#exec /usr/lib/notification-daemon-1.0/notification-daemon &
#exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#exec /usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh &

#exec trayer --edge top --align right --widthtype pixel \
#            --width 80 --height 15 --SetDockType true \
#            --SetPartialStrut true --tint 0x000000 \
#            --transparent true --alpha 0 &
#
#i3status | dzen2 -x 400 -y 0 -w 800 -h 16 -xs 0 -ta r -bg black -fn '-*-terminus-*-*-*-*-12-*-*-*-*-*-*-*' &
#exec wicd-client &
#exec google-chrome &
#exec nm-applet &
#exec pidgin &
exec skype &
#exec dropbox &
#exec thunar --daemon &
#exec dbus-launch thunar &
#exec nautilus --no-desktop &
exec xscreensaver -nosplash &
#exec gnome-volume-control-applet &
exec xrdb -merge .Xresources &
#exec rhythmbox &
#setxkbmap -layout gb
setxkbmap -layout "gb,ee" \ -option "grp:alt_shift_toggle"
xmodmap ~/.xmodmaprc

xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 8 2
#xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 8 200
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 8 6 7 4 5


###########################################
# START WINDOW MANAGER
###########################################
#exec ck-launch-session dbus-launch xmonad
#exec ck-launch-session /home/karl/dev/dwm-5.9/dwm
exec ck-launch-session dbus-launch i3

#kill $GNOME_KEYRING_PID
