local present, _ = pcall(require, "packer_init")
local packer

if present then
	packer = require("packer")
else
	return false
end

local use = packer.use

return packer.startup(function()
	use({
		"wbthomason/packer.nvim",
		event = "VimEnter",
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("plugins.telescope")
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "html", "javascript" },
		event = "BufRead",
		config = function()
			require("plugins.nvim-colorizer")
		end,
	})

	use({
		"hashivim/vim-terraform",
		ft = { "tf", "hcl", "terraform" },
	})
	--[[

	use({
		"akinsho/toggleterm.nvim",

		config = function()
			require("plugins.toggleterm")
		end,
	})

	--]]

	-- Color scheme
	use({
		"EdenEast/nightfox.nvim",
		config = function()
			require("theme")
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		--event = "VimEnter",
		--after = "coq_nvim",
		config = function()
			require("plugins.lsp")
		end,
		requires = {
			"ms-jpq/coq_nvim",
			branch = "coq",
			run = ":COQdeps",
			requires = {
				{
					"ms-jpq/coq.thirdparty",
					branch = "3p",
				},
			},
		},
	})

	-- colorful status line and theme
	use({
		"hoob3rt/lualine.nvim",
		event = "VimEnter",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
		after = "nightfox.nvim",
		config = function()
			require("plugins.lualine")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		run = ":TSUpdate",
		config = function()
			require("plugins.nvim-treesitter")
		end,
	})
	use({
		"dense-analysis/ale",
		config = function()
			require("plugins.ale")
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("plugins.nvim-tree")
		end,
	})
end)
