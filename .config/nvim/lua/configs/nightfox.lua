vim.o.background = "dark"

local nightfox = require("nightfox")

local options = {
	transparent = true,
	terminal_colors = false,
	styles = {
		comments = "italic",
		functions = "italic,bold",
		keywords = "bold",
	},
}

nightfox.clean()
nightfox.setup({
	options = options,
})

nightfox.compile()

vim.cmd("colorscheme nightfox")
