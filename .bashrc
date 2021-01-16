#
# ~/.bashrc
#

if [[ $(ps --no-header --pid=$PPID --format=cmd) != "fish" ]]
then
	exec fish
fi

### EXPORT
export TERM="screen-256color"
export HISTCONTROL=ignoredups:erasedups
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTSIZE=1000000
export HISTFILESIZE=1000000

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### PROMPT
PS1='[\u@\h \W]\$ '

### PATH
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

### CHANGE TITLE OF TERMINALS
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac


### SHOPT
shopt -s histappend
shopt -s checkwinsize
#shopt -s cmdhist

### ALIASES
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

### COMPLETION
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash-completion ]; then
		. /usr/share/bash-completion/bash-completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

if [ -d "$HOME/Documents/Studies" ]; then
	export study="$HOME/Documents/Studies"
fi

if [ -f "$HOME/.local/bin/starship" ]; then
	eval "$(starship init bash)"
fi

