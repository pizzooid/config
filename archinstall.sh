git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..
yaourt -Syu i3-wm i3status dzen2 i3lock xfce4-terminal emacs fasd python-pip rofi --noconfirm
