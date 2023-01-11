require("snaveh.options.disable_builtins")

vim.opt.shell = "/bin/bash"

local function set_globals()
	-- No backups
	vim.g.backup = false
	vim.g.writebackup = false

	vim.g.loaded_python_provider = false -- Python2 only
	vim.g.loaded_ruby_provider = false
	vim.g.loaded_perl_provider = false
	vim.g.loaded_node_provider = false

	vim.g.python3_host_prog = os.getenv("HOME") .. "/.local/opt/pybins/.venv/bin/python3"

	if vim.fn.executable("rg") == 1 then
		vim.g.rg_derive_root = true
	end
end

local function set_options()
	local options = {
		autoindent = true,
		cmdheight = 2,
		expandtab = true,
		hidden = true,
		ignorecase = true,
		mat = 2,
		mouse = "a",
		number = true,
		scrolloff = 10,
		smartcase = true,
		smartindent = true,
		smarttab = true,
		splitbelow = true,
		splitright = true,
		swapfile = false,
		termguicolors = true,
		timeoutlen = 600,
		ttyfast = true,
		undodir = vim.fn.stdpath("data") .. "/undodir/",
		undofile = true,
		updatetime = 100,
	}

	vim.opt.path:append("**")
	vim.opt.wildignore:append("**/.git/*")
	vim.opt.wildignore:append("**/coverage/*")
	vim.opt.wildignore:append("*_build/*")
	vim.opt.wildignore:append("*.pyc")
	vim.opt.wildignore:append("**/__pycache__/*")
	vim.opt.wildignore:append("**/.mypy_cache/*")

	for key, val in pairs(options) do
		vim.opt[key] = val
	end
end

-- Is there nvim api for that?
vim.cmd([[filetype plugin indent on]])

set_globals()
set_options()
