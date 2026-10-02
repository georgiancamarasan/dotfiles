-- Language servers: code intelligence (errors, completion data, go-to-definition, hover docs, rename).
--
-- Pieces
--   mason.nvim                 installs servers/tools into ~/.local/share/nvim/mason (:Mason to browse)
--   mason-lspconfig.nvim       installs the servers listed in `servers` below and enables them
--   mason-tool-installer.nvim  installs the formatters/linters/tools listed in `tools` below
--   nvim-lspconfig             provides the default settings for every server (via vim.lsp.config)
--   fidget.nvim                shows LSP progress ("indexing...") in the corner
-- To add a language server: add it to `servers` (lspconfig name; put overrides in its table), restart.
-- C# is separate, see dotnet.lua. Formatters/linters are configured in formatting.lua.
--
-- Keys (active in buffers with an LSP server; Neovim built-ins marked *)
--   K    hover documentation *            gd   go to definition (telescope)
--   gD   go to declaration                grr  references (telescope)
--   gri  implementations (telescope)      grt  type definition (telescope)
--   grn  rename symbol *                  gra  code action *  (normal and visual)
--   gO   symbols in this file *           <C-s> (insert) signature help * (shadowed by save, use <C-k>)
--   [d / ]d  previous / next diagnostic   <C-w>d  show the diagnostic under the cursor *
--   <leader>lh  toggle inlay hints        <leader>F  format (formatting.lua)
--   <leader>pm  open Mason                :LspInfo / :checkhealth vim.lsp  (what is attached)
--   :LspRestart restarts the servers of the current buffer.
--
-- Diagnostics: errors/warnings are underlined, shown at the end of the line, and marked in the
-- sign column. <leader>xx (trouble.lua) lists them; <leader>fd searches them.
--
-- Docs: https://github.com/neovim/nvim-lspconfig  https://github.com/mason-org/mason.nvim

-- Servers, keyed by their nvim-lspconfig name. `{}` means default settings.
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
        completion = { callSnippet = "Replace" },
        telemetry = { enable = false },
      },
    },
  },
  basedpyright = { settings = { basedpyright = { disableOrganizeImports = true } } }, -- ruff organizes imports
  ruff = {
    on_attach = function(client)
      client.server_capabilities.hoverProvider = false -- let basedpyright answer hover
    end,
  },
  ts_ls = {}, -- JavaScript / TypeScript
  eslint = {},
  html = {},
  cssls = {},
  tailwindcss = {
    -- upstream also attaches to markdown (and any git repo, as the Tailwind v4 fallback); keep it to web files
    filetypes = {
      "html", "css", "scss", "less", "javascript", "javascriptreact",
      "typescript", "typescriptreact", "vue", "svelte", "astro", "razor",
    },
  },
  jsonls = {},
  yamlls = {},
  taplo = {}, -- TOML
  marksman = {}, -- Markdown
  bashls = {},
  dockerls = {},
  helm_ls = {},
  rust_analyzer = { settings = { ["rust-analyzer"] = { check = { command = "clippy" } } } },
  gopls = { settings = { gopls = { gofumpt = true, staticcheck = true } } },
}

-- Non-LSP tools installed through Mason (used by formatting.lua and dotnet.lua).
local tools = {
  "stylua", -- format: lua
  "prettier", -- format: js/ts/json/css/html/yaml/markdown
  "shfmt", -- format: shell
  "csharpier", -- format: C#
  "goimports", -- format: go imports
  "markdownlint-cli2", -- lint: markdown
  "shellcheck", -- lint: shell
  "roslyn", -- C# language server, from the Crashdummyy registry (dotnet.lua)
}

return {
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonUpdate", "MasonInstall", "MasonLog" },
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry", -- provides the `roslyn` package
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    dependencies = { "mason-org/mason.nvim" },
    opts = { ensure_installed = tools },
  },

  { "j-hui/fidget.nvim", event = "LspAttach", opts = {} },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "saghen/blink.cmp", -- provides the completion capabilities
    },
    config = function()
      -- Diagnostics appearance
      vim.diagnostic.config({
        severity_sort = true,
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 2, prefix = "●", source = "if_many" },
        float = { border = "rounded", source = true },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.INFO] = "I",
            [vim.diagnostic.severity.HINT] = "H",
          },
        },
      })

      -- Keys that only exist in buffers where a server is attached
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_attach_keys", { clear = true }),
        callback = function(event)
          local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = event.buf, silent = true, desc = "LSP: " .. desc })
          end
          local function telescope(picker)
            return function()
              require("telescope.builtin")[picker]()
            end
          end

          map("gd", telescope("lsp_definitions"), "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("grr", telescope("lsp_references"), "References")
          map("gri", telescope("lsp_implementations"), "Implementations")
          map("grt", telescope("lsp_type_definitions"), "Type definition")
          map("<leader>lh", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }), { bufnr = event.buf })
          end, "Toggle inlay hints")
        end,
      })

      -- Every server gets blink.cmp's completion capabilities
      vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })

      for name, config in pairs(servers) do
        if next(config) ~= nil then
          vim.lsp.config(name, config)
        end
      end

      -- Install the servers above and enable them (vim.lsp.enable) once installed
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        -- stylua is also an LSP name, but formatting goes through conform; roslyn is started by roslyn.nvim
        automatic_enable = { exclude = { "stylua", "roslyn" } },
      })
    end,
  },
}
