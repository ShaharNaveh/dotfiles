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
alias mirror="sudo reflector --protocol https --age 6 --fastest 10 --latest 10 --number 10 --sort rate --verbose --save /etc/pacman.d/mirrorlist"
alias mv="mv -i"

# P
alias pacsyu="sudo pacman -Syyu"
alias pip_env_base_upgrade="python -m pip install --upgrade wheel && python -m pip install --upgrade setuptools && python -m pip install --upgrade pip"
alias pip_env_req_upgrade='python -m pip install --upgrade --upgrade-strategy "eager" -r'
alias poweroff="systemctl poweroff"

# R
alias reboot="systemctl reboot"
alias rm="rm -i"

# S
alias shutdown="systemctl poweroff"

# V
alias vi="nvim"
alias vim="nvim"
