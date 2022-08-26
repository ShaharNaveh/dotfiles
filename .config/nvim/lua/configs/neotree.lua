local neotree = require("neo-tree")

vim.g.neo_tree_remove_legacy_commands = 1

neotree.setup({
	enable_git_status = true,
	enable_diagnostics = true,
	filesystem = {
		filtered_items = {
			hide_gitignored = false,
			visible = true,
			hide_dotfiles = false,
		},
		hide_by_name = { "\\.dmypy\\.json", "__pycache__" },
		hide_by_pattern = { "^.git$" },
		never_show = {},
	},
	window = {
		position = "left",
		width = 30,
	},
})
