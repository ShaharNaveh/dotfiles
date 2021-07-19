require'nvim-treesitter.configs'.setup {
  ensure_installed = {'bash', 'json', 'lua', 'python', 'toml', 'yaml'},
  ignore_install = {},  -- List of parsers to ignore installing
  highlight = {            
    enable = true,  -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },                                                   
}   
