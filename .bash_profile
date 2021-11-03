#
# ~/.bash_profile
#
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export LESSHISTFILE="-"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"


[[ -f ~/.bashrc ]] && . ~/.bashrc


#if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
#    exec qtile start --backend wayland
#fi


#[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1

#if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
#  exec startx
#fi

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
