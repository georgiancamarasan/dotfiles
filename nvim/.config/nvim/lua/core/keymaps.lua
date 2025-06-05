-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- For conciseness
local opts = { noremap = true, silent = true }

-- Fast escape from insert mode
vim.keymap.set("i", "jk", "<Esc>", opts)
vim.keymap.set("v", "jk", "<Esc>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Buffers
vim.keymap.set("n", "gn", ":bnext<CR>", opts)
vim.keymap.set("n", "gp", ":bprevious<CR>", opts)
vim.keymap.set("n", "_", "<Esc>:m .+1<CR>==", opts)
vim.keymap.set("n", "-", "<Esc>:m .-2<CR>==", opts)
vim.keymap.set("n", "<leader><leader>", "<C-^>", opts)
vim.keymap.set("n", "<leader>x", ":x<CR>", opts)
vim.keymap.set("n", "<leader>q", ":bdelete!<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>w", ":w<CR>", opts)
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)
vim.keymap.set("n", "<leader>p", "_dp", opts) -- paste from clipboard
vim.keymap.set("v", "<", "<gv", opts) -- Shift align left
vim.keymap.set("v", ">", ">gv", opts) -- Shift align right
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts) -- Shift align right
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts) -- Shift align right

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>qs", ":close<CR>", opts) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Lazy sync
vim.keymap.set("n", "<leader>ps", ":Lazy sync<CR>", opts)
