" Text settings
set nowrap " Don't wrap lines
set shiftwidth=2 " Number of spaces for identation

" Theme settings
"if has('gui_running')
  "set guioptions-=T " no toolbar
  "colorscheme industry
  "set lines=45 columns=180 linespace=0
  "if has('gui_win32')
    "set guifont=Consolas:h10:cANSI
  "else
    "set guifont=Consolas
  "endif
"else
  "syntax enable
  "set background=dark
  "colorscheme molokai
"endif
syntax enable
set background=dark
colorscheme molokai

" Editor windows settings
set relativenumber " Show relative line numbers

" Yank and put from system clipboard
set clipboard+=unnamedplus

" Set a global fold level to remember you have folding in VIM
set foldlevelstart=1
set foldmethod=syntax
