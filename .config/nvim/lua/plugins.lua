-- vim.cmd [[packadd packer.nvim]]

-- Running "PackerCompile" after every change to this file
vim.cmd [[autocmd BufWritePost plugins.lua source  | PackerCompile]]

return require('packer').startup(
	function(use)

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Color scheme
	use 'morhetz/gruvbox'

	-- TOML support
	use {
		'cespare/vim-toml', 
		ft={'toml'}
	}

	end)

