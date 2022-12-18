local present, _ = pcall(require, "nvim-treesitter")
if not present then
	return
end

local _, treesitter = pcall(require, "nvim-treesitter.configs")

treesitter.setup({
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"css",
		"dockerfile",
		"fish",
		"gitignore",
		"go",
		"hcl",
		"help",
		"html",
		"java",
		"javascript",
		"jsdoc",
		"json",
		"latex",
		"lua",
		"make",
		"markdown",
		"python",
		"regex",
		"rst",
		"ruby",
		"rust",
		"todotxt",
		"toml",
		"vim",
		"yaml",
	},
	highlight = {
		enable = true,
		use_languagetree = false,
		disable = { "json" },
	},
	indent = {
		enable = true,
	},
})
