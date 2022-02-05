vim.g.coq_settings = ({
	auto_start = "shut-up",
    clients ={
        snippets = {
            enabled = false,
        }
    },
    display = {
        ghost_text = {
            enabled=true,
        },
        icons= {
            mode = "short",
        },
               pum = {
            fast_close = false,
            x_max_len = 128,
            y_max_len = 64,
            y_ratio = 0.9,
            ellipsis = "...",
            kind_context = { "", "" },
            source_context = { "", "" },
        },

        preview = {
            x_max_len = 128,
            border = {
                { "",  "NormalFloat" },
                { "",  "NormalFloat" },
                { "",  "NormalFloat" },
                { " ", "NormalFloat" },
                { "",  "NormalFloat" },
                { "",  "NormalFloat" },
                { "",  "NormalFloat" },
                { " ", "NormalFloat" },
            },
        },
    }
})
local nvim_lsp = require("lspconfig")
local coq = require("coq")



local on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>e",
		"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>so",
		[[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
		opts
	)
	--vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

require'lspconfig'.terraformls.setup{}


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}

-- [[ Specific Language-Server settings ]] --

-- Pylsp
nvim_lsp.pylsp.setup(coq.lsp_ensure_capabilities({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	},
	settings = {
		pylsp = {
			plugins = {
				pylint = {
					enabled = false,
				},
				pyflakes = {
					enabled = false,
				},
				pycodestyle = {
					enabled = false,
				},
				jedi_completion = {
					fuzzy = false,
				},
				pyls_isort = {
					enabled = true,
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
nvim_lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities({}))

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = true,
	signs = true,
	update_in_insert = true,
})

-- ]]

--[[
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = {
       {"┌", "Normal"},
       {"─", "Normal"},
       {"┐", "Normal"},
       {"│", "Normal"},
       {"┘", "Normal"},
       {"─", "Normal"},
       {"└", "Normal"},
       {"│", "Normal"}
     }
    }
)
]]

-- Default config for those lsp
--[[
local servers = {}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
		on_attach = on_attach,
	})
end
--]]
