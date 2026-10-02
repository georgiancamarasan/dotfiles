-- Small plugins that need little or no configuration. One spec each, with a comment
-- saying what it does and which keys it provides. Anything with its own keymaps or a
-- longer configuration lives in its own file in this directory instead.
return {
  -- vim-sleuth: detects indentation (tabs/spaces, width) from the file or its neighbours.
  -- Overrides the 2-space defaults from options.lua per file, e.g. 4 spaces in Python. No keys.
  "tpope/vim-sleuth",

  -- vim-surround: change surrounding quotes, brackets, tags.
  -- Keys: ys{motion}{char} add (ysiw" quotes a word) | cs{old}{new} change (cs"') | ds{char} delete (ds")
  --       S{char} in visual mode surrounds the selection.
  "tpope/vim-surround",

  -- nvim-autopairs: inserts the closing bracket/quote and handles <CR> and <BS> between pairs. No keys.
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

  -- nvim-colorizer: shows a color swatch behind color codes (#ff0000, rgb(), hsl(), Tailwind classes).
  -- Plain color names ("red") are off so ordinary words aren't highlighted. No keys.
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { user_default_options = { names = false, tailwind = true } },
  },

  -- vim-helm: filetype detection and syntax for Helm templates (*.yaml in templates/). No keys.
  { "towolf/vim-helm", ft = "helm" },

  -- vim-illuminate: highlights other uses of the word under the cursor (LSP, then treesitter).
  -- Keys: <A-n> next reference | <A-p> previous reference | <A-i> select the reference as a text object
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = function()
      require("illuminate").configure({ providers = { "lsp", "treesitter", "regex" }, delay = 200 })
    end,
  },

  -- vim-better-whitespace: highlights trailing whitespace. It does not strip on save
  -- (the formatters in formatting.lua handle that). Commands: :StripWhitespace, :ToggleWhitespace
  {
    "ntpeters/vim-better-whitespace",
    event = "BufReadPre",
    init = function()
      vim.g.strip_whitespace_on_save = 0
      vim.g.better_whitespace_filetypes_blacklist = {
        "alpha", "diff", "git", "gitcommit", "help", "lazy", "mason", "neo-tree",
        "noice", "TelescopePrompt", "toggleterm", "trouble", "qf",
      }
    end,
  },

  -- vim-matchup: extends % to jump between matching if/else/end, tags, etc. Also highlights the pair.
  -- Keys: % jump to the match | [% ]% previous/next enclosing block | g% reverse direction
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- crates.nvim: shows the latest versions of dependencies in Cargo.toml, with completion for
  -- crate names/versions. Runs as an in-process LSP, so use the normal LSP keys on it
  -- (gra = update/upgrade a crate, K = crate info, completion via blink).
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = { lsp = { enabled = true, actions = true, completion = true, hover = true } },
  },

  -- ts-comments: makes the built-in gc/gcc pick the right comment syntax inside
  -- embedded languages (JSX/TSX, Vue, HTML with scripts). Keys: see <leader>c in keymaps.lua.
  { "folke/ts-comments.nvim", event = "VeryLazy", opts = {} },

  -- indent-blankline (ibl): draws vertical indent guides and highlights the current scope.
  -- Helps in whitespace-significant languages (Python, YAML). No keys.
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPost",
    opts = { indent = { char = "│" }, scope = { enabled = true } },
  },
}
