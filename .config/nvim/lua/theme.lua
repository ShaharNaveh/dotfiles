vim.o.background = "dark"

local present, _ = pcall(require, "nightfox")
local nightfox

if present then
	nightfox = require("nightfox")
else
	return false
end

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
