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
if type -q bat
	alias cat="bat"
end

alias cleanup='sudo pacman -Rns (pacman -Qtdq)'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

if type -q rsync
	alias cp="rsync --archive --human-readable --progress --verbose --whole-file"
else
	alias cp="cp -v -i"
end

alias download_song='youtube-dl -f "bestaudio/best" -ciw -o "%(title)s.%(ext)s" --extract-audio --audio-quality 0 --audio-format mp3'
alias download_video='youtube-dl -f "bestaudio/best" -ciw -o "%(title)s.%(ext)s" --audio-quality 0'
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

if type -q rg
	alias grep="rg"
else
	alias grep="grep --color=auto"
end

if type -q exa
	alias la="exa -a --color=always --group-directories-first"
	alias ll="exa -l --color=always --group-directories-first"
	alias ls="exa -a -l --color=always --group-directories-first"
	alias lt="exa -a -T --color=always --group-directories-first"
else
	alias la="ls -A"
end

alias mirrorr="sudo reflector --protocol https --age 6 --latest 50 --number 20 --sort rate --verbose --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --protocol https --age 6 --latest 50 --number 20 --sort score --verbose --save /etc/pacman.d/mirrorlist"
alias mv="mv -v -i"
alias pacsyu="sudo pacman -Syyu"
alias pip_env_base_upgrade="python -m pip install --upgrade wheel && python -m pip install --upgrade setuptools && python -m pip install --upgrade pip"
alias pip_env_req_upgrade='python -m pip install --upgrade --upgrade-strategy "eager" -r'
alias poweroff="systemctl poweroff"
alias reboot="systemctl reboot"
alias rm="rm -v -i"
alias shutdown="systemctl poweroff"

if type -q nvim
	alias vi="nvim"
	alias vim="nvim"
else
	alias vi="vim"
end

### Starship prompt ###
if type -q starship
	starship init fish | source
end
