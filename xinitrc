picom -b &
feh --bg-fill $HOME/Pictures/Wallpapers/tree.jpg &
xinput --set-prop "Glorious Model O" "Device Accel Constant Deceleration" 1.65 &
xsetroot -cursor_name left_ptr &
xrandr --output HDMI-0 --mode 1920x1080 --rate 120 &
exec bspwm
