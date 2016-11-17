" Vundle & plug-ins setup
set nocompatible
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')

" The plugin manager
Plugin 'VundleVim/Vundle.vim'

" A tree explorer
Plugin 'scrooloose/nerdtree'

" Syntax checking hacks
" Plugin 'scrooloose/syntastic'

" Vim motion on speed!
" Plugin 'easymotion/vim-easymotion'

" a Git wrapper so awesome, it should be illegal
" Plugin 'tpope/vim-fugitive'

" Fuzzy file, buffer, mru, tag, etc finder
" Plugin 'ctrlpvim/ctrlp.vim'

" Powerline is a statusline plugin for vim, and provides statuslines 
" and prompts for several other applications, including zsh, bash, 
" tmux, IPython, Awesome and Qtile
" Plugin 'powerline/powerline'

" EditorConfig plugin for Vim http://editorconfig.org
Plugin 'editorconfig/editorconfig-vim'

" The most advanced TypeScript Syntax Highlighting
Plugin 'HerringtonDarkholme/yats.vim'

" A code-completion engine
" Plugin 'Valloric/YouCompleteMe'

" CoffeeScript support
Plugin 'kchmck/vim-coffee-script'


" Vim Pug (formerly Jade) template engine syntax highlighting and indention
Plugin 'digitaltoad/vim-pug'

" BufExplorer
" Plugin 'jlanzarotta/bufexplorer'

" Make gvim-only colorschemes work transparently in terminal vim
" Plugin 'godlygeek/csapprox'

" Vim Markdown runtime files
" Plugin 'tpope/vim-markdown'

" Show 'Match 123 of 456 /search term/' in Vim searches.
Plugin 'henrik/vim-indexed-search'

" A plugin of NERDTree showing git status
" Plugin 'Xuyuanp/nerdtree-git-plugin'

" Vim plugin for intensely orgasmic commenting
" Plugin 'scrooloose/nerdcommenter'

" surround.vim: quoting/parenthesizing made simple
" Plugin 'tpope/vim-surround'

" The ultimate snippet solution for Vim.
" Plugin 'SirVer/ultisnips'

" Maintains a history of previous yanks, changes and deletes
" Plugin 'vim-scripts/YankRing.vim'

" Automated tag file generation and syntax highlighting of tags
" Plugin 'xolox/vim-easytags'

" A Vim plugin that always highlights the enclosing html/xml tags
Plugin 'Valloric/MatchTagAlways'

" Vim plugin which asks for the right file to open
" Plugin 'EinfachToll/DidYouMean'

" A vim plugin that simplifies the transition between multiline and single-line code
" Plugin 'AndrewRadev/splitjoin.vim'

" Light & Dark Vim color schemes inspired by Google's Material Design
" Plugin 'NLKNguyen/papercolor-theme'

" vim interface to Web API
" Plugin 'mattn/webapi-vim'


call vundle#end()
filetype plugin indent on

" Setup autocomplete
" if !exists("g:ycm_semantic_triggers")
"   let g:ycm_semantic_triggers = {}
" endif
" let g:ycm_semantic_triggers['typescript'] = ['.']
" let g:ycm_server_keep_logfiles = 1
" let g:ycm_server_log_level = 'debug'

" NERDTree settings
noremap <leader>] :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'

" Editor windows settings
set number " Show line numbers
set nowrap " Don't wrap lines
set shiftwidth=2 " Number of spaces for identation

" Text settings
syntax on
if has('gui_running')
  set guioptions-=T " no toolbar
  colorscheme industry
  set lines=45 columns=180 linespace=0
  if has('gui_win32')
    set guifont=Consolas:h10:cANSI
  else
    set guifont=Consolas
  endif
endif

" Shortcuts
noremap <leader>- ddp
noremap <leader>_ ddkP

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
