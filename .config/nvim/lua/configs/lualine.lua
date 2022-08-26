local present, lualine = pcall(require, "lualine")

if not present then
	return false
end

lualine.setup({
	options = { theme = "nightfox" },
})
