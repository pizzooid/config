git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si --noconfirm
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si --noconfirm
cd ..
yaourt -Syu xorg xorg-server xorg-server-utils xorg-apps arch-wiki-lite i3-wm i3status dzen2 i3lock xfce4-terminal emacs fasd python-pip rofi ttf-droid python --noconfirm
