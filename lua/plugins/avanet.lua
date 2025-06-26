return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	opts = {
		-- add any opts here
		-- for example
		provider = "vertex",
		providers = {
			vertex = {
				model = "gemini-2.5-flash",
				extra_request_body = {
					generationConfig = {
						temperature = 0.75,
						-- 其他 generation 配置
					},
				},
			},
			azure = {
				endpoint = "https://apis.openai.azure.com/", -- example: "https://<your-resource-name>.openai.azure.com"
				deployment = "gpt-4.1-nano", -- Azure deployment name (e.g., "gpt-4o", "my-gpt-4o-deployment")
				api_version = "2024-12-01-preview",
				timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
				extra_request_body = {
					temperature = 0.75,
					max_completion_tokens = 20480, -- Increase this to include reasoning tokens (for reasoning models)
					reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
				},
			},
		},
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = vim.fn.has("win32") == 1 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
		or "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"echasnovski/mini.pick", -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
		"stevearc/dressing.nvim", -- for input provider dressing
		"folke/snacks.nvim", -- for input provider snacks
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
