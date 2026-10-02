-- Leader keys must be set before any <leader> mapping is defined and before lazy.nvim
-- loads plugins, so init.lua requires this file ahead of config.lazy.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Every mapping is silent and carries a description (shown by :map and which-key).
local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- General
map({ "n", "v" }, "<Space>", "<Nop>", "Leader key: disable its default motion")
map("i", "jk", "<Esc>", "Leave insert mode")
map("n", "x", '"_x', "Delete character without yanking")
map({ "n", "v" }, "<leader>d", '"_d', "Delete without yanking")
map("v", "p", '"_dP', "Paste over selection, keep the register")
map("v", "<", "<gv", "Indent left, keep selection")
map("v", ">", ">gv", "Indent right, keep selection")

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
map("n", "<leader>x", "<cmd>x<CR>", "Save and close window (quits nvim if it is the last one)")
map("n", "<leader>q", "<cmd>bdelete<CR>", "Close buffer (refuses if unsaved)")
map("n", "<leader><leader>", "<C-^>", "Switch to the alternate buffer")

-- Windows
map("n", "<leader>v", "<C-w>v", "Split vertically")
map("n", "<leader>h", "<C-w>s", "Split horizontally")
map("n", "<leader>se", "<C-w>=", "Make splits equal size")
map("n", "<leader>sc", "<cmd>close<CR>", "Close current split")

map("n", "<C-h>", "<cmd>wincmd h<CR>", "Go to left split")
map("n", "<C-j>", "<cmd>wincmd j<CR>", "Go to lower split")
map("n", "<C-k>", "<cmd>wincmd k<CR>", "Go to upper split")
map("n", "<C-l>", "<cmd>wincmd l<CR>", "Go to right split")

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
map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostic under cursor")

-- Plugins
map("n", "<leader>ps", "<cmd>Lazy sync<CR>", "Sync plugins (lazy.nvim)")
