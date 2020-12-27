call plug#begin(stdpath('data') . '/plugged')
Plug 'morhetz/gruvbox' " Color scheme
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color' " View css colors when editing



" Autocompletion related plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Python source for deoplete
Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }

" Python completion, goto definition etc.
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

Plug 'dense-analysis/ale'


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'preservim/tagbar'



Plug 'cespare/vim-toml'

if executable('rustc')
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  "Plug 'racer-rust/vim-racer', { 'for': 'rust' }
endif


"Plug 'preservim/tagbar'
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
