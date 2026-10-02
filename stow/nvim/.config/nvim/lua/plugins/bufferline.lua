-- bufferline.nvim: the tab-like bar at the top listing open buffers (with LSP error counts).
-- Tabs created with <leader>to are shown on the right when more than one exists.
--
-- Keys
--   ]b / [b     next / previous buffer, in the order shown in the bar
--   <leader>q   close the current buffer (keymaps.lua)
--   <leader><leader>  jump to the alternate (last) buffer (keymaps.lua)
--   Mouse       click a buffer to switch, click x to close
--
-- Docs: https://github.com/akinsho/bufferline.nvim
return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "]b", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
  },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      always_show_bufferline = false, -- hide when only one buffer is open
      offsets = {
        { filetype = "neo-tree", text = "Explorer", highlight = "Directory", separator = true, side = "right" },
      },
    },
  },
}
