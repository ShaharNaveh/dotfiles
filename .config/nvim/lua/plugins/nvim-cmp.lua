local present, cmp = pcall(require, 'cmp')
if not present then
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local check_back_space = function()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end
local luasnip = require("luasnip")

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- supertab-like mapping
local mapping = {
  ["<Tab>"] = cmp.mapping(function(fallback)
    if vim.fn.pumvisible() == 1 then
      vim.fn.feedkeys(t("<C-n>"), "n")
    elseif luasnip.expand_or_jumpable() then
      vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
    elseif check_back_space() then
      vim.fn.feedkeys(t("<Tab>"), "n")
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if vim.fn.pumvisible() == 1 then
      vim.fn.feedkeys(t("<C-p>"), "n")
    elseif luasnip.jumpable(-1) then
      vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
}

cmp.setup{
      --completion = {
--    completeopt = 'menu,menuone,noinsert',
--  },
  mapping=mapping,
    sources = {
        { name = 'buffer' },
        { name = 'luasnip'},
        { name = 'nvim_lsp'},
    },


}
