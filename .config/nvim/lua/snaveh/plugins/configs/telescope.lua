local present, telescope = pcall(require, "telescope")

if not present then
	return
end

telescope.setup({
	defaults = {
		layout_strategy = "flex",
		layout_config = { anchor = "N" },
		scroll_strategy = "cycle",
		theme = "dropdown",
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
		},
		buffers = {
			ignore_current_buffer = true,
			sort_mru = true,
			previewer = false,
		},
	},
	extensions = {
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,

			--[[
			mappings = {
				n = {
					C = file_browser.change_cwd,
					D = file_browser.remove,
					M = file_browser.move,
					n = file_browser.create,
					R = file_browser.rename,
					S = file_browser.create,
					["~"] = file_browser.goto_home_dir,
					["."] = file_browser.toggle_hidden,
					-- ["<BS>"] = file_browser.actions.move,
				},
				i = {
					["<C-a>"] = file_browser.toggle_hidden,
					["<C-d>"] = file_browser.remove,
					["<C-h>"] = file_browser.goto_home_dir,
					["<C-m>"] = file_browser.move,
					["<C-r>"] = file_browser.rename,
					["<C-y>"] = file_browser.copy,
				},
			},
                        --]]
		},
	},
})

telescope.load_extension("file_browser")
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
vim.keymap.set("n", "<c-n>", telescope.extensions.file_browser.file_browser, opts)
