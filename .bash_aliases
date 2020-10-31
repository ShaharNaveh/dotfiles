# C
alias cat="bat"
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias cp="cp -i"

# E
alias egrep="egrep --color=auto"

# F
alias fgrep="fgrep --color=auto"

# G
alias grep="grep --color=auto"

# L
alias la="exa -a --color=always --group-directories-first"
alias ll="exa -l --color=always --group-directories-first"
alias ls="exa -a -l --color=always --group-directories-first"
alias lt="exa -a -T --color=always --group-directories-first"

# M
alias mirror="sudo reflector -p https --fastest 30 --latest 30 --number 10 --sort score --verbose --save /etc/pacman.d/mirrorlist"
alias mv="mv -i"

# P
alias pacsyu="sudo pacman -Syyu"
alias poweroff="systemctl poweroff"

# R
alias reboot="systemctl reboot"
alias rm="rm -i"

# S
alias shutdown="systemctl poweroff"

# V
alias vi="nvim"
alias vim="nvim"
