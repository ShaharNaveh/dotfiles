-- Buffer options
vim.bo.autoindent = true
vim.bo.expandtab = false
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.tabstop = 4


vim.o.background = 'dark'
vim.o.backup = false
vim.opt.shortmess:append("cA")
vim.opt.completeopt = { "menuone", "noinsert" }
vim.o.hidden = true
vim.o.listchars = 'tab:┆·,trail:·,precedes:,extends:'
vim.opt.mouse = "a"
vim.o.scrolloff = 5
vim.o.shiftwidth = 4
vim.o.showmode = false
vim.o.sidescrolloff = 5
vim.o.softtabstop = 4
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.g.termguicolors = true
vim.o.title = true
vim.o.undodir = vim.fn.stdpath("data") .. "/nvim/undodir/"
vim.o.undofile = true
vim.o.updatetime = 300
vim.o.writebackup = false

-- Window options
vim.wo.list = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'number'
vim.wo.wrap = false



-- Disable builtin vim plugins
vim.g.loaded_gzip = 0
vim.g.loaded_tar = 0
vim.g.loaded_tarPlugin = 0
vim.g.loaded_zipPlugin = 0
vim.g.loaded_2html_plugin = 0
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_matchit = 0
vim.g.loaded_matchparen = 0
vim.g.loaded_spec = 0

-- Diable python2 support
vim.g.load_python_provider = false

-- Set the python3 environment to be inside venv
vim.g.python3_host_prog = os.getenv("HOME") .. "/.venvs/neovim-venv/bin/python3"
