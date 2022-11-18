local present, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
	print("No treesitter")
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
		"javascript",
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
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = {
		enable = true,
	},
})
