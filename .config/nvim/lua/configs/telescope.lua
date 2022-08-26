local telescope = require("telescope")

telescope.setup({
	defaults = {
		layout_strategy = "flex",
		layout_config = { anchor = "N" },
		scroll_strategy = "cycle",
		theme = "dropdown",
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		--[[
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
                --]]
	},
	pickers = {
		buffers = {
			ignore_current_buffer = true,
			sort_mru = true,
			previewer = false,
		},
	},
})
