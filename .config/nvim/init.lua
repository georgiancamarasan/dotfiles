-- {{{
vim.cmd([[
  augroup init_config
    autocmd!
    autocmd BufWritePost init.lua luafile <afile>
  augroup end
]])
-- }}}

require('settings')
require('plugins')
require('plugin-settings')
require('keymappings')

