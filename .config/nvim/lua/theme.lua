vim.o.background = "dark"
local nightfox = require('nightfox')

nightfox.setup(
{

    fox="nightfox", -- nightfox/nordfox/palefox/randfox
    transparent = false,
    styles = {
    comments = "italic", -- change style of comments to be italic
    keywords = "bold", -- change style of keywords to be bold
    functions = "italic,bold" -- styles can be a comma separated list
  },
}
)


-- Load the configuration set above and apply the colorscheme
nightfox.load()
