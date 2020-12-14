### Exports ###
set fish_greeting
set TERM "screen-256color"

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan


### Aliases ###
alias cat="bat"
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias cp="cp -i"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias grep="rg"
alias la="exa -a --color=always --group-directories-first"
alias ll="exa -l --color=always --group-directories-first"
alias ls="exa -a -l --color=always --group-directories-first"
alias lt="exa -a -T --color=always --group-directories-first"
alias mirror="sudo reflector --protocol https --age 6 --fastest 10 --latest 10 --number 10 --sort rate --verbose --save /etc/pacman.d/mirrorlist"
alias mv="mv -i"
alias pacsyu="sudo pacman -Syyu"
alias pip_env_base_upgrade="python -m pip install --upgrade wheel && python -m pip install --upgrade setuptools && python -m pip install --upgrade pip"
alias pip_env_req_upgrade='python -m pip install --upgrade --upgrade-strategy "eager" -r'
alias poweroff="systemctl poweroff"
alias reboot="systemctl reboot"
alias rm="rm -i"
alias shutdown="systemctl poweroff"
alias vi="nvim"
alias vim="nvim"

### Starship prompt ###
if test -e "$HOME/.local/bin/starship"
	starship init fish | source
end
