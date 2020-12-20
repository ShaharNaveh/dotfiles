" Python
" Disable python2 support
let g:loaded_python_provider = 0
let g:python3_host_prog = expand('$HOME') . '/.venvs/neovim/.venv/bin/python3' " Set python3 path



let g:coc_global_extensions = ['coc-json', 'coc-pyright']
