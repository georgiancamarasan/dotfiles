# Neovim config

Managed by the dotfiles repo and symlinked into `~/.config/nvim` with GNU Stow (`stow/nvim`).
Plugins are managed by [lazy.nvim](https://lazy.folke.io); `:Lazy` shows them, `<leader>ps` syncs.

## Where things are

| Path | What it holds |
| --- | --- |
| `init.lua` | entry point; load order matters (options, keymaps, autocmds, then lazy) |
| `lua/config/options.lua` | editor options |
| `lua/config/keymaps.lua` | the leader keys and all keymaps that don't belong to a plugin |
| `lua/config/autocmds.lua` | autocommands not tied to a plugin |
| `lua/config/lazy.lua` | lazy.nvim bootstrap; it loads every file in `lua/plugins/` |
| `lua/plugins/<name>.lua` | one file per major plugin, or per group of plugins that work together |
| `lua/plugins/misc.lua` | small plugins, one commented spec each |
| `lazy-lock.json` | pinned plugin versions (commit it; `:Lazy restore` goes back to it) |

## Conventions

- **Every plugin file starts with a comment block**: what it does, what it needs, and every key it adds.
  Read the top of the file to learn how a plugin is used; that is the documentation.
- **Every keymap has a `desc`**, so which-key (`<Space>` and wait, or `<leader>?` for the current
  buffer) and `<leader>fk` (search all keymaps) always show what a key does.
- **`<leader>` prefixes** are named in `lua/plugins/which-key.lua`. When you add a new prefix, add its name there.
  Don't make a mapping a prefix of another (e.g. `<leader>q` and `<leader>qs`):
  the shorter one then waits for a timeout.
- Plugin keys live in the plugin's own file; general keys live in `keymaps.lua`.

## Adding a plugin

1. Small and no custom keys: add a commented spec to `lua/plugins/misc.lua`.
2. Otherwise create `lua/plugins/<name>.lua` that returns a spec, with the header comment described above.
3. Restart Neovim (lazy installs it), then commit `lazy-lock.json` with the change.

## Language support

- Servers are listed in `lua/plugins/lsp.lua` (`servers`) and installed by Mason.
- Formatters and linters: `lua/plugins/formatting.lua`. Debug adapters: `lua/plugins/debug.lua`.
- Prerequisites outside Neovim: the `tree-sitter` CLI and a C compiler (parsers), `ripgrep` (search),
  `node`, `go`, the dotnet SDK, `lazygit`, a Nerd Font in the terminal. For the AI source, either
  `ANTHROPIC_API_KEY` in your environment or LM Studio's local server (see `lua/plugins/llm.lua`).

## Troubleshooting

`:checkhealth` (try `lazy`, `mason`, `vim.lsp`, `nvim-treesitter`, `which-key`), `:LspInfo`, `:ConformInfo`,
`:Lazy log`.
