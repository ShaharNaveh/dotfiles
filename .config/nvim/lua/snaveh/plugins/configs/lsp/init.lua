require("snaveh.plugins.configs.lsp.diagnostics")
require("snaveh.plugins.configs.lsp.handlers")
local lspconfig = require("lspconfig")

local on_init = function(client)
	client.config.flags = client.config.flags or {}
	client.config.flags.allow_incremental_sync = true
end

local on_attach = function(client, _)
	local group = vim.api.nvim_create_augroup("LSP Commands", {})
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = group,
			pattern = "<buffer>",
			callback = function()
				vim.lsp.buf.document_highlight()
			end,
			desc = "Highlight references to symbol under cursor when held in place.",
		})

		vim.api.nvim_create_autocmd("CursorMoved", {
			group = group,
			pattern = "<buffer>",
			callback = function()
				vim.lsp.buf.clear_references()
			end,
			desc = "Clear highlight highlights of symbol under cursor.",
		})
	end

	if client.server_capabilities.codeLensProvider then
		vim.api.nvim_create_autocmd("BufEnter", {
			group = group,
			once = true,
			pattern = "<buffer>",
			callback = function()
				vim.lsp.codelens.refresh()
			end,
			desc = "Refresh codelens when entering buffer.",
		})

		vim.api.nvim_create_autocmd({ "BufWritePost", "CursorHold" }, {
			group = group,
			pattern = "<buffer>",
			callback = function()
				vim.lsp.codelens.refresh()
			end,
			desc = "Refresh codelens when saving buffer or holding cursor.",
		})
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true -- Enable (broadcasting) snippet capability for completion

lspconfig.terraformls.setup({
	auto_start = true,
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "tf", "terraform" },
})

lspconfig.tflint.setup({
	auto_start = true,
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "tf", "terraform" },
})
