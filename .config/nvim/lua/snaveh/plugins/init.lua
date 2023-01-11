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
		config = function()
			require("snaveh.plugins.configs.treesitter")
		end,
		requires = {
			{ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
			{ "nvim-treesitter/nvim-treesitter-context", after = "nvim-treesitter" },
		},
		run = ":TSUpdate",
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		wants = {
			"plenary.nvim",
		},
		config = function()
			require("snaveh.plugins.configs.null-ls")
		end,
	})

	use({
		{
			"neovim/nvim-lspconfig",
			after = "coq_nvim",
			config = function()
				require("snaveh.plugins.configs.lsp")
			end,
		},
		{

			"ms-jpq/coq_nvim",
			branch = "coq",
			cmd = "COQnow --shut-up",
			run = ":COQdeps",
		},
	})

	use({
		{
			"nvim-telescope/telescope.nvim",
			config = function()
				require("snaveh.plugins.configs.telescope")
			end,
			cmd = "Telescope",
			module = "telescope",
			requires = {
				"nvim-lua/popup.nvim",
				"nvim-lua/plenary.nvim",
				"telescope-frecency.nvim",
				"telescope-fzf-native.nvim",
				"nvim-telescope/telescope-ui-select.nvim",
			},
			wants = {
				"popup.nvim",
				"plenary.nvim",
				"telescope-frecency.nvim",
				"telescope-fzf-native.nvim",
			},
		},
		{
			"nvim-telescope/telescope-frecency.nvim",
			after = "telescope.nvim",
			requires = "tami5/sqlite.lua",
		},
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
		},
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
		requires = "nvim-lua/plenary.nvim",
	})

	use("nvim-tree/nvim-web-devicons")
	use({
		"feline-nvim/feline.nvim",
		config = function()
			require("feline").setup()
		end,
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				css = { mode = "background" },
				html = { mode = "foreground" },
			})
		end,
		cmd = "ColorizerAttachToBuffer",
		event = "BufRead",
	})

	use({
		"mhartington/formatter.nvim",
		config = function()
			require("snaveh.plugins.configs.formatter")
		end,
	})

	use({
		"EdenEast/nightfox.nvim",
		run = ":NightfoxCompile",
		config = function()
			require("snaveh.plugins.configs.nightfox")
		end,
	})

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		config = function()
			require("snaveh.plugins.configs.neo-tree")
		end,
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-web-devicons" },
			{ "MunifTanjim/nui.nvim" },
		},
	})

	use("NoahTheDuke/vim-just")
end

local plugins = setmetatable({}, {
	__index = function(_, key)
		init()
		return packer[key]
	end,
})

return plugins
