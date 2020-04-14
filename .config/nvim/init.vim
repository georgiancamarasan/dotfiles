call plug#begin('~/.local/share/nvim/plugged')

" Plugin manager
Plug 'junegunn/vim-plug'


" Miscellaneous auto-load Vim scripts {{{
" Vim scripts that are used by other plugins
"
Plug 'xolox/vim-misc'
" }}}


" Vim alignment
" Plug 'junegunn/vim-easy-align'

" quoting/paranthesizing made simple
" Plug 'tpope/vim-surround'

" Vim plugin for intensely orgasmic commenting
" Plug 'scrooloose/nerdcommenter'

" Vim motion on speed!
" Plug 'easymotion/vim-easymotion'

" Maintains a history of previous yanks, changes and deletes
" Plug 'vim-scripts/YankRing.vim'

" A Vim plugin that always highlights the enclosing html/xml tags
" Plug 'Valloric/MatchTagAlways'

" A vim plugin that simplifies the transition between multiline and single-line code
" Plug 'AndrewRadev/splitjoin.vim'

" Better whitespace highlighting for Vim
" Plug 'ntpeters/vim-better-whitespace'

" Show 'Match 123 of 456 /search term/' in Vim searches.
" Plug 'henrik/vim-indexed-search'

" Vim mapping for sorting a range of text
" Plug 'christoomey/vim-sort-motion'


" A command-line fuzzy finder {{{
" Options:
" let g:fzf_layout = { 'down': '~40%' }
"
" Usage:
" After opening fzf and selecting a file, use <C-v> to vsplit the file
"
" Mappings:
" nnoremap <silent> <leader>ff :FZF<CR>
"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" }}}


" super simple vim plugin to show the list of buffers in the command bar {{{
Plug 'bling/vim-bufferline'
" }}}

" Fuzzy file, buffer, mru, tag, etc finder {{{
" Usage:
" <C-p> to open the fuzzy finder
" Help:
" :help ctrlp-mappings
" :help ctrlp-commands
Plug 'ctrlpvim/ctrlp.vim'
" }}}

" BufExplorer
" Plug 'jlanzarotta/bufexplorer'

" Vim plugin which asks for the right file to open
" Plug 'EinfachToll/DidYouMean'

" Modern database interface for Vim
" Plug 'tpope/vim-dadbod'

" Perform all your vim insert mode completions with Tab
" Plug 'ervandew/supertab'

" The ultimate snippet solution for Vim.
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" A Vim plugin for Prettier
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'npm install',
"   \ 'branch': 'release/1.x',
"   \ 'for': [
"     \ 'javascript',
"     \ 'typescript',
"     \ 'css',
"     \ 'scss',
"     \ 'json',
"     \ 'graphql',
"     \ 'markdown',
"     \ 'vue',
"     \ 'lua',
"     \ 'php',
"     \ 'python',
"     \ 'ruby',
"     \ 'yaml',
"     \ 'html'] }


" Dark powered asynchronous completion framework for neovim/Vim8
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


" Syntax checking hacks
" Plug 'vim-syntastic/syntastic'


" EditorConfig plugin for Vim http://editorconfig.org {{{
" To view options type
" :help editorconfig
Plug 'editorconfig/editorconfig-vim'
" }}}


" The most advanced TypeScript Syntax Highlighting {{{
" Yet Another TypeScript Syntax file for Vim, adapted from YAJS. Key differences:
"                                                                                                                "
" - Exuberant Highlighting. The most elaborate or byzatine syntax highlighting for TypeScript.
" - Bundled with snippets for UltiSnips!
" - Builtin Support for tagbar!
" - Use 'typescript' as group name's prefix, not 'typeScript' nor 'TypeScript'. Works great with SyntaxComplete.
" - Inherit Web API and DOM keywords from YAJS
" - Syntax fold. Fold long code block, semantically!
" - Remove old, unused syntax definitions.
"
Plug 'HerringtonDarkholme/yats.vim'
" }}}


" Vim Pug (formerly Jade) template engine syntax highlighting and indention {{{
"
" For best results consider using this with an (improved) HTML5 syntax plugin.
"
" Plug 'digitaltoad/vim-pug'
" }}}


" Vim Markdown runtime files {{{
" This is the development version of Vim's included syntax highlighting and
" filetype plugins for Markdown. Generally you don't need to install these if
" you are running a recent version of Vim.
"
" If you want to enable fenced code block syntax highlighting in your markdown
" documents you can enable it in your .vimrc like so:
"
" let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
"
" To disable markdown syntax concealing add the following to your vimrc:
"
" let g:markdown_syntax_conceal = 0
"
" Syntax highlight is synchronized in 50 lines. It may cause collapsed
" highlighting at large fenced code block. In the case, please set larger
" value in your vimrc:
"
" let g:markdown_minlines = 100
"
" Note that setting too large value may cause bad performance on highlighting.
"
" Plug 'tpope/vim-markdown'
" }}}


