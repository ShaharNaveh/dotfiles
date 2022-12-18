local signs = {
  Error = "💢",
  Warn = "⚡",
  Hint = "💡",
  Info = "📌",
}

-- non-emoji signs
-- local signs = {
--   Error = " ",
--   Warn = " ",
--   Hint = " ",
--   Info = " ",
-- }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config {
  -- if I want virtual text again, give it a better symbol
  -- virtual_text = { prefix = "●" },
  virtual_text = false,
  float = {
    source = "always",
  },
}
