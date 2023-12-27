local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
  ensure_installed = {
    omnisharp = {},
    cssls = {},
    cucumber_language_server = {},
    dockerls = {},
    eslint = {},
    html = {},
    jsonls = {},
    tsserver = {},
    lua_ls = {},
    marksman = {},
    powershell_es = {},
    pyright = {},
    rust_analyzer = {},
    taplo = {},
    lemminx = {},
    yamlls = {},
  },
  automatic_installation = true,
})
