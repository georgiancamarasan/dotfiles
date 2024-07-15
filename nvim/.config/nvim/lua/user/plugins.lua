-- Automatically install packer
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

lazy.setup({
  "lewis6991/impatient.nvim",
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "j-hui/fidget.nvim",
        tag = "legacy",
        config = function()
          require('fidget').setup {}
        end,
      },
      "folke/neodev.nvim",
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
          {
            "williamboman/mason.nvim",
            dependencies = {
              "mfussenegger/nvim-lint",
              config = function()
                require("user.linters")
              end,
            },
            config = function()
              require("user.mason")
            end,
          },
        },
        config = function()
          require("user.mason.lspconfig")
        end,
      },
    },
    config = function()
      require("user.lsp")
    end,
  },

  "RRethy/vim-illuminate", -- Vim plugin for automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
  {
    "folke/trouble.nvim",  -- A pretty list for showing diagnostics, references, telescope results...
    config = function()
      require("trouble").setup({})
    end,
  },
  --"jose-elias-alvarez/null-ls.nvim" -- for formatters and linters ]]
  --"jay-babu/mason-null-ls.nvim"
  {
    "hrsh7th/nvim-cmp",       -- A completion engine plugin for neovim written in Lua.
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in language server client.
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
      },                              -- snippets written in lua
      "saadparwaiz1/cmp_luasnip",     -- luasnip completion source for nvim-cmp
      "rafamadriz/friendly-snippets", -- a bunch of snippets to use
      "hrsh7th/cmp-buffer",           -- buffer completions
      "hrsh7th/cmp-path",             -- path completions
      "hrsh7th/cmp-nvim-lua",         -- lua API completions
      "hrsh7th/cmp-cmdline",          -- cmdline completions
      "David-Kunz/cmp-npm",           -- npm packages completions
      "f3fora/cmp-spell",             -- spell source for nvim-cmp based on vim's spellsuggest
      "andersevenrud/cmp-tmux",       -- tmux adjacent panes completionsc
      "onsails/lspkind.nvim"          -- This tiny plugin adds vscode-like pictograms to neovim built-in lsp
    },
    config = function()
      require("user.cmp")
    end,
  },
  {
    "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
    config = function()
      require("user.autopairs")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter", -- Treesitter configurations and abstraction layer for Neovim.
    build = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
    config = function()
      require("user.treesitter")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects", -- Syntax aware text-objects, select, move, swap, and peek support.
    dependencies = {
      "nvim-treesitter"
    },
  },
  "nvim-treesitter/playground",
  "kdheepak/lazygit.nvim",
  {
    "lewis6991/gitsigns.nvim", -- Super fast git decorations implemented purely in lua/teal.
    config = function()
      require("user.gitsigns")
      require("telescope").load_extension("lazygit")
    end,
  },
  {
    -- 'navarasu/onedark.nvim' -- Theme inspired by Atom
    "lunarvim/darkplus.nvim",
    config = function()
      vim.cmd("colorscheme darkplus")
    end,
  },
  {
    "goolord/alpha-nvim", -- alpha is a fast and fully programmable greeter for neovim.
    config = function()
      require("user.alpha")
    end,
  },
  {
    "akinsho/bufferline.nvim", -- A snazzy buffer line (with tabpage integration) for Neovim built using lua.
    config = function()
      require("user.bufferline")
    end,
  },
  {
    "nvim-lualine/lualine.nvim", -- Fancier statusline
    config = function()
      require("user.lualine")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
    main = "ibl",
    opts = {},
    config = function()
      require("user.indent-blankline")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua", -- A File Explorer For Neovim Written In Lua
    config = function()
      require("user.nvim-tree")
    end,
  },
  {
    "folke/which-key.nvim", -- displays a popup with possible key bindings of the command you started typing
    config = function()
      require("user.which-key")
    end,
    event = "VeryLazy",
  },
  {
    "numToStr/Comment.nvim", -- 'gc' to comment visual regions/lines
    config = function()
      require("user.comment")
    end,
  },
  "JoosepAlviste/nvim-ts-context-commentstring",
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
  },
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  "nvim-telescope/telescope-media-files.nvim",
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  "kyazdani42/nvim-web-devicons",
  "moll/vim-bbye",                  -- Bbye allows you to do delete buffers (close files) without closing your windows or messing up your layout.
  "junegunn/vim-easy-align",        -- A simple, easy-to-use Vim alignment plugin.
  "tpope/vim-surround",             --  is all about 'surroundings': parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
  --[[ use 'easymotion/vim-easymotion' -- Vim motion on speed! ]]
  "ntpeters/vim-better-whitespace", -- causes all trailing whitespace characters to be highlighted.
  "machakann/vim-highlightedyank",  -- Make the yanked region apparent!
  "editorconfig/editorconfig-vim",  --
  "christoomey/vim-tmux-navigator",
  {
    "andymass/vim-matchup",
    event = "VimEnter"
  },
  {
    "tpope/vim-dispatch",
    lazy = true,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    cmd = "MarkdownPreview"
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("user.toggleterm")
    end,
  },
  {
    "ahmedkhalf/project.nvim", -- an all in one neovim plugin written in lua that provides superior project management.
    config = function()
      require("user.project")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",    -- A UI for nvim-dap which provides a good out of the box configuration.
    requires = {
      "mfussenegger/nvim-dap", -- nvim-dap is a Debug Adapter Protocol client implementation for Neovim.
      config = function()
        require("user.dap")
      end,
    },
  },
  "ravenxrz/DAPInstall.nvim",
  -- 'simrat39/rust-tools.nvim' -- A plugin to improve your rust experience in neovim.
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({})
    end,
  },
  {
    "saecki/crates.nvim",
    tag = "v0.4.0",
    config = function()
      require("crates").setup()
    end,
  },
  "dstein64/vim-startuptime",
  --"~/code/neovim-plugins/simple-plugin-dev.nvim"
  --"~/code/neovim-plugins/stackmap.nvim"
}, {});
