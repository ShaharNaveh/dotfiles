vim.api.nvim_set_keymap('n', '<C-b>', ":NERDTreeToggle<CR>", {})

vim.g.NERDTreeDirArrows = true
vim.g.NERDTreeIgnore = {
	'.egg-info$',
	'^.coverage$',
	'^.git$',
	'^.hypothesis$',
	'^.mypy_cache$',
	'^.tox$',
	'^.pytest_cache$',
	'^__pycache__$'
}

vim.g.NERDTreeMinimalUI = true
vim.g.NERDTreeShowHidden = true
vim.g.NERDTreeStatusline = ""
