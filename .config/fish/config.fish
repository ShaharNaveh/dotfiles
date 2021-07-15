### Exports ###
set fish_greeting
set TERM "screen-256color"

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan


source "$HOME/.config/fish/functions/builtins.fish"
source "$HOME/.config/fish/functions/aliases.fish" # Load aliases
source "$HOME/.config/fish/functions/environment/init.fish"

### Starship prompt ###
if type -q starship
	starship init fish | source
end
