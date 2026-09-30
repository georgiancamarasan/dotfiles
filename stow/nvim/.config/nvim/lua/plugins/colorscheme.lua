return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000, -- load before other plugins
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
