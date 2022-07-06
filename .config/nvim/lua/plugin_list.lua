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
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lsp")
		end,
		requires = {
			"ms-jpq/coq_nvim",
			branch = "coq",
			run = ":COQdeps",
			requires = {
				{
					"ms-jpq/coq.artifacts",
					branch = "artifacts",
				},
				{
					"ms-jpq/coq.thirdparty",
					branch = "3p",
				},
			},
		},
	})

	use({
		"Chiel92/vim-autoformat",
		config = function()
			require("plugins.autoformat")
		end,
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
		"EdenEast/nightfox.nvim",
		config = function()
			require("theme")
		end,
	})

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
		--event = "BufRead",
		run = ":TSUpdate",
		config = function()
			require("plugins.nvim-treesitter")
		end,
	})

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("plugins.neo-tree")
		end,
	})
end)
