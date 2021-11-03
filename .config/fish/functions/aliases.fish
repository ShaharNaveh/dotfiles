if command -s btm > /dev/null
	alias btm="btm --color nord --group"
end

if command -s rsync > /dev/null
	alias cp="rsync --archive --human-readable --progress --verbose --whole-file"
else
	alias cp="cp -v -i"
end

if command -s rg > /dev/null
	alias grep="rg"
else
	alias grep="grep --color=auto"
end

if command -s exa > /dev/null
	alias la="exa -a --color=always --group-directories-first"
	alias ll="exa -l --color=always --group-directories-first"
	alias ls="exa -a -l --color=always --group-directories-first"
	alias lt="exa -a -T --color=always --group-directories-first"
else
	alias la="ls -A -h"
	alias ll="ls -l -h"
	alias lla="ls -A -l -h"
end

if command -s nvim > /dev/null
	alias vi="nvim"
	alias vim="nvim"
else
	alias vi="vim"
end

alias cleanup='sudo pacman -Rns (pacman -Qtdq)'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias download_song='youtube-dl -f "bestaudio/best" -ciw -o "%(title)s.%(ext)s" --extract-audio --audio-quality 0 --audio-format mp3'
alias download_video='youtube-dl -f "bestaudio/best" -ciw -o "%(title)s.%(ext)s" --audio-quality 0'

alias egrep="egrep --color=auto"

alias fgrep="fgrep --color=auto"

alias mirrorr="sudo reflector --protocol https --age 6 --latest 50 --number 20 --sort rate --verbose --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --protocol https --age 6 --latest 50 --number 20 --sort score --verbose --save /etc/pacman.d/mirrorlist"
alias mv="mv -v -i"

alias pacsyu="sudo pacman -Syyu"
alias pip_env_base_upgrade="python -m pip install --upgrade wheel && python -m pip install --upgrade setuptools && python -m pip install --upgrade pip"
alias pip_env_req_upgrade='python -m pip install --upgrade --upgrade-strategy "eager" -r'
alias poweroff="systemctl poweroff"

alias reboot="systemctl reboot"
alias rm="rm -v -I"

alias shutdown="systemctl poweroff"
