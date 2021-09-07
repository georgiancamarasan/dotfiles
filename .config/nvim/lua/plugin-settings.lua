-- {{{ Setup
vim.cmd([[
  augroup plugins_settings_config
    autocmd!
    autocmd BufWritePost plugins.lua luafile <afile>
  augroup end
]])
-- }}}

vim.g.nvim_tree_side = 'right'
vim.g.nvim_tree_width = 50

local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
  },
  sources = {
    { name = '...' },
    ...
  }
})

