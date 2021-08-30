require("nvim-treesitter.configs").setup({
	autopairs = { enable = true },
	ensure_installed = {
		"bash",
		"css",
		"dockerfile",
		"fish",
		"html",
		"json",
		"latex",
		"lua",
		"python",
		"regex",
		"rst",
		"toml",
		"yaml",
	},
	ignore_install = {}, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {}, -- list of language that will be disabled
	},
	incremental_selection = { enable = true },
	textobjects = { enable = true },
})
