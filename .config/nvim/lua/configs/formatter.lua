local util = require("formatter.util")

local formatter = require("formatter")

formatter.setup({
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		python = {
			require("formatter.filetypes.python").black,
			require("formatter.filetypes.python").isort,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

local augroup = vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	group = augroup,
	command = "FormatWrite",
})
