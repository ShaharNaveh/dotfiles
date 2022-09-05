local nvim_lsp = require("lspconfig")
vim.g.coq_settings = {
	auto_start = "shut-up",
	clients = {
		snippets = {
			enabled = false,
			warn = {},
		},
	},
	completion = {
		always = true,
	},
}

local coq = require("coq")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}

nvim_lsp.pylsp.setup(coq.lsp_ensure_capabilities({
	capabilities = capabilities,
	settings = {
		pylsp = {
			configurationSources = { "flake8" },
			plugins = {
				autopep8 = {
					enabled = false,
				},
				flake8 = {
					enabled = true,
					ignore = { "E203", "E402", "W292", "W503", "W504" },
					maxLineLength = 89,
				},
				jedi_completion = {
					enabled = true,
					fuzzy = true,
				},
				maccabe = {
					enabled = false,
				},
				preload = {
					enabled = false,
				},
				pycodestyle = {
					enabled = false,
				},
				pyflakes = {
					enabled = false,
				},
				pylint = {
					enabled = false,
				},
				rope_completion = {
					enabled = false,
				},
				yapf = {
					enabled = false,
				},
				pylsp_mypy = {
					dmypy = true,
					enabled = true,
					live_mode = false,
				},
			},
		},
	},
}))

nvim_lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities({
	capabilities = capabilities,
}))
