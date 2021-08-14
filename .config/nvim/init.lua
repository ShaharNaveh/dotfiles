
local main_config = {
    "plugin_list",
	"options",
	"mappings",
	"utils",
    "theme",
}

for _, config_file in ipairs(main_config) do
    pcall(require, config_file)
 end
