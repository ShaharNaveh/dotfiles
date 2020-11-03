let mapleader = "\<Space>"

call plug#begin(stdpath('data') . '/plugged')
" Color scheme
Plug 'morhetz/gruvbox'

" Autocompletion related plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Python source for deoplete
Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }

" Python completion, goto definition etc.
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'

"Plug 'neomake/neomake'
"Plug 'sbdchd/neoformat'
"Plug 'rust-lang/rust.vim'
"Plug 'itchyny/lightline.vim'
"Plug 'mengelbrecht/lightline-bufferline'
"Plug 'cespare/vim-toml'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'tpope/vim-fugitive'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
"Plug 'preservim/nerdtree'
"Plug 'ryanoasis/vim-devicons'
call plug#end()

source $HOME/.config/nvim/settings/plugins/jedi-vim.vim
source $HOME/.config/nvim/settings/plugins/deoplete.vim
source $HOME/.config/nvim/settings/plugins/deoplete-jedi.vim

source $HOME/.config/nvim/settings/plugins/airline-themes.vim
source $HOME/.config/nvim/settings/plugins/nerdtree.vim
source $HOME/.config/nvim/settings/general.vim
source $HOME/.config/nvim/settings/color.vim
source $HOME/.config/nvim/settings/ftplugin.vim
source $HOME/.config/nvim/settings/keymap.vim

"source $HOME/.config/nvim/settings/plugins/lightline.vim
"source $HOME/.config/nvim/settings/plugins/fzf.vim
"source $HOME/.config/nvim/settings/plugins/neoformat.vim
"source $HOME/.config/nvim/settings/plugins/coc.vim
