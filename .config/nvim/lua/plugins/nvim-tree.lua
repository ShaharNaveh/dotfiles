local present, tree_c = pcall(require, "nvim-tree.config")
if not present then
	return
end

local tree_cb = tree_c.nvim_tree_callback
local nvim_tree = require("nvim-tree")

vim.o.termguicolors = true

--nvimtree
--vim.g.nvim_tree_auto_open = false
vim.g.nvim_tree_indent_markers = true
vim.g.nvim_tree_git_hl = true
vim.g.nvim_tree_root_folder_modifier = ":~"
vim.g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 1,
}

vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "",
		staged = "✓",
		unmerged = "",
		renamed = "",
		untracked = "",
		deleted = "",
		ignored = "",
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
		symlink_open = "",
	},
	lsp = {
		hint = "",
		info = "",
		warning = "",
		error = "",
	},
}

nvim_tree.setup({
	auto_close = true,
	disable_netrw = true,
	actions = {
		open_file = {
			quit_on_open = false,
		},
	},
	view = {
		auto_resize = true,
		side = "left",
		--width = 25,
	},
	git = {
		ignore = false,
	},
	filters = {
		dotfiles = false,
		custom = {
			"*.egg-info",
			".cache",
			".dmypy.json",
			".git",
			".terraform",
			".terraform.lock.hcl",
			".venv",
			"__pycache__",
			"node_modules",
			"terraform.tfstate",
			"terraform.tfstate.backup",
		},
	},
})
