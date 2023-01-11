vim.g.neo_tree_remove_legacy_commands = true

local neo_tree = require("neo-tree")

neo_tree.setup({
	enable_git_status = true,
	enable_diagnostics = true,
})

vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>", {})
