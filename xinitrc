xrandr --output VGA1 --auto --left-of HDMI1
xrandr --output HDMI1 --primary

xrdb -merge ~/.Xresources         # update x resources db

xautolock -time 6 -locker "i3lock -d -c 303030" \
-notify 30 \
  -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'" \
&
dropbox &

if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

if [ -s ~/.xinitrc.local ]; then
    sh .xinitrc.local
fi

#xsetroot -solid '#101010' &
feh --bg-center ~/Dropbox/designs/blurred-rainbow-wallpaper.jpg

exec i3
