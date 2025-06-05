-- Standalone plugins with less than 10 lines of config go here
return {
	{ "christoomey/vim-tmux-navigator" },
	{ "tpope/vim-sleuth" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" },
	{ "tpope/vim-surround" },
	{ "folke/which-key.nvim" },
	{
		-- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		-- High-performance color highlighter
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{ "towolf/vim-helm" },
	{ "RRethy/vim-illuminate" },
	{
		"nvim-telescope/telescope-media-files.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					media_files = {
						-- filetypes whitelist
						-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
						filetypes = { "png", "webp", "jpg", "jpeg" },
						-- find command (defaults to `fd`)
						find_cmd = "rg",
					},
				},
			})
		end,
	},
	{ "moll/vim-bbye" },
	{ "ntpeters/vim-better-whitespace" },
	{ "machakann/vim-highlightedyank" },
	{ "andymass/vim-matchup" },
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }, -- TODO: Find out how to use
	{ "ravenxrz/DAPInstall.nvim" }, -- TODO:: configure debuggers
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup()
		end,
	},
	-- { "dstein64/vim-startuptime" },
}
