-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--
vim.g.clipboard = {
	name = "tmux",
	copy = {
		["+"] = { "tmux", "load-buffer", "-" },
		["*"] = { "tmux", "load-buffer", "-" },
	},
	paste = {
		["+"] = { "tmux", "save-buffer", "-" },
		["*"] = { "tmux", "save-buffer", "-" },
	},
}
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("osc52", { clear = true }),
	callback = function()
		if vim.v.operator == "y" then
			local text = vim.fn.getreg("+")
			local lines = vim.split(text, "\n")
			require("vim.ui.clipboard.osc52").copy("+")(lines)
		end
	end,
})

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
