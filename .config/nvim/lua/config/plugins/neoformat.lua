vim.g.neoformat_enabled_python = {'black', 'isort'}
vim.g.neoformat_run_all_formatters = 1

-- Execute Neoformat on file write
vim.api.nvim_exec(
  [[
    augroup fmt
      autocmd!
      autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
    augroup END
  ]],
  false
)
