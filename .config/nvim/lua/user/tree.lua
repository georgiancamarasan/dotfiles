local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

tree.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  auto_close          = true,
  update_cwd          = true,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 50,
    height = 30,
    hide_root_folder = false,
    side = 'right',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
}
