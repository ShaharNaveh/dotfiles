-- local tree_cb = require'nvim-tree.config'.nvim_tree_callback


local opts = {
    noremap = true,
    silent = true,
}

vim.g.nvim_tree_width = 40

vim.api.nvim_set_keymap('n', '<C-n>',  '<cmd>NvimTreeToggle<CR>', opts)
