local wk = require("which-key")

wk.setup({
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	motions = {
		count = true,
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
		zindex = 1000, -- positive value to position WhichKey above other floating windows.
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	show_keys = true, -- show the currently pressed key and its label as a message in the command line
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_nowait = {
		-- marks
		"`",
		"'",
		"g`",
		"g'",
		-- registers
		'"',
		"<c-r>",
		-- spelling
		"z=",
	},
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
	-- disable the WhichKey popup for certain buf types and file types.
	-- Disabled by default for Telescope
	disable = {
		buftypes = {},
		filetypes = {},
	},
})

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

wk.register({
	--[[ ["a"] = { "<cmd>Alpha<cr>", "Alpha" }, ]]
	--[[ ["fb"] = { ]]
	--[[ 	"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", ]]
	--[[ 	"Buffers", ]]
	--[[ }, ]]
	e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	w = { "<cmd>w!<CR>", "Save" },
	q = { "<cmd>q!<CR>", "Quit" },
	c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	h = { "<cmd>nohlsearch<CR>", "No Highlight" },
  f = {
    name = "Find",
    f = { "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = true})<cr>", "Find files", },
  },
	--[[ ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" }, ]]
	--[[ ["P"] = { "<cmd>Telescope projects<cr>", "Projects" }, ]]
	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},
	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", },
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff", },
	},
	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics", },
		w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics", },
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic", },
		k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic", },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", },
	},
	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
	},
	t = {
		name = "Terminal",
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
		t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},
}, opts)

wk.register({
	["jk"] = { "<ESC>", "Normal mode" },
}, { mode = "i" })

--[[ wk.register({ ]]
--[[ 	["<"] = { "<gv", "Shift align left" }, ]]
--[[ 	[">"] = { ">gv", "Shift align right" }, ]]
--[[ 	["J"] = { ":m '>+1<CR>gv=gv", "Move selection down" }, ]]
--[[ 	["K"] = { ":m '<-2<CR>gv=gv", "Move selection up" }, ]]
--[[ }, { mode = "v" }) ]]

--[[ wk.register({ ]]
--[[ 	["J"] = { ":move '>+1<CR>gv-gv", "Move selection down" }, ]]
--[[ 	["K"] = { ":move '<-2<CR>gv-gv", "Move seleciton up" }, ]]
--[[ 	["<leader>/"] = { ]]
--[[ 		'<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', ]]
--[[ 		"Comment block", ]]
--[[ 	}, ]]
--[[ }, { mode = "x" }) ]]

--[[ wk.register({ ]]
--[[ 	["<C-h>"] = { "<C-\\><C-N><C-w>h", "Go to previous word" }, ]]
--[[ 	["<C-j>"] = { "<C-\\><C-N><C-w>j", "Go to next" }, ]]
--[[ 	["<C-k>"] = { "<C-\\><C-N><C-w>k", "Go to previous" }, ]]
--[[ 	["<C-l>"] = { "<C-\\><C-N><C-w>l", "Go to next word" }, ]]
--[[ }, { mode = "t" }) ]]

