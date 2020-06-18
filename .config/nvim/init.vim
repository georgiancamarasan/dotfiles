" Basics {{{
filetype plugin indent on         " Add filetype, plugin, and indent support
syntax on                         " Turn on syntax highlighting
let mapleader = ","
" Replace Esc with jk {{{
inoremap jk <ESC>
" }}}

" Simple text edit settings {{{
" Move line current line down
noremap <leader>- ddp
" Move line current line up
noremap <leader>_ ddkP
" }}}

" Vim config file editing {{{
" Open vim config file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source vim config file
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}

" Buffer navigation {{{
" Move to the previous buffer with "gp"
nnoremap gp :bp<CR>
" Move to the next buffer with "gn"
nnoremap gn :bn<CR>
" List all possible buffers with "gl"
nnoremap gl :ls<CR>
" List all possible buffers with "gb" and accept a new buffer argument [1]
nnoremap gb :ls<CR>:b
" toggles between buffers
nnoremap <leader><leader> <c-^>
" Open hotkeys {{{
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>
" }}}

" Quick-save {{{
nmap <leader>w :w<CR>
" }}}

call plug#begin('~/.local/share/nvim/plugged')

" Plugin manager {{{
Plug 'junegunn/vim-plug'
" }}}

" Defaults everyone can agree on {{{
Plug 'tpope/vim-sensible'
" }}}

" Miscellaneous auto-load Vim scripts {{{
" Vim scripts that are used by other plugins
"
Plug 'xolox/vim-misc'
" }}}

"  Language Server Protocol (LSP) support for vim and neovim. {{{
"
" Example configuration
" Required for operations modifying multiple buffers like rename.
" set hidden
"
" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"     \ 'python': ['/usr/local/bin/pyls'],
"     \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"     \ }
"
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
"
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
" }}}

" Vim plugin providing operator motions to quickly replace text {{{
"
" Subversive provides two new operator motions to make it very easy to perform quick substitutions.
" It contains no default mappings and will have no effect until you add your own maps to it.
"
" Mappings:
" s for substitute
" nmap s <plug>(SubversiveSubstitute)
" nmap ss <plug>(SubversiveSubstituteLine)
" nmap S <plug>(SubversiveSubstituteToEndOfLine)
"
Plug 'svermeulen/vim-subversive'
" }}}

"  A parser for a condensed HTML format {{{
"
"   Type in something (e.g. #header > h1), then press <C-E> whilst in insert mode to expand to HTML.
"   Pressing <C-n> will cycle through empty elements.
Plug 'rstacruz/sparkup'
" }}}

" Vim alignment {{{
"
" Add the following mappings to your .vimrc.
"
" Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)
"
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)
"
" Then with the following lines of text,
"
" apple   =red
" grass+=green
" sky-=   blue
"
" try these commands:
"
" vipga=
" 	visual-select inner paragraph
" 	Start EasyAlign command (ga)
" 	Align around =
" gaip=
" 	Start EasyAlign command (ga) for
" 	inner paragraph
" 	Align around =
"
" = Around the 1st occurrences
" 2= Around the 2nd occurrences
" *= Around all occurrences
" **= Left/Right alternating alignment around all occurrences
" <Enter> Switching between left/right/center alignment modes
"
Plug 'junegunn/vim-easy-align'
" }}}

" It's easiest to explain with examples. Press cs"' inside {{{
" "Hello world!"
" to change it to
" 'Hello world!'
"
" Now press cs'<q> to change it to
" <q>Hello world!</q>
"
" To go full circle, press cst" to get
" "Hello world!"
"
" To remove the delimiters entirely, press ds".
" Hello world!
"
" Now with the cursor on "Hello", press ysiw] (iw is a text object).
" [Hello] world!
"
" Let's make that braces and add some space (use } instead of { for no space): cs]{
" { Hello } world!
"
" Now wrap the entire line in parentheses with yssb or yss).
" ({ Hello } world!)
"
" Revert to the original text: ds{ds)
" Hello world!
"
" Finally, let's try out visual mode. Press a capital V (for linewise visual mode) followed by S<p class="important">.
" <p class="important">
"   <em>Hello</em> world!
" </p>
"
Plug 'tpope/vim-surround'
" }}}

" Vim plugin for intensely orgasmic commenting {{{
"
" Options:
" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
"
" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
"
" Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'
"
" Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
"
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1
"
" Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1
"
" Enable NERDCommenterToggle to check all selected lines is commented or not
" let g:NERDToggleCheckAllLines = 1
"
Plug 'scrooloose/nerdcommenter'
" }}}

" Vim motion on speed! {{{
"
" Options:
" map <Leader> <Plug>(easymotion-prefix)
" All motions will then be triggered with <Leader> by default, e.g. <Leader>s, <Leader>gE.
"
Plug 'easymotion/vim-easymotion'
" }}}

