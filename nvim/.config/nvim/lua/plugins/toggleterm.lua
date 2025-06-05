return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
			},
		})

		--[[ vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()") ]]

		local Terminal = require("toggleterm.terminal").Terminal

		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end

		local node = Terminal:new({ cmd = "node", hidden = true })
		function _NODE_TOGGLE()
			node:toggle()
		end

		local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
		function _NCDU_TOGGLE()
			ncdu:toggle()
		end

		local btm = Terminal:new({ cmd = "btm", hidden = true })
		function _BTM_TOGGLE()
			btm:toggle()
		end

		local python = Terminal:new({ cmd = "python", hidden = true })
		function _PYTHON_TOGGLE()
			python:toggle()
		end

		-- Terminal
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>on", "<cmd>lua _NODE_TOGGLE()<cr>", opts)
		vim.keymap.set("n", "<leader>ou", "<cmd>lua _NCDU_TOGGLE()<cr>", opts)
		vim.keymap.set("n", "<leader>ob", "<cmd>lua _BTM_TOGGLE()<cr>", opts)
		vim.keymap.set("n", "<leader>op", "<cmd>lua _PYTHON_TOGGLE()<cr>", opts)
		vim.keymap.set("n", "<leader>of", "<cmd>ToggleTerm direction=float<cr>", opts)
		vim.keymap.set("n", "<leader>oh", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", opts)
		vim.keymap.set("n", "<leader>ov", "<cmd>ToggleTerm size=80 direction=vertical<cr>", opts)
	end,
}
