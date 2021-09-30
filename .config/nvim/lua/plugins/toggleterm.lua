local toggleterm = require("toggleterm")

toggleterm.setup({
	hide_numbers = true, -- hide the number column in toggleterm buffers

	open_mapping = "<C-t>",
	close_on_exit = true, -- close the terminal window when the process exits
})
