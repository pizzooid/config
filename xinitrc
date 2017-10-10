xrandr --output HDMI1 --auto --left-of VGA1
xrandr --output HDMI1 --primary

xrdb -merge ~/.Xresources         # update x resources db
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
xset s 600
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

#sh ~/.dotfiles/xsidle.sh "i3lock -d -c 303030" > ~/.dotfiles/xsidle.out 2> ~/.dotfiles/xsidle.err &
