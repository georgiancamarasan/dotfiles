call plug#begin('~/.local/share/nvim/plugged')

" Plugin manager
Plug 'junegunn/vim-plug'

" Vim alignment
Plug 'junegunn/vim-easy-align'

" quoting/paranthesizing made simple
Plug 'tpope/vim-surround'

" Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'

" Vim motion on speed!
Plug 'easymotion/vim-easymotion'

" Maintains a history of previous yanks, changes and deletes
Plug 'vim-scripts/YankRing.vim'

" A Vim plugin that always highlights the enclosing html/xml tags
Plug 'Valloric/MatchTagAlways'

" A vim plugin that simplifies the transition between multiline and single-line code
Plug 'AndrewRadev/splitjoin.vim'

" Better whitespace highlighting for Vim
Plug 'ntpeters/vim-better-whitespace'

" Show 'Match 123 of 456 /search term/' in Vim searches.
Plug 'henrik/vim-indexed-search'

" Vim mapping for sorting a range of text
Plug 'christoomey/vim-sort-motion'

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" super simple vim plugin to show the list of buffers in the command bar
Plug 'bling/vim-bufferline'

" Fuzzy file, buffer, mru, tag, etc finder
Plug 'ctrlpvim/ctrlp.vim'

" BufExplorer
" Plug 'jlanzarotta/bufexplorer'

" Vim plugin which asks for the right file to open
Plug 'EinfachToll/DidYouMean'

" Modern database interface for Vim
Plug 'tpope/vim-dadbod'

" Perform all your vim insert mode completions with Tab
Plug 'ervandew/supertab'

" The ultimate snippet solution for Vim.
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" A Vim plugin for Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'yaml',
    \ 'html'] }

" Dark powered asynchronous completion framework for neovim/Vim8
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Syntax checking hacks
Plug 'vim-syntastic/syntastic'

" EditorConfig plugin for Vim http://editorconfig.org
Plug 'editorconfig/editorconfig-vim'

" The most advanced TypeScript Syntax Highlighting
Plug 'HerringtonDarkholme/yats.vim'

" Vim Pug (formerly Jade) template engine syntax highlighting and indention
" Plug 'digitaltoad/vim-pug'

" Vim Markdown runtime files
Plug 'tpope/vim-markdown'

" Automated tag file generation and syntax highlighting of tags
Plug 'xolox/vim-easytags'

" vim interface to Web API
" Plug 'mattn/webapi-vim'

" This is a Vim plugin that provides Rust file detection, syntax highlighting,
" formatting, Syntastic integration, and more.
Plug 'rust-lang/rust.vim'

" Vastly improved Javascript indentation and syntax support in Vim. 
Plug 'pangloss/vim-javascript'

" Improved nginx vim plugin (incl. syntax highlighting)
"Plug 'chr4/nginx.vim'

" Ember Handlebars/HTMLBars plugin for Vim with indentation support
"Plug 'joukevandermaas/vim-ember-hbs'

" A code-completion engine
Plug 'Valloric/YouCompleteMe'
" precision colorscheme for the vim text editor
Plug 'altercation/vim-colors-solarized'

" Vim theme
Plug 'fatih/molokai'

" Vim theme
"Plug 'fortes/vim-escuro'

" Vim theme
"Plug 'julien/vim-miniml'

" Vim theme
"Plug 'napcs/vim-mycontrast'

" Defaults everyone can agree on
Plug 'tpope/vim-sensible'

" continuously updated session files
Plug 'tpope/vim-obsession'

" Miscellaneous auto-load Vim scripts
Plug 'xolox/vim-misc'

" Vim plugin for insert mode completion of words in adjacent tmux panes
Plug 'wellle/tmux-complete.vim'

" Seamless navigation between tmux panes and vim splits <Paste>
Plug 'christoomey/vim-tmux-navigator'

" Calendar from the vim site
Plug '~/code/vim-plugins/calendar.vim'

" Personal Wiki for Vim http://vimwiki.github.io/
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

" vinegar.vim: Combine with netrw to create a delicious salad dressing
Plug 'tpope/vim-vinegar'
" A tree explorer plugin for vim.
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Powerline is a statusline plugin for vim, and provides statuslines and prompts for several other applications,
" including zsh, bash, tmux, IPython, Awesome and Qtile.
" Plug 'powerline/powerline'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
Plug 'ryanoasis/vim-devicons'
" A Git wrapper so awesome, it should be illegal<Paste>
Plug 'tpope/vim-fugitive'

" A Vim plugin for more pleasant editing on commit messages
Plug 'rhysd/committia.vim'

" A plugin of NERDTree showing git status
" Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" vimwiki settings
let g:vimwiki_folding = 'syntax'
let g:vimwiki_list = [{'name': 'My Wiki', 'path': '~/Nextcloud/mywiki/wiki', 'path_html': '~/Nextcloud/mywiki/html', 'ext': '.md', 'syntax': 'markdown', 'index': 'index' },
  \ {'name': 'Work Wiki', 'path': '~/Nextcloud/workwiki/wiki', 'path_html': '~/Nextcloud/workwiki/html', 'ext': '.md', 'syntax': 'markdown', 'index': 'index' }]

" newtr settings
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0 " Open in same window
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
  "autocmd!
  "autocmd VimEnter * :Vexplore
"augroup END

" Set up comments
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" NERDTree settings
" noremap <leader>] :NERDTreeToggle<CR><c-w>K
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" let g:NERDTreeDirArrowExpandable = '>'
" let g:NERDTreeDirArrowCollapsible = 'v'

" let g:NERDTreeHijackNetrw=1

" Airline theme
let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'

" Setup autocomplete
"if !exists("g:ycm_semantic_triggers")
  "let g:ycm_semantic_triggers = {}
"endif
"let g:ycm_semantic_triggers['typescript'] = ['.']
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'

" Set up go to definition
"nnoremap <leader>jd :YcmCompleter GoTo<CR>

" Yankring settings
" The yanked text needs to be longer then this to be added to the history
let g:yankring_min_element_length = 2
" Use vertical split
let g:yankring_window_use_horiz = 0
" If using a vertical split, this option controls how wide to make the window.
let g:yankring_window_width = 30

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Ultisnips configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[ "UltiSnips", g:vim_config_dir . "/ultisnips" ]
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
" Move line current line down
noremap <leader>- ddp
" Move line current line up
noremap <leader>_ ddkP

" Open vim config file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source vim config file
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

" easytags settings
" Search for tags
nnoremap <leader>. :CtrlPTag<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>a <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>a <Plug>(EasyAlign)

" Show the Yank history and chose which line to paste
nnoremap <silent> <leader>p :YRShow<CR>

" Format file using prettier
nnoremap <leader>f <Plug>(Prettier)

" Jump to matching tag
nnoremap <leader>] :MtaJumpToOtherTag<cr>
