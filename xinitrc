xrandr --output VGA1 --auto --left-of HDMI1
xrandr --output HDMI1 --primary

xrdb -merge ~/.Xresources         # update x resources db

xset s 300
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
