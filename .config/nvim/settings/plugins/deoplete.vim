let g:python3_host_prog = '/home/bummy/.venvs/neovim/bin/python'
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
