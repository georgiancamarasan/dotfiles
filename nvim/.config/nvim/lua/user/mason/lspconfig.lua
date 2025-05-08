local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
  ensure_installed = {
    -- language servers
    "ansiblels",
    "bicep",
    "omnisharp",
    "clangd",
    "cssls",
    "cucumber_language_server",
    "dockerls",
    "html",
    "jsonls",
    "ts_ls",
    "lua_ls",
    "marksman",
    "powershell_es",
    "pyright",
    "ruby_lsp",
    "rust_analyzer",
    "taplo",
    "lemminx",
    "yamlls",
    "eslint",
  },
  automatic_installation = true,
})
