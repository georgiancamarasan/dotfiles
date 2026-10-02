-- trouble.nvim: a panel listing diagnostics, symbols, references, TODOs and the quickfix list.
--
-- Keys
--   <leader>xx  diagnostics of the whole workspace      <leader>xX  diagnostics of this buffer
--   <leader>xs  symbols of this file (outline)          <leader>xl  LSP definitions / references
--   <leader>xq  quickfix list                           <leader>xL  location list
--   <leader>xt  TODO comments (todo-comments.lua)
-- Inside the panel
--   <CR> jump to the item   o jump and close   p preview   j / k move   q close
--   ?  show all keys
--
-- Docs: https://github.com/folke/trouble.nvim
return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {},
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (workspace)" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Diagnostics (buffer)" },
    { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Symbols (outline)" },
    { "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP definitions / references" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix list" },
    { "<leader>xL", "<cmd>Trouble loclist toggle<CR>", desc = "Location list" },
    { "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "TODO comments" },
  },
}
