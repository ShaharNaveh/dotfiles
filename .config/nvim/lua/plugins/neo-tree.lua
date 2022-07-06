vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require("neo-tree").setup({
	filesystem = {
		filtered_items = {
			hide_gitignored = false,
			hide_dotfiles = false,
		},
		hide_by_name = { ".dmypy.json", "__pycache__" },
		hide_by_pattern = { "^.git$" },
		never_show = {},
	},
	window = {
		position = "left",
		width = 30,
	},
})
