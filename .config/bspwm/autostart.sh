#!/bin/bash

function run {
	if ! pgrep $1; then
		$@ &
	fi
}

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal
#xrandr --newmode "1368x1024_60.00" 115.50 1368 1448 1592 1816 1024 1027 1037 1063 -hsync +vsync
#xrandr --addmode VGA-1 1368x1024_60.00
#xrandr --output VGA-1 --mode 1368x1024_60.00

#$HOME/.config/polybar/launch.sh --colorblocks &

$HOME/.config/polybar/launch.sh

#change your keyboard if you need it
#setxkbmap -layout be

keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

if [ $keybLayout = "be" ]; then
	run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc-azerty &
else
	run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &
fi


xsetroot -cursor_name left_ptr &

killall conky
conky -c $HOME/.config/bspwm/system-overview &

#run variety &
run nm-applet &
run pamac-tray &
numlockx on &
picom --config $HOME/.config/bspwm/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
run volumeicon &
nitrogen --restore &
#run caffeine &
#run vivaldi-stable &
#run firefox &
#run thunar &
#run dropbox &
#run insync start &
#run discord &
#run spotify &
#run atom &
