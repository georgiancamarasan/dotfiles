" Modern database interface for Vim
Plug 'tpope/vim-dadbod'

" The ultimate snippet solution for Vim.
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" A Vim plugin for Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'markdown', 'yaml', 'html'] }

" Dark powered asynchronous completion framework for neovim/Vim8
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

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
" Plug 'Valloric/YouCompleteMe'
