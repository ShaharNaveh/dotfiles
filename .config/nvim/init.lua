local main_config = {
	"options",
	"mappings",
	"theme",
	"utils",
}

for _, config_file in ipairs(main_config) do
	local status, _ = pcall(require, config_file)
	if not status then
		print("Error loading: " .. config_file)
	end
end
