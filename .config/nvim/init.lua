local main_config = {
	"options",
	"keymaps",
	"plugins",
}

-- Don't write to the ShaDa file on startup
vim.opt.shadafile = "NONE"

for _, config_file in ipairs(main_config) do
	local status, _ = pcall(require, config_file)
	if not status then
		print("Error loading: " .. config_file)
		require(config_file)
	end
end

-- We can load shada now
vim.opt.shadafile = ""
