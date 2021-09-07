vim.g.mapleader = ' '

-- {{{
vim.cmd([[
  augroup keymappings_config
    autocmd!
    autocmd BufWritePost keymappings.lua luafile <afile>
  augroup end
]])

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- }}}

map('n', '<Space>', '<NOP>', { silent = true })
map('n', '<Leader>h', ':set hlsearch!<CR>', { silent = true })
map('i', 'jk', '<ESC>', { silent = true })

-- explorer
map('n', '<Leader>e', ':NvimTreeToggle<CR>', { silent = true })

-- better window movement {{{
map('n', '<C-h>', '<C-w>h', { silent = true })
map('n', '<C-j>', '<C-w>j', { silent = true })
map('n', '<C-k>', '<C-w>k', { silent = true })
map('n', '<C-l>', '<C-w>l', { silent = true })
-- }}}

-- file commands {{{
map('n', '<Leader>w', ':w<CR>', { silent = true })
map('n', '<C-s>', ':wa<CR>', { silent = true })
map('n', '<Leader>q', ':q<CR>', { silent = true })
map('n', '<Leader>qa', ':qa<CR>', { silent = true })
map('n', '<Leader>x', ':x<CR>', { silent = true })
map('n', '<Leader>xa', ':xa<CR>', { silent = true })
-- }}}

-- clipboard {{{
map('v', '<Leader>y', '"+y', { silent = true })
map('v', '<Leader>d', '"+d', { silent = true })
map('n', '<Leader>p', '"+p', { silent = true })
map('n', '<Leader>P', '"+P', { silent = true })
map('v', '<Leader>p', '"+p', { silent = true })
map('v', '<Leader>P', '"+P', { silent = true })
-- }}}

-- buffer commands {{{
map('n', 'gp', ':bp<CR>', { silent = true })
map('n', 'gn', ':bn<CR>', { silent = true })
map('n', 'gl', ':ls<CR>', { silent = true })
map('n', 'gb', ':ls<CR>:b', { silent = true })
map('n', '<Leader><Leader>', '<C-^>', { silent = true })
-- }}}

-- simple code manipulation {{{
map('n', '<Leader>-', 'ddp', { silent = true }) -- Move current line above
map('n', '<Leader>_', 'ddkP', { silent = true }) -- Move current line below
-- }}}

-- Tab switch buffer {{{
map('n', '<TAB>', ':bnext<CR>', { silent = true })
map('n', '<S-TAB>', ':bprev<CR>', { silent = true })
-- }}}

-- Move selected line / block of text in visual mode {{{
map('x', 'K', ':move \'<-2<CR>gv-gv\'', { silent = true })
map('x', 'J', ':move \'>-1<CR>gv-gv\'', { silent = true })
-- }}}

-- vsnip {{{
-- map('i', '<expr> <C-j>', 'vsnip#expandable()  ? "<Plug>(vsnip-expand)"         : '<C-j>')
-- }}}
