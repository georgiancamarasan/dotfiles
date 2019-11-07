call plug#begin('~/.local/share/nvim/plugged')

" Plugin manager
Plug 'junegunn/vim-plug'

exec "so" g:vim_plugins_config_dir . '/simple-edits.vim'
exec "so" g:vim_plugins_config_dir . '/files.vim'
exec "so" g:vim_plugins_config_dir . '/dev.vim'
exec "so" g:vim_plugins_config_dir . '/themes.vim'
exec "so" g:vim_plugins_config_dir . '/misc.vim'
exec "so" g:vim_plugins_config_dir . '/ui.vim'
exec "so" g:vim_plugins_config_dir . '/git.vim'

call plug#end()
