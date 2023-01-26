local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

telescope.setup {
  defaults = {

    prompt_prefix = ' ',
    selection_caret = ' ',
    path_display = { 'smart' },
    file_ignore_patterns = { '.git/', 'node_modules' },
  },
  pickers = {
    find_files = {
      -- From https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/telescope/setup.lua
      -- Don't know what it does yet :D
      find_command = { "fd", "--strip-cwd-prefix", "--type", "f" },

      mappings = {
        n = {
          ["kj"] = "close",
        },
      },
    },

    git_branches = {
      mappings = {
        i = {
          ["<C-a>"] = false,
        },
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    }
  },
  layout_strategy = "horizontal",
  layout_config = {
    width = 0.95,
    height = 0.85,
    -- preview_cutoff = 120,
    prompt_position = "top",

    horizontal = {
      preview_width = function(_, cols, _)
        if cols > 200 then
          return math.floor(cols * 0.4)
        else
          return math.floor(cols * 0.6)
        end
      end,
    },

    vertical = {
      width = 0.9,
      height = 0.95,
      preview_height = 0.5,
    },

    flex = {
      horizontal = {
        preview_width = 0.9,
      },
    },
  },
}

telescope.load_extension('fzf')
