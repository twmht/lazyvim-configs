-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- https://github.com/iku-iku-iku/neovim-config
vim.opt.relativenumber = false
vim.o.undofile = false

-- Create an autocommand group for setting file type specific settings
vim.api.nvim_create_augroup("CudaSettings", { clear = true })

-- Set commentstring for CUDA files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "cuda",
	callback = function()
		vim.bo.commentstring = "// %s"
	end,
})
