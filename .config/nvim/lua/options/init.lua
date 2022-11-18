-- Fish slows things down
vim.opt.shell = "/bin/bash"

-- use filetype.lua instead of filetype.vim. it's enabled by default in neovim 0.8 (nightly)
if vim.version().minor < 8 then
	vim.g.did_load_filetypes = 0
	vim.g.do_filetype_lua = 1
end

-- Navigation
vim.opt.ttyfast = true

-- Path
vim.opt.path:append("**")
vim.opt.wildignore:append("**/.git/*")
vim.opt.wildignore:append("**/coverage/*")
vim.opt.wildignore:append("*_build/*")
vim.opt.wildignore:append("*.pyc")
vim.opt.wildignore:append("**/__pycache__/*")
vim.opt.wildignore:append("**/.mypy_cache/*")

vim.opt.mouse = "a"

-- Scrolloff
vim.opt.scrolloff = 10

-- Swap
vim.opt.swapfile = false

-- Use truecolors
vim.opt.termguicolors = true

-- Keep multiple buffers open
vim.opt.hidden = true

-- Split to right/below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Indentation
vim.opt.smarttab = true
vim.opt.smartindent = true
--vim.opt.shiftwidth = 4
--vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Search
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.o.mat = 2 -- How many tenths of a second to blink matches

-- Line numbers
vim.opt.number = true

-- No backups
vim.g.backup = false
vim.g.writebackup = false

-- Undo files
vim.o.undodir = vim.fn.stdpath("data") .. "/undodir/"
vim.o.undofile = true

-- Update time
vim.opt.updatetime = 100
vim.opt.timeoutlen = 600

-- Taller command bar
vim.opt.cmdheight = 2

vim.g.loaded_python_provider = false -- Python2 only
vim.g.loaded_ruby_provider = false
vim.g.loaded_perl_provider = false
vim.g.loaded_node_provider = false

-- Set the python3 environment to be inside venv
vim.g.python3_host_prog = os.getenv("HOME") .. "/.local/opt/pybins/.venv/bin/python3"

if vim.fn.executable("rg") == 1 then
	vim.g.rg_derive_root = "true"
end

local disabled_built_ins = {
	"2html_plugin",
	"bugreport",
	"compiler",
	"ftplugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"man",
	"matchit",
	"matchparen",
	"netrw",
	"netrwFileHandlers",
	"netrwPlugin",
	"netrwSettings",
	"optwin",
	"rplugin",
	"rrhelper",
	"shada_plugin",
	"spellfile_plugin",
	"synmenu",
	"syntax",
	"tar",
	"tarPlugin",
	"tutor",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end
