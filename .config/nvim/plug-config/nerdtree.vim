let g:NERDTreeDirArrows = 1
let g:NERDTreeIgnore = ['\.egg-info$', '^\.coverage$', '^\.git$', '^\.hypothesis$', '^\.mypy_cache$', '^\.tox$', '^\.pytest_cache$', '^__pycache__$']
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
