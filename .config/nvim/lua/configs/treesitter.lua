local present, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
	return false
end

nvim_treesitter.setup({
	ensure_installed = {
		"bash",
		"css",
		"dockerfile",
		"fish",
		"gitignore",
		"hcl",
		"html",
		"json",
		"latex",
		"lua",
		"markdown",
		"python",
		"regex",
		"rst",
		"rust",
		"toml",
		"yaml",
	},
	ignore_install = {}, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {}, -- list of language that will be disabled
	},
	matchup = { enable = true },
	autopairs = { enable = true },
	incremental_selection = { enable = true },
	textobjects = {
		enable = true,
		select = {
			enable = true,
			lookeahead = true,
		},
	},
})
