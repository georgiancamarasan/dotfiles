:so './plugins/index.vim'

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