" Automated tag file generation and syntax highlighting of tags {{{
"
" Note that if the plug-in warns you ctags isn't installed you'll have to download it from its [homepage] exctags, 
" or if you're running Debian/Ubuntu you can install it by executing the following shell command:
" sudo apt-get install exuberant-ctags
"
" Options:
" By setting this option to true (1) you enable asynchronous tags file updates.
" let g:easytags_async = 1
"
" The default value of this option is 'auto' which means to use keyword highlighting where this is possible without sacrificing accuracy. 
" By changing it to 'always' you're telling vim-easytags to sacrifice accuracy in order to gain performance.
" let g:easytags_syntax_keyword = 'always'
"
" Exuberant Ctags supports many languages and can be extended via regular expression patterns, but for some languages separate tools with 
" ctags-compatible output exist (e.g. jsctags jsctags for Javascript). To use these, the executable and its arguments must be configured:
" let g:easytags_languages = {
" \   'language': {
" \     'cmd': g:easytags_cmd,
" \	    'args': [],
" \	    'fileoutput_opt': '-f',
" \	    'stdout_opt': '-f-',
" \	    'recurse_flag': '-R'
" \   }
" \}
" Each key is a special language definition. The key is a Vim file type in lowercase. The above snippet shows the defaults; you only need to specify options that differ.
"
" To change the location of this file, set the global variable:
" g:easytags_file, e.g.:
" let g:easytags_file = '~/.vim/tags'
"
" By default :UpdateTags only writes to the global tags file, but it can be configured to look for project specific tags files by adding the following lines to your [vimrc script] vimrc:
" set tags=./tags;
" let g:easytags_dynamic_files = 1
"
" If this is set and not false, it will suppress the warning on startup if ctags is not found or not recent enough:
" let g:easytags_suppress_ctags_warning = 1
"
" If this is set and not false, it will suppress the report displayed on tag updates:
" let g:easytags_suppress_report = 1
"
Plug 'xolox/vim-easytags'
" }}}


" This is a Vim plugin that provides Rust file detection, syntax highlighting, {{{
" formatting, Syntastic integration, and more.
" rust.vim automatically registers cargo as a syntax checker with Syntastic, if nothing else is specified. See :help rust-syntastic for more details.
"
" The :RustFmt command will format your code with rustfmt if installed.
"
" Placing let g:rustfmt_autosave = 1 in your ~/.vimrc will enable automatic
" running of :RustFmt when you save a buffer.
"
" Do :help :RustFmt for further formatting help and customization options.
"
Plug 'rust-lang/rust.vim'
" }}}


" Vastly improved Javascript indentation and syntax support in Vim. {{{
"
" Enables syntax highlighting for JSDocs.
" let g:javascript_plugin_jsdoc = 1
"
" Enables code folding for javascript based on our syntax file.
" Please note this can have a dramatic effect on performance.
"
" augroup javascript_folding
"   au!
"   au FileType javascript setlocal foldmethod=syntax
" augroup END
"
Plug 'pangloss/vim-javascript'
" }}}


" Improved nginx vim plugin (incl. syntax highlighting) {{{
"
" The plugin is based on the recent vim-plugin distributed with nginx-1.12.0 and additionally features the following syntax improvements:
" Highlight IPv4 and IPv6 addresses
" Mark insecure ssl_protocols as errors
" Inline template syntax highlight for ERB and Jinja
" Inline syntax highlight for LUA
" Improve integer matching
" Syntax highlighting for proxy_next_upstream options
" Syntax highlighting for sticky options
" Syntax highlighting for upstream server options
" More to come!
"
Plug 'chr4/nginx.vim'
" }}}


" Ember Handlebars/HTMLBars plugin for Vim with indentation support {{{
Plug 'joukevandermaas/vim-ember-hbs'
" }}}


" YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for Vim. It has several completion engines: {{{
"
" an identifier-based engine that works with every programming language,
" a powerful clangd-based engine that provides native semantic code completion for C/C++/Objective-C/Objective-C++/CUDA (from now on referred to as "the C-family languages"),
" a Jedi-based completion engine for Python 2 and 3,
" an OmniSharp-Roslyn-based completion engine for C#,
" a Gopls-based completion engine for Go,
" a TSServer-based completion engine for JavaScript and TypeScript,
" a rls-based completion engine for Rust,
" a jdt.ls-based completion engine for Java.
" a generic Language Server Protocol implementation for any language
" and an omnifunc-based completer that uses data from Vim's omnicomplete system to provide semantic completions for many other languages (Ruby, PHP etc.).
"
" Commands:
" If the ycmd completion server suddenly stops for some reason, you can restart it with this command:
" :YcmRestartServer
"
" This command gives access to a number of additional IDE-like features in YCM, for things like semantic GoTo, type information, FixIt and refactoring.
" :YcmCompleter
"
" Looks up the symbol under the cursor and jumps to its implementation (i.e. non-interface). If there are multiple implementations, instead provides a list of implementations to choose from.
" GoToImplementation
"
" Looks up the symbol under the cursor and jumps to the definition of its type e.g. if the symbol is an object, go to the definition of its class.
" GoToType
"
" Displays the preview window populated with quick info about the identifier under the cursor.
" GetDoc
"
" The RefactorRename <new name> subcommand
"
" Maps:
" nnoremap <leader>jd :YcmCompleter GoTo<CR>
" nnoremap <leader>ji :YcmCompleter GoToImplementation<CR>
" nnoremap <leader>jt :YcmCompleter GoToType<CR>
" nnoremap <leader>gt :YcmCompleter GetDoc<CR>
" nnoremap <leader>rr :YcmCompleter RefactorRename<Space>
Plug 'Valloric/YouCompleteMe'
" }}}


