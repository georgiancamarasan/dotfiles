-- vim-tmux-navigator: use the same keys to move between Neovim splits and tmux panes.
-- The tmux side lives in stow/tmux/.config/tmux/tmux.conf (bindings for C-h/j/k/l); both
-- halves are needed. Outside tmux it just moves between Neovim splits.
--
-- Keys (no prefix)
--   <C-h> <C-j> <C-k> <C-l>   move to the left / lower / upper / right split or pane
--   In the shell, Ctrl-l no longer clears the screen; use <tmux prefix> then Ctrl-l instead.
--
-- Docs: https://github.com/christoomey/vim-tmux-navigator
return {
  "christoomey/vim-tmux-navigator",
  cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight" },
  init = function()
    -- We define the keys below; the plugin's default <C-\> would clash with the terminal toggle.
    vim.g.tmux_navigator_no_mappings = 1
  end,
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<CR>", desc = "Go to left split / tmux pane" },
    { "<C-j>", "<cmd>TmuxNavigateDown<CR>", desc = "Go to lower split / tmux pane" },
    { "<C-k>", "<cmd>TmuxNavigateUp<CR>", desc = "Go to upper split / tmux pane" },
    { "<C-l>", "<cmd>TmuxNavigateRight<CR>", desc = "Go to right split / tmux pane" },
  },
}
