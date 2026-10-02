-- lualine.nvim: the statusline at the bottom of the screen. No keys.
--
-- Layout:  mode | branch, diff | file path, diagnostics   ...   LSP servers | filetype | position
-- The mode is shown here because 'showmode' is off in options.lua.
-- The colors follow the active colorscheme (theme = "auto").
--
-- Docs: https://github.com/nvim-lualine/lualine.nvim

-- Names of the LSP servers attached to the current buffer
local function lsp_names()
  local names = {}
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    names[#names + 1] = client.name
  end
  return table.concat(names, ", ")
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "auto",
      globalstatus = true, -- one statusline, matches laststatus = 3
      disabled_filetypes = { statusline = { "alpha" } },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = { { "filename", path = 1 }, "diagnostics" },
      lualine_x = { lsp_names },
      lualine_y = { "filetype" },
      lualine_z = { "progress", "location" },
    },
  },
}
