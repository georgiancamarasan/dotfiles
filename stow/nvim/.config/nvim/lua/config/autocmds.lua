-- Autocommands that aren't tied to a plugin.

local group = vim.api.nvim_create_augroup("config", { clear = true })

-- Briefly highlight yanked text (replaces vim-highlightedyank)
vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  desc = "Highlight yanked text",
  callback = function()
    vim.hl.on_yank()
  end,
})

-- ftplugins often reset 'formatoptions', so reapply "don't continue comments on o/O/<Enter>"
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  desc = "No automatic comment leader",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})
