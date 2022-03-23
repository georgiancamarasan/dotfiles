local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  use "tpope/vim-sensible" -- Defaults everyone can agree on
  use "xolox/vim-misc" -- Vim scripts that are used by other plugins
  use "junegunn/vim-easy-align" --
  use "tpope/vim-surround" --
  use "easymotion/vim-easymotion" --
  use "ntpeters/vim-better-whitespace" --
  use "mhinz/vim-startify" -- The fancy start screen for Vim.
  use "bling/vim-bufferline" -- super simple vim plugin to show the list of buffers in the command bar
  use "jlanzarotta/bufexplorer" -- With bufexplorer, you can quickly and easily switch between buffers by using the one of the default public interfaces
  use "airblade/vim-rooter" -- Changes Vim working directory to project root (identified by presence of known directory or file).
  use "machakann/vim-highlightedyank" -- Make the yanked region apparent!
  --use "tpope/vim-dadbod" -- Modern database interface for Vim
  use "editorconfig/editorconfig-vim" --
  use "christoomey/vim-tmux-navigator" --
  use {'andymass/vim-matchup', event = 'VimEnter'}
  use "9mm/vim-closer" -- Closes brackets when you press Enter
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

   use {
    "w0rp/ale",
    ft = {"ansible-lint", "csc", "dotnet-format", "csslint", "dockerfile_lint", "htmlhint", "eslint", "markdownlint", "prettier", "powershell", "pyright", "rustfmt", "sass-lint", "tslint", "yamllint"},
    cmd = "ALEEnable",
    config = "vim.cmd[[ALEEnable]]"
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"

  -- does not work with init lua. Waiting for fix.
  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- cmp plugins
  use {
    "hrsh7th/nvim-cmp", -- The completion plugin
    requires = {
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-buffer", -- buffer completions
      "hrsh7th/cmp-path", -- path completions
      "hrsh7th/cmp-cmdline", -- cmdline completions
      "saadparwaiz1/cmp_luasnip", -- snippet completions
      "hrsh7th/cmp-nvim-lsp", -- lsp completions
      "hrsh7th/cmp-nvim-lua", -- vim lua settings completions
      "David-Kunz/cmp-npm", -- npm packages completions
      "f3fora/cmp-spell", -- spell source for nvim-cmp based on vim's spellsuggest
      "andersevenrud/cmp-tmux", -- tmux adjacent panes completionsc
    }
  }

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "p00f/nvim-ts-rainbow"
  -- use "nvim-treesitter/playground"

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }

  -- use {
    -- 'glepnir/galaxyline.nvim',
    -- branch = 'main',
    -- requires = {'kyazdani42/nvim-web-devicons', opt = true}
  -- }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

