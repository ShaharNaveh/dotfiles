local map = vim.api.nvim_set_keymap

local silent = { silent = true, noremap = true }
-- Navigate buffers and repos
--
--
map("n", "<leader>ff", [[<cmd>Telescope find_files theme=get_dropdown <cr>]], silent)
map(
	"n",
	"<leader>fa",
	[[<cmd>Telescope find_files theme=get_dropdown follow=true no_ignore=true hidden=true <cr>]],
	silent
)
map("n", "<leader>fw", [[<cmd>Telescope live_grep theme=get_dropdown<cr>]], silent)
map("n", "<leader>fb", [[<cmd>Telescope buffers theme=get_dropdown<cr>]], silent)
map("n", "<leader>fh", [[<cmd>Telescope help_tags theme=get_dropdown<cr>]], silent)
map("n", "<leader>fo", [[<cmd>Telescope oldfiles theme=get_dropdown<cr>]], silent)
map("n", "<leader>tk", [[<cmd>Telescope keymaps theme=get_dropdown<cr>]], silent)
map("n", "<leader>cm", [[<cmd>Telescope git_commits theme=get_dropdown<cr>]], silent)
map("n", "<leader>gt", [[<cmd>Telescope git_status theme=get_dropdown<cr>]], silent)
