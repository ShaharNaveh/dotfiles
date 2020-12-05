let g:python3_host_prog = expand('$HOME') . '/.venvs/neovim/.venv/bin/python'
let g:deoplete#enable_at_startup = 1

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Maximum candidate window width
call deoplete#custom#source('_', 'max_menu_width', 80)

" Minimum character length needed to activate auto-completion.
call deoplete#custom#source('_', 'min_pattern_length', 0)

" Whether to disable completion for certain syntax
call deoplete#custom#source('_', {
  \ 'filetype': ['python'],
  \ 'disabled_syntaxes': ['Comment']
  \ })

" Ignore certain sources, because they only cause nosie most of the time
call deoplete#custom#option('ignore_sources', {
   \ '_': ['around', 'buffer', 'tag']
   \ })

" Candidate list item number limit
"call deoplete#custom#option('max_list', 30)

" The number of processes used for the deoplete parallel feature.
call deoplete#custom#option('num_processes', 16)

" The delay for completion after input, measured in milliseconds.
call deoplete#custom#option('auto_complete_delay', 100)
