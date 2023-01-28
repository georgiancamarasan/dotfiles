-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { noremap = true, silent = true }

-- Remap space as leader key {{{
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
--- }}}

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- clipboard {{{
keymap("x", "<leader>p", "\"_dp")
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

-- buffer commands {{{
keymap('n', 'gp', ':bp<CR>', opts)
keymap('n', 'gn', ':bn<CR>', opts)
keymap('n', '<leader><leader>', '<C-^>', opts)
keymap("n", "<leader>v", ":vsplit<CR>", opts)
keymap("n", "<leader>x", ":x<CR>", opts)
keymap("n", "<leader>q", ":Bdelete!<CR>", opts) -- Close buffers
keymap("n", "<leader>qq", ":qa<CR>", opts) -- Close all
-- }}}

-- LSP commands {{{
keymap('n', '<leader>lf', ':Format', opts)
-- }}}

-- file commands {{{
keymap('n', '<Leader>w', ':w<CR>', opts)
keymap('n', '<C-s>', ':wa<CR>', opts)
keymap('n', '<Leader>x', ':x<CR>', opts)
keymap('n', '<Leader>xa', ':xa<CR>', opts)
-- }}}

-- Move text up and down {{{
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)
-- }}}

--- simple code manipulation {{{
keymap('n', '<leader>-', 'ddp', opts) -- Move current line above
keymap('n', '<leader>_', 'ddkP', opts) -- Move current line below
--- }}}

-- Toggle search hilight {{{
keymap('n', '<leader>h', ':set hlsearch!<CR>', opts)
-- }}}

-- Better paste {{{
keymap("v", "p", '"_dP', opts)
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

-- Move text up and down {{{
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
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
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)
keymap("n", "<C-\\>", ":ToggleTerm<CR>", opts)
-- }}}

-- Plugins -- {{{

-- NvimTree {{{
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
-- }}}

-- Telescope {{{
local status_ok, builtin = pcall(require, 'telescope.builtin')
if status_ok then
  keymap("n", "<leader>ff", builtin.find_files, opts)
  keymap("n", "<leader>fg", builtin.git_files, opts)
  keymap("n", "<leader>ft", builtin.live_grep, opts)
  keymap("n", "<leader>fb", builtin.buffers, opts)
  keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
end
-- }}}

-- Git {{{
keymap("n", "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("n", "<leader>tn", "<cmd>lua _NODE_TOGGLE()<CR>", opts)
keymap("n", "<leader>td", "<cmd>lua _NCDU_TOGGLE()<CR>", opts)
keymap("n", "<leader>th", "<cmd>lua _HTOP_TOGGLE()<CR>", opts)
keymap("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>", opts)
-- }}}

-- Comment {{{
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')
-- }}}

-- DAP {{{
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
-- }}}
-- }}}
