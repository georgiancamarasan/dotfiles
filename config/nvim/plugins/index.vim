call plug#begin('~/.local/share/nvim/plugged')

" Plugin manager
Plug 'junegunn/vim-plug'

:so './simple-edits.vim'
:so './files.vim'
:so './dev.vim'

call plug#end()