" precision colorscheme for the vim text editor
" Plug 'altercation/vim-colors-solarized'

" Vim theme
" Plug 'fatih/molokai'

" Vim theme
"Plug 'fortes/vim-escuro'

" Vim theme
"Plug 'julien/vim-miniml'

" Vim theme
"Plug 'napcs/vim-mycontrast'

" Defaults everyone can agree on
" Plug 'tpope/vim-sensible'

" continuously updated session files
" Plug 'tpope/vim-obsession'

" Vim plugin for insert mode completion of words in adjacent tmux panes
" Plug 'wellle/tmux-complete.vim'

" Seamless navigation between tmux panes and vim splits <Paste>
" Plug 'christoomey/vim-tmux-navigator'

" Calendar from the vim site
" Plug '~/code/vim-plugins/calendar.vim'

" Personal Wiki for Vim http://vimwiki.github.io/
" Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

" vinegar.vim: Combine with netrw to create a delicious salad dressing
" Plug 'tpope/vim-vinegar'
" A tree explorer plugin for vim.
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Powerline is a statusline plugin for vim, and provides statuslines and prompts for several other applications,
" including zsh, bash, tmux, IPython, Awesome and Qtile.
" Plug 'powerline/powerline'

" lean & mean status/tabline for vim that's light as air
" Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline
" Plug 'vim-airline/vim-airline-themes'

" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
" Plug 'ryanoasis/vim-devicons'

" A Git wrapper so awesome, it should be illegal<Paste>
" Plug 'tpope/vim-fugitive'

" A Vim plugin for more pleasant editing on commit messages
" Plug 'rhysd/committia.vim'

" A plugin of NERDTree showing git status
" Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" vimwiki settings
" let g:vimwiki_folding = 'syntax'
" let g:vimwiki_list = [{'name': 'My Wiki', 'path': '~/Nextcloud/mywiki/wiki', 'path_html': '~/Nextcloud/mywiki/html', 'ext': '.md', 'syntax': 'markdown', 'index': 'index' },
"   \ {'name': 'Work Wiki', 'path': '~/Nextcloud/workwiki/wiki', 'path_html': '~/Nextcloud/workwiki/html', 'ext': '.md', 'syntax': 'markdown', 'index': 'index' }]

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
" let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
" let g:NERDToggleCheckAllLines = 1

" NERDTree settings
" noremap <leader>] :NERDTreeToggle<CR><c-w>K
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" let g:NERDTreeDirArrowExpandable = '>'
" let g:NERDTreeDirArrowCollapsible = 'v'

" let g:NERDTreeHijackNetrw=1

" Airline theme
" let g:airline_powerline_fonts = 1
" let g:airline_theme = 'badwolf'

" Setup autocomplete = 1
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
" let g:yankring_min_element_length = 2
" Use vertical split
" let g:yankring_window_use_horiz = 0
" If using a vertical split, this option controls how wide to make the window.
" let g:yankring_window_width = 30

" Use deoplete.
" let g:deoplete#enable_at_startup = 1

" Ultisnips configuration
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsSnippetDirectories=[ "UltiSnips", g:vim_config_dir . "/ultisnips" ]

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
" colorscheme molokai

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
" nnoremap <leader>. :CtrlPTag<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap <leader>a <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap <leader>a <Plug>(EasyAlign)

" Show the Yank history and chose which line to paste
" nnoremap <silent> <leader>p :YRShow<CR>

" Format file using prettier
" nnoremap <leader>f <Plug>(Prettier)

" Jump to matching tag
" nnoremap <leader>] :MtaJumpToOtherTag<cr>


" FzfMappings {{{
nnoremap <silent> <leader>ff :FZF<CR>
" }}}

" easy-tags settings {{{
let g:easytags_async = 1
" }}}

" vim-javascript settings {{{
let g:javascript_plugin_jsdoc = 1
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END
" }}}

" YouCompleteMe settings {{{
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>ji :YcmCompleter GoToImplementation<CR>
nnoremap <leader>jt :YcmCompleter GoToType<CR>
nnoremap <leader>gt :YcmCompleter GetDoc<CR>
nnoremap <leader>rr :YcmCompleter RefactorRename<Space>
" }}}
