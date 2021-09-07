-- {{{
vim.cmd([[
  augroup settings_config
    autocmd!
    autocmd BufWritePost behavior.lua luafile <afile>
    autocmd BufWritePost behavior.lua syntax on
  augroup end
]])
-- }}}

local opt = vim.opt

opt.syntax = 'on'
opt.background = 'dark'
opt.wrap = false
opt.shiftwidth = 2
opt.shell = '/usr/bin/fish'
opt.foldmethod = 'marker'
opt.foldlevelstart = 1
opt.expandtab = true
opt.hidden = true
opt.path = '.,**'
opt.swapfile = false
opt.tags = './tags;,tags;'
opt.relativenumber = true
opt.splitright = true
