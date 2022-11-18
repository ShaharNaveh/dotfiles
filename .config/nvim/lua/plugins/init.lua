vim.cmd("packadd packer.nvim")
local is_packer_installed, packer = pcall(require, "packer")

if not is_packer_installed then
	print("Packer is not installed")
	require("packer_init")
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

	use("lewis6991/impatient.nvim")

	use({
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"feline-nvim/feline.nvim",
		event = "VimEnter",
		config = [[require("..configs.feline")]],
		after = "gitsigns.nvim",
		requires = {
			{ "kyazdani42/nvim-web-devicons", opt = true },
			{
				"lewis6991/gitsigns.nvim",
				event = "BufRead",
				opt = true,
			},
		},
	})

	use({
		"neovim/nvim-lspconfig",
		config = [[require("..configs.lsp")]],
		requires = {
			"ms-jpq/coq_nvim",
			branch = "coq",
			run = ":COQdeps",
			requires = {
				{ "ms-jpq/coq.thirdparty", branch = "3p" },
			},
		},
	})

	use({ "mhartington/formatter.nvim", config = [[require("..configs.formatter")]] })

	use({
		{
			"nvim-telescope/telescope.nvim",
			requires = {
				"nvim-lua/popup.nvim",
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-frecency.nvim",
				"nvim-telescope/telescope-fzf-native.nvim",
				"nvim-telescope/telescope-ui-select.nvim",
			},
			wants = {
				"popup.nvim",
				"plenary.nvim",
				"telescope-frecency.nvim",
				"telescope-fzf-native.nvim",
			},
			config = [[require("..configs.telescope")]],
			setup = [[require("..configs.telescope_setup")]],
			cmd = "Telescope",
			module = "telescope",
		},
		{
			"nvim-telescope/telescope-frecency.nvim",
			after = "telescope.nvim",
			requires = "kkharji/sqlite.lua",
		},
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
		},
	})

	use({
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "html", "javascript" },
		event = "BufRead",
		config = [[require("..configs.nvim-colorizer")]],
	})

	use({
		"EdenEast/nightfox.nvim",
		event = "VimEnter",
		run = ":NightfoxCompile",
		config = [[require("..configs.nightfox")]],
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		--event = "BufRead",
		run = ":TSUpdate",
		config = [[require("..configs.treesitter")]],
	})

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = [[require("..configs.neotree")]],
		setup = [[require("..configs.neotree_setup")]],
	})

	use("NoahTheDuke/vim-just")
	use("martinda/Jenkinsfile-vim-syntax")
end

local plugins = setmetatable({}, {
	__index = function(_, key)
		init()
		return packer[key]
	end,
})

return plugins
