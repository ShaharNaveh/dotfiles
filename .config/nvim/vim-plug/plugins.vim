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
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

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
