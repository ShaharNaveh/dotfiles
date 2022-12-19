vim.cmd("packadd packer.nvim")
local is_packer_installed, packer = pcall(require, "packer")

if not is_packer_installed then
	print("Packer is not installed. Installing...")
	require("snaveh.plugins.packer_init")
end

local packer = nil
local function init()
	if packer == nil then
		packer = require("packer")
		packer.init({ disable_commands = true })
	end

	local use = packer.use
	packer.reset()

	use("wbthomason/packer.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("snaveh.plugins.configs.treesitter")
		end,
	})

	use({ "hrsh7th/cmp-nvim-lsp" })

	use({
		"hrsh7th/nvim-cmp",
		transitive_opt = true,
		opt = true,
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lsp-document-symbol" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip", requires = "L3MON4D3/LuaSnip" },
		},
		event = "VimEnter",
		config = function()
			require("snaveh.plugins.configs.cmp")
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		after = "cmp-nvim-lsp",
		config = function()
			require("snaveh.plugins.configs.lsp")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		after = "nvim-cmp",
		requires = {
			{ "kyazdani42/nvim-web-devicons", opt = true },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-lua/popup.nvim", opt = true },
			{ "nvim-telescope/telescope-file-browser.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		config = function()
			require("snaveh.plugins.configs.telescope")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	})

	use({
		"feline-nvim/feline.nvim",
		--event = "BufWinEnter",
		config = function()
			require("feline").setup()
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		event = "BufRead",
		config = function()
			require("colorizer").setup({
				css = { mode = "background" },
				html = { mode = "foreground" },
			})
			vim.cmd([[ColorizerAttachToBuffer]])
		end,
	})

	use({
		"mhartington/formatter.nvim",
		config = function()
			require("snaveh.plugins.configs.formatter")
		end,
	})

	use({
		"EdenEast/nightfox.nvim",
		event = "VimEnter",
		run = ":NightfoxCompile",
		config = function()
			require("snaveh.plugins.configs.nightfox")
		end,
	})

	use("NoahTheDuke/vim-just")

	use({
		"folke/noice.nvim",
		after = {
			"nvim-cmp",
			"nvim-lspconfig",
		},
		config = function()
			require("snaveh.plugins.configs.noice")
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			{ "rcarriga/nvim-notify", opt = true },
		},
	})
end

local plugins = setmetatable({}, {
	__index = function(_, key)
		init()
		return packer[key]
	end,
})

return plugins
