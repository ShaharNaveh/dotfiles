let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let b:ale_warn_about_trailing_whitespace = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
\ 'python': ['flake8', 'isort'],
\ 'rust': ['cargo', 'rls']
\}
let g:ale_fixers = {
\ 'python': ['black']
\}

" Python specific
let g:ale_python_auto_pipenv = 0
