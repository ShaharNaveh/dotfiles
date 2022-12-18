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
