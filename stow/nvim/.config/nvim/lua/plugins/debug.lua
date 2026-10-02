-- Debugging via the Debug Adapter Protocol: nvim-dap (core), nvim-dap-ui (panels),
-- nvim-dap-virtual-text (values shown next to the code) and mason-nvim-dap (installs adapters).
--
-- Adapters (installed by Mason): python = debugpy, coreclr = netcoredbg (.NET), js = js-debug-adapter,
-- codelldb (Rust), delve (Go). Launch configurations for each language are defined further down.
--
-- Keys
--   F5  start / continue        F10  step over        F11  step into        F12  step out
--   <leader>bb  toggle breakpoint            <leader>bB  conditional breakpoint
--   <leader>bc  run to cursor                <leader>bl  run the last session again
--   <leader>bu  toggle the debugger UI       <leader>br  toggle the REPL
--   <leader>bt  terminate the session
--
-- Workflow: set a breakpoint with <leader>bb, press F5, pick a configuration. The UI opens by
-- itself and closes when the session ends. Breakpoints show as ● in the sign column.
-- Python needs a project venv to be active for its dependencies; .NET asks for the built .dll
-- (run `dotnet build` first); Rust asks for the executable in target/debug/.
--
-- Docs: https://github.com/mfussenegger/nvim-dap  https://github.com/rcarriga/nvim-dap-ui
local function dap(fn, ...)
  local args = { ... }
  return function()
    require("dap")[fn](unpack(args))
  end
end

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
    "theHamsta/nvim-dap-virtual-text",
    "jay-babu/mason-nvim-dap.nvim",
    "mfussenegger/nvim-dap-python",
    "leoluz/nvim-dap-go",
  },
  keys = {
    { "<F5>", dap("continue"), desc = "Debug: start / continue" },
    { "<F10>", dap("step_over"), desc = "Debug: step over" },
    { "<F11>", dap("step_into"), desc = "Debug: step into" },
    { "<F12>", dap("step_out"), desc = "Debug: step out" },
    { "<leader>bb", dap("toggle_breakpoint"), desc = "Debug: toggle breakpoint" },
    {
      "<leader>bB",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Debug: conditional breakpoint",
    },
    { "<leader>bc", dap("run_to_cursor"), desc = "Debug: run to cursor" },
    { "<leader>bl", dap("run_last"), desc = "Debug: run last" },
    {
      "<leader>bu",
      function()
        require("dapui").toggle()
      end,
      desc = "Debug: toggle UI",
    },
    {
      "<leader>br",
      function()
        require("dap").repl.toggle()
      end,
      desc = "Debug: toggle REPL",
    },
    { "<leader>bt", dap("terminate"), desc = "Debug: terminate" },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Adapters. `handlers = {}` registers each installed adapter with its default setup.
    require("mason-nvim-dap").setup({
      ensure_installed = { "python", "coreclr", "js", "codelldb", "delve" },
      automatic_installation = false,
      handlers = {},
    })

    -- UI: open on start, close when the session ends
    dapui.setup()
    require("nvim-dap-virtual-text").setup()
    dap.listeners.before.attach.dapui_config = dapui.open
    dap.listeners.before.launch.dapui_config = dapui.open
    dap.listeners.before.event_terminated.dapui_config = dapui.close
    dap.listeners.before.event_exited.dapui_config = dapui.close

    vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
    vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticOk", linehl = "Visual" })

    -- Python: uses debugpy installed by Mason (and the active virtualenv for the program)
    require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")

    -- Go: configurations for running main packages and tests (uses delve from Mason)
    require("dap-go").setup()

    -- JavaScript / TypeScript (Node). mason-nvim-dap installs js-debug-adapter but doesn't
    -- register it, so the adapter is defined here.
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/js-debug-adapter",
        args = { "${port}" },
      },
    }
    local node_configs = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Node: launch current file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Node: attach to process",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
    }
    dap.configurations.javascript = node_configs
    dap.configurations.typescript = node_configs

    -- .NET: pick the built dll
    dap.configurations.cs = {
      {
        type = "coreclr",
        name = ".NET: launch dll",
        request = "launch",
        program = function()
          return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
        end,
      },
    }

    -- Rust: pick the built executable
    dap.configurations.rust = {
      {
        type = "codelldb",
        name = "Rust: launch executable",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
  end,
}
