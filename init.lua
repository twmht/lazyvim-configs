-- bootstrap lazy.nvim, LazyVim and your plugins
vim.loader.enable()
require("config.globals") -- user and lazy globals
require("config.lazy")
require("filetype")
