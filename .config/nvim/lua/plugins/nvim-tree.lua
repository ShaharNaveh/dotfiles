local present, tree_c = pcall(require, "nvim-tree.config")
if not present then
	return
end

local tree_cb = tree_c.nvim_tree_callback
local nvim_tree = require("nvim-tree")

vim.o.termguicolors = true

--nvimtree
vim.g.nvim_tree_side = "left"
vim.g.nvim_tree_width = 25
vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache", "__pycache__" }
vim.g.nvim_tree_auto_open = false
vim.g.nvim_tree_quit_on_open = 0
vim.g.nvim_tree_follow = true
vim.g.nvim_tree_auto_close = true
vim.g.nvim_tree_indent_markers = true
vim.g.nvim_tree_hide_dotfiles = true
vim.g.nvim_tree_git_hl = true
vim.g.nvim_tree_root_folder_modifier = ":~"
vim.g.nvim_tree_allow_resize = true

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

nvim_tree.setup()
