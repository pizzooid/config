#
# ~/.bashrc
#

export PATH=$PATH:/home/pietro/.cabal/bin/

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias chrome='google-chrome-stable'
#PS1='[\u@\h \W]\$ '
PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\W\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

export EDITOR="vim"
set -o vi

#SCREEN
case ${TERM} in
	screen*)# PROMPT_COMMAND='echo -ne "\033k\033\0134"'
		# function that performs the title update (invoked as PROMPT_COMMAND)
		function update_title { printf "\033]2;%s:%s %s\033\\" $(hostname) $(pwd) ${1}; }

		# Reset title to the default before displaying the command prompt
		PROMPT_COMMAND='update_title'   
		;;
	xterm*|rxvt*)
		export TERM=xterm-256color
		PS1="\[\e]0;\u@\h: \w\a\]$PS1"
		;;
	*)
		;;
esac

sh ~/.dotfiles/base16-default.dark.sh
#"\e[P": delete-char
#stty erase ^H

if [ -f ~/.bashrc.local ]
then
	source ~/.bashrc.local
fi

tput smkx
