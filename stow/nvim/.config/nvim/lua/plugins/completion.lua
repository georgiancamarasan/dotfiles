-- blink.cmp: the autocompletion popup, with documentation and signature help.
-- Sources: LSP, file paths, snippets (friendly-snippets collection, via Neovim's built-in
-- snippet engine) and words from the current buffer. The AI source is added in llm.lua.
--
-- Keys (insert mode; this is the "enter" preset)
--   <CR>            accept the selected item
--   <C-n> <C-p>     next / previous item (also <Down> / <Up>)
--   <C-Space>       open the menu; press again to toggle the documentation
--   <C-e>           close the menu
--   <C-b> <C-f>     scroll the documentation
--   <Tab> <S-Tab>   jump to the next / previous snippet placeholder
--   <C-k>           show / hide signature help
--   <A-y>           ask the AI for a suggestion (llm.lua)
--
-- Docs: https://cmp.saghen.dev
return {
  "saghen/blink.cmp",
  version = "1.*", -- release tags ship a prebuilt fuzzy matcher; no Rust toolchain needed
  event = "InsertEnter",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts_extend = { "sources.default" },
  opts = {
    keymap = { preset = "enter" },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 300 },
    },
    signature = { enabled = true },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
}
