-- Git support: gitsigns (changes in the sign column, hunk actions), vim-fugitive (full git
-- commands inside Neovim) and vim-rhubarb (GitHub links for fugitive). lazygit is in toggleterm.lua.
--
-- Keys (n = normal, v = visual)
--   ]h / [h        next / previous changed hunk
--   <leader>gs     stage hunk (n, v)  -- pressing it on a staged hunk unstages it
--   <leader>gr     reset hunk, discarding the change (n, v)
--   <leader>gS     stage the whole buffer
--   <leader>gp     preview the hunk in a popup
--   <leader>gb     blame the current line (full commit message)
--   <leader>gB     toggle inline blame on every line
--   <leader>gd     diff the file against the index
--   <leader>gg     git status window (fugitive); inside it: s stage, u unstage, cc commit, = inline diff, g? help
--   <leader>gl     lazygit (toggleterm.lua)
--   <leader>go     open the file/selection on GitHub in the browser (fugitive + rhubarb) (n, v)
--
-- Handy fugitive commands: :Git blame, :Git log, :Gdiffsplit, :Git push, :GBrowse
--
-- Docs: https://github.com/lewis6991/gitsigns.nvim  https://github.com/tpope/vim-fugitive
return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = "Git: " .. desc })
        end

        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next hunk")
        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Previous hunk")

        map("n", "<leader>gs", gs.stage_hunk, "Stage / unstage hunk")
        map("v", "<leader>gs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Stage / unstage selection")
        map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
        map("v", "<leader>gr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Reset selection")
        map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
        map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>gb", function()
          gs.blame_line({ full = true })
        end, "Blame line")
        map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle inline blame")
        map("n", "<leader>gd", gs.diffthis, "Diff against index")
      end,
    },
  },

  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "GBrowse" },
    dependencies = { "tpope/vim-rhubarb" },
    keys = {
      { "<leader>gg", "<cmd>Git<CR>", desc = "Git status (fugitive)" },
      { "<leader>go", "<cmd>GBrowse<CR>", mode = { "n", "v" }, desc = "Open on GitHub" },
    },
  },
}
