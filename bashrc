#
# ~/.bashrc
#

export PATH=$PATH:/home/pietro/.cabal/bin/:/home/pietro/Sumatra/bin:/home/pietro/.local/bin

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias chrome='google-chrome-stable'
alias emax="emacsclient -t"

function spacemacs()
{
    if [[ $1 && ${1-x} ]]
    then
        emacsclient -c "$1" &
    else
        emacsclient -c &
    fi
}
#PS1='[\u@\h \W]\$ '
PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\W\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

export EDITOR="emacsclient -t"
export VISUAL="emacsclient -c -a emacs"

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

if [ -f ~/.dir_colors ]
then
	eval 'dircolors ~/.dir_colors'
fi

fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
alias jk='f -e "emacsclient -c"'

unset fasd_cachetput smkx
