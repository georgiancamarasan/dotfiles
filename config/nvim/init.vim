call plug#begin('~/.local/share/nvim/plugged')

" Plugin manager
Plug 'junegunn/vim-plug'

" Defaults everyone can agree on 
Plug 'tpope/vim-sensible'

" Vim alignment plugin 
Plug 'junegunn/vim-easy-align'

" A Git wrapper so awesome, it should be illegal<Paste>
Plug 'tpope/vim-fugitive' 

" A Vim plugin for more pleasant editing on commit messages
Plug 'rhysd/committia.vim'

" continuously updated session files
Plug 'tpope/vim-obsession'

" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" vinegar.vim: Combine with netrw to create a delicious salad dressing 
Plug 'tpope/vim-vinegar'

" Modern database interface for Vim 
Plug 'tpope/vim-dadbod'

" The ultimate snippet solution for Vim.
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" A command-line fuzzy finder 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Powerline is a statusline plugin for vim, and provides statuslines and prompts for several other applications, 
" including zsh, bash, tmux, IPython, Awesome and Qtile.
" Plug 'powerline/powerline'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" super simple vim plugin to show the list of buffers in the command bar
Plug 'bling/vim-bufferline'

" Personal Wiki for Vim http://vimwiki.github.io/
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more 
Plug 'ryanoasis/vim-devicons'

" A Vim plugin for Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'markdown', 'yaml', 'html'] }

" Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'

" Dark powered asynchronous completion framework for neovim/Vim8
" Plug 'Shougo/deoplete.nvim'

" Syntax checking hacks
Plug 'vim-syntastic/syntastic'

" Vim motion on speed!
Plug 'easymotion/vim-easymotion'

" Fuzzy file, buffer, mru, tag, etc finder
Plug 'ctrlpvim/ctrlp.vim'

" EditorConfig plugin for Vim http://editorconfig.org
Plug 'editorconfig/editorconfig-vim'

" The most advanced TypeScript Syntax Highlighting
Plug 'HerringtonDarkholme/yats.vim'

" A code-completion engine
Plug 'Valloric/YouCompleteMe'

" Vim Pug (formerly Jade) template engine syntax highlighting and indention
" Plug 'digitaltoad/vim-pug'

" BufExplorer
" Plug 'jlanzarotta/bufexplorer'

" Make gvim-only colorschemes work transparently in terminal vim
" Plug 'godlygeek/csapprox'

" Vim Markdown runtime files
Plug 'tpope/vim-markdown'

" Show 'Match 123 of 456 /search term/' in Vim searches.
Plug 'henrik/vim-indexed-search'

" A plugin of NERDTree showing git status
Plug 'Xuyuanp/nerdtree-git-plugin'

" Maintains a history of previous yanks, changes and deletes
" Plug 'vim-scripts/YankRing.vim'

" Automated tag file generation and syntax highlighting of tags
" Plug 'xolox/vim-easytags'

" A Vim plugin that always highlights the enclosing html/xml tags
Plug 'Valloric/MatchTagAlways'

" Vim plugin which asks for the right file to open
Plug 'EinfachToll/DidYouMean'

" vim interface to Web API
" Plug 'mattn/webapi-vim'

" This is a Vim plugin that provides Rust file detection, syntax highlighting,
" formatting, Syntastic integration, and more.
Plug 'rust-lang/rust.vim'

" A vim plugin that simplifies the transition between multiline and single-line code 
Plug 'AndrewRadev/splitjoin.vim'

" Vim plugin for insert mode completion of words in adjacent tmux panes 
Plug 'wellle/tmux-complete.vim'

" Vastly improved Javascript indentation and syntax support in Vim. 
Plug 'pangloss/vim-javascript'

" Yet Another TypeScript Syntax: The most advanced TypeScript Syntax Highlighting in Vim 
Plug 'HerringtonDarkholme/yats.vim'

" Improved nginx vim plugin (incl. syntax highlighting)
Plug 'chr4/nginx.vim'

" precision colorscheme for the vim text editor
Plug 'altercation/vim-colors-solarized'

call plug#end()

" Setup autocomplete
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" NERDTree settings
noremap <leader>] :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'

let g:NERDTreeHijackNetrw=1

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
else
  syntax enable
  set background=dark
  colorscheme solarized
endif

" Airline theme
let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'

" Shortcuts
noremap <leader>- ddp
noremap <leader>_ ddkP

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
