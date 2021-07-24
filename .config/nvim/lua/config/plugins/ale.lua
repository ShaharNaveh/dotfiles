vim.g.ale_enabled = true
vim.g.ale_lint_on_enter = false
vim.g.ale_lint_on_text_changed = "never"
vim.b.ale_warn_about_trailing_whitespace = false
vim.g.ale_echo_msg_error_str = "E"
vim.g.ale_echo_msg_warning_str = "W"
vim.g.ale_echo_msg_format = '[%linter%] [%severity%] %code: %%s'
vim.g.ale_completion_enabled = false
vim.g.ale_set_highlights = false
vim.g.ale_fix_on_save = true

vim.g.ale_linters = {
    ["*"] = { 'remove_trailing_lines', 'trim_whitespace' },
    python = { 'flake8', 'isort' },
    rust = { 'cargo', 'rls' },
  }


vim.g.ale_fixers = {
    ["*"] = { 'remove_trailing_lines', 'trim_whitespace' },
    python = { 'black', 'isort' },
  }