" Maintains a history of previous yanks, changes and deletes {{{
" Plug 'vim-scripts/YankRing.vim'
" }}}

" A Vim plugin that always highlights the enclosing html/xml tags {{{
Plug 'Valloric/MatchTagAlways'
" }}}

" A vim plugin that simplifies the transition between multiline and single-line code {{{
"
" Usage:
"
" gS to split a one-liner into multiple lines
" gJ (with the cursor on the first line of a block) to join a block into a single-line statement.
"
Plug 'AndrewRadev/splitjoin.vim'
" }}}

" Better whitespace highlighting for Vim {{{
"
" Options:
" Set a custom highlight color
" let g:better_whitespace_ctermcolor='<desired_color>'
"
" To enable highlighting and stripping whitespace on save by default, use respectively
" let g:better_whitespace_enabled=1
" let g:strip_whitespace_on_save=1
"
Plug 'ntpeters/vim-better-whitespace'
" }}}

" Show 'Match 123 of 456 /search term/' in Vim searches. {{{
Plug 'henrik/vim-indexed-search'
" }}}

" Changes Vim working directory to project root (identified by presence of known directory or file). {{{
Plug 'airblade/vim-rooter'
" }}}

" Vim mapping for sorting a range of text {{{
" Usage:
"
" gs2j => Sort down two lines (current + 2 below)
" gsip => Sort the current paragraph
" gsii => Sort the current indentation level (requires text-obj-indent plugin)
"
Plug 'christoomey/vim-sort-motion' " | Plug 'kana/vim-textobj-indent'
" }}}

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
Plug 'junegunn/fzf.vim'
" }}}

" super simple vim plugin to show the list of buffers in the command bar {{{
Plug 'bling/vim-bufferline'
" }}}

" The fancy start screen for Vim. {{{
Plug 'mhinz/vim-startify'
" }}}

" Fuzzy file, buffer, mru, tag, etc finder {{{
" Usage:
" <C-p> to open the fuzzy finder
" Help:
" :help ctrlp-mappings
" :help ctrlp-commands
Plug 'ctrlpvim/ctrlp.vim'
" }}}

" BufExplorer {{{
" Usage:
" With bufexplorer, you can quickly and easily switch between buffers by using the one of the default public interfaces:
" <leader>be " normal open
" <leader>bt " toggle open / close
" <leader>bs " force horizontal split open
" <leader>bv " force vertical split open
Plug 'jlanzarotta/bufexplorer'
" }}}

" Vim plugin which asks for the right file to open {{{
" This plugin can use fzf to present/filter the list if - it is enabled by:
" let g:dym_use_fzf = 1
" in your .vimrc if the fzf.vim plugin is installed.
"
Plug 'EinfachToll/DidYouMean'
" }}}

" Modern database interface for Vim {{{
"
" Usage:
" Omit further arguments to spawn an interactive console (like psql or
" redis-cli).
" :DB postgresql:///foobar
" :DB redis:
"
" If additional arguments are provided, they are interpreted as a query string
" to pass to the database. Results are displayed in a preview window.
" :DB sqlite:myfile.sqlite3 select count(*) from widgets
" :DB redis:/// CLIENT LIST
"
" Use < to pass in a filename.
" :DB mongodb:///test < big_query.js
"
" There's also a special assignment syntax for saving a URL to a Vim variable
" for later use.
"
" :DB g:prod = postgres://user:pass@db.example.com/production_database
" :DB g:prod drop table users
"
Plug 'tpope/vim-dadbod'
" }}}

" Perform all your vim insert mode completions with Tab {{{
" Plug 'ervandew/supertab'
" }}}

" The ultimate snippet solution for Vim. {{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
"
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" }}}

" A Vim plugin for Prettier {{{
"
" Usage:
" <Leader>p
"
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
" }}}

" Dark powered asynchronous completion framework for neovim/Vim8 {{{
"
" Options:
" let g:deoplete#enable_at_startup = 1
"
" See :help deoplete-options for a complete list of options.
"
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" }}}

" Syntax checking hacks {{{
"
" Options:
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"
" :help syntastic
"
Plug 'vim-syntastic/syntastic'
" }}}

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
" Plug 'pangloss/vim-javascript'
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
" Plug 'joukevandermaas/vim-ember-hbs'
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
" Plug 'Valloric/YouCompleteMe'
" }}}

" Vim themes {{{
Plug 'fatih/molokai'
" Plug 'fortes/vim-escuro'
" Plug 'julien/vim-miniml'
" Plug 'napcs/vim-mycontrast'
" }}}

