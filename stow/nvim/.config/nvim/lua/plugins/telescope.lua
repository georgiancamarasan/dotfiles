-- telescope.nvim: fuzzy finder popup for files, text, buffers, symbols, help and more.
-- Extensions: fzf-native (faster sorting), ui-select (vim.ui.select, e.g. code actions, as a telescope list).
-- Needs ripgrep (installed) for live grep. LSP pickers (gd, grr, ...) are set up in lsp.lua.
--
-- Keys (global)
--   <leader>ff  find files                <leader>fg  live grep (search text in the project)
--   <leader>fw  grep word under cursor    <leader>f/  fuzzy search in the current buffer
--   <leader>fb  open buffers              <leader>fr  recent files
--   <leader>fs  symbols in this file      <leader>fS  symbols in the workspace
--   <leader>fd  diagnostics               <leader>fh  help tags
--   <leader>fk  keymaps                   <leader>fR  resume the last picker
--   <leader>ft  TODO comments (todo-comments.lua)
--
-- Keys inside the picker
--   <C-j> / <C-k>  next / previous result       <CR>  open
--   <C-v> / <C-x> / <C-t>  open in vsplit / split / tab
--   <C-q>  send all results to the quickfix list and open it (see trouble.lua for a nicer view)
--   <C-/> (insert) or ? (normal)  show all picker keys      <Esc>  close
--
-- Docs: https://github.com/nvim-telescope/telescope.nvim

-- Builds a key handler that runs a telescope picker lazily
local function pick(name, opts)
  return function()
    require("telescope.builtin")[name](opts)
  end
end

return {
  "nvim-telescope/telescope.nvim",
  branch = "master", -- the 0.1.x tag predates Neovim 0.11+ treesitter changes
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<leader>ff", pick("find_files"), desc = "Find files" },
    { "<leader>fg", pick("live_grep"), desc = "Live grep" },
    { "<leader>fw", pick("grep_string"), desc = "Grep word under cursor" },
    { "<leader>f/", pick("current_buffer_fuzzy_find"), desc = "Fuzzy find in buffer" },
    { "<leader>fb", pick("buffers", { sort_mru = true }), desc = "Buffers" },
    { "<leader>fr", pick("oldfiles"), desc = "Recent files" },
    { "<leader>fs", pick("lsp_document_symbols"), desc = "Symbols in file" },
    { "<leader>fS", pick("lsp_dynamic_workspace_symbols"), desc = "Symbols in workspace" },
    { "<leader>fd", pick("diagnostics"), desc = "Diagnostics" },
    { "<leader>fh", pick("help_tags"), desc = "Help tags" },
    { "<leader>fk", pick("keymaps"), desc = "Keymaps" },
    { "<leader>fR", pick("resume"), desc = "Resume last picker" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        file_ignore_patterns = { "^.git/" },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        find_files = { hidden = true }, -- include dotfiles; .gitignore is still respected
      },
      extensions = {
        ["ui-select"] = { require("telescope.themes").get_dropdown() },
      },
    })

    pcall(telescope.load_extension, "fzf")
    telescope.load_extension("ui-select")
  end,
}
