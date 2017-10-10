#!/bin/bash
xfce4-terminal --working-directory="$HOME/poloniexlendingbot" -e "python2 lendingbot.py" -H &
xfce4-terminal -e "sh $HOME/.dotfiles/xsidle.sh 'i3lock'" -H
