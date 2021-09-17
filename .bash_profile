#
# ~/.bash_profile
#

SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"


[[ -f ~/.bashrc ]] && . ~/.bashrc


#if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
#    exec qtile start --backend wayland
#fi


#[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec startx
fi
