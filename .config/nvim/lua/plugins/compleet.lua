local compleet = require("compleet")
compleet.setup({
	details = {
		hint = {
			enable = true,
		},
	},
})

local keymap = vim.keymap

local tab = function()
	return (compleet.is_menu_open() and "<Plug>(compleet-next-completion)")
		or (compleet.has_completions() and "<Plug>(compleet-show-completions)")
		or "<Tab>"
end

local s_tab = function()
	return compleet.is_menu_open() and "<Plug>(compleet-prev-completion)" or "<S-Tab>"
end

local right = function()
	return compleet.is_hint_visible() and "<Plug>(compleet-insert-first-completion)" or "<Right>"
end

local cr = function()
	return compleet.is_completion_selected() and "<Plug>(compleet-insert-selected-completion)" or "<CR>"
end

local opts = { expr = true, remap = true }

keymap.set("i", "<Tab>", tab, opts)
keymap.set("i", "<S-Tab>", s_tab, opts)
keymap.set("i", "<Right>", right, opts)
keymap.set("i", "<CR>", cr, opts)
