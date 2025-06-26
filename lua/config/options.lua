-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--
if vim.fn.has("mac") then
	vim.g.clipboard = {
		name = "macOS-clipboard",
		copy = {
			["+"] = "pbcopy",
			["*"] = "pbcopy",
		},
		paste = {
			["+"] = "pbpaste",
			["*"] = "pbpaste",
		},
	}
elseif vim.fn.executable("tmux") == 1 then
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
end

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

local function add_python_files()
	local sidebar = require("avante").get()
	if not sidebar then
		return
	end

	local project_root = require("avante.utils").get_project_root()
	local files = require("avante.utils").scan_directory({ directory = project_root, add_dirs = false })

	for _, filepath in ipairs(files) do
		if filepath:match("%.py$") then
			local relative_path = require("avante.utils").relative_path(filepath)
			sidebar.file_selector:add_selected_file(relative_path)
		end
	end
end

-- 創建命令
vim.api.nvim_create_user_command("AvanteAddPythonFiles", add_python_files, {
	desc = "Add all Python files to Avante file selector",
})

-- 或者創建快捷鍵
vim.keymap.set("n", "<leader>aP", add_python_files, {
	desc = "Add all Python files to Avante",
})
