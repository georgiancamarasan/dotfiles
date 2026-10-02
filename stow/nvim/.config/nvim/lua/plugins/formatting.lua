-- conform.nvim (formatters) and nvim-lint (linters).
--
-- Formatting runs on save. A language without a formatter below falls back to its LSP server.
-- Linting runs on open, save and when leaving insert mode, and shows up as normal diagnostics.
-- The tools are installed by mason-tool-installer (list in lsp.lua); yamllint comes from the system.
--
-- To change how a language is formatted/linted, edit `formatters_by_ft` / `linters_by_ft` below.
-- Python and JS/TS linting come from the ruff and eslint language servers (lsp.lua), not from here.
--
-- Keys
--   <leader>F   format the buffer (or the selection in visual mode)
-- Commands
--   :FormatDisable / :FormatEnable      turn format-on-save off / on everywhere
--   :FormatDisable! / :FormatEnable!    the same for the current buffer only
--   :ConformInfo                        show which formatters apply to this buffer
--
-- Line length: linters that enforce one use 120, matching 'colorcolumn' in options.lua.
--   markdown  linters/markdownlint-cli2.yaml (a project's own .markdownlint* file overrides it)
--   yaml      the `max` value in the yamllint args below
-- Ruff, eslint and shellcheck don't enforce a line length by default, so nothing is set for them.
--   prettier  120 unless the project has a prettier config (--config-precedence prefer-file)
--   ruff fmt  120 unless the project has ruff.toml / .ruff.toml / [tool.ruff] in pyproject.toml
-- Other formatters (stylua, csharpier, gofmt, shfmt) keep their own default widths.
--
-- Docs: https://github.com/stevearc/conform.nvim  https://github.com/mfussenegger/nvim-lint
-- True when `dir` (or a parent) has a ruff configuration, in which case its line length wins
local function has_ruff_config(dir)
  if vim.fs.find({ "ruff.toml", ".ruff.toml" }, { path = dir, upward = true })[1] then
    return true
  end
  local pyproject = vim.fs.find("pyproject.toml", { path = dir, upward = true })[1]
  if pyproject then
    for _, line in ipairs(vim.fn.readfile(pyproject)) do
      if line:match("^%s*%[tool%.ruff") then
        return true
      end
    end
  end
  return false
end

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>F",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = { "n", "v" },
        desc = "Format buffer",
      },
    },
    init = function()
      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, { bang = true, desc = "Disable format on save (! = this buffer only)" })

      vim.api.nvim_create_user_command("FormatEnable", function(args)
        if args.bang then
          vim.b.disable_autoformat = false
        else
          vim.g.disable_autoformat = false
        end
      end, { bang = true, desc = "Enable format on save (! = this buffer only)" })
    end,
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_organize_imports", "ruff_format" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        cs = { "csharpier" },
        go = { "goimports", "gofmt" },
        sh = { "shfmt" },
        -- rust, toml, ...: no entry, so the LSP server (rust-analyzer, taplo) formats
      },
      formatters = {
        prettier = {
          -- a project's prettier config (or .editorconfig) takes precedence over this width
          prepend_args = { "--print-width", "120", "--config-precedence", "prefer-file" },
        },
        ruff_format = {
          -- appended: ruff wants the `format` subcommand first
          append_args = function(_, ctx)
            if has_ruff_config(ctx.dirname) then
              return {}
            end
            return { "--line-length", "120" }
          end,
        },
      },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 1000, lsp_format = "fallback" }
      end,
    },
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        markdown = { "markdownlint-cli2" },
        yaml = { "yamllint" },
        sh = { "shellcheck" },
      }

      -- Relaxed preset (the default rules want document start markers) with a 120 column limit
      lint.linters.yamllint.args = {
        "-d", "{ extends: relaxed, rules: { line-length: { max: 120 } } }", "-f", "parsable", "-",
      }

      -- Base markdownlint config with a 120 column limit (see linters/markdownlint-cli2.yaml)
      lint.linters["markdownlint-cli2"].args = {
        "--config", vim.fn.stdpath("config") .. "/linters/markdownlint-cli2.yaml", "-",
      }

      vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("lint", { clear = true }),
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
