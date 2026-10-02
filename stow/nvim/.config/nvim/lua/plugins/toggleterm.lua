-- toggleterm.nvim: a terminal you can show and hide with one key, plus a floating lazygit.
-- The terminal keeps running while hidden. Uses the shell set in options.lua (bash).
--
-- Keys
--   <C-\>        toggle the terminal at the bottom (works in normal and terminal mode)
--   <Esc><Esc>   in a terminal: back to normal mode (to scroll or copy)
--   <leader>gl   toggle lazygit in a floating window (needs lazygit on PATH)
--   :2ToggleTerm opens a second, separate terminal (any number works)
--
-- Docs: https://github.com/akinsho/toggleterm.nvim
local lazygit -- created on first use

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = "ToggleTerm",
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<CR>", mode = { "n", "t" }, desc = "Toggle terminal" },
    {
      "<leader>gl",
      function()
        if not lazygit then
          lazygit = require("toggleterm.terminal").Terminal:new({
            cmd = "lazygit",
            direction = "float",
            hidden = true,
            float_opts = { border = "rounded" },
          })
        end
        lazygit:toggle()
      end,
      desc = "Git: lazygit",
    },
  },
  opts = {
    direction = "horizontal",
    size = 15,
    shade_terminals = false,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)
    vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Terminal: back to normal mode" })
  end,
}
