local create_cmd = vim.api.nvim_create_user_command

create_cmd("PackerInstall", function()
	vim.cmd([[packadd packer.nvim]])
	require("plugins").install()
end, {})
create_cmd("PackerUpdate", function()
	vim.cmd([[packadd packer.nvim]])
	require("plugins").update()
end, {})
create_cmd("PackerSync", function()
	vim.cmd([[packadd packer.nvim]])
	require("plugins").sync()
end, {})
create_cmd("PackerClean", function()
	vim.cmd([[packadd packer.nvim]])
	require("plugins").clean()
end, {})
create_cmd("PackerCompile", function()
	vim.cmd([[packadd packer.nvim]])
	require("plugins").compile()
end, {})

local map = vim.api.nvim_set_keymap
local silent = { silent = true, noremap = true }

vim.g.mapleader = " "

-- Yank to clipboard
map("n", "y+", "<cmd>set opfunc=util#clipboard_yank<cr>g@", silent)
map("v", "y+", "<cmd>set opfunc=util#clipboard_yank<cr>g@", silent)

-- Window movement
map("n", "<c-h>", "<c-w>h", silent)
map("n", "<c-j>", "<c-w>j", silent)
map("n", "<c-k>", "<c-w>k", silent)
map("n", "<c-l>", "<c-w>l", silent)

-- Tab movement
map("n", "<c-Left>", "<cmd>tabpre<cr>", silent)
map("n", "<c-Right>", "<cmd>tabnext<cr>", silent)
