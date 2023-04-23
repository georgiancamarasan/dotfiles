local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Plugin manager {{{
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself

	use({ "lewis6991/impatient.nvim" })
	-- }}}

	-- LSP Configuration & Plugins {{{
	use({
		"neovim/nvim-lspconfig",
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP (compile progress bar)
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
		config = function()
			require("user.lsp")
		end,
	})
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("RRethy/vim-illuminate") -- Vim plugin for automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
	use({
		"folke/trouble.nvim", -- A pretty list for showing diagnostics, references, telescope results...
		config = function()
			require("trouble").setup({})
		end,
	})
	-- }}}

	-- Autocompletion {{{
	use({
		"hrsh7th/nvim-cmp", -- A completion engine plugin for neovim written in Lua.
		requires = {
			"hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in language server client.
			{ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" }, -- snippets written in lua
			"saadparwaiz1/cmp_luasnip", -- luasnip completion source for nvim-cmp
			"rafamadriz/friendly-snippets", -- a bunch of snippets to use
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-nvim-lua", -- lua API completions
			"hrsh7th/cmp-cmdline", -- cmdline completions
			"David-Kunz/cmp-npm", -- npm packages completions
			"f3fora/cmp-spell", -- spell source for nvim-cmp based on vim's spellsuggest
			"andersevenrud/cmp-tmux", -- tmux adjacent panes completionsc
		},
		config = function()
			require("user.cmp")
		end,
	})
	use({})
	use({
		"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
		config = function()
			require("user.autopairs")
		end,
	})
	-- }}}

	-- Highlight, edit, and navigate code {{{
	use({
		"nvim-treesitter/nvim-treesitter", -- Treesitter configurations and abstraction layer for Neovim.
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		config = function()
			require("user.treesitter")
		end,
	})

	use({
		-- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects", -- Syntax aware text-objects, select, move, swap, and peek support.
		after = "nvim-treesitter",
	})
	use("nvim-treesitter/playground")
	-- }}}

	-- Git related plugins {{{
	use({
    "kdheepak/lazygit.nvim",
		"lewis6991/gitsigns.nvim", -- Super fast git decorations implemented purely in lua/teal.
		config = function()
			require("user.gitsigns")
      require("telescope").load_extension("lazygit")
		end,
	})
	-- }}}

	-- Colorschemes {{{
	-- use 'folke/tokyonight.nvim'
	use({
		-- 'navarasu/onedark.nvim' -- Theme inspired by Atom
		"lunarvim/darkplus.nvim",
		config = function()
			vim.cmd("colorscheme darkplus")
		end,
	})
	-- }}}

	-- Visual plugins {{{
	use({
		"goolord/alpha-nvim", -- alpha is a fast and fully programmable greeter for neovim.
		config = function()
			require("user.alpha")
		end,
	})

	use({
		"akinsho/bufferline.nvim", -- A snazzy buffer line (with tabpage integration) for Neovim built using lua.
		config = function()
			require("user.bufferline")
		end,
	})

	use({
		"nvim-lualine/lualine.nvim", -- Fancier statusline
		config = function()
			require("user.lualine")
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
		config = function()
			require("user.indent-blankline")
		end,
	})

	use({
		"nvim-tree/nvim-tree.lua", -- A File Explorer For Neovim Written In Lua
		config = function()
			require("user.nvim-tree")
		end,
	})

	use({
		"folke/which-key.nvim", -- displays a popup with possible key bindings of the command you started typing
		config = function()
			require("user.which-key")
		end,
	})
	--- }}}

	-- Comments {{{
	use({
		"numToStr/Comment.nvim", -- 'gc' to comment visual regions/lines
		config = function()
			require("user.comment")
		end,
	})
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	-- }}}

	--[[ use("tpope/vim-sleuth") -- Detect tabstop and shiftwidth automatically ]]

	-- Fuzzy Finder (files, lsp, etc) {{{
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("user.telescope")
		end,
	})
	use("nvim-telescope/telescope-media-files.nvim")
	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	-- }}}

	use({ "kyazdani42/nvim-web-devicons" })

	use("moll/vim-bbye") -- Bbye allows you to do delete buffers (close files) without closing your windows or messing up your layout.
	use("junegunn/vim-easy-align") -- A simple, easy-to-use Vim alignment plugin.
	use("tpope/vim-surround") --  is all about 'surroundings': parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
	--[[ use 'easymotion/vim-easymotion' -- Vim motion on speed! ]]
	use("ntpeters/vim-better-whitespace") -- causes all trailing whitespace characters to be highlighted.
	use("machakann/vim-highlightedyank") -- Make the yanked region apparent!
	use("editorconfig/editorconfig-vim") --
	use("christoomey/vim-tmux-navigator")
	use({ "andymass/vim-matchup", event = "VimEnter" })
	use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })
	use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview" })

	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("user.toggleterm")
		end,
	})
	use({
		"ahmedkhalf/project.nvim", -- an all in one neovim plugin written in lua that provides superior project management.
		config = function()
			require("user.project")
		end,
	})

	-- DAP (Debug Adapter Protocol) {{{
	use({
		"rcarriga/nvim-dap-ui", -- A UI for nvim-dap which provides a good out of the box configuration.
		requires = {
			"mfussenegger/nvim-dap", -- nvim-dap is a Debug Adapter Protocol client implementation for Neovim.
			config = function()
				require("user.dap")
			end,
		},
	})
	use("ravenxrz/DAPInstall.nvim") -- A NeoVim plugin for managing several debuggers for Nvim-dap
	-- use 'simrat39/rust-tools.nvim' -- A plugin to improve your rust experience in neovim.
	-- }}}

	-- Lua
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})

	use("dstein64/vim-startuptime")

	use("~/code/neovim-plugins/simple-plugin-dev.nvim")
	use("~/code/neovim-plugins/stackmap.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
