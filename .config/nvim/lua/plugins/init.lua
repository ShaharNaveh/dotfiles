vim.cmd("packadd packer.nvim")
local is_packer_installed, packer = pcall(require, "packer")

if not is_packer_installed then
	print("Packer is not installed")
	require("packer_init")
	require("packer") -- Making sure that packer is installed
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
	git = {
		clone_timeout = 600, -- Timeout, in seconds, for git clones
	},
})

local use = packer.use

return packer.startup(function()
	use({ "wbthomason/packer.nvim" })
	use({ "lewis6991/gitsigns.nvim" })
	use({
		"feline-nvim/feline.nvim",
		event = "VimEnter",
		config = function()
			require("..configs.feline")
		end,
		after = "gitsigns.nvim",
		requires = {
			{ "kyazdani42/nvim-web-devicons", opt = true },
			{ "lewis6991/gitsigns.nvim", opt = true },
		},
	})

	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("..configs.lsp")
		end,
		requires = {
			"ms-jpq/coq_nvim",
			branch = "coq",
			run = ":COQdeps",
			requires = {
				{ "ms-jpq/coq.thirdparty", branch = "3p" },
			},
		},
	})

	use({
		"Chiel92/vim-autoformat",
		config = function()
			require("..configs.autoformat")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("..configs.telescope")
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "html", "javascript" },
		event = "BufRead",
		config = function()
			require("..configs.nvim-colorizer")
		end,
	})

	use({
		"EdenEast/nightfox.nvim",
		event = "VimEnter",
		run = ":NightfoxCompile",
		config = function()
			require("..configs.nightfox")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		run = ":TSUpdate",
		config = function()
			require("..configs.nvim-treesitter")
		end,
	})

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "MunifTanjim/nui.nvim" },
			{ "kyazdani42/nvim-web-devicons" },
		},
		config = function()
			require("..configs.neo-tree")
		end,
	})
end)
