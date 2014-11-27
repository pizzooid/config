xrandr --output VGA1 --auto --left-of HDMI1
xrandr --output HDMI1 --primary
exec i3
@xautolock -time 6 -locker "i3lock -d"
