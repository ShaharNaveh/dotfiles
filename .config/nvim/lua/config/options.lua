-- Navigation
vim.opt.ttyfast = true

-- Path
vim.opt.path:append('**')
vim.opt.wildignore:append('**/.git/*')
vim.opt.wildignore:append('**/coverage/*')
vim.opt.wildignore:append('*_build/*')
vim.opt.wildignore:append('*.pyc')
vim.opt.wildignore:append('**/__pycache__/*')
vim.opt.wildignore:append('**/.mypy_cache/*')

-- Use truecolors
vim.opt.termguicolors = true

-- Keep multiple buffers open
vim.opt.hidden = true

-- Split to right/below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Indentation
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Search
vim.opt.smartcase = true
vim.o.mat=2 -- How many tenths of a second to blink matches

-- Line numbers
vim.opt.number = true
vim.cmd [[
    augroup relativenumber
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave * setl relativenumber
        autocmd BufLeave,FocusLost,InsertEnter   * setl norelativenumber
    augroup END
]]

-- No backups
vim.g.backup = false
vim.g.writebackup = false

-- Undo files
vim.o.undodir = vim.fn.stdpath("data") .. "/nvim/undodir/"
vim.o.undofile = true

-- Update time
vim.opt.updatetime = 100
vim.opt.timeoutlen = 600

-- Taller command bar
vim.opt.cmdheight = 2

-- Disable builtin vim plugins
vim.g.loaded_2html_plugin = false
vim.g.loaded_gzip = false
vim.g.loaded_matchit = false
-- vim.g.loaded_matchparen = false
vim.g.loaded_netrw = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_spec = false
vim.g.loaded_tar = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false

-- Disable python2 support
vim.g.load_python_provider = false

-- Set the python3 environment to be inside venv
vim.g.python3_host_prog = os.getenv("HOME") .. "/.venvs/neovim-venv/bin/python3"

if vim.fn.executable("rg") == 1 then
    vim.g.rg_derive_root = "true"
end
