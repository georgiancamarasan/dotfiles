-- todo-comments.nvim: highlights TODO, FIX, HACK, WARN, PERF, NOTE and TEST in comments
-- (write them as `TODO:` in capitals) and lets you jump to or search them.
--
-- Keys
--   ]t / [t      next / previous TODO comment
--   <leader>ft   search all TODO comments in the project (telescope)
--   <leader>xt   list them in the trouble panel (trouble.lua)
-- Command: :TodoQuickFix
--
-- Docs: https://github.com/folke/todo-comments.nvim
return {
  "folke/todo-comments.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Next TODO comment",
    },
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Previous TODO comment",
    },
    { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "TODO comments" },
  },
}
