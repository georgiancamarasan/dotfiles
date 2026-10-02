-- nvim-treesitter (main branch): parses code into a syntax tree, which Neovim uses for
-- accurate highlighting. LSP semantic tokens are layered on top by Neovim itself.
--
-- How it works here
--   * `parsers` below are installed in the background on startup (needs the tree-sitter CLI
--     and a C compiler, both provisioned by the dotfiles). Already-installed ones are skipped.
--   * Highlighting is started per buffer from a FileType autocmd; filetypes without a parser
--     simply keep Vim's regex syntax.
--   * Indentation still uses Vim's own indent rules (treesitter indent is experimental).
-- To support another language: add its parser name to `parsers`, then restart Neovim.
--
-- Commands: :TSUpdate (update parsers), :checkhealth nvim-treesitter, :InspectTree (show the tree)
-- Keys: none. (vim-matchup and ts-comments use the trees automatically.)
--
-- Docs: https://github.com/nvim-treesitter/nvim-treesitter (branch main)
local parsers = {
  "bash", "c_sharp", "css", "diff", "dockerfile", "gitcommit", "go", "gomod", "helm", "html",
  "javascript", "json", "lua", "markdown", "markdown_inline", "python", "query", "regex",
  "rust", "toml", "tsx", "typescript", "vim", "vimdoc", "yaml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false, -- the main branch does not support lazy-loading
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
      desc = "Start treesitter highlighting",
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
