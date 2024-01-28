local options = {
  syntax = 'on',                            -- switch syntax highlighting
  background = 'dark',                      -- set dark for the theme
  shell = 'env nu',                  -- select fish shell
  hidden = true,
  path = '.,**',
  tags = './tags;,tags;',
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = false,                         -- highlight all matches on previous search pattern
  incsearch = true,
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  undodir = os.getenv("HOME") .. "/.vim/undodir",
  updatetime = 50,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  colorcolumn = "80",
  -- colorcolumn = "120",
  laststatus = 3,
  showcmd = false,
  ruler = false,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  guicursor = "",

}

local global_options = {
  netrw_liststyle = 3,                   -- list files in netrw in tree format
  better_whitespace_enabled = 1,
  strip_whitespace_on_save = 1,
  loaded_netrw = 1,
  loaded_netrwPlugin = 1,
}

-- vim.opt.fillchars.eob = " "
-- vim.opt.fillchars = vim.opt.fillchars + "vertleft: "
-- vim.opt.fillchars = vim.opt.fillchars + "vertright: "
vim.opt.fillchars = vim.opt.fillchars + 'eob: '

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(global_options) do
  vim.g[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

