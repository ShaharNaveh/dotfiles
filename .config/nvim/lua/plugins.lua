local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

-- vim.cmd [[packadd packer.nvim]]
-- Running "PackerCompile" after every change to this file
vim.cmd [[autocmd BufWritePost plugins.lua source  | PackerCompile]]


-- local use = require('packer').use
return require('packer').startup(
	function(use)

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Color scheme
	use 'morhetz/gruvbox'

	-- TOML support
	use {
		'cespare/vim-toml', 
		ft={'toml', }
	}

	use {'neovim/nvim-lspconfig', event = 'VimEnter', config = [[require('config.lsp')]]}
	use { 'hrsh7th/nvim-compe', event = 'InsertEnter *', config = [[require('config.compe')]] }

	-- colorful status line and theme
    use {'vim-airline/vim-airline-themes', event = 'VimEnter'}
    use {'vim-airline/vim-airline', after = 'vim-airline-themes'}

-- use {'numirias/semshi', ft = {'python', } , config = 'vim.cmd [[UpdateRemotePlugins]]'}
    use {'hrsh7th/vim-vsnip', event = {'InsertEnter'}}

	end)

