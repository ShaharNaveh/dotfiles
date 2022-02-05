export HISTFILE=~/.histfile
export HISTSIZE=1000000   # the number of items for the internal history list
export SAVEHIST=1000000   # maximum number of items for the history file

setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

autoload -Uz compinit
compinit -d "$HOME/.cache/zsh/zcompdump-$ZSH_VERSION"
_comp_options+=(globdots)
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

fpath+=~/.config/zsh/funcs/
autoload vpn_connect

#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# vi mode
bindkey -v
export KEYTIMEOUT=1

## Init
setopt PROMPT_SUBST

function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select



PROMPT='%n@%m %~ %# '

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
