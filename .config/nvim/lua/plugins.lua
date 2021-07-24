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

	--use {'ap/vim-css-color', ft={'css', 'html',}}
	use {'chrisbra/Colorizer', config=[[require('config.plugins.colorizer')]]}

	-- Color scheme
	use 'lifepillar/vim-gruvbox8'

	-- TOML support
	use {'cespare/vim-toml', ft={'toml', }}

	use {'neovim/nvim-lspconfig', event = 'VimEnter', config = [[require('config.plugins.lsp')]]}
	use { 'hrsh7th/nvim-compe', event = 'InsertEnter *', config = [[require('config.plugins.compe')]] }

	-- colorful status line and theme
    use {'vim-airline/vim-airline-themes', event = 'VimEnter'}
    -- use {'vim-airline/vim-airline', after = 'vim-airline-themes' }
    use {'vim-airline/vim-airline', config = [[ require('config.plugins.airline') ]] }

    --use {'vim-airline/vim-airline', after = 'vim-airline-themes' }
-- use {'numirias/semshi', ft = {'python', } , config = 'vim.cmd [[UpdateRemotePlugins]]'}
    -- use {'hrsh7th/vim-vsnip', event = {'InsertEnter'}}
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = [[require('config.plugins.treesitter')]]}
-- use {'sbdchd/neoformat', cmd = {'Neoformat', }, config = [[require('config.plugins.neoformat')]]}
	use { 'dense-analysis/ale', config = [[require('config.plugins.ale')]]}



	end)