" A Vim plugin for Vim plugins {{{
"
" From tpope: I make so many Vim plugins I had to make a Vim plugin for making Vim plugins.
"
" Plug 'tpope/vim-scriptease'
" }}}

" Continuously updated session files {{{
"
" Use :Obsess (with optional file/directory name) to start recording to a session file and :Obsess! to stop and throw it away.
" That's it. Load a session in the usual manner: vim -S, or :source it.
" There's also an indicator you can put in 'statusline', 'tabline', or 'titlestring'.
" See :help obsession-status.
"
Plug 'tpope/vim-obsession'
" }}}

" Vim plugin for insert mode completion of words in adjacent tmux panes {{{
"
" This plugin adds a completion function that puts all words visible in your Tmux panes right under your fingertips.
" Just enter insert mode, start typing any word you see and press <C-X><C-U> to the trigger user defined insert mode completion.
"
Plug 'wellle/tmux-complete.vim'
" }}}

" Seamless navigation between tmux panes and vim splits {{{
"
" Usage
" This plugin provides the following mappings which allow you to move between Vim panes and tmux splits seamlessly.
"
" <ctrl-h> => Left
" <ctrl-j> => Down
" <ctrl-k> => Up
" <ctrl-l> => Right
" <ctrl-\> => Previous split
"
" Note - you don't need to use your tmux prefix key sequence before using the mappings.
"
Plug 'christoomey/vim-tmux-navigator'
" }}}

" Personal Wiki for Vim http://vimwiki.github.io/ {{{
"
" <Leader>ww -- Open default wiki index file.
" <Leader>wt -- Open default wiki index file in a new tab.
" <Leader>ws -- Select and open wiki index file.
" <Leader>wd -- Delete wiki file you are in.
" <Leader>wr -- Rename wiki file you are in.
"
" For more keys, see :h vimwiki-mappings
"
" For markdown to html:
" gem install vimwiki_markdown
"
" let g:vimwiki_list = [{'path': '~/vimwiki', 'template_path':
" '~/vimwiki/templates/',
" \ 'template_default': 'default', 'syntax': 'markdown', 'ext': '.md',
" \ 'path_html': '~/vimwiki/site_html/', 'custom_wiki2html': 'vimwiki_markdown',
" \ 'html_filename_parameterization': 1,
" \ 'template_ext': '.tpl'}]
"
" Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
" }}}

" vinegar.vim: Combine with netrw to create a delicious salad dressing {{{
"
" Press - in any buffer to hop up to the directory listing and seek to the file you just came from.
" Press gh to toggle dot file hiding.
" Press . on a file to pre-populate it at the end of a : command line.
" Press y. to yank an absolute path for the file under the cursor.
" Press ~ to go home.
" Use Vim's built-in CTRL-^ (CTRL-6) for switching back to the previous buffer from the netrw buffer.
"
Plug 'tpope/vim-vinegar'
" }}}

" Pairs of handy bracket mappings {{{
"
" Usage:
" ]q is :cnext. [q is :cprevious. ]a is :next. [b is :bprevious.
" [<Space> and ]<Space> add newlines before and after the cursor line.
" [e and ]e exchange the current line with the one above or below it.
" [os, ]os, and yos perform :set spell, :set nospell, and :set invspell, respectively.
"
Plug 'tpope/vim-unimpaired'
" }}}

" A tree explorer plugin for vim. {{{
"
" To open NERDTree
" map <C-n> :NERDTreeToggle<CR>
"
" close vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
Plug 'preservim/nerdtree'
" }}}

" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more {{{
Plug 'ryanoasis/vim-devicons'
" }}}

" Extra syntax and highlight for nerdtree files {{{
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" }}}

" Powerline is a statusline plugin for vim, and provides statuslines and prompts for several other applications, {{{
" including zsh, bash, tmux, IPython, Awesome and Qtile.
" Plug 'powerline/powerline'
" }}}

" lean & mean status/tabline for vim that's light as air {{{
Plug 'vim-airline/vim-airline'
" }}}

" A collection of themes for vim-airline {{{
Plug 'vim-airline/vim-airline-themes'
" }}}

" A Git wrapper so awesome, it should be illegal {{{
" The crown jewel of Fugitive is :Git (or just :G), which calls any arbitrary Git command.
" If you know how to use Git at the command line, you know how to use :Git.
Plug 'tpope/vim-fugitive'
" }}}

" A Vim plugin for more pleasant editing on commit messages {{{
" When you type git commit, Vim starts and opens a commit buffer. This plugin improves the commit buffer.
Plug 'rhysd/committia.vim'
" }}}

