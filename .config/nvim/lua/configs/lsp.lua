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
--capabilities.textDocument.completion.completionItem.snippetSupport = false
--[[
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}
--]]

local on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "d]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
end

nvim_lsp.pylsp.setup(coq.lsp_ensure_capabilities({
	--capabilities = capabilities,
	on_attach = on_attach,
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
	--capabilities = capabilities,
	on_attach = on_attach,
}))

vim.g.terraform_fmt_on_save = 1
vim.g.terraform_align = 1

--vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
--
--
--vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
--vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
--vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
--vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>ti", ":!terraform init<CR>", opts)
keymap("n", "<leader>tv", ":!terraform validate<CR>", opts)
keymap("n", "<leader>tp", ":!terraform plan<CR>", opts)
keymap("n", "<leader>taa", ":!terraform apply -auto-approve<CR>", opts)

--[[
nvim_lsp.terraformls.setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
}))
--]]

nvim_lsp.terraformls.setup({ on_attach = on_attach })

nvim_lsp.tflint.setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
}))

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.tf", "*.tfvars" },
	callback = vim.lsp.buf.formatting_sync,
})

nvim_lsp.eslint.setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
}))
