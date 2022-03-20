vim.g.autoformat_verbosemode = 1

vim.g.formatdef_isort = '"isort -"'
vim.g.formatdef_black = '"black -q -"'
vim.g.formatters_python = { "isort", "black" }

vim.g.run_all_formatters_python = 1

vim.api.nvim_set_keymap("n", "<F3>", "<CMD>Autoformat<CR>", { noremap = true, silent = true })
vim.cmd("au BufWrite * :Autoformat")
