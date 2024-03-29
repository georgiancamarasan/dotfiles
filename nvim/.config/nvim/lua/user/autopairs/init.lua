-- Setup nvim-cmp.
local npairs = require("nvim-autopairs")

npairs.setup({
	check_ts = true, -- treesitter integration
	ts_config = {
		lua = { "string" }, -- it will not add a pair on that treesitter node
		javascript = { "template_string" },
	},
	disable_filetype = { "TelescopePrompt" },
})

--[[ local cmp_autopairs = require "nvim-autopairs.completion.cmp" ]]
--[[ local cmp_status_ok, cmp = pcall(require, "cmp") ]]
--[[ if not cmp_status_ok then ]]
--[[   return ]]
--[[ end ]]
--[[ cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {}) ]]
