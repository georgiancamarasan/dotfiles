-- neo-tree: file explorer in a side panel (also shows git status and open buffers).
--
-- Keys (global)
--   <leader>e   toggle the explorer
--   <leader>E   open the explorer at the current file
--
-- Keys inside the explorer (set in `window.mappings` / `filesystem.window.mappings` below)
--   Open / navigate
--     <CR> or l  open file / expand folder      h  collapse folder
--     s  open in vertical split     S  open in horizontal split     t  open in new tab
--     P  preview file (float)       <BS>  go up one directory       .  make folder the root
--     z  collapse all folders       R  refresh
--   Files
--     a  new file (end with / for a folder)     A  new folder
--     r  rename    d  delete    m  move    c  copy
--     y  copy to clipboard   x  cut to clipboard   p  paste from clipboard
--   Filter / search
--     /  fuzzy find (type to filter, <CR> to jump)      f  filter (apply with <CR>)
--     <C-x>  clear filter        H  show/hide dotfiles and ignored files
--   Git
--     [g / ]g  previous / next git-modified file
--   Other
--     ?  show all keys       i  file details      < / >  switch source (files / buffers / git)
--     q  close the explorer
--   <Space> is disabled here so <leader> mappings (e.g. <leader>ff) still work in the tree.
--
-- Docs: https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Explorer: toggle" },
    { "<leader>E", "<cmd>Neotree reveal<CR>", desc = "Explorer: reveal current file" },
  },
  opts = {
    close_if_last_window = true, -- don't leave the explorer as the last window
    window = {
      position = "right",
      width = 50,
      mappings = {
        ["<space>"] = "none",
        ["<cr>"] = "open",
        ["l"] = "open",
        ["h"] = "close_node",
        ["s"] = "open_vsplit",
        ["S"] = "open_split",
        ["t"] = "open_tabnew",
        ["P"] = { "toggle_preview", config = { use_float = true } },
        ["z"] = "close_all_nodes",
        ["R"] = "refresh",
        ["a"] = { "add", config = { show_path = "relative" } },
        ["A"] = "add_directory",
        ["r"] = "rename",
        ["d"] = "delete",
        ["m"] = "move",
        ["c"] = "copy",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["i"] = "show_file_details",
        ["<"] = "prev_source",
        [">"] = "next_source",
        ["q"] = "close_window",
        ["?"] = "show_help",
      },
    },
    filesystem = {
      follow_current_file = { enabled = true }, -- highlight the file you are editing
      use_libuv_file_watcher = true, -- refresh when files change on disk
      window = {
        mappings = {
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["H"] = "toggle_hidden",
          ["/"] = "fuzzy_finder",
          ["f"] = "filter_on_submit",
          ["<C-x>"] = "clear_filter",
          ["[g"] = "prev_git_modified",
          ["]g"] = "next_git_modified",
        },
      },
    },
  },
}
