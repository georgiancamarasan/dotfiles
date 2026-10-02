-- which-key.nvim: pops up the available keys after you press a prefix (e.g. <Space>).
--
-- It shows every mapping that has a `desc`, so individual mappings never need to be
-- registered here. This file only gives the <leader> prefixes a readable group name.
-- When you add a new <leader>x prefix anywhere, add its group name to `spec` below.
--
-- Keys
--   <leader>?   show the keymaps that are active in the current buffer (LSP, git, ...)
--   <Space>     wait and the popup lists all <leader> mappings
--   Popup:      <BS> go up a level, <Esc> close
--
-- Docs: https://github.com/folke/which-key.nvim
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer-local keymaps",
    },
  },
  opts = {
    spec = {
      { "<leader>b", group = "debug" },
      { "<leader>f", group = "find (telescope)" },
      { "<leader>g", group = "git", mode = { "n", "v" } },
      { "<leader>l", group = "toggles / lsp" },
      { "<leader>p", group = "plugins" },
      { "<leader>s", group = "splits" },
      { "<leader>t", group = "tabs" },
      { "<leader>x", group = "diagnostics (trouble)" },
    },
  },
}
