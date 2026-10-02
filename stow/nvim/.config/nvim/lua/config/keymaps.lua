-- Leader keys must be set before any <leader> mapping is defined and before lazy.nvim
-- loads plugins, so init.lua requires this file ahead of config.lazy.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Every mapping is silent and carries a description (shown by :map and which-key).
-- `extra` is merged into the options (e.g. { remap = true } to trigger other mappings).
local function map(mode, lhs, rhs, desc, extra)
  vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", { silent = true, desc = desc }, extra or {}))
end

-- Keys added by plugins live in lua/plugins/<plugin>.lua, each documented in its file header.

-- General
map({ "n", "v" }, "<Space>", "<Nop>", "Leader key: disable its default motion")
map("i", "jk", "<Esc>", "Leave insert mode")
map("n", "x", '"_x', "Delete character without yanking")
map({ "n", "v" }, "<leader>d", '"_d', "Delete without yanking")
map("v", "p", '"_dP', "Paste over selection, keep the register")
map("v", "<", "<gv", "Indent left, keep selection")
map("v", ">", ">gv", "Indent right, keep selection")

-- Commenting uses Neovim's built-in gc/gcc operators (remap so the built-in mappings fire)
map("n", "<leader>c", "gcc", "Toggle comment on line", { remap = true })
map("v", "<leader>c", "gc", "Toggle comment on selection", { remap = true })

-- Scrolling and search: keep the cursor centered
map("n", "<C-d>", "<C-d>zz", "Scroll down, centered")
map("n", "<C-u>", "<C-u>zz", "Scroll up, centered")
map("n", "n", "nzzzv", "Next match, centered")
map("n", "N", "Nzzzv", "Previous match, centered")

-- Moving lines (re-indents after the move)
map("n", "<A-j>", "<cmd>m .+1<CR>==", "Move line down")
map("n", "<A-k>", "<cmd>m .-2<CR>==", "Move line up")
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move selection down")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move selection up")
map("v", "J", ":m '>+1<CR>gv=gv", "Move selection down")
map("v", "K", ":m '<-2<CR>gv=gv", "Move selection up")

-- Files and buffers (next/previous buffer: built-in ]b and [b)
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", "Save file")
map("n", "<leader>w", "<cmd>w<CR>", "Save file")
map("n", "<leader>q", "<cmd>bdelete<CR>", "Close buffer (refuses if unsaved)")
map("n", "<leader><leader>", "<C-^>", "Switch to the alternate buffer")

-- Windows
map("n", "<leader>v", "<C-w>v", "Split vertically")
map("n", "<leader>h", "<C-w>s", "Split horizontally")
map("n", "<leader>se", "<C-w>=", "Make splits equal size")
map("n", "<leader>sc", "<cmd>close<CR>", "Close current split")

-- Moving between splits (<C-h/j/k/l>) is handled by vim-tmux-navigator, see plugins/tmux-navigator.lua

map("n", "<C-Up>", "<cmd>resize -2<CR>", "Make split shorter")
map("n", "<C-Down>", "<cmd>resize +2<CR>", "Make split taller")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", "Make split narrower")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", "Make split wider")

-- Tabs
map("n", "<leader>to", "<cmd>tabnew<CR>", "New tab")
map("n", "<leader>tx", "<cmd>tabclose<CR>", "Close tab")
map("n", "<leader>tn", "<cmd>tabnext<CR>", "Next tab")
map("n", "<leader>tp", "<cmd>tabprevious<CR>", "Previous tab")

-- Toggles
map("n", "<leader>lw", "<cmd>set wrap!<CR>", "Toggle line wrapping")

-- Diagnostics
map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Previous diagnostic")
map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic")
-- Diagnostic float under the cursor: built-in <C-w>d (also shown by [d / ]d)

-- Plugin management
map("n", "<leader>ps", "<cmd>Lazy sync<CR>", "Sync plugins (lazy.nvim)")
map("n", "<leader>pl", "<cmd>Lazy<CR>", "Plugin manager (lazy.nvim)")
map("n", "<leader>pm", "<cmd>Mason<CR>", "Tool installer (Mason)")
