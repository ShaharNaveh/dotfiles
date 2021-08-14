
local main_config = {
    "plugin_list",
	"options",
	"mappings",
	"utils",
}

for _, config_file in ipairs(main_config) do
    pcall(require, config_file)          
 end

--vim.cmd ("colorscheme gruvbox8_hard")
