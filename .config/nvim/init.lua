local main_config = {
	"options",
	"mappings",
	"theme",
	"utils",
}

for _, config_file in ipairs(main_config) do
	pcall(require, config_file)
end