--[[ wk.register({ ]]
--[[ 	[""] = { "<Space>", "<Nop>" }, -- Remap space as leader key {{{ ]]
--[[ 	["<leader>p"] = { '"_dp', "Paste from clipboard" }, ]]
--[[ 	["<C-h>"] = { "<C-w>h", "Jump to left window" }, ]]
--[[ 	["<C-j>"] = { "<C-w>j", "Jump to bottom window" }, ]]
--[[ 	["<C-k>"] = { "<C-w>k", "Jump to top window" }, ]]
--[[ 	["<C-l>"] = { "<C-w>l", "Jump to right window" }, ]]
--[[ 	["<C-Up>"] = { ":resize -2<CR>", "Shrink window vertically" }, ]]
--[[ 	["<C-Down>"] = { ":resize +2<CR>", "Stretch window vertically " }, ]]
--[[ 	["<C-Left>"] = { ":vertical resize -2<CR>", "Shrink window horizontally" }, ]]
--[[ 	["gp"] = { ":bp<CR>", "Go to previous buffer" }, ]]
--[[ 	["gn"] = { ":bn<CR>", "Go to next buffer" }, ]]
--[[ 	["<leader><leader>"] = { "<C-^>", "Quick switch buffer" }, ]]
--[[ 	["<leader>v"] = { ":vsplit<CR>", "VSplit" }, ]]
--[[ 	["<leader>x"] = { ":x<CR>", "Save and close" }, ]]
--[[ 	["<leader>q"] = { ":Bdelete!<CR>", "Close buffer" }, ]]
--[[ 	["<leader>qq"] = { ":qa<CR>", "Close all" }, ]]
--[[ 	["<leader>rr"] = { ":w<CR>:source %<CR>", "Resource buffer" }, ]]
--[[ 	["<leader>lf"] = { ":Format<CR>", "Format buffer" }, ]]
--[[ 	["<leader>w"] = { ":w<CR>", "Write buffer" }, ]]
--[[ 	["<C-s>"] = { ":wa<CR>", "Save all" }, ]]
--[[ 	["<leader>xa"] = { ":xa<CR>", "Save all & close" }, ]]
--[[ 	["<A-j>"] = { "<Esc>:m .+1<CR>==", "Move line down" }, ]]
--[[ 	["<A-k>"] = { "<Esc>:m .-2<CR>==", "Move line up" }, ]]
--[[ 	["<leader>h"] = { ":set hlsearch!<CR>", "Hide hilight" }, ]]
--[[ 	["<C-\\>"] = { ":ToggleTerm<CR>", "Toggle terminal" }, ]]
--[[ 	["<leader>e"] = { ":NvimTreeToggle<CR>", "Toggle File Explorer" }, ]]
--[[ 	["<leader>fg"] = { "<cmd>Telescope git_files<cr>", "Find git files" }, ]]
--[[ 	["<leader>ft"] = { "<cmd>Telescope grep_string<cr>", "Find text" }, ]]
--[[ 	["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Find buffers" }, ]]
--[[ 	["<leader>fp"] = { ":Telescope projects<CR>", "Find projects" }, ]]
--[[   ["<leader>fl"] = { "<cmd>lua require('telescope').extensions.lazygit.lazygit()<CR>", "Find lazygit project" }, ]]
--[[ 	["<leader>tg"] = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Toggle lazygit" }, ]]
--[[ 	["<leader>tn"] = { "<cmd>lua _NODE_TOGGLE()<CR>", "Toggle node repl" }, ]]
--[[ 	["<leader>td"] = { "<cmd>lua _NCDU_TOGGLE()<CR>", "Toggle disk usage" }, ]]
--[[ 	["<leader>th"] = { "<cmd>lua _HTOP_TOGGLE()<CR>", "Toggle htop" }, ]]
--[[ 	["<leader>tp"] = { "<cmd>lua _PYTHON_TOGGLE()<CR>", "Toggle python repl" }, ]]
--[[ 	["<leader>/"] = { "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", "Comment current line" }, ]]
--[[ 	["<leader>db"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle breakpoint" }, ]]
--[[ 	["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" }, ]]
--[[ 	["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" }, ]]
--[[ 	["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" }, ]]
--[[ 	["<leader>dO"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" }, ]]
--[[ 	["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle REPL" }, ]]
--[[ 	["<leader>dl"] = { "<cmd>lua require'dap'.run_last()<cr>", "Run last" }, ]]
--[[ 	["<leader>du"] = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle DAP" }, ]]
--[[ 	["<leader>dt"] = { "<cmd>lua require'dap'.terminate()<cr>", "Close DAP" }, ]]
--[[ 	["<leader>t"] = { "<Plug>PlenaryTestFile<CR>", "Run plenary tests" }, ]]
--[[ 	["<leader>ca"] = { vim.lsp.buf.code_action, "Code action" }, ]]
--[[ }) ]]
