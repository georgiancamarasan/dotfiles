local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
  ensure_installed = {
    -- language servers
    ansiblels = {},
    omnisharp = {},
    cssls = {},
    cucumber_language_server = {},
    dockerls = {},
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
    -- linters
    ansible_lint = {},
    markdownlint = {},
    eslint = {},
    flake8 = {},
    fish = {},
    luacheck = {},
    dotenv_linter = {},
  },
  automatic_installation = true,
})
