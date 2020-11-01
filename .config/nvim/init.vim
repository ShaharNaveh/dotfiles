set nocompatible

let mapleader = "\<Space>"

call plug#begin(stdpath('data') . '/plugged')

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox' " Color scheme
Plug 'rust-lang/rust.vim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'cespare/vim-toml'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'tpope/vim-fugitive'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
"Plug 'preservim/nerdtree'
"Plug 'ryanoasis/vim-devicons'

call plug#end()

source $HOME/.config/nvim/settings/general.vim
source $HOME/.config/nvim/settings/color.vim
source $HOME/.config/nvim/settings/ftplugin.vim
source $HOME/.config/nvim/settings/plugins/nerdtree.vim
source $HOME/.config/nvim/settings/keymap.vim
source $HOME/.config/nvim/settings/plugins/fzf.vim
"source $HOME/.config/nvim/settings/plugins/coc.vim
source $HOME/.config/nvim/settings/plugins/lightline.vim
source $HOME/.config/nvim/settings/plugins/deoplete.vim
