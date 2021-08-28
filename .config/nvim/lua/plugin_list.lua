local present, _ = pcall(require, "packer_init")
local packer

if present then
    packer = require "packer"
else
    return false
end

local use = packer.use

return packer.startup(
    function()
        use {
            "wbthomason/packer.nvim",
            event = "VimEnter",
            opt=true,
        }

        use {
            'nvim-telescope/telescope.nvim',
            requires={
                {'nvim-lua/popup.nvim'},
                {'nvim-lua/plenary.nvim'},
            },
            config= function()
		    require "plugins.telescope"
	    end
        }

        use {
            "norcalli/nvim-colorizer.lua",
            ft={"css", "html", "javascript",},
            event = "BufRead",
            config= function()
		    require "plugins.nvim-colorizer"
	    end
        }

        -- Color scheme
        use {"lifepillar/vim-gruvbox8"}

        -- TOML support
        use {
            'cespare/vim-toml',
            ft={'toml', },
        }

        use {
            'neovim/nvim-lspconfig',
            event='VimEnter',
            config=function ()
		    require "plugins.lsp"
        end
        }
        use {
            'hrsh7th/nvim-compe',
            event='InsertEnter',
            config= function()
		    require "plugins.compe"
	    end
        }

        -- colorful status line and theme
        use {
            'hoob3rt/lualine.nvim',
            requires = {
                'kyazdani42/nvim-web-devicons',
                opt=true,
            },
            config= function()
                require "plugins.lualine"
            end
        }

        use {
            'nvim-treesitter/nvim-treesitter',
            event = "BufRead",
            run=':TSUpdate',
            config= function()
		    require "plugins.nvim-treesitter"
	    end
        }
        use {
            'dense-analysis/ale',
            config=function ()
		    require "plugins.ale"
	    end
        }

        use {
            'kyazdani42/nvim-tree.lua',
            requires={
                'kyazdani42/nvim-web-devicons',
            },
            config=function()
		    require "plugins.nvim-tree"
	    end
        }
    end
)
