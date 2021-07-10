-- Diable python2 support
vim.g.load_python_provider = false

-- Set the python3 environment to be inside venv
vim.g.python3_host_prog = os.getenv("HOME") .. "/.venvs/neovim-venv/bin/python3"
