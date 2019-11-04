call plug#begin('~/.local/share/nvim/plugged')

" Plugin manager
Plug 'junegunn/vim-plug'

:so './simple-edits.vim'
:so './files.vim'
:so './dev.vim'
:so './themes.vim'
:so './misc.vim'
:so './ui.vim'
:so './git.vim'

call plug#end()
