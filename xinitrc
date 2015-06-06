xrandr --output VGA1 --auto --left-of HDMI1
xrandr --output HDMI1 --primary

xrdb -merge ~/.Xresources         # update x resources db

xautolock -time 6 -locker "i3lock -d -c 303030" &
dropbox &

if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

if [ -s ~/.xinitrc.local ]; then
    sh .xinitrc.local
fi

#xsetroot -solid '#101010' &
feh --bg-center ~/Dropbox/goal1k.png

exec i3
