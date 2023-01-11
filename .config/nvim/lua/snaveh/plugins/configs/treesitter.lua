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
		additional_vim_regex_highlighting = false,
		disable = {},
	},
	autopairs = { enable = true },
	autotag = { enable = true },
	indent = { enable = true, disable = {} },
	indent = {
		enable = true,
	},
	refactor = {
		highlight_definitions = {
			enable = true,
			clear_on_cursor_move = true,
		},
		highlight_current_scope = { enable = false },
	},
	playground = {
		enable = true,
	},
})
