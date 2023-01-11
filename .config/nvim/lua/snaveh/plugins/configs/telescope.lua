local telescope = require("telescope")
local actions = require("telescope.actions")
local theme = require("telescope.themes")

telescope.setup({
	defaults = {
		layout_strategy = "flex",
		layout_config = { anchor = "N" },
		scroll_strategy = "cycle",
		theme = "dropdown",
		mappings = { i = { ["<esc>"] = actions.close } },
	},
	history = {
		path = vim.fn.stdpath("cache") .. "/telescope/history",
	},
	preview = {
		check_mime_type = true,
		timeout = 250,
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			hidden = true,
		},
		live_grep = {
			additional_args = function(opts)
				return { "--hidden" }
			end,
		},
		buffers = {
			ignore_current_buffer = true,
			sort_mru = true,
			previewer = false,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		["ui-select"] = {
			theme.get_dropdown({}),
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")

local builtin = require("telescope.builtin")
local telescope = require("telescope")

local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>km", builtin.keymaps, opts)
