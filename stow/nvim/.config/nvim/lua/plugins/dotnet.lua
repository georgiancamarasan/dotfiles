-- roslyn.nvim: C# / .NET language server (Roslyn, the same server as VS Code's C# extension).
-- It is not part of nvim-lspconfig, so it has its own plugin. It uses the same LSP keys as other
-- languages (see lsp.lua: gd, grr, gra, grn, K, ...).
--
-- Needs
--   * the dotnet SDK on PATH (`dotnet --version`)
--   * the `roslyn` package from the Crashdummyy Mason registry; both the registry and the install
--     are configured in lsp.lua (mason-tool-installer installs it on startup).
--
-- Behavior
--   * Starts for .cs / .razor files and finds the nearest .sln / .csproj on its own. With several
--     solutions open it asks which one to use: :Roslyn target
--   * Formatting uses csharpier (formatting.lua), debugging uses netcoredbg (debug.lua).
--
-- Commands: :Roslyn restart | :Roslyn stop | :Roslyn target
-- Docs: https://github.com/seblyng/roslyn.nvim
return {
  "seblyng/roslyn.nvim",
  ft = { "cs", "razor" },
  opts = {},
}
