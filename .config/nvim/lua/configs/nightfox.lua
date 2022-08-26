vim.o.background = "dark"

local status, nightfox = pcall(require, "nightfox")

if not status then
	print("Error")
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
