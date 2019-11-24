let g:vim_config_dir = $HOME . "/.config/nvim"
let g:vim_plugins_config_dir = g:vim_config_dir . "/plugins"

let g:vim_plugins_index_file = g:vim_plugins_config_dir . "/index.vim"
let g:vim_plugins_settings_file = g:vim_plugins_config_dir . "/settings.vim"
let g:vim_settings_file = g:vim_config_dir . "/settings.vim"
let g:vim_remaps_file = g:vim_config_dir . "/remaps.vim"

exec "so" . g:vim_plugins_index_file
exec "so" . g:vim_plugins_settings_file

exec "so" . g:vim_settings_file
exec "so" . g:vim_remaps_file

