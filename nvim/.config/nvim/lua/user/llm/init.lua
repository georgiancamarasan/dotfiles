local lsp_ai_init_options_json = [[
{
  "memory": {
    "file_store": {}
  },
  "models": {
    "model1": {
      "type": "ollama",
      "model": "deepseek-coder-v2"
    }
  },
  "completion": {
    "model": "model1",
    "parameters": {
      "fim": {
        "start": "<fim_prefix>",
        "middle": "<fim_suffix>",
        "end": "<fim_middle>"
      },
      "max_context": 1024
    }
  }
}
]]

-- The configuration
local lsp_ai_config = {
  cmd = { 'lsp-ai' },
  root_dir = vim.loop.cwd(),
  init_options = vim.json.decode(lsp_ai_init_options_json),
}

-- Start lsp-ai when opening a buffer
--[[ vim.api.nvim_create_autocmd("BufEnter", { ]]
  --[[ callback = function(args) ]]
    --[[ local bufnr = args.buf ]]
    --[[ local client = vim.lsp.get_active_clients({ bufnr = bufnr, name = "lsp-ai" }) ]]
    --[[ if #client == 0 then ]]
      --[[ vim.lsp.start(lsp_ai_config, { bufnr = bufnr }) ]]
    --[[ end ]]
  --[[ end, ]]
--[[ }) ]]

-- Key mapping for code actions
--[[ vim.api.nvim_set_keymap('n', '<leader>c', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true }) ]]
