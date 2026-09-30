-- Leader keys must be set before lazy.nvim loads plugins so mappings pick them up.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.undofile = true
opt.splitright = true
opt.splitbelow = true