" A plugin of NERDTree showing git status {{{
" Use this variable to change symbols:
" let g:NERDTreeIndicatorMapCustom = {
  " \ "Modified"  : "✹",
  " \ "Staged"    : "✚",
  " \ "Untracked" : "✭",
  " \ "Renamed"   : "➜",
  " \ "Unmerged"  : "═",
  " \ "Deleted"   : "✖",
  " \ "Dirty"     : "✗",
  " \ "Clean"     : "✔︎",
  " \ 'Ignored'   : '☒',
  " \ "Unknown"   : "?"
  " \ }
Plug 'Xuyuanp/nerdtree-git-plugin'
" }}}

" enable repeating supported plugin maps with "." {{{
Plug 'tpope/vim-repeat'
" }}}

" TODO: Add documentation {{{
Plug 'Yggdroot/indentLine'
" }}}

" TODO: Add documentation {{{
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" }}}

" Bullets.vim is a Vim/NeoVim plugin for automated bullet lists. {{{
Plug 'dkarter/bullets.vim'
" }}}

" {{{
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" }}}


call plug#end()

" vimwiki settings {{{
" let g:vimwiki_folding = 'syntax'
" let g:vimwiki_list = [{'name': 'My Wiki', 'path': '~/Nextcloud/mywiki/wiki', 'path_html': '~/Nextcloud/mywiki/html', 'ext': '.md', 'syntax': 'markdown', 'index': 'index' },
"   \ {'name': 'Work Wiki', 'path': '~/Nextcloud/workwiki/wiki', 'path_html': '~/Nextcloud/workwiki/html', 'ext': '.md', 'syntax': 'markdown', 'index': 'index' }]
" }}}

" newtr settings {{{
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0 " Open in same window
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
  "autocmd!
  "autocmd VimEnter * :Vexplore
"augroup END
" }}}

" Set up comments {{{
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
" }}}

" NERDTree settings {{{
noremap <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinPos="right"

let g:NERDTreeWinSize=50
" let g:NERDTreeHijackNetrw=1
" }}}

" Airline theme {{{
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'badwolf'
" }}}

" Setup autocomplete = 1 {{{
"if !exists("g:ycm_semantic_triggers")
  "let g:ycm_semantic_triggers = {}
"endif
"let g:ycm_semantic_triggers['typescript'] = ['.']
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'

" Set up go to definition
"nnoremap <leader>jd :YcmCompleter GoTo<CR>
" }}}

" Yankring settings {{{
" The yanked text needs to be longer then this to be added to the history
" let g:yankring_min_element_length = 2
" Use vertical split
" let g:yankring_window_use_horiz = 0
" If using a vertical split, this option controls how wide to make the window.
" let g:yankring_window_width = 30
" }}}

" Use deoplete. {{{
" let g:deoplete#enable_at_startup = 1
" }}}

" Ultisnips configuration {{{
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsSnippetDirectories=[ "UltiSnips", g:vim_config_dir . "/ultisnips" ]
" }}}

" Text settings {{{
set nowrap " Don't wrap lines
set shiftwidth=2 " Number of spaces for identation
" }}}

" Theme settings {{{
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
" }}}

" General Settings {{{
set shell=/usr/bin/zsh            " Prefer zsh for shell-related tasks
set foldmethod=marker             " Group folds with '{{{,}}}'
set foldlevelstart=1              " Set a global fold level to remember you have folding in VIM
set grepprg=LC_ALL=C\ grep\ -rns  " Faster ASCII-based grep
set expandtab                     " Prefer spaces over tabs
set hidden                        " Prefer hiding over unloading buffers
set wildcharm=<C-z>               " Macro-compatible command-line wildchar
set path=.,**                     " Search relative to current file + directory
set noswapfile                    " No swapfiles period.
set tags=./tags;,tags;            " ID Tags relative to current file + directory
set shiftwidth=2                  " Digestable defaults for config files

syntax enable
set background=dark
colorscheme molokai
" Editor windows settings
set relativenumber " Show relative line numbers
" Yank and put from system clipboard
set clipboard+=unnamedplus
" }}}

" Format file using prettier {{{
nmap <leader>f <Plug>(Prettier)
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

" Subversive settings {{{
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
" }}}

" Ultisnip settings {{{
let g:UltiSnipsExpandTrigger="<c-v>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" }}}

" EasyAlign settings {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}

" LanguageClient settings {{{
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" }}}

" NERDCommenter settings {{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" }}}

" EasyMotion settings {{{
map <Leader> <Plug>(easymotion-prefix)
" }}}

" Better-Whitespace settings {{{
let g:better_whitespace_ctermcolor='white'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
" }}}

" Syntastic settings {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

" COC configuration {{{
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}

" Rust settings {{{
augroup rust
  autocmd!
  au FileType rust nnoremap <silent> <C-f> :RustFmt<CR>
augroup END
" }}}
