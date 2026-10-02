local opt = vim.opt

-- UI
opt.number = true -- line number on the current line...
opt.relativenumber = true -- ...relative numbers everywhere else
opt.numberwidth = 4 -- width of the number column (default: 4)
opt.background = "dark"
opt.termguicolors = true -- 24-bit colors
opt.colorcolumn = "120" -- ruler at column 120
opt.signcolumn = "yes" -- always show, avoids text shifting (default: 'auto')
opt.cursorline = true -- highlight the current line (default: false)
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 8 -- screen lines to keep above and below the cursor (default: 0)
opt.sidescrolloff = 8 -- screen columns to keep left and right of the cursor when wrap is off (default: 0)
opt.pumheight = 10 -- popup menu height (default: 0)

-- Command line and status
opt.laststatus = 3 -- single global statusline
opt.cmdheight = 2 -- more room for messages (default: 1)
opt.showcmd = false -- hide pending command in the last line
opt.ruler = false -- hide line/column of the cursor
opt.showmode = false -- hide -- INSERT -- etc. (default: true)
opt.shortmess:append("c") -- no |ins-completion-menu| messages

-- Completion
opt.completeopt = "menuone,noselect" -- better completion experience (default: 'menu,popup')

-- Text
opt.wrap = false -- display long lines as one line (default: true)
opt.linebreak = true -- when wrapping, don't split words (default: false)
opt.conceallevel = 0 -- keep `` visible in markdown (default: 1)
opt.iskeyword:append("-") -- treat hyphenated words as one word
opt.formatoptions:remove({ "c", "r", "o" }) -- no automatic comment leader on wrap, <Enter>, o/O (default: 'croql')

-- Indentation: tabs are 2 spaces
opt.autoindent = true -- copy indent from the current line (default: true)
opt.expandtab = true -- insert spaces when pressing <Tab>
opt.tabstop = 2 -- width of a tab (default: 8)
opt.softtabstop = 2 -- spaces a <Tab>/<BS> counts for while editing (default: 0)
opt.shiftwidth = 2 -- spaces per indent level (default: 8)
opt.breakindent = true -- wrapped lines keep their indent (default: false)

-- Search
opt.ignorecase = true
opt.smartcase = true -- case-sensitive if the pattern has an uppercase letter
opt.hlsearch = false -- don't keep matches highlighted (default: true)
opt.incsearch = true -- show matches while typing (default: true)

-- Files
opt.swapfile = false
opt.backup = false -- no backup file (default: false)
opt.writebackup = false -- no temporary backup while writing (default: true)
opt.undofile = true -- persistent undo, stored in the default undodir (~/.local/state/nvim/undo)

-- System
opt.shell = "bash" -- used by :! and :terminal (login shell is unaffected)
opt.clipboard = "unnamedplus" -- yank/paste use the system clipboard
opt.mouse = "a"
opt.updatetime = 250 -- ms of idle before CursorHold and swap write (default: 4000)
opt.timeoutlen = 300 -- ms to wait for a mapped key sequence (default: 1000)
