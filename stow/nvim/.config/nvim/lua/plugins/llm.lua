-- minuet-ai.nvim: LLM code completion, shown as an extra source in the blink.cmp menu.
-- It only runs when you ask for it (no automatic requests), so nothing is sent or billed otherwise.
--
-- Keys
--   <A-y>  (insert) ask the model for a completion and show it in the menu
--
-- Commands
--   :Minuet change_provider   pick the provider (see below)
--   :Minuet change_model      pick another model for the current provider
--   :Minuet blink toggle      turn the integration on/off
--
-- Providers (the default is set by `provider` below)
--   claude                    Anthropic API. Needs ANTHROPIC_API_KEY exported in your shell
--                             (keep the key out of this repo). Fast, cheap Haiku model.
--   openai_fim_compatible     LM Studio, running locally (listed as "LM Studio"). Free and offline.
--                             Setup, once: download a code model in LM Studio (e.g. a Qwen2.5-Coder
--                             "base" or FIM-capable build), then start the local server (Developer tab
--                             -> Start Server, or `lms server start`). Set `lmstudio_model` below to
--                             the model's identifier as LM Studio shows it. Check the server with:
--                               curl localhost:1234/v1/models
--
-- Docs: https://github.com/milanglacier/minuet-ai.nvim
local lmstudio_model = "qwen2.5-coder-7b" -- must match the model loaded in LM Studio

return {
  {
    "milanglacier/minuet-ai.nvim",
    event = "InsertEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      provider = "claude", -- or "openai_fim_compatible" for LM Studio
      blink = { enable_auto_complete = false }, -- manual only, via <A-y>
      provider_options = {
        claude = {
          model = "claude-haiku-4-5-20251001",
          api_key = "ANTHROPIC_API_KEY", -- name of the environment variable, not the key itself
          max_tokens = 256,
          stream = true,
        },
        openai_fim_compatible = {
          name = "LM Studio",
          end_point = "http://localhost:1234/v1/completions",
          model = lmstudio_model,
          api_key = "TERM", -- LM Studio needs no key; this is any environment variable that exists
          stream = true,
          optional = { max_tokens = 64, top_p = 0.9 },
        },
      },
    },
  },

  -- Register minuet as a blink.cmp source, triggered by <A-y> (merged into completion.lua's options)
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<A-y>"] = {
          function(cmp)
            cmp.show({ providers = { "minuet" } })
          end,
        },
      },
      sources = {
        providers = {
          minuet = { name = "minuet", module = "minuet.blink", async = true, timeout_ms = 3000, score_offset = 50 },
        },
      },
    },
  },
}
