local ok, lspconfig = pcall(require, "lspconfig");
if not ok then
  return
end

lspconfig.ansiblels.setup {}
lspconfig.omnisharp.setup {}
lspconfig.cssls.setup {}
lspconfig.cucumber_language_server.setup {}
lspconfig.dockerls.setup {}
lspconfig.eslint.setup {}
lspconfig.html.setup {}
lspconfig.jsonls.setup {}
lspconfig.tsserver.setup {}
lspconfig.marksman.setup {}
lspconfig.powershell_es.setup {}
lspconfig.pyright.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.taplo.setup {}
lspconfig.lemminx.setup {}
lspconfig.yamlls.setup {}
lspconfig.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
---@diagnostic disable-next-line: undefined-field
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}
