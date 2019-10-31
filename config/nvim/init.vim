call plug#begin('~/.local/share/nvim/plugged')

" Plugin manager
Plug 'junegunn/vim-plug'

" Defaults everyone can agree on 
Plug 'tpope/vim-sensible'

" A Git wrapper so awesome, it should be illegal<Paste>
Plug 'tpope/vim-fugitive' 

" A Vim plugin for more pleasant editing on commit messages
Plug 'rhysd/committia.vim'

" continuously updated session files
Plug 'tpope/vim-obsession'

" vinegar.vim: Combine with netrw to create a delicious salad dressing 
Plug 'tpope/vim-vinegar'

" Modern database interface for Vim 
Plug 'tpope/vim-dadbod'

" The ultimate snippet solution for Vim.
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" A tree explorer plugin for vim.
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Powerline is a statusline plugin for vim, and provides statuslines and prompts for several other applications, 
" including zsh, bash, tmux, IPython, Awesome and Qtile.
" Plug 'powerline/powerline'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

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
Plug 'Shougo/deoplete.nvim'

" Syntax checking hacks
Plug 'vim-syntastic/syntastic'

" EditorConfig plugin for Vim http://editorconfig.org
Plug 'editorconfig/editorconfig-vim'

" The most advanced TypeScript Syntax Highlighting
Plug 'HerringtonDarkholme/yats.vim'

" A code-completion engine
" Plug 'Valloric/YouCompleteMe'

" Vim Pug (formerly Jade) template engine syntax highlighting and indention
" Plug 'digitaltoad/vim-pug'

" Vim Markdown runtime files
Plug 'tpope/vim-markdown'

" A plugin of NERDTree showing git status
" Plug 'Xuyuanp/nerdtree-git-plugin'

" Miscellaneous auto-load Vim scripts
Plug 'xolox/vim-misc'

" Automated tag file generation and syntax highlighting of tags
Plug 'xolox/vim-easytags'

" vim interface to Web API
" Plug 'mattn/webapi-vim'

" This is a Vim plugin that provides Rust file detection, syntax highlighting,
" formatting, Syntastic integration, and more.
Plug 'rust-lang/rust.vim'

" Vim plugin for insert mode completion of words in adjacent tmux panes 
Plug 'wellle/tmux-complete.vim'

" Seamless navigation between tmux panes and vim splits <Paste>
Plug 'christoomey/vim-tmux-navigator'

" Vastly improved Javascript indentation and syntax support in Vim. 
Plug 'pangloss/vim-javascript'

" Yet Another TypeScript Syntax: The most advanced TypeScript Syntax Highlighting in Vim 
Plug 'HerringtonDarkholme/yats.vim'

" Improved nginx vim plugin (incl. syntax highlighting)
Plug 'chr4/nginx.vim'

" Vim mapping for sorting a range of text
Plug 'christoomey/vim-sort-motion'

" Ember Handlebars/HTMLBars plugin for Vim with indentation support
Plug 'joukevandermaas/vim-ember-hbs'

" Calendar from the vim site
Plug '~/code/vim-plugins/calendar.vim'

" precision colorscheme for the vim text editor
Plug 'altercation/vim-colors-solarized'

" Vim theme
Plug 'fatih/molokai'

" Vim theme
Plug 'fortes/vim-escuro'

" Vim theme
Plug 'julien/vim-miniml'

" Vim theme
Plug 'napcs/vim-mycontrast'

call plug#end()

" Setup autocomplete
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" Set up go to definition
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" Set up comments
" let g:NERDSpaceDelims = 1
" let g:NERDDefaultAlign = 'left'
" let g:NERDCommentEmptyLines = 1

" NERDTree settings
" noremap <leader>] :NERDTreeToggle<CR><c-w>K
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" let g:NERDTreeDirArrowExpandable = '>'
" let g:NERDTreeDirArrowCollapsible = 'v'

" let g:NERDTreeHijackNetrw=1

" newtr settings
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0 " Open in same window
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
  "autocmd!
  "autocmd VimEnter * :Vexplore
"augroup END

" Editor windows settings
set relativenumber " Show relative line numbers
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
  colorscheme molokai
endif

" Airline theme
let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'

" easytags settings
" Search for tags
nnoremap <leader>. :CtrlPTag<cr>

" vimwiki settings
let g:vimwiki_folding = 'syntax'
let g:vimwiki_list = [{'name': 'My Wiki', 'path': '~/Nextcloud/mywiki/wiki', 'path_html': '~/Nextcloud/mywiki/html', 'ext': '.md', 'syntax': 'markdown', 'index': 'index' },
  \ {'name': 'Work Wiki', 'path': '~/Nextcloud/workwiki/wiki', 'path_html': '~/Nextcloud/workwiki/html', 'ext': '.md', 'syntax': 'markdown', 'index': 'index' }]

" Yank and put from system clipboard
set clipboard+=unnamedplus


" Shortcuts
noremap <leader>- ddp
noremap <leader>_ ddkP

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Move to the previous buffer with "gp"
nnoremap gp :bp<CR>

" Move to the next buffer with "gn"
nnoremap gn :bn<CR>

" List all possible buffers with "gl"
nnoremap gl :ls<CR>

" List all possible buffers with "gb" and accept a new buffer argument [1]
nnoremap gb :ls<CR>:b

" Replace Esc with jk
inoremap jk <ESC>
