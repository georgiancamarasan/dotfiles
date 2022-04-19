local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key {{{
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--}}}

-- Modes {{{
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--}}}

-- clipboard {{{
keymap('v', '<Leader>y', '"+y', opts)
keymap('v', '<Leader>d', '"+d', opts)
keymap('n', '<Leader>p', '"+p', opts)
keymap('n', '<Leader>P', '"+P', opts)
keymap('v', '<Leader>p', '"+p', opts)
keymap('v', '<Leader>P', '"+P', opts)
-- }}}

-- Normal --
-- Better window navigation {{{
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- }}}

-- Resize with arrows {{{
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- }}}

-- Navigate buffers {{{
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- }}}

-- Move text up and down {{{
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
-- }}}

-- explorer {{{
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>r", ":NvimTreeRefresh<cr>", opts)
keymap("n", "<leader>n", ":NvimTreeFindFile<cr>", opts)
-- keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
-- }}}

-- file commands {{{
keymap('n', '<Leader>w', ':w<CR>', opts)
keymap('n', '<C-s>', ':wa<CR>', opts)
keymap('n', '<Leader>q', ':q<CR>', opts)
keymap('n', '<Leader>qa', ':qa<CR>', opts)
keymap('n', '<Leader>x', ':x<CR>', opts)
keymap('n', '<Leader>xa', ':xa<CR>', opts)
-- }}}

-- buffer commands {{{
keymap('n', 'gp', ':bp<CR>', opts)
keymap('n', 'gn', ':bn<CR>', opts)
keymap('n', 'gl', ':ls<CR>', opts)
keymap('n', 'gb', ':ls<CR>:b', opts)
keymap('n', '<Leader><Leader>', '<C-^>', opts)
-- }}}

-- simple code manipulation {{{
keymap('n', '<Leader>-', 'ddp', opts) -- Move current line above
keymap('n', '<Leader>_', 'ddkP', opts) -- Move current line below
-- }}}

-- Buffer shortcuts {{{
keymap("n", "<leader>v", ":vsplit<ENTER>", opts)
keymap("n", "<leader>x", ":x<ENTER>", opts)
keymap("n", "gp", ":bp<ENTER>", opts)
keymap("n", "gn", ":bn<ENTER>", opts)
keymap("n", "gb", ":ls<ENTER>", opts)
keymap("n", "gb", ":la<ENTER>:b ", opts)
-- }}}

-- Simple edits {{{
keymap("n", "<leader>-", "ddp", opts)
keymap("n", "<leader>_", "ddkP", opts)
-- }}}

-- {{{
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown())<cr>", opts)
keymap("n", "<leader>r", "<cmd>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_dropdown())<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
-- }}}

-- Insert --
-- Press jk fast to enter {{{
keymap("i", "jk", "<ESC>", opts)
-- }}}

-- Visual --
-- Stay in indent mode {{{
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- }}}

-- Toggle search hilight {{{
keymap('n', '<leader>h', ':set hlsearch!<CR>', opts)
-- }}}

-- Move text up and down {{{
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
-- }}}

-- Visual Block --
-- Move text up and down {{{
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
-- }}}

-- Terminal --
-- Better terminal navigation {{{
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
-- }}}

