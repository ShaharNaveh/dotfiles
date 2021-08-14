-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
return require('packer').startup(function()

    -- Packer can manage itself
    use {
        'wbthomason/packer.nvim',
    }

    use {
        'nvim-telescope/telescope.nvim',
        config=[[require('config.plugins.telescope')]],
        requires={
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
        },
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config=[[require('config.plugins.nvim-colorizer')]],
    }

    -- Color scheme
    use {
        'lifepillar/vim-gruvbox8'
    }

    -- TOML support
    use {
        'cespare/vim-toml',
        ft={'toml', },
    }

    use {
        'neovim/nvim-lspconfig',
        config=[[require('config.plugins.lsp')]],
        event='VimEnter',
    }
    use {
        'hrsh7th/nvim-compe',
        config=[[require('config.plugins.compe')]],
        event='InsertEnter *',
    }

    -- colorful status line and theme
    use {
        'vim-airline/vim-airline-themes',
        event='VimEnter'
    }
    use {
        'vim-airline/vim-airline',
        config=[[require('config.plugins.airline')]],
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        config=[[require('config.plugins.nvim-treesitter')]],
        run=':TSUpdate',
    }
    use {
        'dense-analysis/ale',
        config=[[require('config.plugins.ale')]],
    }

    use {
        'kyazdani42/nvim-tree.lua',
        config=[[require('config.plugins.nvim-tree')]],
        requires={
            'kyazdani42/nvim-web-devicons',
        },
}
end)
