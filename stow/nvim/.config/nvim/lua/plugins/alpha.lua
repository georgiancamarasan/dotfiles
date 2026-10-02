-- alpha-nvim: the start screen shown when you run `nvim` without a file.
--
-- Keys (press the letter on the start screen)
--   f  find file        n  new file       r  recent files    g  grep text
--   c  open config      l  Lazy           q  quit
--
-- Edit `header` and `buttons` below to change the screen.
-- Docs: https://github.com/goolord/alpha-nvim
return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "                                   ",
      "   N E O V I M                     ",
      "                                   ",
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "Find file", "<cmd>Telescope find_files<CR>"),
      dashboard.button("n", "New file", "<cmd>enew<CR>"),
      dashboard.button("r", "Recent files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("g", "Grep text", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("c", "Config", "<cmd>cd " .. vim.fn.stdpath("config") .. " | edit init.lua<CR>"),
      dashboard.button("l", "Lazy", "<cmd>Lazy<CR>"),
      dashboard.button("q", "Quit", "<cmd>qa<CR>"),
    }

    require("alpha").setup(dashboard.config)
  end,
}
