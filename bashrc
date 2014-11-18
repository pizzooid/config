#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR="vim"

source /etc/profile.d/autojump.sh

# A shortcut function that simplifies usage of xclip.
# - Accepts input from either stdin (pipe), or params.
# ------------------------------------------------
cb() {
  local _scs_col="\e[0;32m"; local _wrn_col='\e[1;31m'; local _trn_col='\e[0;33m'
  # Check that xclip is installed.
  if ! type xclip > /dev/null 2>&1; then
    echo -e "$_wrn_col""You must have the 'xclip' program installed.\e[0m"
  # Check user is not root (root doesn't have access to user xorg server)
  elif [[ "$USER" == "root" ]]; then
    echo -e "$_wrn_col""Must be regular user (not root) to copy a file to the clipboard.\e[0m"
  else
    # If no tty, data should be available on stdin
    if ! [[ "$( tty )" == /dev/* ]]; then
      input="$(< /dev/stdin)"
    # Else, fetch input from params
    else
      input="$*"
    fi
    if [ -z "$input" ]; then  # If no input, print usage message.
      echo "Copies a string to the clipboard."
      echo "Usage: cb <string>"
      echo "       echo <string> | cb"
    else
      # Copy input to clipboard
      echo -n "$input" | xclip -selection c
      # Truncate text for status
      if [ ${#input} -gt 80 ]; then input="$(echo $input | cut -c1-80)$_trn_col...\e[0m"; fi
      # Print status.
      echo -e "$_scs_col""Copied to clipboard:\e[0m $input"
    fi
  fi
}
# Aliases / functions leveraging the cb() function
# ------------------------------------------------
# Copy contents of a file
function cbf() { cat "$1" | cb; }  
# Copy SSH public key
alias cbssh="cbf ~/.ssh/id_rsa.pub"  
# Copy current working directory
alias cbwd="pwd | cb"  
# Copy most recent command in bash history
alias cbhs="cat $HISTFILE | tail -n 1 | cb" 

#SCREEN
case ${TERM} in
    screen*)# PROMPT_COMMAND='echo -ne "\033k\033\0134"'
		# user command to change default pane title on demand
		function title { TMUX_PANE_TITLE="$*"; }

		# function that performs the title update (invoked as PROMPT_COMMAND)
		function update_title { printf "\033]2;%s %s\033\\" $(hostname) ${1}; }

		# default pane title is the name of the current process (i.e. 'bash')
		TMUX_PANE_TITLE=#$(ps -o comm $$ | tail -1)

		# Reset title to the default before displaying the command prompt
		PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'update_title'   

		# Update title before executing a command: set it to the command
		trap 'update_title "$BASH_COMMAND"' DEBUG
esac

settitle() {
    printf "\033k$1\033\\"
}
bash_prompt_command() {
    settitle "`hostname -s`:$PWD"
}
PROMPT_COMMAND=bash_prompt_command
