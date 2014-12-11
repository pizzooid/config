xrandr --output VGA1 --auto --left-of HDMI1
xrandr --output HDMI1 --primary

xrdb -merge ~/.Xresources         # update x resources db

xautolock -time 6 -locker "i3lock -d" &
dropboxd &
kaynav &

if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

xsetroot -solid '#101010' &

exec i3
