call plug#begin(stdpath('data') . '/plugged')
Plug 'morhetz/gruvbox' " Color scheme
Plug 'preservim/nerdtree' " File explorer
Plug 'Xuyuanp/nerdtree-git-plugin' " Integrate git with file explorer
Plug 'ryanoasis/vim-devicons' " Show icons for file types
Plug 'ap/vim-css-color' " View css colors when editing
Plug 'vim-airline/vim-airline' " Show bottom toolbar
Plug 'vim-airline/vim-airline-themes' " Themes for bottom toolbar
Plug 'cespare/vim-toml', { 'for': 'toml' } " TOML syntax
Plug 'dense-analysis/ale' " Syntax checker
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocompletion
Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' } " Jedi support for deoplete
Plug 'davidhalter/jedi-vim', { 'for': 'python' } " Jedi for vim
Plug 'preservim/tagbar' " Display information about functions and variables, Install [ctags]

if executable('rustc')
  Plug 'rust-lang/rust.vim', { 'for': 'rust' } " Rust syntax
  "Plug 'racer-rust/vim-racer', { 'for': 'rust' }
endif


"Plug 'neoclide/coc.nvim', {'branch': 'release'} " Remove [nodejs, npm, yarn] when deleting this.
"Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
"Plug 'tpope/vim-markdown', { 'for': 'markdown' }
"Plug 'sbdchd/neoformat'
"Plug 'itchyny/lightline.vim'
"Plug 'mengelbrecht/lightline-bufferline'
"Plug 'tpope/vim-fugitive'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
call plug#end()
