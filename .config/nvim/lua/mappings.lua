local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local cmd = vim.cmd
local opt = {}

-- Remap space as leader key
map("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "

-- [[ Toggle numbers
map("n", "<leader>n", [[ <Cmd> set nu!<CR>]], opt) -- TODO: Fix with relativenumbers
-- ]]

-- [[ <C-{hjkl}> to navigate splits
map("n", "<c-k>", [[<Cmd>wincmd k<CR>]], opt)
map("n", "<c-j>", [[<Cmd>wincmd j<CR>]], opt)
map("n", "<c-h>", [[<Cmd>wincmd h<CR>]], opt)
map("n", "<c-l>", [[<Cmd>wincmd l<CR>]], opt)
-- ]]

-- [[ NvimTree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", opts)
-- ]]

-- [[ Telescope
map("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
map("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
map("n", "<Leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })
map("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>", { noremap = true, silent = true })
-- ]]

-- Packer commands here because we are not loading it at startup
vim.cmd("silent! command PackerCompile lua require 'plugin_list' require('packer').compile()")
vim.cmd("silent! command PackerInstall lua require 'plugin_list' require('packer').install()")
vim.cmd("silent! command PackerStatus lua require 'plugin_list' require('packer').status()")
vim.cmd("silent! command PackerSync lua require 'plugin_list' require('packer').sync()")
vim.cmd("silent! command PackerUpdate lua require 'plugin_list' require('packer').update()")
